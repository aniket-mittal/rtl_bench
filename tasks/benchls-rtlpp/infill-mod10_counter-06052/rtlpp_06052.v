module rtlpp_06052 (
    clock,
    cnt_en,
    sclr,
    cout,
    q
);

    input clock;
    input cnt_en;
    input sclr;
    output cout;
    output [3:0] q;

    reg [3:0] counter;
    reg cout_reg;
    wire [3:0] modulus_bus = 4'b1010;

    assign cout = cout_reg;
    assign q = counter;

    [MASKED]
endmodule