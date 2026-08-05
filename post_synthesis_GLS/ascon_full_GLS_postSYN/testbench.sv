`timescale 1ns/1ps
module testbench;
  // Instantiate the testbench
  tb_spi_slave tb();

  initial begin
    $display("=========================================================");
    $display(" Loading SDF File for Timing-Aware GLS Simulation...");
    $display("=========================================================");
    $sdf_annotate("spi_slave.sdf", tb.u_chip, , "sdf_annotate.log", "MAXIMUM");
    $display("SDF Annotation Complete.");
  end
endmodule
