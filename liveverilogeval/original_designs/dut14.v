

module dut
(
  output reg clk
);

  parameter PERIOD = 10;

  initial begin
    clk = 0;
  end


  always @(*) begin
    #(PERIOD / 2) clk = ~clk;
  end


endmodule

