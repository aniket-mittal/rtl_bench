module rtlpp_00073 (
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
input wire [20 : 3] addr;
input wire [63 : 0] cache;
input wire cready;
input wire clk_memory;
input wire aresetn;

// Internal register and wire declarations
reg [12:0] bram_addr_reg;
reg bram_clk_reg;
reg bram_rst_reg;
reg [63:0] bram_din_reg;
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
    bram_addr_reg <= 13'b0;
    bram_clk_reg <= 1'b0;
    bram_rst_reg <= 1'b1; // Assuming reset is active high
    bram_din_reg <= 64'b0;
    bram_en_reg <= 1'b0;
    bram_we_reg <= 1'b0;
  end else begin
    bram_clk_reg <= clk_memory;
    bram_rst_reg <= 1'b0;
    if (cready) begin
      bram_addr_reg <= addr[20:8];
      bram_din_reg <= cache;
      bram_en_reg <= 1'b1;
      bram_we_reg <= 1'b1;
    end else begin
      bram_en_reg <= 1'b0;
      bram_we_reg <= 1'b0;
    end
  end
end

endmodule