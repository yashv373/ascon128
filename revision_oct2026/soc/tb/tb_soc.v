`timescale 1ns/1ps
module tb_soc #(parameter ASCON_PRESENT = 1, parameter MAXCYC = 40000000);
    reg clk = 0, resetn = 0; wire trap;
    reg [31:0] irq = 0; reg [15:0] count_cycle = 0;
    always #25 clk = ~clk;                       // 20 MHz
    soc_top #(.ASCON_PRESENT(ASCON_PRESENT)) dut (.clk(clk), .resetn(resetn), .irq(irq), .trap(trap));
    // as in picorv32 testbench.v: irq[4]/irq[5] wake the start.S waitirq (reset_vec)
    always @(posedge clk) count_cycle <= resetn ? count_cycle + 1 : 0;
    always @* begin irq = 0; irq[4] = &count_cycle[12:0]; irq[5] = &count_cycle[15:0]; end
    integer cyc = 0, decerr = 0, maxcyc = MAXCYC;
    initial if ($value$plusargs("maxcyc=%d", maxcyc)) ;
    always @(posedge clk) begin
        cyc <= cyc + 1;
        // bus monitor on the slot: count non-OKAY responses (picorv32_axi itself ignores *RESP)
        if (dut.u_core.acc_rvalid && dut.u_core.acc_rready && dut.u_core.acc_rresp != 0) decerr <= decerr + 1;
        if (dut.u_core.acc_bvalid && dut.u_core.acc_bready && dut.u_core.acc_bresp != 0) decerr <= decerr + 1;
        if (trap) begin $display("TRAP cpu trapped at cyc=%0d -> FAIL, slot non-OKAY responses=%0d", cyc, decerr); $finish; end
        if (cyc == maxcyc) begin $display("TIMEOUT after %0d cycles (hang) -> FAIL, slot non-OKAY responses=%0d", cyc, decerr); $finish; end
    end
    initial begin
        $readmemh("fw.hex", dut.u_core.u_ram.mem, 0, 32767);
        repeat (10) @(posedge clk); resetn = 1;
    end
    final $display("BUS_MONITOR slot non-OKAY responses=%0d total_cycles=%0d", decerr, cyc);
endmodule
