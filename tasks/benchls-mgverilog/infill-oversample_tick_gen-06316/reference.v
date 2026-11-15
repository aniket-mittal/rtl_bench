module mg_06316(input clk,input tick_8x,input rst,output go);
parameter RESET_TYPE = 0; 
  reg [2:0] clk_div = 0; 
  always @ (posedge clk) begin 
  if (rst) begin 
  if (RESET_TYPE == 0) begin 
  clk_div <= 0; 
  end else begin 
  clk_div <= 4; 
  end 
  end else if (tick_8x) begin 
  clk_div <= clk_div + 1; 
  end 
  end 
  assign go = !rst & tick_8x & clk_div == 3'b111; 
 endmodule