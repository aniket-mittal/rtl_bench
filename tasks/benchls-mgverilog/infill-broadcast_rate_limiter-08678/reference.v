module mg_08678 (Reset ,Clk ,broadcast_ptr ,broadcast_drop ,broadcast_filter_en ,broadcast_bucket_depth ,broadcast_bucket_interval);
input Reset ; 
 input Clk ; 
 input broadcast_ptr ; 
 output broadcast_drop ; 
 input broadcast_filter_en ; 
 input [15:0] broadcast_bucket_depth ; 
 input [15:0] broadcast_bucket_interval ; 
 reg [15:0] time_counter ; 
 reg [15:0] broadcast_counter ; 
 reg broadcast_drop ; 
 always @ (posedge Clk or posedge Reset) 
  if (Reset) 
  time_counter <=0; 
  else if (time_counter==broadcast_bucket_interval) 
  time_counter <=0; 
  else 
  time_counter <=time_counter+1; 
 always @ (posedge Clk or posedge Reset) 
  if (Reset) 
  broadcast_counter <=0; 
  else if (time_counter==broadcast_bucket_interval) 
  broadcast_counter <=0; 
  else if (broadcast_ptr&&broadcast_counter!=broadcast_bucket_depth) 
  broadcast_counter <=broadcast_counter+1; 
 always @ (posedge Clk or posedge Reset) 
  if (Reset) 
  broadcast_drop <=0; 
  else if(broadcast_filter_en&&broadcast_counter==broadcast_bucket_depth) 
  broadcast_drop <=1; 
  else 
  broadcast_drop <=0; 
 endmodule