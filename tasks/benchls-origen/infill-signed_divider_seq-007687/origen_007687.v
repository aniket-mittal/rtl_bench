module origen_007687(
    input wire clk,
    input wire rst,
    input wire signed_div_i,
    input wire [31:0] opdata1_i,
    input wire [31:0] opdata2_i,
    input wire start_i,
    input wire annul_i,
    output reg [63:0] result_o,
    output reg ready_o
);

    // FSM states
    localparam DivFree = 2'b00;
    localparam DivByZero = 2'b01;
    localparam DivOn = 2'b10;
    localparam DivEnd = 2'b11;

    reg [1:0] state;
    reg [5:0] cnt;
    reg [64:0] tempresult;
    reg [31:0] temp_op1, temp_op2;
    reg [31:0] dividend, divisor;
    reg invert_result;

    [MASKED]

endmodule