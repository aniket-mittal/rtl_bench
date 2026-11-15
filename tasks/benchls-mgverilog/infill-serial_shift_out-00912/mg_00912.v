module mg_00912 (input clk,input sclk_posedge,input sclk_negedge,input reset,input en,input [DATA_BITS-1:0] data,output reg out,output done);
parameter DATA_BITS = 48; 
  reg [2:0] bit_counter = 7; 
  always @ (posedge clk) begin 
  if (sclk_negedge) begin 
  bit_counter <= bit_counter - 1; 
  end 
  end 
  localparam STATE_IDLE = 0; 
  localparam STATE_SYNC = 1; 
  localparam STATE_ENABLED = 2; 
  reg [1:0] state = STATE_IDLE; 
  reg [$clog2(DATA_BITS)-1:0] out_index = DATA_BITS - 1; 
  reg [DATA_BITS-1:0] saved_data = 0; 
  assign done = (STATE_IDLE == state) && !en; 
  [MASKED] 
 endmodule