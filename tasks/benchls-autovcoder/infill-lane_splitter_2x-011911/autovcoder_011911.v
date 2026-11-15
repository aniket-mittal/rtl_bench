module autovcoder_011911 (
    input clk_2f_c,
    input reset,
    input valid_in,
    input [31:0] Data_in,
    output reg valid_0_c,
    output reg [31:0] lane_0_c,
    output reg valid_1_c,
    output reg [31:0] lane_1_c
);
  reg contador;

  always @(*) begin
    if (reset == 0) begin
      valid_0_c <= 0;
      lane_0_c  <= 0;
      valid_1_c <= 0;
      lane_1_c  <= 0;
      contador  <= 0;
    end
  end

  [MASKED]
endmodule

