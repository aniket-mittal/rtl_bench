module axi_hdmi_rx_tpm (
  input                   hdmi_clk,
  input                   hdmi_sof,
  input                   hdmi_de,
  input       [15:0]      hdmi_data,

  output  reg             hdmi_tpm_oos
);

  wire    [15:0]  hdmi_tpm_lr_data_s;
  wire            hdmi_tpm_lr_mismatch_s;
  wire    [15:0]  hdmi_tpm_fr_data_s;
  wire            hdmi_tpm_fr_mismatch_s;

  reg     [15:0]  hdmi_tpm_data = 'd0;
  reg             hdmi_tpm_lr_mismatch = 'd0;
  reg             hdmi_tpm_fr_mismatch = 'd0;

  // Limited range
  assign hdmi_tpm_lr_data_s[15:8] = (hdmi_tpm_data[15:8] < 8'h10) ? 8'h10 :
    ((hdmi_tpm_data[15:8] > 8'heb) ? 8'heb : hdmi_tpm_data[15:8]);
  assign hdmi_tpm_lr_data_s[ 7:0] = (hdmi_tpm_data[ 7:0] < 8'h10) ? 8'h10 :
    ((hdmi_tpm_data[ 7:0] > 8'heb) ? 8'heb : hdmi_tpm_data[ 7:0]);
  assign hdmi_tpm_lr_mismatch_s = (hdmi_tpm_lr_data_s == hdmi_data) ? 1'b0 : 1'b1;

  // Full range
  assign hdmi_tpm_fr_data_s[15:8] = (hdmi_tpm_data[15:8] < 8'h01) ? 8'h01 :
    ((hdmi_tpm_data[15:8] > 8'hfe) ? 8'hfe : hdmi_tpm_data[15:8]);
  assign hdmi_tpm_fr_data_s[ 7:0] = (hdmi_tpm_data[ 7:0] < 8'h01) ? 8'h01 :
    ((hdmi_tpm_data[ 7:0] > 8'hfe) ? 8'hfe : hdmi_tpm_data[ 7:0]);
  assign hdmi_tpm_fr_mismatch_s = (hdmi_tpm_fr_data_s == hdmi_data) ? 1'b0 : 1'b1;

  [MASKED]

endmodule