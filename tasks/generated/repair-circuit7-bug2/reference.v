module dut
(
  input clk,
  input a,
  output reg q
);

  reg q_d;

  always @(posedge clk) begin
    q_d <= ~a;
    q <= q_d;
  end


endmodule
