module dpram
#(parameter DATA_WIDTH = 8,
  parameter ADDRESS_WIDTH = 8) (
  input clock,
  input reset,

  input enable_a,
  input write_enable,
  input [ADDRESS_WIDTH-1:0] write_address,
  input [DATA_WIDTH-1:0] write_data,
  output reg [DATA_WIDTH-1:0] read_data_a,

  input enable_b,
  input [ADDRESS_WIDTH-1:0] read_address,
  output reg [DATA_WIDTH-1:0] read_data
);

  reg [DATA_WIDTH-1:0] memory [(1<<ADDRESS_WIDTH)-1:0];
  
  // integer i;

  [MASKED]

endmodule