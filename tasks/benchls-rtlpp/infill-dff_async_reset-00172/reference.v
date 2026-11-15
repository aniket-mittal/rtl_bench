module rtlpp_00172(clk, reset_n, d, q);
  input clk;
  input d;
  input reset_n;
  output q;
  reg q;
  always @(posedge clk) begin
    if (reset_n == 1'b0)
      q <= 0;
    else
      q <= d;
  end
endmodule