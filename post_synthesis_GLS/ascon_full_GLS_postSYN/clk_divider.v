// ============================================================================
// clk_divider.v  -  Power-of-2 clock divider (counter + toggle).
//   clk_out = clk_in / DIV.  DIV must be even (it is a /2 toggle after DIV/2
//   input cycles). Same structure as the /8 example, generalized.
//     DIV=8  -> HALF=4, counts 0..3 then toggles  (matches the sample)
// ============================================================================
`timescale 1ns/1ps
module clk_divider #(
    parameter integer DIV = 4          // total divide ratio (even)
)(
    input  wire clk_in,
    input  wire rst_n,                 // async, active-low
    output reg  clk_out
);
    localparam integer HALF = DIV/2;                   // input cycles per half period
    localparam integer CW   = (HALF <= 2) ? 1 : $clog2(HALF);
    reg [CW-1:0] cnt;
    always @(posedge clk_in or negedge rst_n) begin
        if (!rst_n) begin
            cnt <= 0; clk_out <= 1'b0;
        end else if (cnt == HALF-1) begin
            cnt <= 0; clk_out <= ~clk_out;             // toggle each half period
        end else begin
            cnt <= cnt + 1'b1;
        end
    end
endmodule



