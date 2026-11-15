module mg_02608 (input clk,input en,input [BITS-1:0] data_a,input [BITS-1:0] data_b,output reg [(BITS*2)-1:0] result,output done);
parameter BITS = 16; 
  localparam STATE_IDLE = 0; 
  localparam STATE_MULTIPLY = 1; 
  reg state = STATE_IDLE; 
  reg [$clog2(BITS)-1:0] mul_counter = 0; 
  reg [BITS-1:0] data_a_reg = 0; 
  reg [(BITS*2)-1:0] data_b_reg = 0; 
  assign done = (STATE_IDLE == state) && !en; 
  [MASKED] 
 endmodule