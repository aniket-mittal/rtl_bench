

module dut
(
  input [7:0] a,
  input [7:0] b,
  input cin,
  output [7:0] sum,
  output cout
);

  wire [8:0] c;

  dut_dependency_2
  FA0
  (
    .a(a[0]),
    .b(b[0]),
    .cin(cin),
    .sum(sum[0]),
    .cout(c[0])
  );


  dut_dependency_2
  FA1
  (
    .a(a[1]),
    .b(b[1]),
    .cin(c[0]),
    .sum(sum[1]),
    .cout(c[1])
  );


  dut_dependency_2
  FA2
  (
    .a(a[2]),
    .b(b[2]),
    .cin(c[1]),
    .sum(sum[2]),
    .cout(c[2])
  );


  dut_dependency_2
  FA3
  (
    .a(a[3]),
    .b(b[3]),
    .cin(c[2]),
    .sum(sum[3]),
    .cout(c[3])
  );


  dut_dependency_2
  FA4
  (
    .a(a[4]),
    .b(b[4]),
    .cin(c[3]),
    .sum(sum[4]),
    .cout(c[4])
  );


  dut_dependency_2
  FA5
  (
    .a(a[5]),
    .b(b[5]),
    .cin(c[4]),
    .sum(sum[5]),
    .cout(c[5])
  );


  dut_dependency_2
  FA6
  (
    .a(a[6]),
    .b(b[6]),
    .cin(c[5]),
    .sum(sum[6]),
    .cout(c[6])
  );


  dut_dependency_2
  FA7
  (
    .a(a[7]),
    .b(b[7]),
    .cin(c[6]),
    .sum(sum[7]),
    .cout(c[7])
  );

  assign cout = c[7];

endmodule



module dut_dependency_2
(
  input a,
  input b,
  input cin,
  output sum,
  output cout
);

  assign { cout, sum } = a + b + cin;

endmodule

