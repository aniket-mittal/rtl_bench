module origen_211422(
    input wire clk,
    input wire rst,
    input wire signed_div,
    input wire [31:0] div_opdata1,
    input wire [31:0] div_opdata2,
    input wire div_start,
    input wire div_cancel,
    output reg [63:0] div_res,
    output reg div_done
);

reg [32:0] div_temp;
reg [64:0] dividend;
reg [31:0] divisor;
reg [31:0] opdata1_tmp;
reg [31:0] opdata2_tmp;
reg [1:0] state;
reg [5:0] cnt;

localparam DivFree = 2'b00;
localparam DivZero = 2'b01;
localparam DivOn = 2'b10;
localparam DivEnd = 2'b11;

[MASKED]

endmodule