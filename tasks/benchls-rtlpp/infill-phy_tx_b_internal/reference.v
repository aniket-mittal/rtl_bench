module phy_tx_b_internal(
  output wire out_b,
  output wire [7:0] out0_recir,
  output wire [7:0] out1_recir,
  output wire [7:8] out2_recir,
  output wire [7:8] out3_recir,
  output wire [7:0] valid_out_recir,

  input wire clk1f,
  input wire clk2f,
  input wire clk4f,
  input wire clk32f,
  input wire reset,
  input wire [7:0] in0,
  input wire [7:0] in1,
  input wire [7:0] in2,
  input wire [7:0] in3,
  input wire in_rx_tx,
  input wire [3:0] validmux41
);

reg [7:0] data_reg0, data_reg1, data_reg2, data_reg3;
reg valid_reg;

always @(posedge clk1f or posedge reset) begin
  if (reset) begin
    data_reg0 <= 8'b0;
    data_reg1 <= 8'b0;
    data_reg2 <= 8'b0;
    data_reg3 <= 8'b0;
    valid_reg <= 1'b0;
  end else begin
    if (in_rx_tx == 1'b1) begin
      data_reg0 <= in0;
      data_reg1 <= in1;
      data_reg2 <= in2;
      data_reg3 <= in3;
      valid_reg <= validmux41;
    end
  end
end

assign out_b = valid_reg;
assign out0_recir = data_reg0;
assign out1_recir = data_reg1;
assign out2_recir = data_reg2;
assign out3_recir = data_reg3;
assign valid_out_recir = valid_reg;

endmodule