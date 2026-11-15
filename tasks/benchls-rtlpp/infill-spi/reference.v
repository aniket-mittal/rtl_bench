module spi(rst,clk,req,din,cmd,J);
	input rst,clk;
	input [7:0] din;
	input req;
	input cmd;
	output reg [3:0] J;
	reg [1:0] state;
	reg [7:0] data_buffer;
	reg [3:0] counter;
	
	always @(posedge rst or posedge clk) begin
		if(rst) begin
			J[0] <= 1;
			state <= 0;
			counter <= 8;
			J[3] <= 1;
			J[2] <= 0;
			J[1] <= 0;
			data_buffer <= 8'h00;
		end else begin
			case(state)
			0 : if(req) begin
					J[0] <= 0;
					state <= 1;
					counter <= 8;
					J[3] <= 1;
					J[2] <= 0;
					J[1] <= cmd;
					data_buffer <= din;
				end else begin
					J[0] <= 1;
					state <= 0;
					counter <= 8;
					J[3] <= 1;
					J[2] <= 0;
					J[1] <= J[1];
					data_buffer <= 8'h00;
				end					
			1 : if(counter == 0) begin
					J[0] <= 0;
					state <= 2;
					J[1] <= J[1];
					J[3] <= ~J[3];
					J[2] <= data_buffer[7];
					counter <= counter;
					data_buffer <= data_buffer << 1;
				end else begin
					J[0] <= 0;
					state <= 1;
					J[1] <= J[1];
					J[3] <= ~J[3];
					if(J[3]) begin 
						counter <= counter - 4'b0001;
						J[2] <= data_buffer[7];
						data_buffer <= data_buffer;
					end else begin
						counter <= counter;
						J[2] <= J[2];
						data_buffer <= data_buffer << 1;
					end
				end
			2 : begin
					J[0] <= 1;
					state <= 0;
					J[1] <= 0;
					J[3] <= 1;
					J[2] <= 0;
					counter <= 8;
					data_buffer <= 8'h00;
				end
			default : begin
					J[0] <= 1;
					state <= 0;
					J[1] <= 0;
					J[3] <= 1;
					J[2] <= 0;
					counter <= 8;
					data_buffer <= 8'h00;
				end
			endcase
		end
	end
endmodule