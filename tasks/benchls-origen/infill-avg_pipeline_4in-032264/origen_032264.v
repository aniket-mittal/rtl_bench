module origen_032264(
    input wire Clk, Rst, Start,
    input wire signed [31:0] a, b, c, d, e, f, g, h,
    input wire signed [31:0] sa, one, two, four,
    output reg Done,
    output reg signed [31:0] avg
);

    reg [3:0] state;
    reg signed [31:0] t1, t2, t3, t4, t5, t6, t7, t7div2, t7div4;
    reg csa1, csa2, csa3;

    [MASKED]

endmodule