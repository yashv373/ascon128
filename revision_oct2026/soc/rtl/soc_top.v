// soc_top: soc_core with its accelerator slot populated.
// ASCON_PRESENT=1 -> axi_ascon (unmodified RTL), 0 -> DECERR stub. Hand-written; mirrors ipxact/soc_ascon.design.xml.
`timescale 1ns/1ps
`default_nettype none
module soc_top #(parameter ASCON_PRESENT = 1) (input wire clk, input wire resetn, input wire [31:0] irq, output wire trap);
    wire        acc_resetn, awvalid, awready, wvalid, wready, bvalid, bready, arvalid, arready, rvalid, rready;
    wire [6:0]  awaddr, araddr; wire [2:0] awprot, arprot; wire [31:0] wdata, rdata; wire [3:0] wstrb; wire [1:0] bresp, rresp;
    soc_core u_core (.clk(clk), .resetn(resetn), .trap(trap), .irq(irq), .acc_resetn(acc_resetn),
        .acc_awaddr(awaddr), .acc_awprot(awprot), .acc_awvalid(awvalid), .acc_awready(awready),
        .acc_wdata(wdata), .acc_wstrb(wstrb), .acc_wvalid(wvalid), .acc_wready(wready),
        .acc_bresp(bresp), .acc_bvalid(bvalid), .acc_bready(bready),
        .acc_araddr(araddr), .acc_arprot(arprot), .acc_arvalid(arvalid), .acc_arready(arready),
        .acc_rdata(rdata), .acc_rresp(rresp), .acc_rvalid(rvalid), .acc_rready(rready));
    generate if (ASCON_PRESENT) begin : g_ascon
        axi_ascon u_ascon (.S_AXI_ACLK(clk), .S_AXI_ARESETN(acc_resetn),
            .S_AXI_AWADDR(awaddr), .S_AXI_AWPROT(awprot), .S_AXI_AWVALID(awvalid), .S_AXI_AWREADY(awready),
            .S_AXI_WDATA(wdata), .S_AXI_WSTRB(wstrb), .S_AXI_WVALID(wvalid), .S_AXI_WREADY(wready),
            .S_AXI_BRESP(bresp), .S_AXI_BVALID(bvalid), .S_AXI_BREADY(bready),
            .S_AXI_ARADDR(araddr), .S_AXI_ARPROT(arprot), .S_AXI_ARVALID(arvalid), .S_AXI_ARREADY(arready),
            .S_AXI_RDATA(rdata), .S_AXI_RRESP(rresp), .S_AXI_RVALID(rvalid), .S_AXI_RREADY(rready));
    end else begin : g_stub
        axil_stub u_stub (.clk(clk), .resetn(acc_resetn), .awvalid(awvalid), .awready(awready), .wvalid(wvalid), .wready(wready),
            .bresp(bresp), .bvalid(bvalid), .bready(bready), .arvalid(arvalid), .arready(arready),
            .rdata(rdata), .rresp(rresp), .rvalid(rvalid), .rready(rready));
    end endgenerate
endmodule
`default_nettype wire
