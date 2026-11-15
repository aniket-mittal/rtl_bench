module twotofour(a1, en1, f1);
    input en1;
    input [1:0] a1;
    output reg [3:0] f1;

    [MASKED]
endmodule

module lab4_2(a, en, f);
    input en;
    input [3:0] a;
    output [15:0] f;
    wire [3:0] w;

    twotofour first(.a1(a[3:2]), .en1(en), .f1(w));
    twotofour second(.a1(a[1:0]), .en1(~w[0]), .f1(f[3:0]));
    twotofour third(.a1(a[1:0]), .en1(~w[1]), .f1(f[7:4]));
    twotofour fourth(.a1(a[1:0]), .en1(~w[2]), .f1(f[11:8]));
    twotofour fifth(.a1(a[1:0]), .en1(~w[3]), .f1(f[15:12]));
endmodule