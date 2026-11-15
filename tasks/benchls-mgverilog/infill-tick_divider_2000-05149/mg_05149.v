module mg_05149(input wire clk,input wire en,output wire outclk);
reg [10:0] cnt = 0; 
  assign outclk = en & (cnt == 2000); 
  [MASKED] 
 endmodule