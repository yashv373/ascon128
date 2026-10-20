// Sim-only console/exit (EXIT: 123456789 = pass, upstream picorv32 convention)/control AXI4-Lite slave @0x5000_0000 (not synthesizable: $write/$finish).
//  0x00 CHAR  (W) $write("%c")      0x04 EXIT (W) code -> $finish (0 = pass)
//  0x08 ACCRST(W) bit0 -> pulse reset to the accelerator slot (SoC-level soft reset; the IP has no soft-reset reg)
//  0x0C PERF  (W) 0 = start timer, n>0 = stop and print throughput for n bytes ($realtime based)
`timescale 1ns/1ps
module sim_ctrl (
    input  wire clk, input wire resetn,
    input  wire [5:0]  awaddr, input wire awvalid, output reg awready,
    input  wire [31:0] wdata,  input wire wvalid,  output reg wready,
    output reg  [1:0]  bresp,  output reg bvalid,  input wire bready,
    input  wire [5:0]  araddr, input wire arvalid, output reg arready,
    output reg  [31:0] rdata,  output reg [1:0] rresp, output reg rvalid, input wire rready,
    output wire acc_resetn
);
    reg [3:0] rst_cnt; assign acc_resetn = (rst_cnt == 0);
    real t0, dt; integer nb;
    wire wr = awvalid && wvalid && !bvalid && !awready;
    always @(posedge clk or negedge resetn) begin
        if (!resetn) begin awready<=0; wready<=0; bvalid<=0; bresp<=0; arready<=0; rvalid<=0; rresp<=0; rdata<=0; rst_cnt<=0; t0=0; end
        else begin
            awready<=wr; wready<=wr;
            if (rst_cnt != 0) rst_cnt <= rst_cnt - 1'b1;
            if (wr) begin
                bvalid<=1; bresp<=0;
                case (awaddr[5:2])
                  4'd0: $write("%c", wdata[7:0]);
                  4'd1: begin $display("SOC_EXIT code=%0d (%0s) t=%0t", wdata, (wdata == 123456789) ? "PASS" : "FAIL", $time); $finish; end
                  4'd2: if (wdata[0]) rst_cnt <= 4'd8;
                  4'd3: if (wdata == 0) t0 = $realtime;
                        else begin
                            dt = $realtime - t0; nb = wdata;
                            $display("PERF bytes=%0d elapsed_ns=%0d throughput_kbit_per_s=%0d (clk=20MHz)",
                                     nb, $rtoi(dt), $rtoi(nb*8.0*1.0e6/dt));
                        end
                  default: ;
                endcase
            end
            if (bvalid && bready) bvalid<=0;
            arready <= arvalid && !rvalid && !arready;
            if (arready) begin rvalid<=1; rresp<=0; rdata<=0; end
            if (rvalid && rready) rvalid<=0;
        end
    end
endmodule
