module origen_036542(
    input [5:0] Opcode,
    input [21:0] Alu_resultHigh,
    input [5:0] Function_opcode,
    output reg RegDST,
    output reg ALUSrc,
    output reg MemorIOtoReg,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg IORead,
    output reg IOWrite,
    output reg Branch,
    output reg nBranch,
    output reg Jmp,
    output reg Jal,
    output reg I_format,
    output reg Sftmd,
    output reg [1:0] ALUOp,
    output reg Jrn
);

    wire R_format = (Opcode == 6'b000000);
    wire Lw = (Opcode == 6'b100011);
    wire Sw = (Opcode == 6'b101011);

    always @(*) begin
        // Default values
        RegDST = 0;
        ALUSrc = 0;
        MemorIOtoReg = 0;
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        IORead = 0;
        IOWrite = 0;
        Branch = 0;
        nBranch = 0;
        Jmp = 0;
        Jal = 0;
        I_format = 0;
        Sftmd = 0;
        ALUOp = 2'b00;
        Jrn = 0;

        case(Opcode)
            6'b000000: begin // R-format
                RegDST = 1;
                RegWrite = 1;
                ALUOp = 2'b10;
                if (Function_opcode == 6'b001000) begin // Jr
                    Jrn = 1;
                    RegWrite = 0;
                end
                else if (Function_opcode[5:3] == 3'b000) begin // Shift
                    Sftmd = 1;
                end
            end
            6'b100011: begin // Lw
                ALUSrc = 1;
                MemorIOtoReg = 1;
                RegWrite = 1;
                if (Alu_resultHigh == 22'h3fffff) begin
                    IORead = 1;
                end else begin
                    MemRead = 1;
                end
            end
            6'b101011: begin // Sw
                ALUSrc = 1;
                if (Alu_resultHigh == 22'h3fffff) begin
                    IOWrite = 1;
                end else begin
                    MemWrite = 1;
                end
            end
            6'b000100: Branch = 1; // Beq
            6'b000101: nBranch = 1; // Bne
            6'b000010: Jmp = 1; // J
            6'b000011: begin // Jal
                Jal = 1;
                RegWrite = 1;
            end
            default: begin
                if (Opcode[5:3] == 3'b001) begin // I-format
                    I_format = 1;
                    ALUSrc = 1;
                    RegWrite = 1;
                    ALUOp = 2'b11;
                end
            end
        endcase
    end

endmodule