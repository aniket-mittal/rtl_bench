module mg_01723(input clk,input rst,input SCLK,input SSbar,input MOSI,output reg[7:0] dout,output reg data_present,input rd);
reg clear; 
  always @(posedge clk or posedge rst) begin 
  if(rst) clear <= 1; 
  else if(rd) clear <= 1; 
  else clear <= 0; 
  end 
  always @(posedge rst or posedge SCLK) begin 
  if(rst) dout <= 0; 
  else if (SSbar==0 & ~data_present) dout <= { dout[6:0] , MOSI}; 
  end 
  reg data_present_temp; 
  always @(posedge SSbar or posedge clear) begin 
  if(clear) data_present_temp <= 0; 
  else data_present_temp <= 1; 
  end 
  always @(posedge clk or posedge rst) begin 
  if(rst) data_present <= 0; 
  else data_present <= data_present_temp; 
  end 
 endmodule