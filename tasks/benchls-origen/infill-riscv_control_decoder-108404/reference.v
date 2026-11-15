module origen_108404(
    input [6:0] Opcode,
    output reg ALUSrc,
    output reg [1:0] MemtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg Branch,
    output reg jalr,
    output reg lui,
    output reg jal,
    output reg ReadFlag,
    output reg WriteFlag,
    output reg [1:0] ALUOp
);

    // RISC-V Opcodes
    localparam R_TYPE    = 7'b0110011;
    localparam I_TYPE    = 7'b0010011;
    localparam LOAD      = 7'b0000011;
    localparam STORE     = 7'b0100011;
    localparam BRANCH    = 7'b1100011;
    localparam JALR      = 7'b1100111;
    localparam JAL       = 7'b1101111;
    localparam LUI       = 7'b0110111;
    localparam AUIPC     = 7'b0010111;

    always @(*) begin
        // Default values
        ALUSrc = 1'b0;
        MemtoReg = 2'b00;
        RegWrite = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        Branch = 1'b0;
        jalr = 1'b0;
        lui = 1'b0;
        jal = 1'b0;
        ReadFlag = 1'b0;
        WriteFlag = 1'b0;
        ALUOp = 2'b00;

        case(Opcode)
            R_TYPE: begin
                RegWrite = 1'b1;
                ALUOp = 2'b10;
            end
            I_TYPE: begin
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ALUOp = 2'b10;
            end
            LOAD: begin
                ALUSrc = 1'b1;
                MemtoReg = 2'b01;
                RegWrite = 1'b1;
                MemRead = 1'b1;
                ReadFlag = 1'b1;
            end
            STORE: begin
                ALUSrc = 1'b1;
                MemWrite = 1'b1;
                WriteFlag = 1'b1;
            end
            BRANCH: begin
                Branch = 1'b1;
                ALUOp = 2'b01;
            end
            JALR: begin
                ALUSrc = 1'b1;
                MemtoReg = 2'b10;
                RegWrite = 1'b1;
                jalr = 1'b1;
                ALUOp = 2'b11;
            end
            JAL: begin
                MemtoReg = 2'b10;
                RegWrite = 1'b1;
                jal = 1'b1;
                ALUOp = 2'b11;
            end
            LUI: begin
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                lui = 1'b1;
                ALUOp = 2'b11;
            end
            AUIPC: begin
                ALUSrc = 1'b1;
                MemtoReg = 2'b11;
                RegWrite = 1'b1;
                ALUOp = 2'b11;
            end
            default: begin
                // Default values already set
            end
        endcase
    end

endmodule