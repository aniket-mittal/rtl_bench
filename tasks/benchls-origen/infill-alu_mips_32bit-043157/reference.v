module origen_043157 #(
    parameter WIDTH = 32
)(
    input [WIDTH-1:0] src1, src2,
    input [3:0] ALUOp,
    input [4:0] shamt,
    output reg [WIDTH-1:0] ALU_result,
    output reg Zero
);

    // Operation codes
    localparam op_add = 4'b0000;
    localparam op_sub = 4'b0001;
    localparam op_and = 4'b0010;
    localparam op_or  = 4'b0011;
    localparam op_xor = 4'b0100;
    localparam op_nor = 4'b0101;
    localparam op_slt = 4'b0110;
    localparam op_sll = 4'b0111;
    localparam op_srl = 4'b1000;
    localparam op_beq = 4'b1001;
    localparam op_bne = 4'b1010;

    wire [WIDTH-1:0] sub_result;
    assign sub_result = src1 - src2;

    always @(*) begin
        case(ALUOp)
            op_add: ALU_result = src1 + src2;
            op_sub: ALU_result = sub_result;
            op_and: ALU_result = src1 & src2;
            op_or:  ALU_result = src1 | src2;
            op_xor: ALU_result = src1 ^ src2;
            op_nor: ALU_result = ~(src1 | src2);
            op_slt: ALU_result = {31'b0, sub_result[WIDTH-1]};
            op_sll: ALU_result = src1 << shamt;
            op_srl: ALU_result = src1 >> shamt;
            op_beq: ALU_result = {WIDTH{1'b0}};
            op_bne: ALU_result = {WIDTH{1'b0}};
            default: ALU_result = {WIDTH{1'bx}};
        endcase
    end

    always @(*) begin
        case(ALUOp)
            op_beq: Zero = (src1 == src2);
            op_bne: Zero = (src1 != src2);
            default: Zero = (ALU_result == {WIDTH{1'b0}});
        endcase
    end

endmodule