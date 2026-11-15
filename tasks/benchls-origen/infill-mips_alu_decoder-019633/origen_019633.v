module origen_019633(
    input [5:0] ALUOp,
    input [5:0] ALUFunction,
    output reg [3:0] ALUOperation,
    output reg JrFlag
);

    wire [11:0] Selector;
    reg [4:0] ALUControlValues;

    assign Selector = {ALUOp, ALUFunction};

    // Local parameters for instruction types
    localparam R_TYPE_AND    = 12'b000000_100100;
    localparam R_TYPE_OR     = 12'b000000_100101;
    localparam R_TYPE_NOR    = 12'b000000_100111;
    localparam R_TYPE_ADD    = 12'b000000_100000;
    localparam R_TYPE_SUB    = 12'b000000_100010;
    localparam R_TYPE_SLL    = 12'b000000_000000;
    localparam R_TYPE_SRL    = 12'b000000_000010;
    localparam R_TYPE_JR     = 12'b000000_001000;
    localparam I_TYPE_ADDI   = 12'b001000_xxxxxx;
    localparam I_TYPE_ORI    = 12'b001101_xxxxxx;
    localparam I_TYPE_LUI    = 12'b001111_xxxxxx;
    localparam I_TYPE_LW     = 12'b100011_xxxxxx;
    localparam I_TYPE_SW     = 12'b101011_xxxxxx;
    localparam I_TYPE_BEQ    = 12'b000100_xxxxxx;
    localparam I_TYPE_BNE    = 12'b000101_xxxxxx;

    [MASKED]

    always @(*) begin
        ALUOperation = ALUControlValues[3:0];
        JrFlag = ALUControlValues[4];
    end

endmodule