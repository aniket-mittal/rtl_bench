module synchronizer (
    input clk,
    input din,
    output dout,
    input reset_n
  );

  parameter depth = 2;
  reg [depth-1:0] sync_reg;

  always @(posedge clk or negedge reset_n)
  begin
    if (!reset_n)
      sync_reg <= 0;
    else
      sync_reg <= {sync_reg[depth-2:0], din};
  end

  assign dout = sync_reg[depth-1];

endmodule