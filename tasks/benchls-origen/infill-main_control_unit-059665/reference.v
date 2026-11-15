module origen_059665 (
    input wire [5:0] instr_op_i,
    output reg RegWrite_o,
    output reg [2:0] ALUOp_o,
    output reg ALUSrc_o,
    output reg RegDst_o
);

    // Internal registers for control signals
    reg write, src, Dst;
    reg [2:0] op;

    // Instruction opcodes
    localparam OP_RTYPE = 6'b111111;
    localparam OP_ADDI  = 6'b110111;
    localparam OP_LUI   = 6'b110000;

    always @(*) begin
        case (instr_op_i)
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

    // Assign internal registers to output ports
    always @(*) begin
        RegWrite_o = write;
        ALUOp_o = op;
        ALUSrc_o = src;
        RegDst_o = Dst;
    end

endmodule