module jesd204_phy_glue #(
  parameter WIDTH = 20,
  parameter CONST_WIDTH = 1,
  parameter NUM_OF_LANES = 1,
  parameter LANE_INVERT = 0
) (
  input  [WIDTH-1:0] in,
  output [WIDTH-1:0] out,
  output [CONST_WIDTH-1:0] const_out,
  output [NUM_OF_LANES-1:0] polinv
);

/* There really should be a standard component in Qsys that allows to do this */

  assign out = in;
  assign const_out = {CONST_WIDTH{1'b0}};
  assign polinv = LANE_INVERT[NUM_OF_LANES-1:0];

endmodule