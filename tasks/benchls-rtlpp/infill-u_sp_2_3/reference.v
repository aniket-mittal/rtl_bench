module U_SP_2_3(IN1, IN2 , P0, P1, P2, P3);
  input [1:0] IN1;
  input [2:0] IN2;
  output [0:0] P0;
  output [1:0] P1;
  output [1:0] P2;
  output [0:0] P3;
  assign P0[0] = IN1[0]&IN2[0];
  assign P1[0] = IN1[0]&IN2[1];
  assign P2[0] = IN1[0]&IN2[2];
  assign P1[1] = IN1[1]&IN2[0];
  assign P2[1] = IN1[1]&IN2[1];
  assign P3[0] = IN1[1]&IN2[2];
endmodule