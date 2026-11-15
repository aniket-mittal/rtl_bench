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

[MASKED]
endmodule