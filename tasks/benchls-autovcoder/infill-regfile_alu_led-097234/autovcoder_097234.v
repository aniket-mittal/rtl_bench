module autovcoder_097234 (
    input wire clk,
    input wire rstn,
    input wire [31:0] instr,
    output reg [7:0] led
);
  reg [31:0] regfile[63:0];
  reg [ 2:0] state;

  reg [31:0] rdata  [ 3:0];
  reg [31:0] wdata  [ 5:0];

  [MASKED]

  integer i;
  initial begin
    for (i = 0; i < 64; i = i + 1) begin
      regfile[i] <= i;
    end
  end
endmodule

