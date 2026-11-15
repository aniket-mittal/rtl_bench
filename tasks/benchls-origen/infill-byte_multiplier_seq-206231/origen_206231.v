module origen_206231(
    i_clk,
    i_nrst,
    i_start,
    i_a,
    i_b,
    o_c,
    o_done
);

input i_clk;
input i_nrst;
input i_start;
input [7:0] i_a;
input [7:0] i_b;
output reg [15:0] o_c;
output reg o_done;

reg upd_ptr;
reg [3:0] ptr;
reg [1:0] a_ptr, b_ptr;
reg a0, a1, a2, a3, b0, b1, b2, b3;
reg [1:0] a, b;
reg [3:0] ab;
reg [5:0] ab0, ab1, ab2, ab3, ab4, ab5;
reg [15:0] ab_acc_next, ab_acc;
reg done, run;

[MASKED]

endmodule