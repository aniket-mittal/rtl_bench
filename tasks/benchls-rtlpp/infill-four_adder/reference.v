module full_adds(a, b, c_ins, sums, c_outs);
  input a, b, c_ins;
  output sums, c_outs;

  assign sums = a ^ b ^ c_ins;
  assign c_outs = (a & b) | (c_ins & (a ^ b));
endmodule

module four_adder(A, B, c_in, c_out, sum);
  input [3:0] A;
  input [3:0] B;
  input c_in;
  output c_out;
  output [3:0] sum;

  wire c0, c1, c2;

  full_adds u0(
    .a(A[0]),
    .b(B[0]),
    .c_ins(c_in),
    .sums(sum[0]),
    .c_outs(c0)
  );

  full_adds u1(
    .a(A[1]),
    .b(B[1]),
    .c_ins(c0),
    .sums(sum[1]),
    .c_outs(c1)
  );

  full_adds u2(
    .a(A[2]),
    .b(B[2]),
    .c_ins(c1),
    .sums(sum[2]),
    .c_outs(c2)
  );

  full_adds u3(
    .a(A[3]),
    .b(B[3]),
    .c_ins(c2),
    .sums(sum[3]),
    .c_outs(c_out)
  );
endmodule