module filtersIP_0(
  input clk,
  output done,
  input [1:0]filt_select,
  output [15:0]result,
  input rstn,
  input start,
  input [15:0]val
);
  // Filters IP dummy implementation
  assign done = 1'b0;
  assign result = 16'h0000;
endmodule