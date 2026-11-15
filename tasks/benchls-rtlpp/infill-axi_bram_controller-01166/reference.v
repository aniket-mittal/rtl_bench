module rtlpp_01166 (
  bram_addr,
  bram_clk,
  bram_rst,
  bram_din,
  bram_dout,
  bram_en,
  bram_we,
  addr,
  cache,
  cready,
  clk_memory,
  aresetn
);

output wire [12 : 0] bram_addr;
output wire bram_clk;
output wire bram_rst;
output wire [63 : 0] bram_din;
input wire [63 : 0] bram_dout;
output wire bram_en;
output wire [0 : 0] bram_we;
input wire [17 : 0] addr;
input wire [63 : 0] cache;
input wire cready;
input wire clk_memory;
input wire aresetn;

reg [12 : 0] bram_addr_reg;
reg bram_clk_reg;
reg bram_rst_reg;
reg [63 : 0] bram_din_reg;
reg bram_en_reg;
reg bram_we_reg;

assign bram_addr = bram_addr_reg;
assign bram_clk = bram_clk_reg;
assign bram_rst = bram_rst_reg;
assign bram_din = bram_din_reg;
assign bram_en = bram_en_reg;
assign bram_we = bram_we_reg;

always @(posedge clk_memory or negedge aresetn) begin
  if (!aresetn) begin
    bram_addr_reg <= 0;
    bram_clk_reg <= 0;
    bram_rst_reg <= 0;
    bram_din_reg <= 0;
    bram_en_reg <= 0;
    bram_we_reg <= 0;
  end else if (cready) begin
    bram_addr_reg <= addr[12:0];
    bram_clk_reg <= clk_memory;
    bram_rst_reg <= ~aresetn;
    bram_din_reg <= cache;
    bram_en_reg <= 1;
    bram_we_reg <= 1;
  end
end

endmodule