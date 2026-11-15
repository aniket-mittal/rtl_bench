module origen_145392(
    input [5:0] op,
    input [5:0] func,
    input z,
    output reg wreg,
    output reg regrt,
    output reg jal,
    output reg [1:0] pcsource
);

    wire m2reg, shift, aluimm, sext, wmem;
    wire [3:0] aluc;

    CONTROL_UNIT cu (
        .op(op),
        .func(func),
        .z(z),
        .m2reg(m2reg),
        .shift(shift),
        .aluimm(aluimm),
        .sext(sext),
        .wmem(wmem),
        .aluc(aluc)
    );

    always @(*) begin
        case (op)
            6'b000000: begin // R-type instructions
                wreg = 1'b1;
                regrt = 1'b0;
                jal = 1'b0;
                pcsource = 2'b00;
            end
            6'b000010: begin // j
                wreg = 1'b0;
                regrt = 1'b0;
                jal = 1'b0;
                pcsource = 2'b10;
            end
            6'b000011: begin // jal
                wreg = 1'b1;
                regrt = 1'b0;
                jal = 1'b1;
                pcsource = 2'b10;
            end
            6'b000100: begin // beq
                wreg = 1'b0;
                regrt = 1'b0;
                jal = 1'b0;
                pcsource = z ? 2'b01 : 2'b00;
            end
            6'b000101: begin // bne
                wreg = 1'b0;
                regrt = 1'b0;
                jal = 1'b0;
                pcsource = z ? 2'b00 : 2'b01;
            end
            6'b100011: begin // lw
                wreg = 1'b1;
                regrt = 1'b1;
                jal = 1'b0;
                pcsource = 2'b00;
            end
            6'b101011: begin // sw
                wreg = 1'b0;
                regrt = 1'b1;
                jal = 1'b0;
                pcsource = 2'b00;
            end
            default: begin // I-type instructions
                wreg = 1'b1;
                regrt = 1'b1;
                jal = 1'b0;
                pcsource = 2'b00;
            end
        endcase
    end

endmodule

module CONTROL_UNIT(
    input [5:0] op,
    input [5:0] func,
    input z,
    output reg m2reg,
    output reg shift,
    output reg aluimm,
    output reg sext,
    output reg wmem,
    output reg [3:0] aluc
);

    always @(*) begin
        case (op)
            6'b000000: begin // R-type instructions
                m2reg = 1'b0;
                shift = (func == 6'b000000 || func == 6'b000010 || func == 6'b000011);
                aluimm = 1'b0;
                sext = 1'b0;
                wmem = 1'b0;
                case (func)
                    6'b100000: aluc = 4'b0010; // add
                    6'b100010: aluc = 4'b0110; // sub
                    6'b100100: aluc = 4'b0000; // and
                    6'b100101: aluc = 4'b0001; // or
                    6'b100110: aluc = 4'b0011; // xor
                    6'b000000: aluc = 4'b0100; // sll
                    6'b000010: aluc = 4'b0101; // srl
                    6'b000011: aluc = 4'b1000; // sra
                    6'b101010: aluc = 4'b0111; // slt
                    default:   aluc = 4'b0000;
                endcase
            end
            6'b100011: begin // lw
                m2reg = 1'b1;
                shift = 1'b0;
                aluimm = 1'b1;
                sext = 1'b1;
                wmem = 1'b0;
                aluc = 4'b0010; // add
            end
            6'b101011: begin // sw
                m2reg = 1'b0;
                shift = 1'b0;
                aluimm = 1'b1;
                sext = 1'b1;
                wmem = 1'b1;
                aluc = 4'b0010; // add
            end
            default: begin // I-type instructions
                m2reg = 1'b0;
                shift = 1'b0;
                aluimm = 1'b1;
                sext = 1'b1;
                wmem = 1'b0;
                case (op)
                    6'b001000: aluc = 4'b0010; // addi
                    6'b001100: aluc = 4'b0000; // andi
                    6'b001101: aluc = 4'b0001; // ori
                    6'b001110: aluc = 4'b0011; // xori
                    6'b001010: aluc = 4'b0111; // slti
                    default:   aluc = 4'b0000;
                endcase
            end
        endcase
    end

endmodule