module mg_02809(input clk, input [7:0] adc_d, input [7:0] threshold,output [7:0] min, output [7:0] max);
reg [7:0] min_val = 255; 
  reg [7:0] max_val = 0; 
  reg [7:0] cur_min_val = 255; 
  reg [7:0] cur_max_val = 0; 
  reg [1:0] state = 0; 
  [MASKED] 
  assign min = min_val; 
  assign max = max_val; 
 endmodule