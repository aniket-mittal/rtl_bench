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

always @(s_pr_state or x)
begin : p_fsm_nx_state_out
	case (s_pr_state)
		ST_B : begin
			s_y_out = 1'b1;
			if (x) 
				s_nx_state = ST_C;
			else 
				s_nx_state = ST_A;
		end
		ST_C : begin
			s_y_out = 1'b0;
			if (!x) 
				s_nx_state = ST_A;
			else 
				s_nx_state = ST_C;
		end
		default : begin 
			s_y_out = 1'b0;
			if (x) 
				s_nx_state = ST_B;
			else 
				s_nx_state = ST_A;
		end
	endcase 
end

always @(posedge clk)
begin : p_fsm_glitch_free
	y <= s_y_out;
end

endmodule