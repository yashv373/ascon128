// ============================================================================
// tb_spi_slave.v  -  Full-chip integration test with REAL derived clocks and
// a FREE-RUNNING sclk master.
// ============================================================================
`timescale 1ns/1ps
module tb_spi_slave;
    reg clk_128=0, rst_n=0;
    integer errors=0; reg [31:0] v;

    always #3.90625 clk_128 = ~clk_128;      // ~128 MHz PLL output

    wire clk, sclk_raw;
    wire sclk;
    clk_divider #(.DIV(128))  u_dclk  (.clk_in(clk_128), .rst_n(rst_n), .clk_out(clk));      // clk = 1 MHz
    clk_divider #(.DIV(4096)) u_dsclk (.clk_in(clk_128), .rst_n(rst_n), .clk_out(sclk_raw)); // sclk = 31.25 kHz
    assign #5 sclk = sclk_raw; // 5 ns skew to eliminate 0-ps race between clk & sclk in gate-level SDF simulation

    // master command interface (sclk domain)
    reg        mstart=0, mrw=0;
    reg  [6:0] maddr=0;
    reg [31:0] mwdata=0;
    wire       mbusy, mdone;
    wire [31:0] mrdata;
    wire sclk_w;
    assign sclk_w = sclk;
    wire  mosi, miso, cs_n;

    spi_master u_mst (
        .sclk(sclk), .rst_n(rst_n),
        .start(mstart), .rw(mrw), .addr(maddr), .wdata(mwdata),
        .busy(mbusy), .done(mdone), .rdata(mrdata),
        .cs_n(cs_n), .mosi(mosi), .miso(miso)
    );

    spi_slave u_chip (
        .clk(clk), .rst_n(rst_n),
        .sclk(sclk), .mosi(mosi), .miso(miso), .cs_n(cs_n)
    );

    // ---- one register access through the free-running master (sclk domain) ----
    task do_xfer(input rw_i, input [6:0] a, input [31:0] wd, output [31:0] rdo);
    begin
        @(negedge sclk); mrw=rw_i; maddr=a; mwdata=wd; mstart=1'b1;
        @(negedge sclk); mstart=1'b0;
        @(posedge mdone);
        @(negedge sclk);
        rdo = mrdata;
    end
    endtask
    task wr(input [6:0] a, input [31:0] d); reg [31:0] j; begin do_xfer(1'b1,a,d,j); end endtask
    task rd(input [6:0] a, output [31:0] d); begin do_xfer(1'b0,a,32'd0,d); end endtask
    task poll(input integer b);
        reg [31:0] s; begin rd(7'h24,s); while(!s[b]) rd(7'h24,s); end
    endtask
    task chk(input [31:0] got, input [31:0] exp);
        begin
            if (got!==exp) begin $display("      FAIL got %08x exp %08x",got,exp); errors=errors+1; end
            else $display("      ok:  %08x",got);
        end
    endtask
    task load_kn;
    begin
        wr(7'h00,32'h03020100); wr(7'h04,32'h07060504);
        wr(7'h08,32'h0b0a0908); wr(7'h0C,32'h0f0e0d0c);
        wr(7'h10,32'h13121110); wr(7'h14,32'h17161514);
        wr(7'h18,32'h1b1a1918); wr(7'h1C,32'h1f1e1d1c);
    end
    endtask
    task load_tag(input [31:0] t0,input [31:0] t1,input [31:0] t2,input [31:0] t3);
    begin wr(7'h50,t0); wr(7'h54,t1); wr(7'h58,t2); wr(7'h5C,t3); end endtask

    // Pre-sets ad_empty and dec_mode so CDC synchronizers settle before start=1
    task start_op(input dec, input adempty);
    begin
        wr(7'h20, {29'd0, adempty, dec, 1'b0});
        repeat(5) @(posedge sclk);
        wr(7'h20, {29'd0, adempty, dec, 1'b1});
        wr(7'h20, {29'd0, adempty, dec, 1'b0});
    end endtask

    task push(input sel, input last, input [4:0] nbytes,
              input [31:0] d0,input [31:0] d1,input [31:0] d2,input [31:0] d3);
    begin
        poll(3);
        wr(7'h28, {25'd0, nbytes, last, sel});
        wr(7'h30,d0); wr(7'h34,d1); wr(7'h38,d2); wr(7'h3C,d3);
    end
    endtask
    task expect_out(input [31:0] e0,input [31:0] e1,input [31:0] e2,input [31:0] e3,input integer n);
        reg [31:0] x; begin
        poll(4);
        rd(7'h40,x); if(n>0) chk(x,e0); rd(7'h44,x); if(n>1) chk(x,e1);
        rd(7'h48,x); if(n>2) chk(x,e2); rd(7'h4C,x); if(n>3) chk(x,e3);
    end
    endtask
    task check_tag(input [31:0] e0,input [31:0] e1,input [31:0] e2,input [31:0] e3);
        reg [31:0] x; begin
        poll(1);
        rd(7'h50,x); chk(x,e0); rd(7'h54,x); chk(x,e1);
        rd(7'h58,x); chk(x,e2); rd(7'h5C,x); chk(x,e3);
    end
    endtask
    task check_auth(input exp);
        reg [31:0] s; begin
        poll(1); rd(7'h24,s);
        if (s[2]!==exp) begin $display("      FAIL auth_ok=%b exp=%b",s[2],exp); errors=errors+1; end
        else $display("      ok:  auth_ok=%b",s[2]);
    end
    endtask

    initial begin
        #1000;
        rst_n=0; #2000; rst_n=1;
        repeat(6) @(posedge sclk);          // let both reset synchronizers release

        $display("\n[CASE1] encrypt no-AD / no-PT");
        load_kn; start_op(1'b0,1'b1);
        push(1'b1,1'b1,5'd0, 32'h00000000,32'h00000000,32'h00000000,32'h00000000);
        check_tag(32'h82279c4f,32'h31c9be11,32'h468ff66b,32'hc62e8bee);

        $display("\n[CASE2] encrypt AD-only (13B)");
        load_kn; start_op(1'b0,1'b0);
        push(1'b0,1'b1,5'd13, 32'h64616568,32'h642d7265,32'h21617461,32'h00000021);
        push(1'b1,1'b1,5'd0, 32'h00000000,32'h00000000,32'h00000000,32'h00000000);
        check_tag(32'h83b1a67b,32'heb6b5504,32'hb0e4af81,32'h506c9b4e);

        $display("\n[CASE3] encrypt PT-only (20B)");
        load_kn; start_op(1'b0,1'b1);
        push(1'b1,1'b0,5'd16, 32'h03020100,32'h07060504,32'h0b0a0908,32'h0f0e0d0c);
        expect_out(32'hcefee3c8,32'hcae54c04,32'h1152c8c3,32'h9b82b718, 4);
        push(1'b1,1'b1,5'd4, 32'h13121110,32'h00000000,32'h00000000,32'h00000000);
        expect_out(32'h79ff2015,32'h00000000,32'h00000000,32'h00000000, 1);
        check_tag(32'h4ed1cea9,32'h4f9ee413,32'he7a0576c,32'he514e7e8);

        $display("\n[CASE4] encrypt AD(13B)+PT(40B)");
        load_kn; start_op(1'b0,1'b0);
        push(1'b0,1'b1,5'd13, 32'h64616568,32'h642d7265,32'h21617461,32'h00000021);
        push(1'b1,1'b0,5'd16, 32'h03020100,32'h07060504,32'h0b0a0908,32'h0f0e0d0c);
        expect_out(32'hf174bf5e,32'h2c430f33,32'h91633386,32'hb4bc0d0c, 4);
        push(1'b1,1'b0,5'd16, 32'h13121110,32'h17161514,32'h1b1a1918,32'h1f1e1d1c);
        expect_out(32'hd4674209,32'h7cd73d78,32'h4653df21,32'hc7ef592b, 4);
        push(1'b1,1'b1,5'd8, 32'h23222120,32'h27262524,32'h00000000,32'h00000000);
        expect_out(32'hce30b0f0,32'hb2a3ed09,32'h00000000,32'h00000000, 2);
        check_tag(32'h7f5d2aa2,32'h82fecae3,32'he48e057a,32'h0730f873);

        $display("\n[CASE5] decrypt CASE4 (good tag) -> auth_ok=1");
        load_kn; load_tag(32'h7f5d2aa2,32'h82fecae3,32'he48e057a,32'h0730f873);
        start_op(1'b1,1'b0);
        push(1'b0,1'b1,5'd13, 32'h64616568,32'h642d7265,32'h21617461,32'h00000021);
        push(1'b1,1'b0,5'd16, 32'hf174bf5e,32'h2c430f33,32'h91633386,32'hb4bc0d0c);
        expect_out(32'h03020100,32'h07060504,32'h0b0a0908,32'h0f0e0d0c, 4);
        push(1'b1,1'b0,5'd16, 32'hd4674209,32'h7cd73d78,32'h4653df21,32'hc7ef592b);
        expect_out(32'h13121110,32'h17161514,32'h1b1a1918,32'h1f1e1d1c, 4);
        push(1'b1,1'b1,5'd8, 32'hce30b0f0,32'hb2a3ed09,32'h00000000,32'h00000000);
        expect_out(32'h23222120,32'h27262524,32'h00000000,32'h00000000, 2);
        check_auth(1'b1);

        $display("\n[CASE6] decrypt CASE4 (bad tag) -> auth_ok=0");
        load_kn; load_tag(32'h7f5d2aa3,32'h82fecae3,32'he48e057a,32'h0730f873);
        start_op(1'b1,1'b0);
        push(1'b0,1'b1,5'd13, 32'h64616568,32'h642d7265,32'h21617461,32'h00000021);
        push(1'b1,1'b0,5'd16, 32'hf174bf5e,32'h2c430f33,32'h91633386,32'hb4bc0d0c);
        expect_out(32'h03020100,32'h07060504,32'h0b0a0908,32'h0f0e0d0c, 4);
        push(1'b1,1'b0,5'd16, 32'hd4674209,32'h7cd73d78,32'h4653df21,32'hc7ef592b);
        expect_out(32'h13121110,32'h17161514,32'h1b1a1918,32'h1f1e1d1c, 4);
        push(1'b1,1'b1,5'd8, 32'hce30b0f0,32'hb2a3ed09,32'h00000000,32'h00000000);
        expect_out(32'h23222120,32'h27262524,32'h00000000,32'h00000000, 2);
        check_auth(1'b0);

        if (errors==0) $display("\n==== free-running SPI + chip: ALL 6 CASES PASSED ====\n");
        else           $display("\n==== %0d FAILURE(S) ====\n",errors);
        $finish;
    end

    initial begin #60000000 $display("TIMEOUT"); $finish; end
endmodule
