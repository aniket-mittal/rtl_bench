module origen_031071 #(parameter W = 6) (
    input [W-1:0] opcode,
    input [W-1:0] funct,
    output reg RegDst,
    output reg MemRead,
    output reg MemtoReg,
    output reg MemWrite,
    output reg ALUsrc,
    output reg RegWrite,
    output reg [W-1:0] ALUop
);

    // Instruction type parameters
    localparam R_TYPE = 6'b000000;
    localparam LW     = 6'b100011;
    localparam SW     = 6'b101011;
    localparam ADDI   = 6'b001000;
    localparam ANDI   = 6'b001100;
    localparam ORI    = 6'b001101;
    localparam XORI   = 6'b001110;
    localparam SLTI   = 6'b001010;
    localparam SLTIU  = 6'b001011;

    // ALU operation parameters
    localparam ALU_ADD  = 6'b100000;
    localparam ALU_SUB  = 6'b100010;
    localparam ALU_AND  = 6'b100100;
    localparam ALU_OR   = 6'b100101;
    localparam ALU_XOR  = 6'b100110;
    localparam ALU_SLT  = 6'b101010;
    localparam ALU_SLTU = 6'b101011;

    always @(*) begin
        // Initialize all control signals to 0
        RegDst = 0;
        MemRead = 0;
        MemtoReg = 0;
        MemWrite = 0;
        ALUsrc = 0;
        RegWrite = 0;
        ALUop = 6'b000000;

        case (opcode)
            R_TYPE: begin
                RegDst = 1;
                RegWrite = 1;
                ALUop = funct;
            end
            LW: begin
                ALUsrc = 1;
                MemtoReg = 1;
                MemRead = 1;
                RegWrite = 1;
                ALUop = ALU_ADD;
            end
            SW: begin
                ALUsrc = 1;
                MemWrite = 1;
                ALUop = ALU_ADD;
            end
            ADDI: begin
                ALUsrc = 1;
                RegWrite = 1;
                ALUop = ALU_ADD;
            end
            ANDI: begin
                ALUsrc = 1;
                RegWrite = 1;
                ALUop = ALU_AND;
            end
            ORI: begin
                ALUsrc = 1;
                RegWrite = 1;
                ALUop = ALU_OR;
            end
            XORI: begin
                ALUsrc = 1;
                RegWrite = 1;
                ALUop = ALU_XOR;
            end
            SLTI: begin
                ALUsrc = 1;
                RegWrite = 1;
                ALUop = ALU_SLT;
            end
            SLTIU: begin
                ALUsrc = 1;
                RegWrite = 1;
                ALUop = ALU_SLTU;
            end
            default: begin
                // Invalid opcode, all control signals remain 0
            end
        endcase
    end

endmodule