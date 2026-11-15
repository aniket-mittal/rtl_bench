module synchronizer (
    input clk,
    input din,
    output dout,
    input reset_n
  );

  parameter depth = 2;
  reg [depth-1:0] sync_reg;

  [MASKED]

  assign dout = sync_reg[depth-1];

endmodule