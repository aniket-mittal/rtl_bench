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

    always @(*) begin
        casex(Selector)
            R_TYPE_AND:    ALUControlValues = 5'b00000;
            R_TYPE_OR:     ALUControlValues = 5'b00001;
            R_TYPE_NOR:    ALUControlValues = 5'b00010;
            R_TYPE_ADD:    ALUControlValues = 5'b00011;
            R_TYPE_SUB:    ALUControlValues = 5'b00100;
            R_TYPE_SLL:    ALUControlValues = 5'b00101;
            R_TYPE_SRL:    ALUControlValues = 5'b00110;
            R_TYPE_JR:     ALUControlValues = 5'b10000;
            I_TYPE_ADDI:   ALUControlValues = 5'b00011;
            I_TYPE_ORI:    ALUControlValues = 5'b00001;
            I_TYPE_LUI:    ALUControlValues = 5'b00111;
            I_TYPE_LW:     ALUControlValues = 5'b00011;
            I_TYPE_SW:     ALUControlValues = 5'b00011;
            I_TYPE_BEQ:    ALUControlValues = 5'b00100;
            I_TYPE_BNE:    ALUControlValues = 5'b00100;
            default:       ALUControlValues = 5'b00000;
        endcase
    end

    always @(*) begin
        ALUOperation = ALUControlValues[3:0];
        JrFlag = ALUControlValues[4];
    end

endmodule