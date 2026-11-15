module origen_195332(
    input  [5:0] i_Op,
    input  [4:0] i_co0,
    output reg  o_RegDst,
    output reg  o_RegWrite,
    output reg  o_ExtOp,
    output reg  o_ALUSrc,
    output reg  o_WE,
    output reg  [1:0] o_MemtoReg,
    output reg  o_beq,
    output reg  o_bne,
    output reg  o_j,
    output reg  o_mtc0,
    output reg  o_eret
);

    always @(*) begin
        // Default values
        o_RegDst = 1'b0;
        o_RegWrite = 1'b0;
        o_ExtOp = 1'b0;
        o_ALUSrc = 1'b0;
        o_WE = 1'b0;
        o_MemtoReg = 2'b00;
        o_beq = 1'b0;
        o_bne = 1'b0;
        o_j = 1'b0;
        o_mtc0 = 1'b0;
        o_eret = 1'b0;

        case (i_Op)
            6'b000000: begin // R-type
                o_RegDst = 1'b1;
                o_RegWrite = 1'b1;
                o_ALUSrc = 1'b0;
            end
            6'b001000: begin // addi
                o_RegDst = 1'b0;
                o_RegWrite = 1'b1;
                o_ExtOp = 1'b1;
                o_ALUSrc = 1'b1;
            end
            6'b100011: begin // lw
                o_RegDst = 1'b0;
                o_RegWrite = 1'b1;
                o_ExtOp = 1'b1;
                o_ALUSrc = 1'b1;
                o_MemtoReg = 2'b01;
            end
            6'b101011: begin // sw
                o_ExtOp = 1'b1;
                o_ALUSrc = 1'b1;
                o_WE = 1'b1;
            end
            6'b000100: begin // beq
                o_beq = 1'b1;
            end
            6'b000101: begin // bne
                o_bne = 1'b1;
            end
            6'b000010: begin // j
                o_j = 1'b1;
            end
            6'b010000: begin // co-processor 0
                case (i_co0)
                    5'b00100: begin // mtc0
                        o_RegDst = 1'b1;
                        o_RegWrite = 1'b1;
                        o_mtc0 = 1'b1;
                    end
                    5'b10000: begin // eret
                        o_eret = 1'b1;
                    end
                endcase
            end
            6'b100001: begin // lh
                o_RegDst = 1'b0;
                o_RegWrite = 1'b1;
                o_ExtOp = 1'b1;
                o_ALUSrc = 1'b1;
                o_MemtoReg = 2'b01;
            end
            6'b100101: begin // lhu
                o_RegDst = 1'b0;
                o_RegWrite = 1'b1;
                o_ExtOp = 1'b0;
                o_ALUSrc = 1'b1;
                o_MemtoReg = 2'b01;
            end
            6'b100000: begin // lb
                o_RegDst = 1'b0;
                o_RegWrite = 1'b1;
                o_ExtOp = 1'b1;
                o_ALUSrc = 1'b1;
                o_MemtoReg = 2'b01;
            end
            6'b100100: begin // lbu
                o_RegDst = 1'b0;
                o_RegWrite = 1'b1;
                o_ExtOp = 1'b0;
                o_ALUSrc = 1'b1;
                o_MemtoReg = 2'b01;
            end
            6'b101000: begin // sb
                o_ExtOp = 1'b1;
                o_ALUSrc = 1'b1;
                o_WE = 1'b1;
            end
            6'b101001: begin // sh
                o_ExtOp = 1'b1;
                o_ALUSrc = 1'b1;
                o_WE = 1'b1;
            end
            default: begin
                // Do nothing
            end
        endcase
    end
endmodule