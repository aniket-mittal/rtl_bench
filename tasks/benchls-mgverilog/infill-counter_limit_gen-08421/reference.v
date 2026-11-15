module mg_08421 (enable, clock, resetn,i_init,i_limit,i_increment,i_counter_reset,o_size,o_resultvalid,o_result,o_full,o_stall);
parameter INIT=0; 
 parameter LIMIT=65536; 
 input logic clock; 
 input logic resetn; 
 input logic enable; 
 input logic [31:0] i_init; 
 input logic [31:0] i_limit; 
 input logic i_counter_reset; 
 input logic [31:0] i_increment; 
 output logic [31:0] o_size; 
 output logic o_resultvalid; 
 output logic [31:0] o_result; 
 output logic o_full; 
 output logic o_stall; 
 reg [31:0] counter; 
 assign o_size = counter; 
 always@(posedge clock or negedge resetn) 
 begin 
  if ( !resetn ) begin 
  o_resultvalid <= 1'b0; 
  counter <= 32'b0; 
  o_result <= 32'b0; 
  o_full <= 1'b0; 
  o_stall <= 1'b0; 
  end 
  else if( i_counter_reset ) begin 
  o_resultvalid <= 1'b1; 
  counter <= i_increment; 
  o_result <= i_init; 
  o_stall <= 1'b0; 
  end 
  else if( o_full ) begin 
  o_full <= 1'b0; 
  end 
  else if( ~o_stall ) begin 
  if (enable) begin 
  if( (counter != 32'b0) && (counter == i_limit) ) begin 
  o_full <= 1'b1; 
  o_stall <= 1'b1; 
  o_resultvalid <= 1'b0; 
  end 
  else begin 
  o_result <= i_init + counter; 
  o_resultvalid <= 1'b1; 
  counter <= counter + i_increment; 
  end 
  end 
  else begin 
  o_resultvalid <= 1'b0; 
  end 
  end 
 end 
 endmodule