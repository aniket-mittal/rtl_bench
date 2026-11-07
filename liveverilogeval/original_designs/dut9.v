

module dut
(
  input [3:0] A,
  input [3:0] B,
  input Cin,
  output [3:0] Sum,
  output Cout
);

  wire [4:0] temp_sum;
  wire [3:0] corrected_sum;
  wire carry_out;
  assign temp_sum = A + B + Cin;
  assign carry_out = (temp_sum > 9)? 1 : 0;
  assign corrected_sum = (temp_sum > 9)? temp_sum + 4'b0110 : temp_sum;
  assign Sum = corrected_sum[3:0];
  assign Cout = carry_out;

endmodule

