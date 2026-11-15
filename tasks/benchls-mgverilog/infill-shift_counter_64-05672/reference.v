module mg_05672 (clock,resetn,enable,shift,incr_cntl,shift_in,incr_val,data_out,shift_out);
parameter COUNTER_WIDTH=64; 
 parameter INCREMENT_WIDTH=32; 
 parameter DAISY_WIDTH=64; 
 input clock; 
 input resetn; 
 input enable; 
 input shift; 
 input incr_cntl; 
 input [DAISY_WIDTH-1:0] shift_in; 
 input [INCREMENT_WIDTH-1:0] incr_val; 
 output [31:0] data_out; 
 output [DAISY_WIDTH-1:0] shift_out; 
 reg [COUNTER_WIDTH-1:0] counter; 
 always@(posedge clock or negedge resetn) 
 begin 
  if( !resetn ) 
  counter <= { COUNTER_WIDTH{1'b0} }; 
  else if(shift) 
  counter <= {counter, shift_in}; 
  else if(enable && incr_cntl) 
  counter <= counter + incr_val; 
 end 
 assign data_out = counter; 
 assign shift_out = {counter, shift_in} >> COUNTER_WIDTH; 
 endmodule