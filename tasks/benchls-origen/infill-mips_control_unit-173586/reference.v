module origen_173586(
    input [5:0] opCode,
    output reg regDst,
    output reg aluSrc,
    output reg memToReg,
    output reg regWrite,
    output reg memRead,
    output reg memWrite,
    output reg branch,
    output reg [1:0] aluOp,
    output reg jmp
);

    always @(*) begin
        case (opCode)
            6'b000010: begin // Jump
                jmp = 1'b1;
                regDst = 1'b0;
                aluSrc = 1'b0;
                memToReg = 1'b0;
                regWrite = 1'b0;
                memRead = 1'b0;
                memWrite = 1'b0;
                branch = 1'b0;
                aluOp = 2'b00;
            end
            6'b000000: begin // R-type
                jmp = 1'b0;
                regDst = 1'b1;
                aluSrc = 1'b0;
                memToReg = 1'b0;
                regWrite = 1'b1;
                memRead = 1'b0;
                memWrite = 1'b0;
                branch = 1'b0;
                aluOp = 2'b10;
            end
            6'b100011: begin // Load
                jmp = 1'b0;
                regDst = 1'b0;
                aluSrc = 1'b1;
                memToReg = 1'b1;
                regWrite = 1'b1;
                memRead = 1'b1;
                memWrite = 1'b0;
                branch = 1'b0;
                aluOp = 2'b00;
            end
            6'b101011: begin // Store
                jmp = 1'b0;
                regDst = 1'b0;
                aluSrc = 1'b1;
                memToReg = 1'b0;
                regWrite = 1'b0;
                memRead = 1'b0;
                memWrite = 1'b1;
                branch = 1'b0;
                aluOp = 2'b00;
            end
            6'b000100: begin // Branch
                jmp = 1'b0;
                regDst = 1'b0;
                aluSrc = 1'b0;
                memToReg = 1'b0;
                regWrite = 1'b0;
                memRead = 1'b0;
                memWrite = 1'b0;
                branch = 1'b1;
                aluOp = 2'b01;
            end
            6'b001000: begin // addi
                jmp = 1'b0;
                regDst = 1'b0;
                aluSrc = 1'b1;
                memToReg = 1'b0;
                regWrite = 1'b1;
                memRead = 1'b0;
                memWrite = 1'b0;
                branch = 1'b0;
                aluOp = 2'b11;
            end
            default: begin
                jmp = 1'b0;
                regDst = 1'b0;
                aluSrc = 1'b0;
                memToReg = 1'b0;
                regWrite = 1'b0;
                memRead = 1'b0;
                memWrite = 1'b0;
                branch = 1'b0;
                aluOp = 2'b00;
            end
        endcase
    end

endmodule