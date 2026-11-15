module origen_207413(
    input           clk,
    input           rst,
    input           input_rdy,
    output reg      input_acc,
    output reg      ld_reg,
    output reg      inc,
    output reg      start,
    output reg      icc,
    input           outsent
);

    reg [2:0] state;
    reg [1:0] cnt;

    localparam IDLE         = 3'd0;
    localparam RDY          = 3'd1;
    localparam GET_DATA     = 3'd2;
    localparam WAIT_FOR_INPUT_RDY = 3'd3;
    localparam WAIT_FOR_BUFFER = 3'd4;
    localparam START        = 3'd5;

    [MASKED]

endmodule