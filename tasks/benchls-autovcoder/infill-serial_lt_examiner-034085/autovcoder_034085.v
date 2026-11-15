module autovcoder_034085 (
    input clk,
    input reset,
    input rd,
    input examine,
    input [7:0] lo_addr,
    input [7:0] hi_addr,
    output reg [7:0] data_out,
    output examine_latch
);

  reg [2:0] state = 3'b000;
  reg prev_rd = 1'b0;
  reg en_lt = 1'b0;

  [MASKED]
  assign examine_latch = en_lt;
endmodule

