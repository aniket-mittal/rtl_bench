module rtlpp_07029 (y, clk, rst, x);
input x;
input clk;
input rst;
output reg y;

localparam [1:0] ST_A = 2'b00;
localparam [1:0] ST_B = 2'b01;
localparam [1:0] ST_C = 2'b10;

reg [1:0] s_pr_state;
reg [1:0] s_nx_state;
reg s_y_out;

always @(posedge clk or posedge rst)
begin : p_fsm_pr_state
	if (rst) 
		s_pr_state <= ST_A;
	else 
		s_pr_state <= s_nx_state;
end

[MASKED]

always @(posedge clk)
begin : p_fsm_glitch_free
	y <= s_y_out;
end

endmodule