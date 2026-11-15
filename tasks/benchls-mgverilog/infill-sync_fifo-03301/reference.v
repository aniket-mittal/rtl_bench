module mg_03301(input clk_i,input reset_i,input write_i,input [DATA_WIDTH-1:0] data_in,input read_i,output reg [DATA_WIDTH-1:0] data_out,output reg valid_o,output full_o,output empty_o,output [ADDR_WIDTH-1:0] data_count_out);
parameter CAPACITY = 256; 
  parameter DATA_INIT = 0; 
  parameter DATA_WIDTH = 8; 
  parameter ADDR_WIDTH = $clog2(CAPACITY); 
  localparam MEMORY_SIZE = 2**ADDR_WIDTH; 
  localparam [ADDR_WIDTH-1:0] DATA_COUNT_INC = 1; 
  localparam [ADDR_WIDTH-1:0] WRITE_INC = 1; 
  localparam [ADDR_WIDTH-1:0] READ_INC = 1; 
  reg [ADDR_WIDTH-1:0] write_pointer = 0; 
  reg [ADDR_WIDTH-1:0] read_pointer = 0; 
  reg [ADDR_WIDTH-1:0] data_count = 0; 
  reg [DATA_WIDTH-1:0] memory[0:MEMORY_SIZE-1]; 
  initial begin: init 
  integer i; 
  for (i=0; i<MEMORY_SIZE; i=i+1) begin 
  memory[i] = 0; 
  end 
  data_out = DATA_INIT[DATA_WIDTH-1:0]; 
  valid_o = 1'b0; 
  end 
  assign data_count_out = data_count; 
  assign empty_o = ~|data_count; 
  assign full_o = &data_count; 
  always @(posedge clk_i) begin: fifo 
  valid_o <= 1'b0; 
  if (write_i && !full_o) begin 
  memory[write_pointer] <= data_in; 
  write_pointer <= write_pointer + WRITE_INC; 
  end 
  if (read_i && !empty_o) begin 
  valid_o <= 1'b1; 
  data_out <= memory[read_pointer]; 
  read_pointer <= read_pointer + READ_INC; 
  end 
  if (write_i && !read_i && !full_o) begin 
  data_count <= data_count + DATA_COUNT_INC; 
  end 
  else if (read_i && !write_i && !empty_o) begin 
  data_count <= data_count - DATA_COUNT_INC; 
  end 
  else begin 
  data_count <= data_count; 
  end 
  if (reset_i) begin 
  valid_o <= 1'b0; 
  data_out <= DATA_INIT[DATA_WIDTH-1:0]; 
  data_count <= 0; 
  read_pointer <= 0; 
  write_pointer <= 0; 
  end 
  end 
 endmodule