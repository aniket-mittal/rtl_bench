module origen_090476(
    input wire reset,
    input wire [5:0] opCode,
    output reg regDst,
    output reg aluSrc,
    output reg memToReg,
    output reg regWrite,
    output reg memRead,
    output reg memWrite,
    output reg branch,
    output reg [1:0] aluOp,
    output reg jump
);

always @(*) begin
    if (reset) begin
        regDst = 0;
        aluSrc = 0;
        memToReg = 0;
        regWrite = 0;
        memRead = 0;
        memWrite = 0;
        branch = 0;
        aluOp = 2'b00;
        jump = 0;
    end else begin
        case(opCode)
            6'b000010: begin // Jump instruction
                regDst = 0;
                aluSrc = 0;
                memToReg = 0;
                regWrite = 0;
                memRead = 0;
                memWrite = 0;
                branch = 0;
                aluOp = 2'b00;
                jump = 1;
            end
            6'b000000: begin // R-type instruction
                regDst = 1;
                aluSrc = 0;
                memToReg = 0;
                regWrite = 1;
                memRead = 0;
                memWrite = 0;
                branch = 0;
                aluOp = 2'b10;
                jump = 0;
            end
            6'b100011: begin // Load word instruction
                regDst = 0;
                aluSrc = 1;
                memToReg = 1;
                regWrite = 1;
                memRead = 1;
                memWrite = 0;
                branch = 0;
                aluOp = 2'b00;
                jump = 0;
            end
            6'b101011: begin // Store word instruction
                regDst = 1'bx;
                aluSrc = 1;
                memToReg = 1'bx;
                regWrite = 0;
                memRead = 0;
                memWrite = 1;
                branch = 0;
                aluOp = 2'b00;
                jump = 0;
            end
            6'b000100: begin // Branch instruction (corrected opcode)
                regDst = 1'bx;
                aluSrc = 0;
                memToReg = 1'bx;
                regWrite = 0;
                memRead = 0;
                memWrite = 0;
                branch = 1;
                aluOp = 2'b01;
                jump = 0;
            end
            default: begin
                regDst = 0;
                aluSrc = 0;
                memToReg = 0;
                regWrite = 0;
                memRead = 0;
                memWrite = 0;
                branch = 0;
                aluOp = 2'b00;
                jump = 0;
            end
        endcase
    end
end

endmodule