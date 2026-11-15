module mg_00421(input clk,input binput,output boutput);
parameter PERIOD=1000000; 
 reg [23:0] counter; 
 reg d_button_state; 
 reg pressed; 
 assign boutput=d_button_state; 
 [MASKED] 
 always@(posedge clk)begin 
  if(counter==PERIOD && pressed==0)begin 
  d_button_state<=1; 
  end 
  else begin 
  d_button_state<=(binput==0)?0:boutput; 
  end 
 end 
 endmodule