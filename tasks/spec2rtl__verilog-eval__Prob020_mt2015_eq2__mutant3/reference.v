module dut
(
  input [1:0] A,
  input [1:0] B,
  output z
);

  assign z = A[1:0] == { B[0], B[1] };

endmodule
