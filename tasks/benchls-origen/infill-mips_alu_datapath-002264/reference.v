module origen_002264 (
    input [31:0] rin_A, rin_B, ir_data, pc,
    input alu_srcA,
    input [1:0] alu_srcB, alu_ctrl,
    output zero,
    output [31:0] res
);

    wire [31:0] in_A;
    reg [31:0] in_B;
    wire [31:0] signimm, shiftimm;

    // Sign extension
    assign signimm = {{16{ir_data[15]}}, ir_data[15:0]};
    
    // Shift immediate (currently same as signimm)
    assign shiftimm = signimm;

    // Input A selection
    assign in_A = alu_srcA ? pc : rin_A;

    // Input B selection
    always @(*) begin
        case(alu_srcB)
            2'b00: in_B = rin_B;
            2'b01: in_B = 32'd1;
            2'b10: in_B = signimm;
            2'b11: in_B = shiftimm;
        endcase
    end

    // ALU core instantiation
    alu alu_core (
        .A(in_A),
        .B(in_B),
        .alu_ctrl(alu_ctrl),
        .result(res)
    );

    // Zero flag
    assign zero = (res == 32'd0);

endmodule

module alu (
    input [31:0] A, B,
    input [1:0] alu_ctrl,
    output reg [31:0] result
);

    always @(*) begin
        case(alu_ctrl)
            2'b00: result = A + B;           // Addition
            2'b01: result = A - B;           // Subtraction
            2'b11: result = A & B;           // Bitwise AND
            2'b10: result = ~(A | B);        // Bitwise NOR
            default: result = 32'bx;         // Undefined operation
        endcase
    end

endmodule