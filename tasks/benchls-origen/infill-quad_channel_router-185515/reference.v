module origen_185515(
  input clk,
  input IDL,
  input [7:0] data_in0, data_in1, data_in2, data_in3,
  input valid0, valid1, valid2, valid3,
  output reg [7:0] L1_in0, L1_in1, L1_in2, L1_in3,
  output reg L1_valid0, L1_valid1, L1_valid2, L1_valid3,
  output reg [7:0] probador_in0, probador_in1, probador_in2, probador_in3,
  output reg probador_valid0, probador_valid1, probador_valid2, probador_valid3
);

always @(posedge clk) begin
  if (IDL == 0) begin
    L1_in0 <= 0;
    L1_in1 <= 0;
    L1_in2 <= 0;
    L1_in3 <= 0;
    L1_valid0 <= 0;
    L1_valid1 <= 0;
    L1_valid2 <= 0;
    L1_valid3 <= 0;
    probador_in0 <= data_in0;
    probador_in1 <= data_in1;
    probador_in2 <= data_in2;
    probador_in3 <= data_in3;
    probador_valid0 <= valid0;
    probador_valid1 <= valid1;
    probador_valid2 <= valid2;
    probador_valid3 <= valid3;
  end else begin
    L1_in0 <= data_in0;
    L1_in1 <= data_in1;
    L1_in2 <= data_in2;
    L1_in3 <= data_in3;
    L1_valid0 <= valid0;
    L1_valid1 <= valid1;
    L1_valid2 <= valid2;
    L1_valid3 <= valid3;
    probador_in0 <= 0;
    probador_in1 <= 0;
    probador_in2 <= 0;
    probador_in3 <= 0;
    probador_valid0 <= 0;
    probador_valid1 <= 0;
    probador_valid2 <= 0;
    probador_valid3 <= 0;
  end
end

endmodule