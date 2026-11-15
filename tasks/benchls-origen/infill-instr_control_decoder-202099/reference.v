module origen_202099(
    input [11:0] i_instrCode,
    output reg o_regDst,
    output reg o_jump,
    output reg o_branch,
    output reg o_memToReg,
    output reg [1:0] o_aluOp,
    output reg o_memWrite,
    output reg o_memRead,
    output reg o_aluSrc,
    output reg o_regWrite
);

always @(*) begin
    case (i_instrCode[11:6])
        6'b000000: begin // R-type instructions
            o_regDst   = 1'b1;
            o_jump     = 1'b0;
            o_branch   = 1'b0;
            o_memToReg = 1'b0;
            o_aluOp    = 2'b10;
            o_memWrite = 1'b0;
            o_memRead  = 1'b0;
            o_aluSrc   = 1'b0;
            o_regWrite = 1'b1;
        end
        6'b000100: begin // Branch instructions
            o_regDst   = 1'b0;
            o_jump     = 1'b0;
            o_branch   = 1'b1;
            o_memToReg = 1'b0;
            o_aluOp    = 2'b01;
            o_memWrite = 1'b0;
            o_memRead  = 1'b0;
            o_aluSrc   = 1'b0;
            o_regWrite = 1'b0;
        end
        6'b101011: begin // Store instructions
            o_regDst   = 1'b0;
            o_jump     = 1'b0;
            o_branch   = 1'b0;
            o_memToReg = 1'b0;
            o_aluOp    = 2'b00;
            o_memWrite = 1'b1;
            o_memRead  = 1'b0;
            o_aluSrc   = 1'b1;
            o_regWrite = 1'b0;
        end
        6'b100011: begin // Load instructions
            o_regDst   = 1'b0;
            o_jump     = 1'b0;
            o_branch   = 1'b0;
            o_memToReg = 1'b1;
            o_aluOp    = 2'b00;
            o_memWrite = 1'b0;
            o_memRead  = 1'b1;
            o_aluSrc   = 1'b1;
            o_regWrite = 1'b1;
        end
        6'b001000, 6'b001001, 6'b001010, 6'b001011: begin // Immediate arithmetic instructions
            o_regDst   = 1'b0;
            o_jump     = 1'b0;
            o_branch   = 1'b0;
            o_memToReg = 1'b0;
            o_aluOp    = 2'b00;
            o_memWrite = 1'b0;
            o_memRead  = 1'b0;
            o_aluSrc   = 1'b1;
            o_regWrite = 1'b1;
        end
        6'b000010: begin // Jump instructions
            o_regDst   = 1'b0;
            o_jump     = 1'b1;
            o_branch   = 1'b0;
            o_memToReg = 1'b0;
            o_aluOp    = 2'b00;
            o_memWrite = 1'b0;
            o_memRead  = 1'b0;
            o_aluSrc   = 1'b0;
            o_regWrite = 1'b0;
        end
        default: begin
            o_regDst   = 1'b0;
            o_jump     = 1'b0;
            o_branch   = 1'b0;
            o_memToReg = 1'b0;
            o_aluOp    = 2'b00;
            o_memWrite = 1'b0;
            o_memRead  = 1'b0;
            o_aluSrc   = 1'b0;
            o_regWrite = 1'b0;
        end
    endcase
end

endmodule