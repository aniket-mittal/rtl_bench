module rtlpp_00119 (g, d, q);

input  g, d;
output reg q;

always @(g or d) begin
  if (g)
    q <= d;
end

endmodule