module origen_045017 (
    input [11:0] aluop,
    input [31:0] alu_in_1,
    input [31:0] alu_in_2,
    output reg [31:0] result
);

    wire [31:0] add_sub_result;
    wire [31:0] slt_result, sltu_result;
    wire [31:0] and_result, nor_result, or_result, xor_result;
    wire [31:0] sll_result, srl_result, sra_result;
    wire [31:0] lui_result;
    wire overflow, carry;

    // ADD, SUB, SLT, SLTU
    assign {carry, add_sub_result} = aluop[1] ? (alu_in_1 - alu_in_2) : (alu_in_1 + alu_in_2);
    assign overflow = (alu_in_1[31] == alu_in_2[31]) && (add_sub_result[31] != alu_in_1[31]);
    assign slt_result = {31'b0, (overflow ^ add_sub_result[31])};
    assign sltu_result = {31'b0, carry};

    // Logical operations
    assign and_result = alu_in_1 & alu_in_2;
    assign nor_result = ~(alu_in_1 | alu_in_2);
    assign or_result = alu_in_1 | alu_in_2;
    assign xor_result = alu_in_1 ^ alu_in_2;

    // Shift operations
    assign sll_result = alu_in_2 << alu_in_1[4:0];
    assign srl_result = alu_in_2 >> alu_in_1[4:0];
    assign sra_result = $signed(alu_in_2) >>> alu_in_1[4:0];

    // LUI operation
    assign lui_result = {alu_in_2[15:0], 16'b0};

    // Result selection
    always @(*) begin
        case (aluop)
            12'b000000000001: result = add_sub_result; // ADD
            12'b000000000010: result = add_sub_result; // SUB
            12'b000000000100: result = slt_result;     // SLT
            12'b000000001000: result = sltu_result;    // SLTU
            12'b000000010000: result = and_result;     // AND
            12'b000000100000: result = nor_result;     // NOR
            12'b000001000000: result = or_result;      // OR
            12'b000010000000: result = xor_result;     // XOR
            12'b000100000000: result = sll_result;     // SLL
            12'b001000000000: result = srl_result;     // SRL
            12'b010000000000: result = sra_result;     // SRA
            12'b100000000000: result = lui_result;     // LUI
            default: result = 32'b0;
        endcase
    end

endmodule