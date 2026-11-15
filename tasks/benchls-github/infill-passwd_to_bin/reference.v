module passwd_to_bin (in,out);
input [63:0] in;
output [63:0] out;
wire [63:0] out;
assign out = ((in & 64'h7f7f7f7f7f7f7f7f) << 1);
endmodule