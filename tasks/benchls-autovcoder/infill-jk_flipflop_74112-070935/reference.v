module autovcoder_070935 (  // ref: 74??112
    input  pr1_b,   // pin: 4
    input  cl1_b,   // pin: 15
    input  clk1_b,  // pin: 1
    input  j1,      // pin: 3
    input  k1,      // pin: 2
    output q1,      // pin: 5
    output q1_b,    // pin: 6

    input  pr2_b,   // pin: 10
    input  cl2_b,   // pin: 14
    input  clk2_b,  // pin: 13
    input  j2,      // pin: 11
    input  k2,      // pin: 12
    output q2,      // pin: 9
    output q2_b     // pin: 7
);
  reg qq1 = 1'b0;
  reg qq2 = 1'b0;

  assign #20 q1   = qq1;
  assign #20 q1_b = ~qq1;

  always @(negedge clk1_b or negedge pr1_b or negedge cl1_b)
    if (!pr1_b) qq1 <= 1'b1;
    else if (!cl1_b) qq1 <= 1'b0;
    else if (!clk1_b)
      case ({
        j1, k1
      })
        2'b01: qq1 <= 1'b0;
        2'b10: qq1 <= 1'b1;
        2'b11: qq1 <= ~qq1;
      endcase

  assign #20 q2   = qq2;
  assign #20 q2_b = ~qq2;

  always @(negedge clk2_b or negedge pr2_b or negedge cl2_b)
    if (!pr2_b) qq2 <= 1'b1;
    else if (!cl2_b) qq2 <= 1'b0;
    else if (!clk2_b)
      case ({
        j2, k2
      })
        2'b01: qq2 <= 1'b0;
        2'b10: qq2 <= 1'b1;
        2'b11: qq2 <= ~qq2;
      endcase

endmodule

