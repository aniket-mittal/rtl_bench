module origen_184477(
    input [5:0] op,
    input [5:0] func,
    output reg wreg,
    output reg m2reg,
    output reg wmem,
    output reg aluimm,
    output reg regrt,
    output reg [2:0] aluc
);

    parameter ADD = 3'b000;
    parameter SUB = 3'b001;
    parameter AND = 3'b010;
    parameter OR  = 3'b011;
    parameter XOR = 3'b100;

    always @(*) begin
        case (op)
            6'b000000: begin // R-type
                case (func)
                    6'b100000: begin // ADD
                        wreg = 1'b1;
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                        aluc = ADD;
                    end
                    6'b100010: begin // SUB
                        wreg = 1'b1;
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                        aluc = SUB;
                    end
                    6'b100100: begin // AND
                        wreg = 1'b1;
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                        aluc = AND;
                    end
                    6'b100101: begin // OR
                        wreg = 1'b1;
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                        aluc = OR;
                    end
                    6'b100110: begin // XOR
                        wreg = 1'b1;
                        m2reg = 1'b0;
                        wmem = 1'b0;
                        aluimm = 1'b0;
                        regrt = 1'b0;
                        aluc = XOR;
                    end
                    default: begin
                        wreg = 1'bx;
                        m2reg = 1'bx;
                        wmem = 1'bx;
                        aluimm = 1'bx;
                        regrt = 1'bx;
                        aluc = 3'bxxx;
                    end
                endcase
            end
            6'b001000: begin // addi
                wreg = 1'b1;
                m2reg = 1'b0;
                wmem = 1'b0;
                aluimm = 1'b1;
                regrt = 1'b1;
                aluc = ADD;
            end
            6'b001100: begin // andi
                wreg = 1'b1;
                m2reg = 1'b0;
                wmem = 1'b0;
                aluimm = 1'b1;
                regrt = 1'b1;
                aluc = AND;
            end
            6'b001101: begin // ori
                wreg = 1'b1;
                m2reg = 1'b0;
                wmem = 1'b0;
                aluimm = 1'b1;
                regrt = 1'b1;
                aluc = OR;
            end
            6'b100011: begin // lw
                wreg = 1'b1;
                m2reg = 1'b1;
                wmem = 1'b0;
                aluimm = 1'b1;
                regrt = 1'b1;
                aluc = ADD;
            end
            6'b101011: begin // sw
                wreg = 1'b0;
                m2reg = 1'bx;
                wmem = 1'b1;
                aluimm = 1'b1;
                regrt = 1'bx;
                aluc = ADD;
            end
            default: begin
                wreg = 1'bx;
                m2reg = 1'bx;
                wmem = 1'bx;
                aluimm = 1'bx;
                regrt = 1'bx;
                aluc = 3'bxxx;
            end
        endcase
    end

endmodule