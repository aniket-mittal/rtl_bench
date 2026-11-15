module twotofour(a1, en1, f1);
    input en1;
    input [1:0] a1;
    output reg [3:0] f1;

    always @(a1 or en1) begin
        case ({en1, a1})
            3'b000: f1 = 4'b1000;
            3'b001: f1 = 4'b0100;
            3'b010: f1 = 4'b0010;
            3'b011: f1 = 4'b0001;
            default: f1 = 4'b0000;
        endcase
    end
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