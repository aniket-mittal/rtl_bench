module rtlpp_01503 (
      output reg [3:0] fill_level,
      input clk,
      input reset,
      output reg in_ready,
      input in_valid,
      input [36:0] in_data,
      input out_ready,
      output reg out_valid,
      output reg [36:0] out_data
);

   parameter DEPTH = 8;
   parameter DATA_WIDTH = 37;
   parameter ADDR_WIDTH = 3;

   reg [ADDR_WIDTH:0] wr_addr;
   reg [ADDR_WIDTH:0] rd_addr;
   reg [ADDR_WIDTH:0] next_wr_addr;
   reg [ADDR_WIDTH:0] next_rd_addr;
   reg [ADDR_WIDTH-1:0] mem_rd_addr;
   reg [DATA_WIDTH-1:0] mem[DEPTH-1:0];
   reg empty;
   reg full;

   [MASKED]

endmodule