module mg_00421(input clk,input binput,output boutput);
parameter PERIOD=1000000; 
 reg [23:0] counter; 
 reg d_button_state; 
 reg pressed; 
 assign boutput=d_button_state; 
 always@(posedge clk)begin 
  if(binput==0)begin 
  counter<=0; 
  if(d_button_state) pressed=1;else pressed=0; 
  end 
  else begin 
  counter<=counter+1; 
  end 
 end 
 always@(posedge clk)begin 
  if(counter==PERIOD && pressed==0)begin 
  d_button_state<=1; 
  end 
  else begin 
  d_button_state<=(binput==0)?0:boutput; 
  end 
 end 
 endmodule