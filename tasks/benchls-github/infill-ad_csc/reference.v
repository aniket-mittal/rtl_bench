module ad_csc #(

  parameter   DELAY_DW    = 16,
  parameter   MUL_COEF_DW = 17,
  parameter   SUM_COEF_DW = 24,
  parameter   YCbCr_2_RGB = 0
) (

  // data

  input                             clk,
  input        [   DELAY_DW-1:0]    sync,
  input        [           23:0]    data,

  // constants

  input signed [MUL_COEF_DW-1:0]    C1,
  input signed [MUL_COEF_DW-1:0]    C2,
  input signed [MUL_COEF_DW-1:0]    C3,
  input signed [SUM_COEF_DW-1:0]    C4,

  // sync is delay matched

  output       [   DELAY_DW-1:0]    csc_sync,
  output       [            7:0]    csc_data
);

  localparam PIXEL_WD = 9; // sign extended
  localparam MUL_DW = MUL_COEF_DW + PIXEL_WD -1;

  // internal wires

  reg  signed [        23:0]  data_d1;
  reg  signed [        23:0]  data_d2;
  reg  signed [    MUL_DW:0]  data_1;
  reg  signed [    MUL_DW:0]  data_2;
  reg  signed [    MUL_DW:0]  data_3;
  reg  signed [    MUL_DW:0]  s_data_1;
  reg  signed [    MUL_DW:0]  s_data_2;
  reg  signed [    MUL_DW:0]  s_data_3;
  reg         [DELAY_DW-1:0]  sync_1_m;
  reg         [DELAY_DW-1:0]  sync_2_m;
  reg         [DELAY_DW-1:0]  sync_3_m;
  reg         [DELAY_DW-1:0]  sync_4_m;
  reg         [         7:0]  csc_data_d;

  wire signed [8:0]  color1;
  wire signed [8:0]  color2;
  wire signed [8:0]  color3;

  // delay signals

  always @(posedge clk) begin
    data_d1 <= data;
    data_d2 <= data_d1;
    sync_1_m <= sync;
    sync_2_m <= sync_1_m;
    sync_3_m <= sync_2_m;
    sync_4_m <= sync_3_m;
  end

  assign color1 = {1'd0,    data[23:16]};
  assign color2 = {1'd0, data_d1[15: 8]};
  assign color3 = {1'd0, data_d2[ 7: 0]};

  // pipeline DSPs for multiplications and additions

  always @(posedge clk) begin
    data_1 <= color1 * C1;
    data_2 <= color2 * C2;
    data_3 <= color3 * C3;
  end

  always @(posedge clk) begin
    s_data_1 <= data_1 + C4;
    s_data_2 <= s_data_1 + data_2;
    s_data_3 <= s_data_2 + data_3;
  end

  generate
    // in RGB to YCbCr there are no overflows or underflows
    if (YCbCr_2_RGB) begin
      reg  [DELAY_DW-1:0]  sync_5_m;
      // output registers, output is unsigned (0 if sum is < 0) and saturated.
      // the inputs are expected to be 1.4.20 format (output is 8bits).

      always @(posedge clk) begin
        if (s_data_3[27] == 1'b1) begin
          csc_data_d <= 8'h0;
        end else if (s_data_3[26:24] != 3'b0) begin
          csc_data_d <= 8'hff;
        end else begin
          csc_data_d <= s_data_3[22:15];
        end
        sync_5_m <= sync_4_m;
      end
      assign csc_data = csc_data_d;
      assign csc_sync = sync_5_m;
    end else begin
      assign csc_data = s_data_3[23:16];
      assign csc_sync = sync_4_m;
    end
  endgenerate

endmodule