module six_three_comp (data,sum);

input [5:0] data;
output [2:0] sum;

reg [2:0] sum /* synthesis keep */;

always @(data) begin
    case (data)
      0: sum=0;
      1: sum=1;
      2: sum=1;
      3: sum=2;
      4: sum=1;
      5: sum=2;
      6: sum=2;
      7: sum=3;
      8: sum=1;
      9: sum=2;
      10: sum=2;
      11: sum=3;
      12: sum=2;
      13: sum=3;
      14: sum=3;
      15: sum=4;
      16: sum=1;
      17: sum=2;
      18: sum=2;
      19: sum=3;
      20: sum=2;
      21: sum=3;
      22: sum=3;
      23: sum=4;
      24: sum=2;
      25: sum=3;
      26: sum=3;
      27: sum=4;
      28: sum=3;
      29: sum=4;
      30: sum=4;
      31: sum=5;
      32: sum=1;
      33: sum=2;
      34: sum=2;
      35: sum=3;
      36: sum=2;
      37: sum=3;
      38: sum=3;
      39: sum=4;
      40: sum=2;
      41: sum=3;
      42: sum=3;
      43: sum=4;
      44: sum=3;
      45: sum=4;
      46: sum=4;
      47: sum=5;
      48: sum=2;
      49: sum=3;
      50: sum=3;
      51: sum=4;
      52: sum=3;
      53: sum=4;
      54: sum=4;
      55: sum=5;
      56: sum=3;
      57: sum=4;
      58: sum=4;
      59: sum=5;
      60: sum=4;
      61: sum=5;
      62: sum=5;
      63: sum=6;
      default: sum=0;
    endcase
end

endmodule

module ternary_add (a,b,c,o);

parameter WIDTH=8;
parameter SIGN_EXT = 1'b0;

input [WIDTH-1:0] a,b,c;
output [WIDTH+1:0] o;
wire [WIDTH+1:0] o;

generate 
if (!SIGN_EXT)
	assign o = a+b+c;
else
	assign o = {a[WIDTH-1],a[WIDTH-1],a} +
			   {b[WIDTH-1],b[WIDTH-1],b} +
			   {c[WIDTH-1],c[WIDTH-1],c};
endgenerate

endmodule

module thirtysix_six_comp (data,sum);

input [35:0] data;
output [5:0] sum;
wire [5:0] sum;

wire [5:0] word_l;
wire [5:0] word_m;
wire [5:0] word_h;

wire [2:0] sa,sb,sc,sd,se,sf;
wire [2:0] slo,sme,shi;

six_three_comp a (.data(data[5:0]),.sum(sa));
six_three_comp b (.data(data[11:6]),.sum(sb));
six_three_comp c (.data(data[17:12]),.sum(sc));
six_three_comp d (.data(data[23:18]),.sum(sd));
six_three_comp e (.data(data[29:24]),.sum(se));
six_three_comp f (.data(data[35:30]),.sum(sf));

six_three_comp lo (.data({sa[0],sb[0],sc[0],sd[0],se[0],sf[0]}),.sum(slo));
six_three_comp me (.data({sa[1],sb[1],sc[1],sd[1],se[1],sf[1]}),.sum(sme));
six_three_comp hi (.data({sa[2],sb[2],sc[2],sd[2],se[2],sf[2]}),.sum(shi));

wire [7:0] tmp_sum;
ternary_add t (.a({3'b0,slo}),
			.b({2'b0,sme,1'b0}),
			.c({1'b0,shi,2'b0}),
			.o(tmp_sum));
	defparam t .WIDTH = 6;
assign sum = tmp_sum[5:0];

endmodule