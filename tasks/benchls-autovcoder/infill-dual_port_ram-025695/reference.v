module autovcoder_025695 (
    clk,
    rst,
    readA_clkEn,
    readA_addr,
    readA_data,
    readB_clkEn,
    readB_addr,
    readB_data,
    writeA_clkEn,
    writeA_addr,
    writeA_data,
    writeB_clkEn,
    writeB_addr,
    writeB_data
);
`ifdef DCACHE_256K
  localparam ADDR_WIDTH = 6;
  localparam ADDR_COUNT = 64;
`else
  localparam ADDR_WIDTH = 5;
  localparam ADDR_COUNT = 32;
`endif

  input clk;
  input rst;
  input readA_clkEn;
  input [ADDR_WIDTH-1:0] readA_addr;
  output [35:0] readA_data;
  input readB_clkEn;
  input [ADDR_WIDTH-1:0] readB_addr;
  output [35:0] readB_data;
  input writeA_clkEn;
  input [ADDR_WIDTH-1:0] writeA_addr;
  input [35:0] writeA_data;
  input writeB_clkEn;
  input [ADDR_WIDTH-1:0] writeB_addr;
  input [35:0] writeB_data;

  reg [35:0] RAM[ADDR_COUNT-1:0];
  reg [ADDR_WIDTH-1:0] readA_addr_reg;
  reg [ADDR_WIDTH-1:0] readB_addr_reg;

  assign readA_data = RAM[readA_addr_reg];
  assign readB_data = RAM[readB_addr_reg];

  always @(posedge clk) begin
    readA_addr_reg <= readA_addr;
    readB_addr_reg <= readB_addr;
    if (writeA_clkEn) RAM[writeA_addr] <= writeA_data;
    if (writeB_clkEn) RAM[writeB_addr] <= writeB_data;
  end
endmodule

