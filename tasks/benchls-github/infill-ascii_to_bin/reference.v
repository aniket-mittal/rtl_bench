module ascii_to_bin (in,out);
input [7:0] in;
output [5:0] out;
wire [5:0] out;
assign out = (in>="a"?(in-59):in>="A"?(in-53):in-".");
endmodule