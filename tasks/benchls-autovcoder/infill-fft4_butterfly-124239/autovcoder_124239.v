module autovcoder_124239 (
    input clk,
    input rst,
    input [15:0] x0_real, x0_imag,
    input [15:0] x1_real, x1_imag,
    input [15:0] x2_real, x2_imag,
    input [15:0] x3_real, x3_imag,
    output reg [15:0] y0_real, y0_imag,
    output reg [15:0] y1_real, y1_imag,
    output reg [15:0] y2_real, y2_imag,
    output reg [15:0] y3_real, y3_imag,
    input start,
    output reg done
);
    reg [1:0] state;
    parameter IDLE = 2'b00, PROCESS = 2'b01, DONE = 2'b10;

    [MASKED]
endmodule