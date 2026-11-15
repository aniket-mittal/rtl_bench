module origen_153738(
    input [5:0] OP_code,
    input [5:0] FUNC_code,
    output reg [3:0] ALU_op,
    output reg RegWrite,
    output reg ALUSrc,
    output reg RegDest,
    output reg MemtoReg,
    output reg MemRead,
    output reg MemWrite,
    output reg signal_Branch,
    output reg Jump
);

    always @(*) begin
        case (OP_code)
            6'b000000: begin // R-type instructions
                case (FUNC_code)
                    6'b100000: ALU_op <= 4'b0010; // ADD
                    6'b100010: ALU_op <= 4'b0110; // SUB
                    6'b100100: ALU_op <= 4'b0000; // AND
                    6'b100101: ALU_op <= 4'b0001; // OR
                    6'b101010: ALU_op <= 4'b0111; // SLT
                    default: ALU_op <= 4'b0000;
                endcase
                RegWrite <= 1'b1;
                ALUSrc <= 1'b0;
                RegDest <= 1'b1;
                MemtoReg <= 1'b0;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                signal_Branch <= 1'b0;
                Jump <= 1'b0;
            end
            6'b001000: begin // ADDI
                ALU_op <= 4'b0010;
                RegWrite <= 1'b1;
                ALUSrc <= 1'b1;
                RegDest <= 1'b0;
                MemtoReg <= 1'b0;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                signal_Branch <= 1'b0;
                Jump <= 1'b0;
            end
            6'b100011: begin // LW
                ALU_op <= 4'b0010;
                RegWrite <= 1'b1;
                ALUSrc <= 1'b1;
                RegDest <= 1'b0;
                MemtoReg <= 1'b1;
                MemRead <= 1'b1;
                MemWrite <= 1'b0;
                signal_Branch <= 1'b0;
                Jump <= 1'b0;
            end
            6'b101011: begin // SW
                ALU_op <= 4'b0010;
                RegWrite <= 1'b0;
                ALUSrc <= 1'b1;
                RegDest <= 1'bx;
                MemtoReg <= 1'bx;
                MemRead <= 1'b0;
                MemWrite <= 1'b1;
                signal_Branch <= 1'b0;
                Jump <= 1'b0;
            end
            6'b000100: begin // BEQ
                ALU_op <= 4'b0110;
                RegWrite <= 1'b0;
                ALUSrc <= 1'b0;
                RegDest <= 1'bx;
                MemtoReg <= 1'bx;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                signal_Branch <= 1'b1;
                Jump <= 1'b0;
            end
            6'b000010: begin // J
                ALU_op <= 4'b0000;
                RegWrite <= 1'b0;
                ALUSrc <= 1'b0;
                RegDest <= 1'bx;
                MemtoReg <= 1'bx;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                signal_Branch <= 1'b0;
                Jump <= 1'b1;
            end
            default: begin
                ALU_op <= 4'b0000;
                RegWrite <= 1'b0;
                ALUSrc <= 1'b0;
                RegDest <= 1'b0;
                MemtoReg <= 1'b0;
                MemRead <= 1'b0;
                MemWrite <= 1'b0;
                signal_Branch <= 1'b0;
                Jump <= 1'b0;
            end
        endcase
    end

endmodule