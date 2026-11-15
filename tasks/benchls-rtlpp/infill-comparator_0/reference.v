module comparator_0(
   input [26:0] a,
   input [26:0] b,
   output c
);
  assign c = (a < b) ? 1'b1 : 1'b0;
endmodule