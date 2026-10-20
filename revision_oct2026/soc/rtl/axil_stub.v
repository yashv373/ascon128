// Placeholder accelerator slot: AXI4-Lite slave that answers every access with DECERR and zero data.
`timescale 1ns/1ps
module axil_stub (
    input  wire clk, input wire resetn,
    input  wire        awvalid, output reg  awready,
    input  wire        wvalid,  output reg  wready,
    output reg  [1:0]  bresp,   output reg  bvalid, input wire bready,
    input  wire        arvalid, output reg  arready,
    output reg  [31:0] rdata,   output reg  [1:0] rresp, output reg rvalid, input wire rready
);
    reg aw_d, w_d;
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin
            awready<=0; wready<=0; bvalid<=0; bresp<=0; arready<=0; rvalid<=0; rresp<=0; rdata<=0; aw_d<=0; w_d<=0;
        end else begin
            awready <= awvalid && !aw_d && !bvalid && !awready;
            wready  <= wvalid  && !w_d  && !bvalid && !wready;
            if (awready) aw_d<=1;
            if (wready)  w_d<=1;
            if ((aw_d||awready) && (w_d||wready) && !bvalid) begin bvalid<=1; bresp<=2'b11; aw_d<=0; w_d<=0; end
            if (bvalid && bready) bvalid<=0;
            arready <= arvalid && !rvalid && !arready;
            if (arready) begin rvalid<=1; rresp<=2'b11; rdata<=0; end
            if (rvalid && rready) rvalid<=0;
        end
    end
endmodule
