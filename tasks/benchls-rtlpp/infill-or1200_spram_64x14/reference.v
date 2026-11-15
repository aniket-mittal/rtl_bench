module or1200_spram_64x14(
    input clk, input rst, input ce, input we, input oe, input [5:0] addr,
    input [20:0] di, output [20:0] doq
`ifdef OR1200_BIST
    , input mbist_si_i, output mbist_so_o, input [3:0] mbist_ctrl_i
`endif
);
  reg [20:0] ram [0:63];
  reg [5:0] addr_reg;
  
  always @(posedge clk) begin
    if (rst) begin
      addr_reg <= 6'b0;
    end else if (ce) begin
      if (we) ram[addr] <= di;
      addr_reg <= addr;
    end
  end
  
  assign doq = ram[addr_reg];
`ifdef OR1200_BIST
  // MBIST logic can be added here
`endif
endmodule