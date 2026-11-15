module origen_218252(
    input  [5:0] opCode,
    output       regDst,
    output       aluSrc,
    output       memToReg,
    output       regWrite,
    output       memRead,
    output       memWrite,
    output       branch,
    output [1:0] aluOp,
    output       jump
);

    reg regDst_r, aluSrc_r, memToReg_r, regWrite_r, memRead_r, memWrite_r, branch_r, jump_r;
    reg [1:0] aluOp_r;

    always @(*) begin
        case (opCode)
            6'b000000: begin // R-type instructions
                regDst_r   = 1'b1;
                aluSrc_r   = 1'b0;
                memToReg_r = 1'b0;
                regWrite_r = 1'b1;
                memRead_r  = 1'b0;
                memWrite_r = 1'b0;
                branch_r   = 1'b0;
                aluOp_r    = 2'b10;
                jump_r     = 1'b0;
            end
            6'b100011: begin // Load (LW)
                regDst_r   = 1'b0;
                aluSrc_r   = 1'b1;
                memToReg_r = 1'b1;
                regWrite_r = 1'b1;
                memRead_r  = 1'b1;
                memWrite_r = 1'b0;
                branch_r   = 1'b0;
                aluOp_r    = 2'b00;
                jump_r     = 1'b0;
            end
            6'b101011: begin // Store (SW)
                regDst_r   = 1'bx; // Don't care
                aluSrc_r   = 1'b1;
                memToReg_r = 1'bx; // Don't care
                regWrite_r = 1'b0;
                memRead_r  = 1'b0;
                memWrite_r = 1'b1;
                branch_r   = 1'b0;
                aluOp_r    = 2'b00;
                jump_r     = 1'b0;
            end
            6'b000100: begin // Branch (BEQ)
                regDst_r   = 1'bx; // Don't care
                aluSrc_r   = 1'b0;
                memToReg_r = 1'bx; // Don't care
                regWrite_r = 1'b0;
                memRead_r  = 1'b0;
                memWrite_r = 1'b0;
                branch_r   = 1'b1;
                aluOp_r    = 2'b01;
                jump_r     = 1'b0;
            end
            6'b000010: begin // Jump (J)
                regDst_r   = 1'bx; // Don't care
                aluSrc_r   = 1'bx; // Don't care
                memToReg_r = 1'bx; // Don't care
                regWrite_r = 1'b0;
                memRead_r  = 1'b0;
                memWrite_r = 1'b0;
                branch_r   = 1'b0;
                aluOp_r    = 2'bxx; // Don't care
                jump_r     = 1'b1;
            end
            default: begin // Undefined instructions
                regDst_r   = 1'bx; // Don't care
                aluSrc_r   = 1'bx; // Don't care
                memToReg_r = 1'bx; // Don't care
                regWrite_r = 1'b0;
                memRead_r  = 1'b0;
                memWrite_r = 1'b0;
                branch_r   = 1'b0;
                aluOp_r    = 2'bxx; // Don't care
                jump_r     = 1'b0;
            end
        endcase
    end

    assign regDst   = regDst_r;
    assign aluSrc   = aluSrc_r;
    assign memToReg = memToReg_r;
    assign regWrite = regWrite_r;
    assign memRead  = memRead_r;
    assign memWrite = memWrite_r;
    assign branch   = branch_r;
    assign aluOp    = aluOp_r;
    assign jump     = jump_r;

endmodule