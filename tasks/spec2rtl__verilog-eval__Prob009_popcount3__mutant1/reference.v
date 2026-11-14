module dut
(
  input [2:0] in,
  output [1:0] out
);

  wire [1:0] sum;
  assign sum = in[0] + in[1] + in[2];
  assign out = { sum[0], sum[1] };

endmodule
