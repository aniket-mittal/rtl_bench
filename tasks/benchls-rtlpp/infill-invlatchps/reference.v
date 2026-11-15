module InvLatchPS (g, d, pre, q);

input        g, pre;
input  [3:0] d;
output reg [3:0] q;

always @(g or d or pre) begin
  if (pre)
    q <= 4'b1111;
  else if (~g)
    q <= d;
end

endmodule