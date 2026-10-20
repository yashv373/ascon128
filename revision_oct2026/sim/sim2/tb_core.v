// Core-level cycle-count TB for ascon_core_adpt_encdec (encrypt). Zero-wait stream driver.
// plusargs: +ADLEN=n +PTLEN=n ; files ad.hex pt.hex exp.hex (1 byte/line; exp = CT||TAG)
`timescale 1ns/1ps
module tb_core;
  reg clk=0, rst_n=0; always #25 clk=~clk;   // 20 MHz (50 ns), matches pd_closure/best/constraints.sdc
  reg start=0, ad_empty=0, ad_valid=0, ad_last=0, din_valid=0, din_last=0;
  reg [127:0] ad_data=0, din_data=0; reg [4:0] ad_bytes=0, din_bytes=0;
  wire ad_ready, din_ready, dout_valid, dout_last, busy, done, auth_ok;
  wire [127:0] dout_data; wire [4:0] dout_bytes; wire [63:0] t0,t1;
  ascon_core_adpt_encdec dut(.clk(clk),.rst_n(rst_n),.start(start),.dec_mode(1'b0),
    .k0_in(64'h0706050403020100),.k1_in(64'h0f0e0d0c0b0a0908),
    .n0_in(64'h1716151413121110),.n1_in(64'h1f1e1d1c1b1a1918),.tag0_in(64'd0),.tag1_in(64'd0),
    .ad_empty(ad_empty),.ad_valid(ad_valid),.ad_last(ad_last),.ad_data(ad_data),.ad_bytes(ad_bytes),.ad_ready(ad_ready),
    .din_valid(din_valid),.din_last(din_last),.din_data(din_data),.din_bytes(din_bytes),.din_ready(din_ready),
    .dout_valid(dout_valid),.dout_last(dout_last),.dout_data(dout_data),.dout_bytes(dout_bytes),
    .busy(busy),.done(done),.auth_ok(auth_ok),.t0_out(t0),.t1_out(t1));
  integer cyc=0; always @(posedge clk) cyc<=cyc+1;
  reg [7:0] adm[0:4095], ptm[0:4095], expm[0:4095];
  integer adlen, ptlen, i, b, nfull, rem, errors=0, c_start, c_done, ob=0, n;
  reg [7:0] eb;
  real t_first=-1.0, t_done, sim_ns, mbps, ss_ns, tblk[0:4095];   // throughput timestamps (ns)
  integer nblk=0;
  // monitor events (cycle = posedge index at which handshake is sampled)
  always @(posedge clk) begin
    if (ad_valid && ad_ready)   $display("EVT AD_CONSUME cyc=%0d", cyc);
    if (din_valid && din_ready) $display("EVT DIN_CONSUME cyc=%0d", cyc);
    if (dout_valid) begin
      $display("EVT DOUT_VALID cyc=%0d bytes=%0d", cyc, dout_bytes);
      for (n=0;n<dout_bytes;n=n+1) begin
        eb = expm[ob+n]; if (dout_data[8*n+:8]!==eb) begin errors=errors+1; $display("CT MISMATCH byte %0d got %02x exp %02x",ob+n,dout_data[8*n+:8],eb); end
      end
      ob = ob + dout_bytes;
    end
  end
  task push_ad(input [127:0] d, input [4:0] nb, input last);
    begin if (t_first<0.0) t_first=$realtime;
      ad_data<=d; ad_bytes<=nb; ad_last<=last; ad_valid<=1;
      @(posedge clk); while(!ad_ready) @(posedge clk);  // handshake sampled at this edge
      ad_valid<=0; end endtask
  task push_din(input [127:0] d, input [4:0] nb, input last);
    begin if (t_first<0.0) t_first=$realtime; tblk[nblk]=$realtime; nblk=nblk+1;
      din_data<=d; din_bytes<=nb; din_last<=last; din_valid<=1;
      @(posedge clk); while(!din_ready) @(posedge clk);
      din_valid<=0; end endtask
  reg [127:0] blk;
  initial begin
    if(!$value$plusargs("ADLEN=%d",adlen)) adlen=0; if(!$value$plusargs("PTLEN=%d",ptlen)) ptlen=0;
    $readmemh("ad.hex",adm); $readmemh("pt.hex",ptm); $readmemh("exp.hex",expm);
    if ($test$plusargs("VCD")) begin $dumpfile("core.vcd"); $dumpvars(0,tb_core); end
    repeat(4) @(posedge clk); rst_n<=1; repeat(2) @(posedge clk);
    ad_empty <= (adlen==0);
    @(posedge clk); start<=1; c_start=cyc+1; $display("EVT START cyc=%0d", cyc+1); @(posedge clk); start<=0;
    // AD
    if (adlen>0) begin
      nfull=adlen/16; rem=adlen%16;
      for (b=0;b<nfull;b=b+1) begin blk=0; for(i=0;i<16;i=i+1) blk[8*i+:8]=adm[16*b+i]; push_ad(blk,5'd16,1'b0); end
      blk=0; for(i=0;i<rem;i=i+1) blk[8*i+:8]=adm[16*nfull+i]; push_ad(blk,rem[4:0],1'b1);
    end
    // PT
    nfull=ptlen/16; rem=ptlen%16;
    for (b=0;b<nfull;b=b+1) begin blk=0; for(i=0;i<16;i=i+1) blk[8*i+:8]=ptm[16*b+i]; push_din(blk,5'd16,1'b0); end
    blk=0; for(i=0;i<rem;i=i+1) blk[8*i+:8]=ptm[16*nfull+i]; push_din(blk,rem[4:0],1'b1);
    @(posedge clk); while(!done) @(posedge clk);
    c_done=cyc; t_done=$realtime; $display("EVT DONE cyc=%0d", cyc);
    for(i=0;i<8;i=i+1) begin
      if (t0[8*i+:8]!==expm[ptlen+i]) errors=errors+1;
      if (t1[8*i+:8]!==expm[ptlen+8+i]) errors=errors+1;
    end
    sim_ns=t_done-t_first; mbps=ptlen*8*1000.0/sim_ns;
    $display("THROUGHPUT level=core adlen=%0d ptlen=%0d sim_time_ns=%0.1f pt_bits=%0d mbps=%0.2f cycles=%0d", adlen, ptlen, sim_ns, ptlen*8, mbps, $rtoi(sim_ns/50.0));
    // steady state: start of PT block 8 -> start of PT block 40 (N=32 blocks of 128 bit)
    if (nblk > 40) begin ss_ns=tblk[40]-tblk[8]; $display("THROUGHPUT_SS level=core adlen=%0d ptlen=%0d N=32 from_blk=8 to_blk=40 window_ns=%0.1f pt_bits=%0d mbps=%0.2f", adlen, ptlen, ss_ns, 32*128, 32*128*1000.0/ss_ns); end
    $display("RESULT adlen=%0d ptlen=%0d start_to_done_cycles=%0d errors=%0d %s", adlen, ptlen, c_done-c_start, errors, errors==0?"PASS":"FAIL");
    $finish;
  end
  initial begin #50000000; $display("TIMEOUT"); $finish; end
endmodule
