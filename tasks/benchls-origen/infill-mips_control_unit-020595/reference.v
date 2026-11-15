module origen_020595(
    input [5:0] opcode,
    input czero,
    output reg [1:0] aluOp,
    output reg regDst, aluSrc, memToReg, regWrite, memRead, memWrite,
    output reg [2:0] pccontrol
);

always @* begin
    case(opcode)
        6'b000000: begin // R-type
            regDst = 1'b1;
            aluSrc = 1'b0;
            memToReg = 1'b0;
            regWrite = 1'b1;
            memRead = 1'b0;
            memWrite = 1'b0;
            aluOp = 2'b10;
            pccontrol = 3'b000;
        end
        6'b100011: begin // Load word
            regDst = 1'b0;
            aluSrc = 1'b1;
            memToReg = 1'b1;
            regWrite = 1'b1;
            memRead = 1'b1;
            memWrite = 1'b0;
            aluOp = 2'b00;
            pccontrol = 3'b000;
        end
        6'b101011: begin // Store word
            regDst = 1'bx;
            aluSrc = 1'b1;
            memToReg = 1'bx;
            regWrite = 1'b0;
            memRead = 1'b0;
            memWrite = 1'b1;
            aluOp = 2'b00;
            pccontrol = 3'b000;
        end
        6'b000100: begin // Branch on equal
            regDst = 1'bx;
            aluSrc = 1'b0;
            memToReg = 1'bx;
            regWrite = 1'b0;
            memRead = 1'b0;
            memWrite = 1'b0;
            aluOp = 2'b01;
            pccontrol = czero ? 3'b011 : 3'b000;
        end
        6'b001000: begin // Immediate arithmetic
            regDst = 1'b0;
            aluSrc = 1'b1;
            memToReg = 1'b0;
            regWrite = 1'b1;
            memRead = 1'b0;
            memWrite = 1'b0;
            aluOp = 2'b11;
            pccontrol = 3'b000;
        end
        6'b000010: begin // Jump
            regDst = 1'bx;
            aluSrc = 1'bx;
            memToReg = 1'bx;
            regWrite = 1'b0;
            memRead = 1'b0;
            memWrite = 1'b0;
            aluOp = 2'bxx;
            pccontrol = 3'b001;
        end
        6'b111111: begin // Halt
            regDst = 1'bx;
            aluSrc = 1'bx;
            memToReg = 1'bx;
            regWrite = 1'b0;
            memRead = 1'b0;
            memWrite = 1'b0;
            aluOp = 2'bxx;
            pccontrol = 3'b111;
        end
        default: begin
            regDst = 1'b0;
            aluSrc = 1'b0;
            memToReg = 1'b0;
            regWrite = 1'b0;
            memRead = 1'b0;
            memWrite = 1'b0;
            aluOp = 2'b11;
            pccontrol = 3'b000;
        end
    endcase
end

endmodule