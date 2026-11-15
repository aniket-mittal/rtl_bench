module rtlpp_08709(
	 input CLK,
	 input rst,
	 input CNV_START,
	 input SDO,
	 output BUSY,
	 output CNV,
	 output reg SCK,
	 output SDI,
	 output [15:0] RESULT,
	 output VALID
	 );

	reg busy_w;
	reg cnv_w;
	reg [15:0] result_w;
	reg valid_w;
	reg clk_en;
	reg [15:0] counter;

	parameter IDLE = 5'b00001,
	          CONVERT = 5'b00010,
	          END_CONVERSION = 5'b00100,
	          READ_OUT = 5'b01000,
	          VALID_F = 5'b10000,
	          WAIT = 5'b10001;	
		
	reg [4:0] state;
		
	always @(posedge CLK or posedge rst) begin
		if (rst) begin
			cnv_w <= 1'b0; 
			clk_en <= 1'b0; 
			busy_w <= 1'b0; 
			valid_w <= 1'b0; 
			result_w <= 16'd0; 
			counter <= 16'd0; 
			state <= IDLE;
		end
		else begin		
			case (state)
				IDLE: begin
					cnv_w <= 1'b0; 
					clk_en <= 1'b0; 
					busy_w <= 1'b0; 
					valid_w <= 1'b0; 
					result_w <= 16'd0;
					counter <= 16'd0;
					if (CNV_START == 1'b1) begin
						counter <= 16'd64; 
						state <= CONVERT;
					end
				end
				
				CONVERT: begin
					cnv_w <= 1'b1; 
					busy_w <= 1'b1; 
					if (counter == 16'd0) begin  
						counter <= 16'd31;	
						cnv_w <= 1'b0; 		
						state <= READ_OUT;
					end
					else begin 
						counter <= counter - 1; 
					end
				end
				
				READ_OUT: begin
					if (counter == 16'd31) begin
						result_w[15] <= SDO;  
						counter <= counter - 1; 
						clk_en <= 1'b1;
					end
					else if ( (counter == 16'd30) || (counter == 16'd28) || (counter == 16'd26) || 
					          (counter == 16'd24) || (counter == 16'd22) || (counter == 16'd20) || 
					          (counter == 16'd18) || (counter == 16'd16) || (counter == 16'd14) || 
					          (counter == 16'd12) || (counter == 16'd10) || (counter == 16'd8) || 
					          (counter == 16'd6) || (counter == 16'd4) || (counter == 16'd2)) begin
						clk_en <= 1'b1;
						result_w[counter >> 1] <= SDO;
						counter <= counter - 1; 
					end
					else if (counter == 16'd0) begin
						result_w[counter] <= SDO;  
						counter <= 16'd35; 
						state <= VALID_F;
					end
					else begin
						counter <= counter - 1; 
					end
				end
				
				VALID_F: begin
					valid_w <= 1'b1;	
					state <= WAIT;
				end
				
				WAIT: begin
					busy_w <= 1'b0; 
					clk_en <= 1'b0;	
					valid_w <= 1'b0; 
					if (counter == 16'd0) begin
						state <= IDLE;
					end
					else begin 
						counter <= counter - 1; 
					end
				end
				
				default: state <= IDLE;
			endcase
		end
	end
	
	assign BUSY = busy_w;
	assign CNV = cnv_w;
	assign SDI = 1'b1; // Drive SDI high
	assign RESULT = result_w;
	assign VALID = valid_w;
	 
	always @(posedge CLK) begin
		SCK <= (!SCK) & clk_en;
	end
	 
endmodule