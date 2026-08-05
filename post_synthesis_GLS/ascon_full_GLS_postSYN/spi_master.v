// ============================================================================
// spi_master.v  -  Synthesizable SPI MASTER, FREE-RUNNING sclk style.
//
//   Runs directly on the (free-running, divided) SPI bit clock `sclk`, exactly
//   like the 16-bit sample master - just 40-bit and read-capable.
//     * MOSI = piso[39] (MSB), piso shifts on  posedge sclk   (mode 1)
//     * MISO sampled into sipo on              negedge sclk
//     * cs_n / bit-window framed by a 40-count on posedge sclk
//   The slave samples MOSI on the falling edge, so presenting MOSI right after
//   the rising edge gives it a full half-period of setup. MSB-first.
//
//   `sclk` is a continuous clock (e.g. 1 MHz from a /128 divider of 128 MHz).
//   Frame = {rw, addr[6:0], wdata[31:0]}.  One frame per `start` pulse.
//
//   Command interface (sclk domain):
//     start : pulse (>=1 sclk, while idle) launches a frame
//     rw    : 1=write (send wdata) / 0=read (result in rdata)
//     busy  : high during a frame ; done : 1-sclk pulse at end
//     rdata : captured 32-bit read data (valid at done)
// ============================================================================
`timescale 1ns/1ps
module spi_master (
    input  wire        sclk,        // free-running SPI bit clock
    input  wire        rst_n,       // async, active-low
    input  wire        start,
    input  wire        rw,
    input  wire [6:0]  addr,
    input  wire [31:0] wdata,
    output reg         busy,
    output reg         done,
    output reg  [31:0] rdata,
    output reg         cs_n,
    output wire        mosi,
    input  wire        miso
);
    reg [39:0] piso;               // transmit shift reg (MSB-first)
    reg [39:0] sipo;               // receive shift reg
    reg [5:0]  bitcnt;             // presented-bit index 0..39
    reg        shifting;

    assign mosi = piso[39];        // MOSI = current MSB (combinational, like sample)

    // ---- TX + framing : posedge sclk (present MOSI, drive cs_n) ----
    always @(posedge sclk or negedge rst_n) begin
        if (!rst_n) begin
            piso<=0; bitcnt<=0; shifting<=0; cs_n<=1; busy<=0; done<=0; rdata<=0;
        end else begin
            done <= 1'b0;
            if (!shifting) begin
                cs_n <= 1'b1; busy <= 1'b0;
                if (start) begin                       // launch a frame
                    piso     <= {rw, addr, wdata};
                    bitcnt   <= 6'd0;
                    shifting <= 1'b1; cs_n <= 1'b0; busy <= 1'b1;
                end
            end else begin
                piso <= {piso[38:0], 1'b0};            // advance to next bit
                if (bitcnt == 6'd39) begin             // 40th bit presented
                    shifting <= 1'b0; cs_n <= 1'b1; busy <= 1'b0;
                    done  <= 1'b1;
                    rdata <= sipo[31:0];               // low 32 bits = read data
                end else bitcnt <= bitcnt + 6'd1;
            end
        end
    end

    // ---- RX : negedge sclk (sample MISO while framed) ----
    always @(negedge sclk or negedge rst_n) begin
        if (!rst_n) sipo <= 40'd0;
        else if (shifting) sipo <= {sipo[38:0], miso};
    end
endmodule
