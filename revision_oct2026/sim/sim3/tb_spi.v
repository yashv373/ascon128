// SPI-level TB: drives spi_slave (RTL or post-PnR netlist) with one KAT encryption.
// SPI mode 1, 40-bit frames. sclk period = 1250 ns (0.8 MHz, as in constraints.sdc), clk = 20 MHz (50 ns).
// plusargs: +ADLEN +PTLEN  +MODE=enc|idle  +VCD  (defines: GLS_PNL for power-pin netlist, SDF=path)
`timescale 1ns/1ps
module tb_spi;
  reg clk=0, sclk=0, rst_n=1, mosi=0, cs_n=1; wire miso;
  always #21.74 clk=~clk;
  localparam HALF=625;   // sclk period 1250 ns
`ifdef GLS_PNL
  spi_slave dut(.clk(clk),.rst_n(rst_n),.sclk(sclk),.mosi(mosi),.miso(miso),.cs_n(cs_n),.VDD(1'b1),.VSS(1'b0));
`else
  spi_slave dut(.clk(clk),.rst_n(rst_n),.sclk(sclk),.mosi(mosi),.miso(miso),.cs_n(cs_n));
`endif
`ifdef SDFFILE
  initial begin $sdf_annotate(`SDFFILE, dut, , "sdf_annotate.log", "TYPICAL"); end
`endif
  reg [7:0] adm[0:4095], ptm[0:4095], expm[0:4095];
  integer adlen, ptlen, errors=0, nframes=0;
  reg [31:0] rd; reg [39:0] f; integer k;
  time t_win_start, t_win_end;
  real t_first=-1.0, t_last, sim_ns, mbps, ss_ns, tpt[0:255]; integer npt=0;   // throughput timestamps (ns)
  // sclk is FREE-RUNNING (the RTL clears bitcnt/txcnt only on sclk edges while cs_n=1)
  always #HALF sclk=~sclk;
  task frame(input rw, input [6:0] a, input [31:0] d);   // rw=1 write, 0 read ; result in rd
    begin
      f = {rw,a,d}; rd=0; @(negedge sclk); #100 cs_n=0;
      for (k=0;k<40;k=k+1) begin
        @(posedge sclk); #50 mosi=f[39-k];
        #(HALF-100) if (!rw && k>=8) rd[39-k] = miso;   // sample MISO 50 ns before the falling edge
        @(negedge sclk);
      end
      #100 cs_n=1; mosi=0; @(negedge sclk); nframes=nframes+1;   // one idle sclk cycle clears counters
    end endtask
  task wr(input [6:0] a, input [31:0] d); frame(1,a,d); endtask
  task rdr(input [6:0] a); frame(0,a,0); endtask
  function [31:0] w32(input [7:0] mem0,input [7:0] mem1,input [7:0] mem2,input [7:0] mem3);
    w32={mem3,mem2,mem1,mem0}; endfunction
  integer b, i, nfull, rem, ob, j, sel_prev, bytes_prev, last_prev;
  reg [127:0] blk; reg [7:0] eb;
  task push(input sel, input last, input [4:0] nb, input [127:0] d, input needblk);
    begin
      if (t_first<0.0) t_first=$realtime; if (sel) begin tpt[npt]=$realtime; npt=npt+1; end
      if (needblk) wr(7'h28, {25'd0, nb, last, sel});
      wr(7'h30,d[31:0]); wr(7'h34,d[63:32]); wr(7'h38,d[95:64]); wr(7'h3C,d[127:96]);
    end endtask
  task chkword(input integer off, input [31:0] got);
    begin for (j=0;j<4;j=j+1) if (got[8*j+:8]!==expm[off+j]) begin errors=errors+1; $display("MISMATCH byte %0d got %02x exp %02x",off+j,got[8*j+:8],expm[off+j]); end end endtask
  initial begin
    if(!$value$plusargs("ADLEN=%d",adlen)) adlen=0; if(!$value$plusargs("PTLEN=%d",ptlen)) ptlen=0;
    $readmemh("ad.hex",adm); $readmemh("pt.hex",ptm); $readmemh("exp.hex",expm);
    #1000; rst_n=0; #2000; rst_n=1; #3000;
    #12000;                                         // sclk edges release the sclk-domain reset synchronizer
    if ($test$plusargs("IDLE")) begin
      if ($test$plusargs("VCD")) begin $dumpfile("spi_idle.vcd"); $dumpvars(0,dut); end
      $display("WINDOW_START %0t", $time); #200000; $display("WINDOW_END %0t", $time); $finish;
    end
    if ($test$plusargs("VCD")) begin $dumpfile("spi_enc.vcd"); $dumpvars(0,dut); end
    t_win_start=$time; $display("WINDOW_START %0t", $time);
    for (i=0;i<4;i=i+1) wr(7'h00+4*i, w32(i*4,i*4+1,i*4+2,i*4+3));           // key  00..0f
    for (i=0;i<4;i=i+1) wr(7'h10+4*i, w32(16+i*4,17+i*4,18+i*4,19+i*4));     // nonce 10..1f
    wr(7'h20, {29'd0,(adlen==0),1'b0,1'b0});  wr(7'h20, {29'd0,(adlen==0),1'b0,1'b1});
    // AD
    if (adlen>0) begin
      nfull=adlen/16; rem=adlen%16;
      for (b=0;b<nfull;b=b+1) begin blk=0; for(i=0;i<16;i=i+1) blk[8*i+:8]=adm[16*b+i]; push(0,0,5'd16,blk,b==0); end
      blk=0; for(i=0;i<rem;i=i+1) blk[8*i+:8]=adm[16*nfull+i]; push(0,1,rem[4:0],blk,1);
    end
    // data (BLK register rewritten only when sel/last/bytes change)
    nfull=ptlen/16; rem=ptlen%16; ob=0;
    for (b=0;b<nfull;b=b+1) begin
      blk=0; for(i=0;i<16;i=i+1) blk[8*i+:8]=ptm[16*b+i];
      push(1,0,5'd16,blk,b==0);
      for (i=0;i<4;i=i+1) begin rdr(7'h40+4*i); chkword(ob+4*i, rd); end ob=ob+16;
    end
    blk=0; for(i=0;i<rem;i=i+1) blk[8*i+:8]=ptm[16*nfull+i]; push(1,1,rem[4:0],blk,1);
    for (i=0;i*4<rem;i=i+1) begin rdr(7'h40+4*i); chkword(ob+4*i, rd); end   // extra bytes beyond rem are zero
    #10000;
    for (i=0;i<4;i=i+1) begin rdr(7'h50+4*i); chkword(ptlen+4*i, rd); end
    t_last=$realtime; t_win_end=$time; $display("WINDOW_END %0t", $time);
    sim_ns=t_last-t_first; mbps=ptlen*8*1000.0/sim_ns;
    $display("THROUGHPUT level=spi adlen=%0d ptlen=%0d sim_time_ns=%0.1f pt_bits=%0d mbps=%0.2f cycles=%0d", adlen, ptlen, sim_ns, ptlen*8, mbps, $rtoi(sim_ns/43.48));
    // steady state: start of PT block 0 -> start of PT block 4 (N=4; block 4 is the final empty last-flag block, so this spans the 4 full 16-byte blocks)
    if (npt > 4) begin ss_ns=tpt[4]-tpt[0]; $display("THROUGHPUT_SS level=spi adlen=%0d ptlen=%0d N=4 from_blk=0 to_blk=4 window_ns=%0.1f pt_bits=%0d mbps=%0.2f", adlen, ptlen, ss_ns, 4*128, 4*128*1000.0/ss_ns); end
    $display("RESULT adlen=%0d ptlen=%0d frames=%0d window_us=%0d errors=%0d %s", adlen, ptlen, nframes, (t_win_end-t_win_start)/1000, errors, errors==0?"PASS":"FAIL");
    $finish;
  end
  initial begin #400000000; $display("TIMEOUT"); $finish; end
endmodule
