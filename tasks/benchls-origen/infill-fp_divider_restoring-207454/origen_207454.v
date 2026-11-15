module origen_207454(
    input wire [31:0] A,
    input wire [31:0] B,
    input wire fp_clk,
    input wire int_clk,
    output wire [31:0] Out
);

reg [31:0] a_reg, b_reg;
reg [47:0] Q;
reg start;
wire a_sign, b_sign;
wire [7:0] a_exp, b_exp;
wire [22:0] a_frac, b_frac;
wire zero;
wire [22:0] out_frac;
wire [7:0] out_exp;
wire out_sign;

assign a_sign = A[31];
assign a_exp = A[30:23];
assign a_frac = {1'b1, A[22:0]};
assign b_sign = B[31];
assign b_exp = B[30:23];
assign b_frac = {1'b1, B[22:0]};
assign zero = |b_exp == 0;

always @(posedge fp_clk) begin
    start <= 1'b1;
end

[MASKED]

assign out_frac = Q[23] ? Q[23:1] : Q[22:0];
assign out_exp = a_exp - b_exp - ~Q[23] + 8'd127;
assign out_sign = a_sign ^ b_sign;
assign Out = {out_sign, out_exp, out_frac};

endmodule