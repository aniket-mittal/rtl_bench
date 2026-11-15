module origen_164727(
    input [5:0] opcode,
    output reg regDst,
    output reg branch,
    output reg memRead,
    output reg mentoReg,
    output reg [1:0] aluOP1,
    output reg [1:0] aluOP2,
    output reg memWrite,
    output reg aluSrc,
    output reg regWrite,
    output reg jump
);

    parameter opcodeLW = 6'b100011;
    parameter opcodeSW = 6'b101011;
    parameter opcodeR = 6'b000000;
    parameter opcodeBeq = 6'b000100;
    parameter opcodeJ = 6'b000010;

    always @(*) begin
        case (opcode)
            opcodeLW: begin
                regDst = 0;
                branch = 0;
                memRead = 1;
                mentoReg = 1;
                aluOP1 = 2'b00;
                aluOP2 = 2'b01;
                memWrite = 0;
                aluSrc = 1;
                regWrite = 1;
                jump = 0;
            end
            opcodeSW: begin
                regDst = 0;
                branch = 0;
                memRead = 0;
                mentoReg = 0;
                aluOP1 = 2'b00;
                aluOP2 = 2'b01;
                memWrite = 1;
                aluSrc = 1;
                regWrite = 0;
                jump = 0;
            end
            opcodeR: begin
                regDst = 1;
                branch = 0;
                memRead = 0;
                mentoReg = 0;
                aluOP1 = 2'b10;
                aluOP2 = 2'b00;
                memWrite = 0;
                aluSrc = 0;
                regWrite = 1;
                jump = 0;
            end
            opcodeBeq: begin
                regDst = 0;
                branch = 1;
                memRead = 0;
                mentoReg = 0;
                aluOP1 = 2'b01;
                aluOP2 = 2'b00;
                memWrite = 0;
                aluSrc = 0;
                regWrite = 0;
                jump = 0;
            end
            opcodeJ: begin
                regDst = 0;
                branch = 0;
                memRead = 0;
                mentoReg = 0;
                aluOP1 = 2'b00;
                aluOP2 = 2'b00;
                memWrite = 0;
                aluSrc = 0;
                regWrite = 0;
                jump = 1;
            end
            default: begin
                regDst = 0;
                branch = 0;
                memRead = 0;
                mentoReg = 0;
                aluOP1 = 2'b00;
                aluOP2 = 2'b00;
                memWrite = 0;
                aluSrc = 0;
                regWrite = 0;
                jump = 0;
            end
        endcase
    end

endmodule