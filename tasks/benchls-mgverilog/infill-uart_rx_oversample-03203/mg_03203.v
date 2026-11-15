module mg_03203(input rst, clk, baud_edge, rx,output [7:0] data,output data_ready, framing_error);
parameter OVERSAMPLE = 8; 
  localparam FIND_EDGE = 3'd1, START = 3'd2, DATA = 3'd3, END = 3'd4; 
  reg prev_rx; 
  reg [7:0] data_reg; 
  reg [2:0] data_counter; 
  reg [2:0] state = 0; 
  reg [$clog2(OVERSAMPLE+OVERSAMPLE/2)-1:0] over_sample_counter = 0; 
  reg data_ready_reg = 0; 
  reg framing_error_reg = 0; 
  assign data = data_reg; 
  assign data_ready = data_ready_reg; 
  assign framing_error = framing_error_reg; 
  [MASKED] 
 endmodule