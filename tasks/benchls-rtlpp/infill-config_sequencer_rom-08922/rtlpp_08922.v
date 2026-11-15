module rtlpp_08922 (
  input wire clk,
  input wire resend,
  input wire advance,
  output wire [15:0] command,
  output reg finished
);

  reg [15:0] sreg;
  reg [7:0] address = 8'b0;

  assign command = sreg;

  always @(*) begin
    if (sreg == 16'hFFFF)
      finished = 1'b1;
    else
      finished = 1'b0;
  end

  [MASKED]

endmodule