module origen_216366(
    input [31:0] dividend,
    input [31:0] divisor,
    input start,
    input clock,
    input reset,
    output [31:0] q,
    output [31:0] r,
    output busy
);

reg first;
reg busy2;
reg r_sign;
reg flag;
reg [1:0] flag_s;
reg [4:0] count;
reg [31:0] reg_q, reg_r, reg_b;
reg [31:0] tmp_q, tmp_r;

wire sub_add = (r_sign) ? 1'b1 : 1'b0;

[MASKED]

assign q = tmp_q;
assign r = tmp_r;
assign busy = busy2;

endmodule