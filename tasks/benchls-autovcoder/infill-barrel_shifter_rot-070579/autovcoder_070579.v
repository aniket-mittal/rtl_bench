module autovcoder_070579 #(
    parameter SHIFT_WIDTH = 5,
    parameter DATA_WIDTH  = 32
) (
    input wire reset,
    input wire clk,
    input wire cke,

    input wire left,
    input wire rotation,
    input wire arithmetic,
    input wire shift_signed,

    input  wire [SHIFT_WIDTH-1:0] shift,
    input  wire [ DATA_WIDTH-1:0] din,
    output reg  [ DATA_WIDTH-1:0] dout
);

  wire        [SHIFT_WIDTH-1:0] ushift = shift;
  wire signed [SHIFT_WIDTH-1:0] sshift = shift;

  wire        [ DATA_WIDTH-1:0] udata = din;
  wire signed [ DATA_WIDTH-1:0] sdata = din;

  localparam ROT_NUM = ((1 << SHIFT_WIDTH) + DATA_WIDTH + (DATA_WIDTH - 1)) / DATA_WIDTH;
  localparam ROT_SHIFT = (ROT_NUM - 1) * DATA_WIDTH;

  [MASKED]

endmodule

