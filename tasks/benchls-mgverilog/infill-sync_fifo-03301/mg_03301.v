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
  [MASKED] 
 endmodule