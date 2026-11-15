module rot_word (in,out);
input [31:0] in;
output [31:0] out;
wire [31:0] out;
assign out = {in[23:0],in[31:24]};
endmodule