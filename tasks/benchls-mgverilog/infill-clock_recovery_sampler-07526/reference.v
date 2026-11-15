module mg_07526(input clock_recovery,input clock_50,input reset_n,input [7:0] data_rec,output reg [7:0] data_stand);
always@(posedge clock_50 or negedge reset_n ) 
 begin 
  if(!reset_n) 
  begin 
  data_stand <= 8'd0; 
  end 
  else 
  begin 
  if(clock_recovery) 
  data_stand <= data_rec; 
  else 
  data_stand <= data_stand; 
  end 
 end 
 endmodule