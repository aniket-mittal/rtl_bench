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
 [MASKED] 
 endmodule