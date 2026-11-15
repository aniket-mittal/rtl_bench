module origen_121156 (
    input [6:0] Opcode,
    output reg ALUSrc,
    output reg MemtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg [1:0] ALUOp,
    output reg Branch,
    output reg JalrSel,
    output reg [1:0] RWSel
);

    // Instruction type constants
    parameter R_TYPE = 7'b0110011;
    parameter LW     = 7'b0000011;
    parameter SW     = 7'b0100011;
    parameter RTypeI = 7'b0010011;
    parameter BR     = 7'b1100011;
    parameter JAL    = 7'b1101111;
    parameter JALR   = 7'b1100111;
    parameter LUI    = 7'b0110111;
    parameter AUIPC  = 7'b0010111;

    always @(*) begin
        // Default values
        ALUSrc = 1'b0;
        MemtoReg = 1'b0;
        RegWrite = 1'b0;
        MemRead = 1'b0;
        MemWrite = 1'b0;
        ALUOp = 2'b00;
        Branch = 1'b0;
        JalrSel = 1'b0;
        RWSel = 2'b00;

        case (Opcode)
            R_TYPE: begin
                RegWrite = 1'b1;
                ALUOp = 2'b10;
            end
            LW: begin
                ALUSrc = 1'b1;
                MemtoReg = 1'b1;
                RegWrite = 1'b1;
                MemRead = 1'b1;
                ALUOp = 2'b00;
            end
            SW: begin
                ALUSrc = 1'b1;
                MemWrite = 1'b1;
                ALUOp = 2'b00;
            end
            RTypeI: begin
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                ALUOp = 2'b10;
            end
            BR: begin
                Branch = 1'b1;
                ALUOp = 2'b01;
            end
            JAL: begin
                RegWrite = 1'b1;
                Branch = 1'b1;
                RWSel = 2'b10;
            end
            JALR: begin
                ALUSrc = 1'b1;
                RegWrite = 1'b1;
                JalrSel = 1'b1;
                RWSel = 2'b10;
            end
            LUI: begin
                RegWrite = 1'b1;
                ALUOp = 2'b11;
                RWSel = 2'b11;
            end
            AUIPC: begin
                RegWrite = 1'b1;
                ALUOp = 2'b00;
                RWSel = 2'b01;
            end
            default: begin
                // Default values already set
            end
        endcase
    end

endmodule