module dut
(
  input clk,
  input d,
  output reg q
);

  reg d_q;

  initial q = 1'hx;


  initial d_q = 1'hx;


  always @(posedge clk) begin
    d_q <= d;
    q <= d_q;
  end


endmodule
