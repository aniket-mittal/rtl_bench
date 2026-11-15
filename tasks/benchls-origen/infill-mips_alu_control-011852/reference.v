module origen_011852(
    input [5:0] instr_op_i,
    output RegWrite_o,
    output [2:0] ALUOp_o,
    output ALUSrc_o,
    output RegDst_o
);

    // Internal registers
    reg write, src, Dst;
    reg [2:0] op;

    // Instruction op-codes
    parameter OP_RTYPE = 6'b000000;
    parameter OP_ADDI  = 6'b001000;
    parameter OP_LUI   = 6'b001111;

    // Combinational logic block
    always @(instr_op_i) begin
        case(instr_op_i)
            OP_RTYPE: begin
                write = 1'b1;
                op = 3'b010;
                src = 1'b0;
                Dst = 1'b1;
            end
            OP_ADDI: begin
                write = 1'b1;
                op = 3'b110;
                src = 1'b1;
                Dst = 1'b0;
            end
            OP_LUI: begin
                write = 1'b1;
                op = 3'b100;
                src = 1'b1;
                Dst = 1'b0;
            end
            default: begin
                write = 1'b0;
                op = 3'b000;
                src = 1'b0;
                Dst = 1'b0;
            end
        endcase
    end

    // Continuous assignments
    assign RegWrite_o = write;
    assign ALUOp_o = op;
    assign ALUSrc_o = src;
    assign RegDst_o = Dst;

endmodule