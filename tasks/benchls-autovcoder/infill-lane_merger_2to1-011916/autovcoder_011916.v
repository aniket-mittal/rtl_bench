module autovcoder_011916 (
    input clk_2f_c,
    input reset,
    input valid_0,
    input [31:0] lane_0,
    input valid_1,
    input [31:0] lane_1,
    output reg valid_out_c,
    output reg [31:0] Data_out_c
);
  reg contador;

  always @(*) begin
    if (reset == 0) begin
      valid_out_c <= 0;
      Data_out_c <= 32'b0;
      contador <= 1;
    end
  end

  [MASKED]
endmodule

