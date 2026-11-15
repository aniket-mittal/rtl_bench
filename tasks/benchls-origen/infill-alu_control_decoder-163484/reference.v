module origen_163484(
    input [3:0] instruction,
    output reg regWrite,
    output reg [2:0] aluCon,
    output reg branch,
    output reg memWrite,
    output reg memRead,
    output reg AluSrc,
    output reg memToReg,
    output reg regDst
);

    always @(*) begin
        case (instruction)
            4'b0010: begin // add
                regWrite = 1;
                aluCon = 3'b010;
                branch = 0;
                memWrite = 0;
                memRead = 0;
                AluSrc = 0;
                memToReg = 0;
                regDst = 1;
            end
            4'b0110: begin // or
                regWrite = 1;
                aluCon = 3'b110;
                branch = 0;
                memWrite = 0;
                memRead = 0;
                AluSrc = 0;
                memToReg = 0;
                regDst = 1;
            end
            4'b0000: begin // and
                regWrite = 1;
                aluCon = 3'b000;
                branch = 0;
                memWrite = 0;
                memRead = 0;
                AluSrc = 0;
                memToReg = 0;
                regDst = 1;
            end
            4'b0001: begin // or
                regWrite = 1;
                aluCon = 3'b001;
                branch = 0;
                memWrite = 0;
                memRead = 0;
                AluSrc = 0;
                memToReg = 0;
                regDst = 1;
            end
            4'b0111: begin // slt
                regWrite = 1;
                aluCon = 3'b111;
                branch = 0;
                memWrite = 0;
                memRead = 0;
                AluSrc = 0;
                memToReg = 0;
                regDst = 0;
            end
            4'b1000: begin // lw
                regWrite = 1;
                aluCon = 3'b010;
                branch = 1;
                memWrite = 0;
                memRead = 1;
                AluSrc = 1;
                memToReg = 1;
                regDst = 0;
            end
            4'b1010: begin // sw
                regWrite = 0;
                aluCon = 3'b010;
                branch = 1;
                memWrite = 1;
                memRead = 0;
                AluSrc = 1;
                memToReg = 0;
                regDst = 0;
            end
            4'b1110: begin // beq
                regWrite = 0;
                aluCon = 3'b011;
                branch = 1;
                memWrite = 0;
                memRead = 0;
                AluSrc = 0;
                memToReg = 0;
                regDst = 0;
            end
            default: begin
                regWrite = 0;
                aluCon = 3'b000;
                branch = 0;
                memWrite = 0;
                memRead = 0;
                AluSrc = 0;
                memToReg = 0;
                regDst = 0;
            end
        endcase
    end

endmodule