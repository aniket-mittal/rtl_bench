module origen_186082(
    Operand1,
    Operand2,
    ShfAmt,
    TAG_IN,
    ALU_OPCODE,
    RESULT,
    TAG_OUT,
    ALU_BRANCH,
    ALU_BRANCH_TAKEN
);

    input [31:0] Operand1;
    input [31:0] Operand2;
    input [4:0] ShfAmt;
    input [4:0] TAG_IN;
    input [3:0] ALU_OPCODE;

    output [31:0] RESULT;
    output [4:0] TAG_OUT;
    output ALU_BRANCH;
    output ALU_BRANCH_TAKEN;

    reg [31:0] RESULT;
    reg [4:0] TAG_OUT;
    reg ALU_BRANCH;
    reg ALU_BRANCH_TAKEN;

    always @(*) begin
        case (ALU_OPCODE)
            4'b0000: begin // ADD
                RESULT = Operand1 + Operand2;
                TAG_OUT = TAG_IN;
                ALU_BRANCH = 0;
                ALU_BRANCH_TAKEN = 0;
            end
            4'b0001: begin // ADDU
                RESULT = Operand1 + Operand2;
                TAG_OUT = TAG_IN;
                ALU_BRANCH = 0;
                ALU_BRANCH_TAKEN = 0;
            end
            4'b0010: begin // SUB
                RESULT = Operand1 - Operand2;
                TAG_OUT = TAG_IN;
                ALU_BRANCH = 0;
                ALU_BRANCH_TAKEN = 0;
            end
            4'b0011: begin // AND
                RESULT = Operand1 & Operand2;
                TAG_OUT = TAG_IN;
                ALU_BRANCH = 0;
                ALU_BRANCH_TAKEN = 0;
            end
            4'b0100: begin // OR
                RESULT = Operand1 | Operand2;
                TAG_OUT = TAG_IN;
                ALU_BRANCH = 0;
                ALU_BRANCH_TAKEN = 0;
            end
            4'b0101: begin // NOR
                RESULT = ~(Operand1 | Operand2);
                TAG_OUT = TAG_IN;
                ALU_BRANCH = 0;
                ALU_BRANCH_TAKEN = 0;
            end
            4'b0110: begin // SLT
                RESULT = (Operand1 < Operand2) ? 32'd1 : 32'd0;
                TAG_OUT = TAG_IN;
                ALU_BRANCH = 0;
                ALU_BRANCH_TAKEN = 0;
            end
            4'b0111: begin // SLTU
                RESULT = (Operand1 < Operand2) ? 32'd1 : 32'd0;
                TAG_OUT = TAG_IN;
                ALU_BRANCH = 0;
                ALU_BRANCH_TAKEN = 0;
            end
            4'b1000: begin // SLL
                RESULT = Operand1 << ShfAmt;
                TAG_OUT = TAG_IN;
                ALU_BRANCH = 0;
                ALU_BRANCH_TAKEN = 0;
            end
            4'b1001: begin // SRL
                RESULT = Operand1 >> ShfAmt;
                TAG_OUT = TAG_IN;
                ALU_BRANCH = 0;
                ALU_BRANCH_TAKEN = 0;
            end
            4'b1010: begin // BEQ
                ALU_BRANCH = 1;
                ALU_BRANCH_TAKEN = (Operand1 == Operand2);
                RESULT = 32'b0;
                TAG_OUT = TAG_IN;
            end
            4'b1011: begin // BNE
                ALU_BRANCH = 1;
                ALU_BRANCH_TAKEN = (Operand1 != Operand2);
                RESULT = 32'b0;
                TAG_OUT = TAG_IN;
            end
            default: begin
                RESULT = 32'b0;
                TAG_OUT = TAG_IN;
                ALU_BRANCH = 0;
                ALU_BRANCH_TAKEN = 0;
            end
        endcase
    end

endmodule