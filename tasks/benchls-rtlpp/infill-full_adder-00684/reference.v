module rtlpp_00684 (
	a,
	b,
	cin,
	sum,
	cout
);
input a;
input b;
input cin;
output sum;
output cout;

wire gnd;
wire vcc;

assign gnd = 1'b0;
assign vcc = 1'b1;

assign sum = a ^ b ^ cin;     // sum calculation
assign cout = (a & b) | (cin & (a ^ b)); // carry out calculation

endmodule