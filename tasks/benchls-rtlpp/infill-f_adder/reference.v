module full_adder(a, b, cin, s, cout);
  input a;
  input b;
  input cin;
  output s;
  output cout;

  wire a_xor_b;

  assign a_xor_b = a ^ b;
  assign s = a_xor_b ^ cin;
  assign cout = (a_xor_b & cin) | (a & b);
endmodule

module f_adder(LEDR, SW);
  input [7:0] SW;
  output [4:0] LEDR;

  wire carry1;
  wire carry2;
  wire carry3;

  full_adder fadd1(
    .a(SW[4]),
    .b(SW[0]),
    .cin(0),
    .s(LEDR[0]),
    .cout(carry1)
  );
  full_adder fadd2(
    .a(SW[5]),
    .b(SW[1]),
    .cin(carry1),
    .s(LEDR[1]),
    .cout(carry2)
  );
  full_adder fadd3(
    .a(SW[6]),
    .b(SW[2]),
    .cin(carry2),
    .s(LEDR[2]),
    .cout(carry3)
  );
  full_adder fadd4(
    .a(SW[7]),
    .b(SW[3]),
    .cin(carry3),
    .s(LEDR[3]),
    .cout(LEDR[4])
  );
endmodule