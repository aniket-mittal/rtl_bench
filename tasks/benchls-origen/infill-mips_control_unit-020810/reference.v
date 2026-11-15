module origen_020810(
    input [5:0] opcode,
    output reg [1:0] ALUOp,
    output reg jump, branchBeq, branchBne, memRd, memWr, mem2Reg, regDst, regWr, ALUSrc
);

always @(*) begin
    case(opcode)
        6'b000000: begin // R-type
            ALUOp = 2'b10;
            jump = 1'b0;
            branchBeq = 1'b0;
            branchBne = 1'b0;
            memRd = 1'b0;
            memWr = 1'b0;
            mem2Reg = 1'b0;
            regDst = 1'b1;
            regWr = 1'b1;
            ALUSrc = 1'b0;
        end
        6'b100011: begin // lw
            ALUOp = 2'b00;
            jump = 1'b0;
            branchBeq = 1'b0;
            branchBne = 1'b0;
            memRd = 1'b1;
            memWr = 1'b0;
            mem2Reg = 1'b1;
            regDst = 1'b0;
            regWr = 1'b1;
            ALUSrc = 1'b1;
        end
        6'b101011: begin // sw
            ALUOp = 2'b00;
            jump = 1'b0;
            branchBeq = 1'b0;
            branchBne = 1'b0;
            memRd = 1'b0;
            memWr = 1'b1;
            mem2Reg = 1'bx;
            regDst = 1'bx;
            regWr = 1'b0;
            ALUSrc = 1'b1;
        end
        6'b000100: begin // beq
            ALUOp = 2'b01;
            jump = 1'b0;
            branchBeq = 1'b1;
            branchBne = 1'b0;
            memRd = 1'b0;
            memWr = 1'b0;
            mem2Reg = 1'bx;
            regDst = 1'bx;
            regWr = 1'b0;
            ALUSrc = 1'b0;
        end
        6'b000101: begin // bne
            ALUOp = 2'b01;
            jump = 1'b0;
            branchBeq = 1'b0;
            branchBne = 1'b1;
            memRd = 1'b0;
            memWr = 1'b0;
            mem2Reg = 1'bx;
            regDst = 1'bx;
            regWr = 1'b0;
            ALUSrc = 1'b0;
        end
        6'b000010: begin // j
            ALUOp = 2'bxx;
            jump = 1'b1;
            branchBeq = 1'b0;
            branchBne = 1'b0;
            memRd = 1'b0;
            memWr = 1'b0;
            mem2Reg = 1'bx;
            regDst = 1'bx;
            regWr = 1'b0;
            ALUSrc = 1'bx;
        end
        6'b001000: begin // addi
            ALUOp = 2'b00;
            jump = 1'b0;
            branchBeq = 1'b0;
            branchBne = 1'b0;
            memRd = 1'b0;
            memWr = 1'b0;
            mem2Reg = 1'b0;
            regDst = 1'b0;
            regWr = 1'b1;
            ALUSrc = 1'b1;
        end
        6'b001100: begin // andi
            ALUOp = 2'b11;
            jump = 1'b0;
            branchBeq = 1'b0;
            branchBne = 1'b0;
            memRd = 1'b0;
            memWr = 1'b0;
            mem2Reg = 1'b0;
            regDst = 1'b0;
            regWr = 1'b1;
            ALUSrc = 1'b1;
        end
        default: begin
            ALUOp = 2'bxx;
            jump = 1'bx;
            branchBeq = 1'bx;
            branchBne = 1'bx;
            memRd = 1'bx;
            memWr = 1'bx;
            mem2Reg = 1'bx;
            regDst = 1'bx;
            regWr = 1'bx;
            ALUSrc = 1'bx;
        end
    endcase
end

endmodule