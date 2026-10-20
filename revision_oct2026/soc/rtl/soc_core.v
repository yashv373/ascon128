// soc_core: PicoRV32 (AXI-Lite) -> verilog-axi axil_interconnect -> {RAM, accelerator slot, sim_ctrl}.
// The accelerator slot (acc_*) is the placeholder: any AXI4-Lite slave with a 7-bit address plugs in.
//   0x0000_0000 RAM 128 KiB | 0x4000_0000 slot 128 B | 0x5000_0000 sim_ctrl 64 B ; other addresses -> DECERR from interconnect
`timescale 1ns/1ps
`default_nettype none
module soc_core (
    input  wire clk, input wire resetn, output wire trap, input wire [31:0] irq,
    // ---- accelerator slot (master side of the interconnect, slave pins on the IP) ----
    output wire        acc_resetn,
    output wire [6:0]  acc_awaddr, output wire [2:0] acc_awprot, output wire acc_awvalid, input wire acc_awready,
    output wire [31:0] acc_wdata,  output wire [3:0] acc_wstrb,  output wire acc_wvalid,  input wire acc_wready,
    input  wire [1:0]  acc_bresp,  input wire acc_bvalid,        output wire acc_bready,
    output wire [6:0]  acc_araddr, output wire [2:0] acc_arprot, output wire acc_arvalid, input wire acc_arready,
    input  wire [31:0] acc_rdata,  input wire [1:0] acc_rresp,   input wire acc_rvalid,   output wire acc_rready
);
    wire rst = ~resetn;
    // ---- CPU ----
    wire        c_awvalid, c_awready, c_wvalid, c_wready, c_bvalid, c_bready, c_arvalid, c_arready, c_rvalid, c_rready;
    wire [31:0] c_awaddr, c_wdata, c_araddr, c_rdata; wire [2:0] c_awprot, c_arprot; wire [3:0] c_wstrb;
    picorv32_axi #(.ENABLE_MUL(1), .ENABLE_DIV(1), .ENABLE_IRQ(1)) u_cpu (
        .clk(clk), .resetn(resetn), .trap(trap),
        .mem_axi_awvalid(c_awvalid), .mem_axi_awready(c_awready), .mem_axi_awaddr(c_awaddr), .mem_axi_awprot(c_awprot),
        .mem_axi_wvalid(c_wvalid), .mem_axi_wready(c_wready), .mem_axi_wdata(c_wdata), .mem_axi_wstrb(c_wstrb),
        .mem_axi_bvalid(c_bvalid), .mem_axi_bready(c_bready),
        .mem_axi_arvalid(c_arvalid), .mem_axi_arready(c_arready), .mem_axi_araddr(c_araddr), .mem_axi_arprot(c_arprot),
        .mem_axi_rvalid(c_rvalid), .mem_axi_rready(c_rready), .mem_axi_rdata(c_rdata),
        .pcpi_valid(), .pcpi_insn(), .pcpi_rs1(), .pcpi_rs2(),
        .pcpi_wr(1'b0), .pcpi_rd(32'b0), .pcpi_wait(1'b0), .pcpi_ready(1'b0), .irq(irq), .eoi(), .trace_valid(), .trace_data());

    // ---- interconnect: 1 slave (CPU) x 3 masters (0 RAM, 1 slot, 2 sim_ctrl) ----
    wire [95:0] m_awaddr, m_araddr, m_wdata, m_rdata; wire [8:0] m_awprot, m_arprot; wire [11:0] m_wstrb;
    wire [2:0] m_awvalid, m_awready, m_wvalid, m_wready, m_bvalid, m_bready, m_arvalid, m_arready, m_rvalid, m_rready;
    wire [5:0] m_bresp, m_rresp;
    axil_interconnect #(.S_COUNT(1), .M_COUNT(3), .DATA_WIDTH(32), .ADDR_WIDTH(32), .M_REGIONS(1),
        .M_BASE_ADDR({32'h5000_0000, 32'h4000_0000, 32'h0000_0000}),
        .M_ADDR_WIDTH({32'd6, 32'd7, 32'd17})) u_ic (
        .clk(clk), .rst(rst),
        .s_axil_awaddr(c_awaddr), .s_axil_awprot(c_awprot), .s_axil_awvalid(c_awvalid), .s_axil_awready(c_awready),
        .s_axil_wdata(c_wdata), .s_axil_wstrb(c_wstrb), .s_axil_wvalid(c_wvalid), .s_axil_wready(c_wready),
        .s_axil_bresp(), .s_axil_bvalid(c_bvalid), .s_axil_bready(c_bready),
        .s_axil_araddr(c_araddr), .s_axil_arprot(c_arprot), .s_axil_arvalid(c_arvalid), .s_axil_arready(c_arready),
        .s_axil_rdata(c_rdata), .s_axil_rresp(), .s_axil_rvalid(c_rvalid), .s_axil_rready(c_rready),
        .m_axil_awaddr(m_awaddr), .m_axil_awprot(m_awprot), .m_axil_awvalid(m_awvalid), .m_axil_awready(m_awready),
        .m_axil_wdata(m_wdata), .m_axil_wstrb(m_wstrb), .m_axil_wvalid(m_wvalid), .m_axil_wready(m_wready),
        .m_axil_bresp(m_bresp), .m_axil_bvalid(m_bvalid), .m_axil_bready(m_bready),
        .m_axil_araddr(m_araddr), .m_axil_arprot(m_arprot), .m_axil_arvalid(m_arvalid), .m_axil_arready(m_arready),
        .m_axil_rdata(m_rdata), .m_axil_rresp(m_rresp), .m_axil_rvalid(m_rvalid), .m_axil_rready(m_rready));

    // ---- M0: RAM ----
    axil_ram #(.DATA_WIDTH(32), .ADDR_WIDTH(17)) u_ram (
        .clk(clk), .rst(rst),
        .s_axil_awaddr(m_awaddr[16:0]), .s_axil_awprot(m_awprot[2:0]), .s_axil_awvalid(m_awvalid[0]), .s_axil_awready(m_awready[0]),
        .s_axil_wdata(m_wdata[31:0]), .s_axil_wstrb(m_wstrb[3:0]), .s_axil_wvalid(m_wvalid[0]), .s_axil_wready(m_wready[0]),
        .s_axil_bresp(m_bresp[1:0]), .s_axil_bvalid(m_bvalid[0]), .s_axil_bready(m_bready[0]),
        .s_axil_araddr(m_araddr[16:0]), .s_axil_arprot(m_arprot[2:0]), .s_axil_arvalid(m_arvalid[0]), .s_axil_arready(m_arready[0]),
        .s_axil_rdata(m_rdata[31:0]), .s_axil_rresp(m_rresp[1:0]), .s_axil_rvalid(m_rvalid[0]), .s_axil_rready(m_rready[0]));

    // ---- M1: accelerator slot ----
    assign acc_awaddr = m_awaddr[32 +: 7]; assign acc_awprot = m_awprot[3 +: 3]; assign acc_awvalid = m_awvalid[1]; assign m_awready[1] = acc_awready;
    assign acc_wdata  = m_wdata[32 +: 32]; assign acc_wstrb  = m_wstrb[4 +: 4];  assign acc_wvalid  = m_wvalid[1];  assign m_wready[1]  = acc_wready;
    assign m_bresp[3:2] = acc_bresp; assign m_bvalid[1] = acc_bvalid; assign acc_bready = m_bready[1];
    assign acc_araddr = m_araddr[32 +: 7]; assign acc_arprot = m_arprot[3 +: 3]; assign acc_arvalid = m_arvalid[1]; assign m_arready[1] = acc_arready;
    assign m_rdata[32 +: 32] = acc_rdata; assign m_rresp[3:2] = acc_rresp; assign m_rvalid[1] = acc_rvalid; assign acc_rready = m_rready[1];

    // ---- M2: sim console / exit ----
    wire ctrl_acc_resetn;
    sim_ctrl u_ctrl (.clk(clk), .resetn(resetn),
        .awaddr(m_awaddr[64 +: 6]), .awvalid(m_awvalid[2]), .awready(m_awready[2]),
        .wdata(m_wdata[64 +: 32]), .wvalid(m_wvalid[2]), .wready(m_wready[2]),
        .bresp(m_bresp[5:4]), .bvalid(m_bvalid[2]), .bready(m_bready[2]),
        .araddr(m_araddr[64 +: 6]), .arvalid(m_arvalid[2]), .arready(m_arready[2]),
        .rdata(m_rdata[64 +: 32]), .rresp(m_rresp[5:4]), .rvalid(m_rvalid[2]), .rready(m_rready[2]),
        .acc_resetn(ctrl_acc_resetn));
    assign acc_resetn = resetn & ctrl_acc_resetn;
endmodule
`default_nettype wire
