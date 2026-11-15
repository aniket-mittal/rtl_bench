module autovcoder_063522 (
    input clk,
    arst,
    input [31:0] din,  // bit 0 is sent first
    input din_valid,
    input din_slip,  // drop bit 0 of the current din
    output [32:0] dout,  // bit 0 is sent first
    output reg dout_valid
);

  reg  [63:0] storage;
  reg  [ 5:0] holding;

  // make it explicit that holding will never be greater than 32
  // to help synthesis with the shifter
  wire [63:0] aligned_din = holding[5] ? {din, 32'b0} : (din << holding[4:0]);

  [MASKED]

  assign dout = storage[32:0];

endmodule

