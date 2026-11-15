module mix_one_column (in,out);

input [4*8-1:0] in;
output [4*8-1:0] out;
wire [4*8-1:0] out;

function [7:0] mult2;
	input [7:0] n;
	begin
		mult2 = {n[6],n[5],n[4],n[3]^n[7],n[2]^n[7],n[1],n[0]^n[7],n[7]};
	end
endfunction

function [7:0] mult3;
	input [7:0] n;
	begin
		mult3 = mult2(n) ^ n;
	end
endfunction

wire [7:0] s0_i,s1_i,s2_i,s3_i;
wire [7:0] s0_o,s1_o,s2_o,s3_o;

assign {s0_i,s1_i,s2_i,s3_i} = in;

assign s0_o = mult2(s0_i) ^ mult3(s1_i) ^ s2_i ^ s3_i;
assign s1_o = s0_i ^ mult2(s1_i) ^ mult3(s2_i) ^ s3_i;
assign s2_o = s0_i ^ s1_i ^ mult2(s2_i) ^ mult3(s3_i);
assign s3_o = mult3(s0_i) ^ s1_i ^ s2_i ^ mult2(s3_i);

assign out = {s0_o,s1_o,s2_o,s3_o};

endmodule