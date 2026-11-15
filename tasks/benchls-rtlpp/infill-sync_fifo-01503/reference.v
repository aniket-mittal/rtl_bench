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

   always @(posedge clk or posedge reset) begin
      if (reset) begin
         wr_addr <= 0;
         rd_addr <= 0;
         empty <= 1;
         full <= 0;
         out_valid <= 0;
         fill_level <= 0;
      end else begin
         if (in_ready && in_valid) begin
            mem[wr_addr[ADDR_WIDTH-1:0]] <= in_data;
            wr_addr <= next_wr_addr;
            empty <= 0;
            if (next_wr_addr == rd_addr)
               full <= 1;
         end

         if (out_ready && out_valid) begin
            rd_addr <= next_rd_addr;
            full <= 0;
            if (next_rd_addr == wr_addr) begin
               empty <= 1;
               out_valid <= 0;
            end else begin
               out_valid <= 1;
            end
         end

         if (out_ready && out_valid && in_ready && in_valid) begin
            full <= full; // Hold full and empty state if both read and write happen at the same time
            empty <= empty;
         end

         mem_rd_addr = rd_addr[ADDR_WIDTH-1:0];

         if (out_ready && out_valid)
            mem_rd_addr = next_rd_addr[ADDR_WIDTH-1:0];

         out_data <= mem[mem_rd_addr];
         out_valid <= !empty;

         in_ready <= !full;

         next_wr_addr <= wr_addr + 1;
         next_rd_addr <= rd_addr + 1;

         if (full)
            fill_level <= DEPTH;
         else
            fill_level <= wr_addr - rd_addr;
      end
   end

endmodule