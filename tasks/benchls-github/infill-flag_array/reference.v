module flag_array (
	clk,
	waddr_a, waddr_b, 
	we_a, we_b, 
	raddr_a, raddr_b,
	sel_a, sel_b
);

parameter ADDR_WIDTH = 4;
parameter NUM_SLOTS = 1 << ADDR_WIDTH;

input clk;
input [ADDR_WIDTH-1:0] waddr_a,waddr_b,raddr_a,raddr_b;
input we_a,we_b;
output sel_a,sel_b;

reg [NUM_SLOTS-1:0] slots;

reg [ADDR_WIDTH-1:0] waddr_a_r,waddr_b_r,raddr_a_r,raddr_b_r;
reg we_a_r, we_b_r;

always @(posedge clk) begin
	waddr_a_r <= waddr_a;
	waddr_b_r <= waddr_b;
	raddr_a_r <= raddr_a;
	raddr_b_r <= raddr_b;
	we_a_r <= we_a;
	we_b_r <= we_b;
end

reg sel_a,sel_b;
always @(posedge clk) begin
	if (we_a_r) slots[waddr_a_r] <= 1'b0;
	if (we_b_r) slots[waddr_b_r] <= 1'b1;
	sel_a <= slots[raddr_a_r];
	sel_b <= slots[raddr_b_r];
end

endmodule