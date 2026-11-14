module dut
(
  input a,
  input b,
  input cin,
  output cout,
  output sum
);

  assign { cout, sum } = a + a + cin;

endmodule
