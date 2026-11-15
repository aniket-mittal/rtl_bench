module rtlpp_00751(i_data_A, i_data_B, i_alu_control, o_zero_flag, o_result);

input [31:0] i_data_A;					
input [31:0] i_data_B;					
output reg [31:0] o_result;				
input [3:0] i_alu_control;				

output wire o_zero_flag;				
assign o_zero_flag = ~|o_result;

reg [31:0] i_shifter_data;
reg [2:0] i_shift_mode;
reg [4:0] i_shift_cnt;
wire [31:0] o_shifted_data; 

// Barrel Shifter logic integrated directly into the ALU
assign o_shifted_data = (i_shift_mode == 3'b000) ? (i_shifter_data << i_shift_cnt) :  
                        (i_shift_mode == 3'b001) ? (i_shifter_data >> i_shift_cnt) :  
                        (i_shift_mode == 3'b010) ? (($signed(i_shifter_data) >>> i_shift_cnt)) :  
                        (i_shift_mode == 3'b011) ? ((i_shifter_data >> i_shift_cnt) | (i_shifter_data << (32 - i_shift_cnt))) :  
                        (i_shift_mode == 3'b100) ? ((i_shifter_data << i_shift_cnt) | (i_shifter_data >> (32 - i_shift_cnt))) :  
                        32'bx;

always @(*) begin
	
	i_shifter_data = {32{1'bx}};
	i_shift_mode = {3{1'bx}};
	i_shift_cnt = {5{1'bx}};
	
	casex(i_alu_control)
		4'b0010:	
			begin
				o_result = i_data_A + i_data_B;
			end
		4'b0110:	
			begin
				o_result = i_data_A - i_data_B;
			end
		4'b0000:	
			begin
				o_result = i_data_A & i_data_B;
			end
		4'b0001:	
			begin
				o_result = i_data_A | i_data_B;
			end
		4'b0111:	
			begin
				o_result = i_data_A < i_data_B ? 32'h00000001 : 32'h00000000;	
			end
		4'b0011:	
			begin
				o_result = i_data_A ^ i_data_B;
			end
		4'b0100:	
			begin
				o_result = ~(i_data_A | i_data_B);
			end
		4'b1000:	
			begin
				i_shifter_data = i_data_B;
				i_shift_mode = 3'b000;
				i_shift_cnt = i_data_A[4:0];	
		
				o_result = o_shifted_data;		
			end
		4'b1001:	
			begin
				i_shifter_data = i_data_B;
				i_shift_mode = 3'b001;
				i_shift_cnt = i_data_A[4:0];	
		
				o_result = o_shifted_data;	
			end
		4'b1010:	
			begin
				i_shifter_data = i_data_B;
				i_shift_mode = 3'b100;
				i_shift_cnt = i_data_A[4:0];	
		
				o_result = o_shifted_data;	
			end
		4'b1011:	
			begin
				i_shifter_data = i_data_B;
				i_shift_mode = 3'b011;
				i_shift_cnt = i_data_A[4:0];
		
				o_result = o_shifted_data;	
			end
		4'b1100:	
			begin
				i_shifter_data = i_data_B;
				i_shift_mode = 3'b010;
				i_shift_cnt = i_data_A[4:0];	
		
				o_result = o_shifted_data;	
			end
			
		default:
			begin
				o_result = {32{1'bx}};	
			end
	endcase
end
endmodule