module origen_213869(
    input clk,
    input rst,
    input start,
    input [9:0] data,
    output reg en,
    output reg flag,
    output reg fin,
    output reg [9:0] addr,
    output reg [9:0] result
);

reg [2:0] state;
reg [9:0] num;
reg [9:0] ans;

localparam IDLE = 3'b000;
localparam S0 = 3'b001;
localparam S1 = 3'b010;
localparam S2 = 3'b011;
localparam S3 = 3'b100;
localparam S4 = 3'b101;
localparam S5 = 3'b110;
localparam S6 = 3'b111;

[MASKED]

endmodule