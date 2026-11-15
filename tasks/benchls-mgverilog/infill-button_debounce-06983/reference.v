module mg_06983 (signal_debounced,clk_50mhz,rst,signal_async);
output signal_debounced; 
 input clk_50mhz; 
 input rst; 
 input signal_async; 
 reg [1:0] sync_stage; 
 always @(posedge clk_50mhz or posedge rst) 
  if (rst) sync_stage <= 2'b00; 
  else sync_stage <= {sync_stage[0], signal_async}; 
 wire signal_sync = sync_stage[1]; 
 reg [18:0] debounce_counter; 
 always @(posedge clk_50mhz or posedge rst) 
  if (rst) debounce_counter <= 19'h00000; 
  else if(signal_debounced==signal_sync) debounce_counter <= 19'h00000; 
  else debounce_counter <= debounce_counter+1; 
 wire debounce_counter_done = (debounce_counter==19'h7ffff); 
 reg signal_debounced; 
 always @(posedge clk_50mhz or posedge rst) 
  if (rst) signal_debounced <= 1'b0; 
  else if(debounce_counter_done) signal_debounced <= ~signal_debounced; 
 endmodule