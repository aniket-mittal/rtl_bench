module rtlpp_08796 (
	input clk,
	input signed [15:0] x,
	input signed [15:0] y,
	input signed [15:0] z,
	input mode,
	output reg signed [17:0] x_rot,
	output reg signed [17:0] y_rot,
	output reg signed [15:0] z_rot,
	output reg signed [1:0] d
);
	always @(posedge clk)
	begin
		case(mode)
			0:  begin
					if (z > 16384 && z < 32767)
					begin
						x_rot <= {x[15], x[15], x}; // sign extend
						y_rot <= {y[15], y[15], y}; // sign extend
						z_rot <= z - 16'd32767;
						d 	  <= 2'b11;
					end
					else if (z < -16384 && z >= -32768)
					begin
						x_rot <= {x[15], x[15], x}; // sign extend
						y_rot <= {y[15], y[15], y}; // sign extend
						z_rot <= z + 16'd32767;
						d 	  <= 2'b11;
					end
					else
					begin
						x_rot <= {x[15], x[15], x}; // sign extend
						y_rot <= {y[15], y[15], y}; // sign extend
						z_rot <= z;
						d 	  <= 2'b01;
					end
				end
			1:  begin
					if (x < 0)
					begin
						x_rot <= -{x[15], x[15], x}; // sign extend and negate
						y_rot <= -{y[15], y[15], y}; // sign extend and negate
						z_rot <= z - 16'd32767;
					end
					else
					begin
						x_rot <= {x[15], x[15], x}; // sign extend
						y_rot <= {y[15], y[15], y}; // sign extend
						z_rot <= z;
					end
				end
		endcase
	end
endmodule