module inv_mix_one_column (in,out);

input [4*8-1:0] in;
output [4*8-1:0] out;
wire [4*8-1:0] out;

function [7:0] mult2;
	input [7:0] n;
	begin
		mult2 = {n[6],n[5],n[4],n[3]^n[7],n[2]^n[7],n[1],n[0]^n[7],n[7]};
	end
endfunction

function [7:0] mult4;
	input [7:0] n;
	begin
		mult4 = {n[5],	n[4],	n[3]^n[7],	n[2]^n[7]^n[6],
				n[6]^n[1],	n[0]^n[7],	n[6]^n[7],	n[6]};
	end
endfunction

function [7:0] mult8;
	input [7:0] n;
	begin
		mult8 = {n[4],	n[3]^n[7],	n[2]^n[7]^n[6],	n[5]^n[6]^n[1],
				n[5]^n[0]^n[7],	n[6]^n[7],	n[6]^n[5],	n[5]};
	end
endfunction

// equivalent to mult8 ^ mult2
function [7:0] multa;
	input [7:0] n;
	begin
		multa = {n[4]^n[6],	n[3]^n[7]^n[5],	n[4]^n[2]^n[7]^n[6],	n[5]^n[6]^n[1]^n[3]^n[7],
				n[5]^n[0]^n[2],	n[6]^n[7]^n[1],	n[0]^n[7]^n[6]^n[5],	n[7]^n[5]};
	end
endfunction

// equivalent to mult8 ^ mult4
function [7:0] multc;
	input [7:0] n;
	begin
		multc = {n[4]^n[5],	n[4]^n[3]^n[7],	n[2]^n[3]^n[6],	n[2]^n[5]^n[7]^n[1],
				n[6]^n[1]^n[5]^n[0]^n[7],	n[6]^n[0],	n[7]^n[5],	n[6]^n[5]};
	end
endfunction

function [7:0] mult9;
	input [7:0] n;
	begin
		mult9 = mult8(n) ^ n;
	end
endfunction

function [7:0] multb;
	input [7:0] n;
	begin
		multb = multa(n) ^ n;
	end
endfunction

function [7:0] multd;
	input [7:0] n;
	begin
		multd = multc(n) ^ n;
	end
endfunction

function [7:0] multe;
	input [7:0] n;
	begin
		multe = {n[5]^n[4]^n[6],	n[4]^n[3]^n[7]^n[5],	n[4]^n[2]^n[3]^n[6],	n[5]^n[2]^n[1]^n[3],
				n[6]^n[1]^n[5]^n[0]^n[2],	n[6]^n[0]^n[1],	n[0]^n[5],	n[7]^n[5]^n[6]};
	end
endfunction

wire [7:0] s0_i,s1_i,s2_i,s3_i;
wire [7:0] s0_o,s1_o,s2_o,s3_o;

assign {s0_i,s1_i,s2_i,s3_i} = in;

assign s0_o = multe(s0_i) ^ multb(s1_i) ^ multd(s2_i) ^ mult9(s3_i);
assign s1_o = mult9(s0_i) ^ multe(s1_i) ^ multb(s2_i) ^ multd(s3_i);
assign s2_o = multd(s0_i) ^ mult9(s1_i) ^ multe(s2_i) ^ multb(s3_i);
assign s3_o = multb(s0_i) ^ multd(s1_i) ^ mult9(s2_i) ^ multe(s3_i);

assign out = {s0_o,s1_o,s2_o,s3_o};

endmodule