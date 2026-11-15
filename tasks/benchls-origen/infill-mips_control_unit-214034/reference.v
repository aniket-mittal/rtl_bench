module origen_214034(
    input  wire [5:0] i_instrCode,
    output reg  o_regDst,
    output reg  o_jump,
    output reg  o_branch,
    output reg  o_memToReg,
    output reg [1:0] o_aluOp,
    output reg  o_memWrite,
    output reg  o_aluSrc,
    output reg  o_regWrite,
    output reg  o_aluConI
);

    always @(*) begin
        case (i_instrCode)
            6'h00: begin // R-type
                o_regDst = 1'b1;
                o_jump = 1'b0;
                o_branch = 1'b0;
                o_memToReg = 1'b0;
                o_aluOp = 2'b10;
                o_memWrite = 1'b0;
                o_aluSrc = 1'b0;
                o_regWrite = 1'b1;
                o_aluConI = 1'b0;
            end
            6'h08, 6'h0C: begin // I-type (addi, andi)
                o_regDst = 1'b0;
                o_jump = 1'b0;
                o_branch = 1'b0;
                o_memToReg = 1'b0;
                o_aluOp = 2'b00;
                o_memWrite = 1'b0;
                o_aluSrc = 1'b1;
                o_regWrite = 1'b1;
                o_aluConI = 1'b1;
            end
            6'h23: begin // Load (lw)
                o_regDst = 1'b0;
                o_jump = 1'b0;
                o_branch = 1'b0;
                o_memToReg = 1'b1;
                o_aluOp = 2'b00;
                o_memWrite = 1'b0;
                o_aluSrc = 1'b1;
                o_regWrite = 1'b1;
                o_aluConI = 1'b1;
            end
            6'h2B: begin // Store (sw)
                o_regDst = 1'bx;
                o_jump = 1'b0;
                o_branch = 1'b0;
                o_memToReg = 1'bx;
                o_aluOp = 2'b00;
                o_memWrite = 1'b1;
                o_aluSrc = 1'b1;
                o_regWrite = 1'b0;
                o_aluConI = 1'b1;
            end
            6'h04: begin // Branch (beq)
                o_regDst = 1'bx;
                o_jump = 1'b0;
                o_branch = 1'b1;
                o_memToReg = 1'bx;
                o_aluOp = 2'b01;
                o_memWrite = 1'b0;
                o_aluSrc = 1'b0;
                o_regWrite = 1'b0;
                o_aluConI = 1'b0;
            end
            6'h02: begin // Jump (j)
                o_regDst = 1'bx;
                o_jump = 1'b1;
                o_branch = 1'b0;
                o_memToReg = 1'bx;
                o_aluOp = 2'bxx;
                o_memWrite = 1'b0;
                o_aluSrc = 1'bx;
                o_regWrite = 1'b0;
                o_aluConI = 1'bx;
            end
            default: begin
                o_regDst = 1'bx;
                o_jump = 1'b0;
                o_branch = 1'b0;
                o_memToReg = 1'bx;
                o_aluOp = 2'bxx;
                o_memWrite = 1'b0;
                o_aluSrc = 1'bx;
                o_regWrite = 1'b0;
                o_aluConI = 1'bx;
            end
        endcase
    end

endmodule