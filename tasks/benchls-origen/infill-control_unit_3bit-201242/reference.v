module origen_201242(
    input clock,
    input [2:0] OpCode,
    input [15:0] Instr,
    input reset,
    output reg RegWrite,
    output reg [1:0] RegDst,
    output reg ALUSrc,
    output reg [1:0] ALUOp,
    output reg Branch,
    output reg MemWrite,
    output reg MemRead,
    output reg [1:0] MemtoReg
);

always @(OpCode, reset) begin
    if (reset) begin
        RegWrite <= 0;
        RegDst <= 0;
        ALUSrc <= 0;
        ALUOp <= 0;
        Branch <= 0;
        MemWrite <= 0;
        MemRead <= 0;
        MemtoReg <= 0;
    end
    else begin
        case (OpCode)
            3'b000: begin // R-type
                RegWrite <= 1;
                RegDst <= 1;
                ALUSrc <= 0;
                ALUOp <= 2'b10;
                Branch <= 0;
                MemWrite <= 0;
                MemRead <= 0;
                MemtoReg <= 0;
            end
            3'b010: begin // Branch
                RegWrite <= 0;
                RegDst <= 0;
                ALUSrc <= 0;
                ALUOp <= 0;
                Branch <= 1;
                MemWrite <= 0;
                MemRead <= 0;
                MemtoReg <= 0;
            end
            3'b011: begin // I-type (load/store)
                RegWrite <= 1;
                RegDst <= 0;
                ALUSrc <= 1;
                ALUOp <= 0;
                Branch <= 0;
                MemWrite <= 0;
                MemRead <= 0;
                MemtoReg <= 0;
            end
            3'b101: begin // Load
                RegWrite <= 1;
                RegDst <= 0;
                ALUSrc <= 1;
                ALUOp <= 0;
                Branch <= 0;
                MemWrite <= 0;
                MemRead <= 1;
                MemtoReg <= 1;
            end
            3'b110: begin // Store
                RegWrite <= 0;
                RegDst <= 0;
                ALUSrc <= 1;
                ALUOp <= 0;
                Branch <= 0;
                MemWrite <= 1;
                MemRead <= 0;
                MemtoReg <= 0;
            end
            3'b111: begin // NOP
                RegWrite <= 0;
                RegDst <= 0;
                ALUSrc <= 0;
                ALUOp <= 0;
                Branch <= 0;
                MemWrite <= 0;
                MemRead <= 0;
                MemtoReg <= 0;
            end
            3'b001: begin // Jump
                RegWrite <= 1;
                RegDst <= 2;
                ALUSrc <= 0;
                ALUOp <= 0;
                Branch <= 0;
                MemWrite <= 0;
                MemRead <= 0;
                MemtoReg <= 2;
            end
            default: begin
                RegWrite <= 0;
                RegDst <= 0;
                ALUSrc <= 0;
                ALUOp <= 0;
                Branch <= 0;
                MemWrite <= 0;
                MemRead <= 0;
                MemtoReg <= 0;
            end
        endcase
    end
end

endmodule