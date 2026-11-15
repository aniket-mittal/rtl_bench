module rtlpp_11382(instruction, 
	inM,
	outM,
	writeM,
	PC,
	addressM,
	reset,
	clk);

input clk;
input reset;
output [0:14] addressM;
input [0:15] inM;
input [0:15] instruction;
output [0:15] outM;
output [0:15] PC;
output writeM;

wire a;
wire i;
wire c1, c2, c3, c4, c5, c6;
wire j1, j2, j3;

assign a = instruction[3];
assign i = instruction[0];
assign c1 = instruction[4];
assign c2 = instruction[5];
assign c3 = instruction[6];
assign c4 = instruction[7];
assign c5 = instruction[8];
assign c6 = instruction[9];

assign d1 = instruction[10];
assign d2 = instruction[11];
assign d3 = instruction[12];

assign j1 = instruction[13];
assign j2 = instruction[14];
assign j3 = instruction[15];

assign writeM = d3 & i;

reg [0:15] areg;
reg [0:15] dreg;

wire [0:15] aregIn;
wire [0:15] aluOut;
assign outM = aluOut;

wire aload;

wire [0:15] aluY;

assign aregIn = i ? instruction : aluOut;
assign aload = !i | d1;
assign aluY = a ? areg : inM;

assign addressM = areg;

always @(posedge clk) begin
	if (aload == 1'b1)
		areg <= aregIn;
end

always @(posedge clk) begin
	if (d2 == 1'b1 && i == 1'b1)
		dreg <= aluOut;
end

wire zr;
wire ng;

// ALU Module Logic Replaced Inline
assign {zr, ng, aluOut} = alu_function(dreg, aluY, c1, c2, c3, c4, c5, c6);

function [17:0] alu_function;
	input [15:0] x, y;
	input zx, nx, zy, ny, f, no;
	reg [15:0] out;
	reg zr, ng;
	begin
		if (zx) x = 0;
		if (nx) x = ~x;
		if (zy) y = 0;
		if (ny) y = ~y;
		if (f) out = x + y;
		else out = x & y;
		if (no) out = ~out;
		zr = (out == 0);
		ng = out[15];
		alu_function = {zr, ng, out};
	end
endfunction

wire pcload;
wire pcinc;
assign pcload = ((j2 & zr) | (j1 & ng) | (j2 & !ng)) & i;
assign pcinc = !pcload;

// PC Module Logic Replaced Inline
reg [0:15] PC_reg;
always @(posedge clk or posedge reset) begin
	if (reset) 
		PC_reg <= 0;
	else if (pcload)
		PC_reg <= areg;
	else if (pcinc)
		PC_reg <= PC_reg + 1;
end

assign PC = PC_reg;

endmodule