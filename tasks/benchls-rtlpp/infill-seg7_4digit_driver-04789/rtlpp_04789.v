module rtlpp_04789 (
    input clk,
    input [3:0] binary_input_0, 
    input [3:0] binary_input_1,
    input [3:0] binary_input_2,
    input [3:0] binary_input_3,
    output reg [3:0] IO_SSEG_SEL, 
    output reg [6:0] IO_SSEG 
    );
    
    reg [1:0] current_LED = 0;
    reg [6:0] LED_out [3:0];
    
    reg [18:0] counter = 0; 
    parameter max_counter = 500000; 
    
    wire [3:0] four_bit_data [3:0]; 
    assign  four_bit_data[0] = binary_input_0;
    assign  four_bit_data[1] = binary_input_1;
    assign  four_bit_data[2] = binary_input_2;
    assign  four_bit_data[3] = binary_input_3;
                      	 
    [MASKED]    
endmodule