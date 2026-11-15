module mg_07976(data_i, data_o, clk_i, en_i);
parameter DATA_WIDTH = 32; 
  parameter PIPE_STAGES = 1; 
  input [DATA_WIDTH-1:0] data_i; 
  output [DATA_WIDTH-1:0] data_o; 
  input clk_i; 
  input en_i; 
  genvar i; 
  integer j; 
  reg [DATA_WIDTH - 1:0] pipe_array [PIPE_STAGES+1:0]; 
  generate 
  if(PIPE_STAGES == 0) begin: no_pipe 
  assign data_o = data_i; 
  end 
  endgenerate 
  generate 
  if(PIPE_STAGES > 0) begin: add_pipe 
  initial begin 
  for(j = 0; j < PIPE_STAGES; j = j + 1) 
  pipe_array[j] <= 'b0; 
  end 
  assign data_o = pipe_array[PIPE_STAGES-1]; 
  always @ (posedge clk_i) begin 
  if(en_i) begin 
  pipe_array[0] <= data_i; 
  end 
  end 
  for(i = 1; i < PIPE_STAGES; i = i + 1) begin : pipe 
  always @ (posedge clk_i) begin 
  if(en_i) begin 
  pipe_array[i] <= pipe_array[i-1]; 
  end 
  end 
  end 
  end 
  endgenerate 
 endmodule