module origen_054998(
    input wire stallSignal,
    input wire [5:0] opCode,
    output reg regDst,
    output reg branch,
    output reg memRead,
    output reg memToReg,
    output reg [1:0] aluOp,
    output reg memWrite,
    output reg aluSrc,
    output reg regWrite
);

    always @(*) begin
        case(opCode)
            6'b000000: begin // R-type instruction
                regDst = 1'b1;
                branch = 1'b0;
                memRead = 1'b0;
                memToReg = 1'b0;
                aluOp = 2'b10;
                memWrite = 1'b0;
                aluSrc = 1'b0;
                regWrite = 1'b1;
            end
            6'b100011: begin // Load Word
                regDst = 1'b0;
                branch = 1'b0;
                memRead = 1'b1;
                memToReg = 1'b1;
                aluOp = 2'b00;
                memWrite = 1'b0;
                aluSrc = 1'b1;
                regWrite = 1'b1;
            end
            6'b101011: begin // Store Word
                regDst = 1'b0;
                branch = 1'b0;
                memRead = 1'b0;
                memToReg = 1'b0;
                aluOp = 2'b00;
                memWrite = 1'b1;
                aluSrc = 1'b1;
                regWrite = 1'b0;
            end
            6'b000100: begin // Branch
                regDst = 1'b0;
                branch = 1'b1;
                memRead = 1'b0;
                memToReg = 1'b0;
                aluOp = 2'b01;
                memWrite = 1'b0;
                aluSrc = 1'b0;
                regWrite = 1'b0;
            end
            default: begin
                regDst = 1'b0;
                branch = 1'b0;
                memRead = 1'b1;
                memToReg = 1'b1;
                aluOp = 2'b00;
                memWrite = 1'b0;
                aluSrc = 1'b1;
                regWrite = 1'b1;
            end
        endcase
    end

endmodule

