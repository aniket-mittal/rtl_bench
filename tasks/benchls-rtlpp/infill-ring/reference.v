module DFF(CK, D, Q, QN);
    input [0:0] CK;
    input [0:0] D;
    output [0:0] Q;
    output [0:0] QN;
    reg [0:0] Q;

    assign QN = ~Q;

    always @(posedge CK) begin
        Q <= D;
    end
endmodule

module Bit(input in, clock, load, output out);
  DFF dff1(in, clock, load, out);
endmodule

module ring(clk, q);
  input clk;
  output [3:0] q;

  wire [1:0] count;
  wire en = 1;

  // Bit counter (2-bit counter)
  reg [1:0] count_reg;
  always @ (posedge clk) begin
    count_reg <= count_reg + 1;
  end
  assign count = count_reg;

  // 2-to-4 line decoder with enable
  reg [3:0] y;
  always @ (*) begin
    y = 0;
    if (en == 1) begin
      case (count)
        0: y[3] = 1;
        1: y[2] = 1;
        2: y[1] = 1;
        3: y[0] = 1;
      endcase
    end
  end
  assign q = y;
endmodule