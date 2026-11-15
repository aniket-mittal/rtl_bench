module origen_032382 (
    input wire [5:0] Opcode,
    input wire rst,
    input wire Enable,
    output reg RegDst,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [1:0] ALUOp,
    output reg MemWrite,
    output reg ALUSrc,
    output reg RegWrite,
    output reg Jump
);

    always @(*) begin
        if (!rst || Enable) begin
            RegDst = 0;
            Branch = 0;
            MemRead = 0;
            MemtoReg = 0;
            ALUOp = 2'b00;
            MemWrite = 0;
            ALUSrc = 0;
            RegWrite = 0;
            Jump = 0;
        end else begin
            case (Opcode)
                6'b000000: begin // R-type
                    RegDst = 1;
                    ALUSrc = 0;
                    MemtoReg = 0;
                    RegWrite = 1;
                    MemRead = 0;
                    MemWrite = 0;
                    Branch = 0;
                    ALUOp = 2'b10;
                    Jump = 0;
                end
                6'b100011: begin // lw
                    RegDst = 0;
                    ALUSrc = 1;
                    MemtoReg = 1;
                    RegWrite = 1;
                    MemRead = 1;
                    MemWrite = 0;
                    Branch = 0;
                    ALUOp = 2'b00;
                    Jump = 0;
                end
                6'b101011: begin // sw
                    RegDst = 1'bx;
                    ALUSrc = 1;
                    MemtoReg = 1'bx;
                    RegWrite = 0;
                    MemRead = 0;
                    MemWrite = 1;
                    Branch = 0;
                    ALUOp = 2'b00;
                    Jump = 0;
                end
                6'b000100: begin // beq
                    RegDst = 1'bx;
                    ALUSrc = 0;
                    MemtoReg = 1'bx;
                    RegWrite = 0;
                    MemRead = 0;
                    MemWrite = 0;
                    Branch = 1;
                    ALUOp = 2'b01;
                    Jump = 0;
                end
                6'b001000: begin // addi
                    RegDst = 0;
                    ALUSrc = 1;
                    MemtoReg = 0;
                    RegWrite = 1;
                    MemRead = 0;
                    MemWrite = 0;
                    Branch = 0;
                    ALUOp = 2'b00;
                    Jump = 0;
                end
                6'b000010: begin // jump
                    RegDst = 1'bx;
                    ALUSrc = 1'bx;
                    MemtoReg = 1'bx;
                    RegWrite = 0;
                    MemRead = 0;
                    MemWrite = 0;
                    Branch = 1'bx;
                    ALUOp = 2'bxx;
                    Jump = 1;
                end
                default: begin
                    RegDst = 0;
                    Branch = 0;
                    MemRead = 0;
                    MemtoReg = 0;
                    ALUOp = 2'b00;
                    MemWrite = 0;
                    ALUSrc = 0;
                    RegWrite = 0;
                    Jump = 0;
                end
            endcase
        end
    end

endmodule