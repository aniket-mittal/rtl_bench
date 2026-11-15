module ascii_to_bin (in,out);
input [7:0] in;
output [5:0] out;
wire [5:0] out;
assign out = (in>="a"?(in-59):in>="A"?(in-53):in-".");
endmodule

module salt_to_bin (in,out);
input [15:0] in;
output [11:0] out;
wire [11:0] out;
ascii_to_bin x (.in(in[15:8]),.out(out[5:0]) );
ascii_to_bin y (.in(in[7:0]),.out(out[11:6]) );
endmodule