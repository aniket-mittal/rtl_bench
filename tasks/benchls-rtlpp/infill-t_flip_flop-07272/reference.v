module rtlpp_07272(t,clock,reset,q);
  input t, clock, reset;
  output reg q;

  always @(negedge clock or negedge reset) begin 
    if (!reset)
      q <= 0;
    else 
      case (t)
        0: q <= q;
        1: q <= ~q;
      endcase
  end
endmodule