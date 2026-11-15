module rtlpp_07052(
	input CLK,			  
	input [3:0]I,       
	output	  Y		  
);

reg Y1;
assign Y = Y1;

parameter s0 = 4'd0,
          s1 = 4'd1,
          s2 = 4'd2,
          s3 = 4'd3,
          s4 = 4'd4,
          s5 = 4'd5;

reg [3:0] state = s0, next_state;

always @ (posedge CLK) begin
	state <= next_state;
end

always @ (state or I) begin
	case (state)
		s0: begin
			if (I == 4'd1) next_state = s1;
			else next_state = s0;
		end
		s1: begin
			if (I == 4'd0) next_state = s2;
			else if (I == 4'd1) next_state = s1;
			else next_state = s0;
		end
		s2: begin
			if (I == 4'd2) next_state = s3;
			else if (I == 4'd1) next_state = s1;
			else next_state = s0;
		end
		s3: begin
			if (I == 4'd2) next_state = s4;
			else if (I == 4'd1) next_state = s1;
			else next_state = s0;
		end
		s4: begin
			if (I == 4'd1) next_state = s5;
			else next_state = s0;
		end
		s5: begin
			if (I == 4'd0) next_state = s2;
			else if (I == 4'd1) next_state = s1;
			else next_state = s0;
		end
		default: next_state = s0;
	endcase
end

always @ (posedge CLK) begin
	Y1 <= (state == s5 && I == 4'd0) ? 1'b1 : 1'b0;
end

endmodule