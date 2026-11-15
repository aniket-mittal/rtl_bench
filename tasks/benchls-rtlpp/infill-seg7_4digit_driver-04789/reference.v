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
                      	 
    always @(posedge clk) begin
        if (counter < max_counter) begin
            counter <= counter + 1;
        end else begin
            current_LED <= current_LED + 1;
            counter <= 0;
        end
                
		case (four_bit_data[current_LED]) 
			 4'b0000 : LED_out[current_LED] <= 7'b1000000; 
			 4'b0001 : LED_out[current_LED] <= 7'b1111001; 
			 4'b0010 : LED_out[current_LED] <= 7'b0100100; 
			 4'b0011 : LED_out[current_LED] <= 7'b0110000; 
			 4'b0100 : LED_out[current_LED] <= 7'b0011001; 
			 4'b0101 : LED_out[current_LED] <= 7'b0010010; 
			 4'b0110 : LED_out[current_LED] <= 7'b0000010; 
			 4'b0111 : LED_out[current_LED] <= 7'b1111000; 
			 4'b1000 : LED_out[current_LED] <= 7'b0000000; 
			 4'b1001 : LED_out[current_LED] <= 7'b0011000; 
			 4'b1010 : LED_out[current_LED] <= 7'b0001000; 
			 4'b1011 : LED_out[current_LED] <= 7'b0000011; 
			 4'b1100 : LED_out[current_LED] <= 7'b1000110; 
			 4'b1101 : LED_out[current_LED] <= 7'b0100001; 
			 4'b1110 : LED_out[current_LED] <= 7'b0000110; 
			 default : LED_out[current_LED] <= 7'b0001110; 
		 endcase
        
        case (current_LED)
            0: begin
                IO_SSEG_SEL <= 4'b1110;
                IO_SSEG <= LED_out[0];
            end
                
            1: begin
                IO_SSEG_SEL <= 4'b1101;
                IO_SSEG <= LED_out[1];            
            end
            
            2: begin
                IO_SSEG_SEL <= 4'b1011;
                IO_SSEG <= LED_out[2];
            end
            
            3: begin
                IO_SSEG_SEL <= 4'b0111;
                IO_SSEG <= LED_out[3];
            end                
        endcase        
    end    
endmodule