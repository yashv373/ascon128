// AXI4-Lite level TB: drives axi_ascon directly (no SPI) with a minimal AXI master BFM.
// plusargs: +P=<file prefix> (P_ad.hex P_pt.hex P_exp.hex) +ADLEN +PTLEN [+MIN] [+DEC] [+FLIP]
//  default flow = repo-style: poll in_ready, write BLK, 4x DIN, poll dout_pending, 4x DOUT read, ... poll done, read tag.
//  +MIN : BLK register written only when sel/last/bytes change.
//  +DEC : decrypt: DIN = ciphertext, expected-tag regs written (+FLIP flips bit0 of tag byte0 -> forged tag).
`timescale 1ns/1ps
module tb_axi;
  reg clk=0, rstn=0; always #31.25 clk=~clk;   // 16 MHz (cycle counts are frequency independent)
  reg [6:0] awaddr=0, araddr=0; reg awvalid=0, wvalid=0, bready=0, arvalid=0, rready=0; reg [31:0] wdata=0;
  wire awready, wready, bvalid, arready, rvalid; wire [31:0] rdata; wire [1:0] bresp, rresp;
  axi_ascon dut(.S_AXI_ACLK(clk),.S_AXI_ARESETN(rstn),
    .S_AXI_AWADDR(awaddr),.S_AXI_AWPROT(3'b0),.S_AXI_AWVALID(awvalid),.S_AXI_AWREADY(awready),
    .S_AXI_WDATA(wdata),.S_AXI_WSTRB(4'hf),.S_AXI_WVALID(wvalid),.S_AXI_WREADY(wready),
    .S_AXI_BRESP(bresp),.S_AXI_BVALID(bvalid),.S_AXI_BREADY(bready),
    .S_AXI_ARADDR(araddr),.S_AXI_ARPROT(3'b0),.S_AXI_ARVALID(arvalid),.S_AXI_ARREADY(arready),
    .S_AXI_RDATA(rdata),.S_AXI_RRESP(rresp),.S_AXI_RVALID(rvalid),.S_AXI_RREADY(rready));
  integer cyc=0; always @(posedge clk) cyc<=cyc+1;
  reg aw_d, w_d, got; reg [31:0] rd;
  task wr(input [6:0] a, input [31:0] d);
    begin
      @(negedge clk); awaddr=a; wdata=d; awvalid=1; wvalid=1; bready=1; aw_d=0; w_d=0;
      while (!(aw_d && w_d)) begin
        @(posedge clk); if (awvalid&&awready) aw_d=1; if (wvalid&&wready) w_d=1;
        @(negedge clk); if (aw_d) awvalid=0; if (w_d) wvalid=0;
      end
      got=0; while (!got) begin @(posedge clk); if (bvalid&&bready) got=1; end
      @(negedge clk); bready=0;
    end endtask
  task rdr(input [6:0] a);
    begin
      @(negedge clk); araddr=a; arvalid=1; rready=1; got=0;
      while (!got) begin @(posedge clk); if (arvalid&&arready) got=1; end
      @(negedge clk); arvalid=0; got=0;
      while (!got) begin @(posedge clk); if (rvalid&&rready) begin got=1; rd=rdata; end end
      @(negedge clk); rready=0;
    end endtask
  task poll(input integer bit_);
    begin rdr(7'h24); while (!rd[bit_]) rdr(7'h24); end endtask
  reg [7:0] adm[0:4095], ptm[0:4095], expm[0:4095];
  integer adlen, ptlen, errors=0, b, i, j, nfull, rem, ob, c0, c1, blkcyc, dec, flip, minmode, plain_released=0;
  reg [127:0] blk; reg [31:0] tw[0:3]; reg prev_set; reg [31:0] prev_blk;
  task push(input sel, input last, input [4:0] nb, input [127:0] d, input force_blk);
    reg [31:0] bv;
    begin
      poll(3);
      bv = {25'd0, nb, last, sel};
      if (!minmode || force_blk || !prev_set || bv!==prev_blk) wr(7'h28, bv);
      prev_set=1; prev_blk=bv;
      wr(7'h30,d[31:0]); wr(7'h34,d[63:32]); wr(7'h38,d[95:64]); wr(7'h3C,d[127:96]);
    end endtask
  task getout(input integer nbytes);   // dec: compare against PT; enc: against CT
    begin
      poll(4);
      for (j=0;j<4;j=j+1) begin rdr(7'h40+4*j);
        for (i=0;i<4;i=i+1) if (4*j+i<nbytes) begin
          if (dec) begin if (rd[8*i+:8]!==ptm[ob+4*j+i]) errors=errors+1; else plain_released=plain_released+1; end
          else if (rd[8*i+:8]!==expm[ob+4*j+i]) errors=errors+1;
        end
      end
      ob=ob+nbytes;
    end endtask
  reg [31:0] st;
  initial begin
    string pfx;
    if(!$value$plusargs("ADLEN=%d",adlen)) adlen=0; if(!$value$plusargs("PTLEN=%d",ptlen)) ptlen=0;
    if(!$value$plusargs("P=%s",pfx)) pfx="x";
    minmode=$test$plusargs("MIN"); dec=$test$plusargs("DEC"); flip=$test$plusargs("FLIP");
    $readmemh({pfx,"_ad.hex"},adm); $readmemh({pfx,"_pt.hex"},ptm); $readmemh({pfx,"_exp.hex"},expm);
    prev_set=0; ob=0;
    repeat(4) @(posedge clk); rstn=1; repeat(3) @(posedge clk);
    c0=cyc;
    for (i=0;i<4;i=i+1) wr(7'h00+4*i, {8'd3+8'd4*i[7:0],8'd2+8'd4*i[7:0],8'd1+8'd4*i[7:0],8'd0+8'd4*i[7:0]});   // key 00..0f
    for (i=0;i<4;i=i+1) wr(7'h10+4*i, {8'd19+8'd4*i[7:0],8'd18+8'd4*i[7:0],8'd17+8'd4*i[7:0],8'd16+8'd4*i[7:0]});// nonce 10..1f
    if (dec) begin
      for (i=0;i<4;i=i+1) begin tw[i]={expm[ptlen+4*i+3],expm[ptlen+4*i+2],expm[ptlen+4*i+1],expm[ptlen+4*i]}; end
      if (flip) tw[0]=tw[0]^32'h1;
      for (i=0;i<4;i=i+1) wr(7'h50+4*i, tw[i]);
    end
    wr(7'h20, {29'd0,(adlen==0),dec[0],1'b0}); wr(7'h20, {29'd0,(adlen==0),dec[0],1'b1});
    if (adlen>0) begin
      nfull=adlen/16; rem=adlen%16;
      for (b=0;b<nfull;b=b+1) begin blk=0; for(i=0;i<16;i=i+1) blk[8*i+:8]=adm[16*b+i]; push(0,0,5'd16,blk,0); end
      blk=0; for(i=0;i<rem;i=i+1) blk[8*i+:8]=adm[16*nfull+i]; push(0,1,rem[4:0],blk,0);
    end
    nfull=ptlen/16; rem=ptlen%16;
    for (b=0;b<nfull;b=b+1) begin
      if (b==0) $display("EVT DATA_START cyc=%0d", cyc); if (b==nfull-1) $display("EVT LAST_FULL_START cyc=%0d", cyc);
      blk=0; for(i=0;i<16;i=i+1) blk[8*i+:8]=(dec?expm[16*b+i]:ptm[16*b+i]); push(1,0,5'd16,blk,0); getout(16);
    end
    blk=0; for(i=0;i<rem;i=i+1) blk[8*i+:8]=(dec?expm[16*nfull+i]:ptm[16*nfull+i]); push(1,1,rem[4:0],blk,0);
    if (rem>0) getout(rem);
    $display("EVT DATA_END cyc=%0d", cyc);
    poll(1);
    rdr(7'h24); st=rd;
    for (i=0;i<4;i=i+1) begin rdr(7'h50+4*i);
      if (!dec) for (j=0;j<4;j=j+1) if (rd[8*j+:8]!==expm[ptlen+4*i+j]) errors=errors+1; end
    c1=cyc;
    $display("STATUS=%h auth_ok=%0d", st, st[2]);
    $display("RESULT mode=%s%s%s adlen=%0d ptlen=%0d total_cycles=%0d errors=%0d plain_bytes_matching_PT_released=%0d",
      dec?"DEC":"ENC", flip?"+FORGED":"", minmode?"+MIN":"", adlen, ptlen, c1-c0, errors, plain_released);
    $finish;
  end
  initial begin #2000000000; $display("TIMEOUT"); $finish; end
endmodule
