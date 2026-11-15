module origen_014866(
    input [31:0] A,
    input [31:0] B,
    input [5:0] ALUFun,
    input Sign,
    output [31:0] Z
);

    wire [32:0] addsub_result;
    wire zero_flag, negative_flag;
    wire [31:0] cmp_result, logic_result, shift_result;

    AddSub addsub_unit (
        .A(A),
        .B(B),
        .ALUFun(ALUFun[0]),
        .Sign(Sign),
        .Z(zero_flag),
        .N(negative_flag),
        .S(addsub_result)
    );

    Cmp cmp_unit (
        .ALUFun(ALUFun[3:0]),
        .Sign(Sign),
        .Z(zero_flag),
        .N(negative_flag),
        .S(cmp_result)
    );

    Logic logic_unit (
        .A(A),
        .B(B),
        .ALUFun(ALUFun[3:0]),
        .S(logic_result)
    );

    Shift shift_unit (
        .A(A),
        .B(B),
        .ALUFun(ALUFun[1:0]),
        .S(shift_result)
    );

    assign Z = (ALUFun[5:4] == 2'b00) ? addsub_result[31:0] :
               (ALUFun[5:4] == 2'b01) ? logic_result :
               (ALUFun[5:4] == 2'b10) ? shift_result :
               cmp_result;

endmodule

module AddSub(
    input [31:0] A,
    input [31:0] B,
    input ALUFun,
    input Sign,
    output Z,
    output N,
    output [32:0] S
);

    wire [32:0] A_ext = {Sign & A[31], A};
    wire [32:0] B_ext = {Sign & B[31], B};
    wire [32:0] B_comp = ALUFun ? ~B_ext + 1 : B_ext;

    assign S = A_ext + B_comp;
    assign Z = (S[31:0] == 32'b0);
    assign N = S[31];

endmodule

module Cmp(
    input [3:0] ALUFun,
    input Sign,
    input Z,
    input N,
    output reg [31:0] S
);

    always @(*) begin
        case (ALUFun[3:1])
            3'b001: S = {31'b0, Z};                     // EQ
            3'b010: S = {31'b0, ~Z};                    // NE
            3'b011: S = {31'b0, N ^ (Sign & (Z | N))}; // LT
            3'b100: S = {31'b0, Z | (N ^ (Sign & (Z | N)))}; // LE
            3'b101: S = {31'b0, ~(N ^ (Sign & (Z | N)))}; // GT
            3'b110: S = {31'b0, ~(Z | (N ^ (Sign & (Z | N))))}; // GE
            default: S = 32'b0;
        endcase
    end

endmodule

module Logic(
    input [31:0] A,
    input [31:0] B,
    input [3:0] ALUFun,
    output reg [31:0] S
);

    always @(*) begin
        case (ALUFun[3:0])
            4'b0000: S = A & B;   // AND
            4'b0001: S = A | B;   // OR
            4'b0010: S = A ^ B;   // XOR
            4'b0011: S = ~A;      // NOT
            default: S = 32'b0;
        endcase
    end

endmodule

module Shift(
    input [31:0] A,
    input [31:0] B,
    input [1:0] ALUFun,
    output reg [31:0] S
);

    wire [4:0] shamt = B[4:0];

    always @(*) begin
        case (ALUFun[1:0])
            2'b00: S = A << shamt;             // Logical left shift
            2'b01: S = A >> shamt;             // Logical right shift
            2'b10: S = $signed(A) >>> shamt;   // Arithmetic right shift
            default: S = A;
        endcase
    end

endmodule