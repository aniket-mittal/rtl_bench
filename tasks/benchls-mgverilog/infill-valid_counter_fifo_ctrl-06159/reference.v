module mg_06159 (clock, resetn, i_counter_reset, i_datain_valid, o_datain_stall,o_dataout_valid, i_dataout_stall);
parameter DEPTH=2048; 
 localparam COUNTER_BITS = $clog2(DEPTH)+1; 
 input clock, resetn, i_counter_reset; 
 input i_datain_valid, i_dataout_stall; 
 output o_dataout_valid, o_datain_stall; 
 reg [COUNTER_BITS-1:0] valid_counter; 
 reg [COUNTER_BITS:0] valid_counter_neg; 
 wire input_accepted, output_acknowledged; 
 assign input_accepted = i_datain_valid; 
 assign output_acknowledged = o_dataout_valid & ~i_dataout_stall; 
  always @(posedge clock or negedge resetn) 
  begin 
  if (~resetn) 
  begin 
  valid_counter <= {COUNTER_BITS{1'b0}}; 
  valid_counter_neg <= {(COUNTER_BITS+1){1'b0}}; 
  end 
  else if (i_counter_reset) 
  begin 
  valid_counter <= {COUNTER_BITS{1'b0}}; 
  valid_counter_neg <= {(COUNTER_BITS+1){1'b0}}; 
  end 
  else 
  begin 
  valid_counter <= valid_counter + input_accepted - output_acknowledged; 
  valid_counter_neg <= valid_counter_neg - input_accepted + output_acknowledged; 
  end 
  end 
 assign o_datain_stall = valid_counter[COUNTER_BITS-1]; 
 assign o_dataout_valid = valid_counter_neg[COUNTER_BITS]; 
 endmodule