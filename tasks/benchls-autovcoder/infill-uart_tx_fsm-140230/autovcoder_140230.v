module autovcoder_140230 (
    input wire clk,
    input wire rst,
    input wire enable,
    input wire [7:0] data_in,
    output reg tx,
    output reg busy
);
    parameter IDLE = 2'b00;
    parameter START = 2'b01;
    parameter DATA = 2'b10;
    parameter STOP = 2'b11;

    reg [1:0] state;
    reg [3:0] bit_cnt;

    [MASKED]
endmodule