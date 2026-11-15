module rtlpp_05001
   (AUD_SD,
    MISO,
    PWM,
    aud_in_sel,
    aud_out_sel,
    clk,
    led,
    monitor_audio_in,
    monitor_audio_out,
    monitor_fft_out,
    monitor_fft_vld,
    monitor_pitch_out,
    monitor_pitch_vld,
    pitch_enable,
    rst,
    sck,
    ss);
  output AUD_SD;
  input MISO;
  output PWM;
  input aud_in_sel;
  input aud_out_sel;
  input clk;
  output [11:0]led;
  output [11:0]monitor_audio_in;
  output [11:0]monitor_audio_out;
  output [31:0]monitor_fft_out;
  output monitor_fft_vld;
  output [31:0]monitor_pitch_out;
  output monitor_pitch_vld;
  input pitch_enable;
  input rst;
  output sck;
  output ss;

  wire PWM_wrap_0_AUD_PWM;
  wire PWM_wrap_0_AUD_SD;
  wire [11:0]PWM_wrap_0_monitor_audio_out;
  wire PWM_wrap_0_s_axis_data_tready1;
  wire aud_out_sel_1;
  wire [31:0]buff_fft_wrapper_0_audio_by1;
  wire buff_fft_wrapper_0_audio_vld1;
  wire [15:0]buff_fft_wrapper_0_m_axis_config_TDATA;
  wire buff_fft_wrapper_0_m_axis_config_TREADY;
  wire buff_fft_wrapper_0_m_axis_config_TVALID;
  wire [31:0]buff_fft_wrapper_0_m_axis_data_TDATA;
  wire buff_fft_wrapper_0_m_axis_data_TLAST;
  wire buff_fft_wrapper_0_m_axis_data_TREADY;
  wire buff_fft_wrapper_0_m_axis_data_TVALID;
  wire clk_0_1;
  wire miso_0_1;
  wire [15:0]pitch_correction_1_m_axis_config_TDATA;
  wire pitch_correction_1_m_axis_config_TREADY;
  wire pitch_correction_1_m_axis_config_TVALID;
  wire [31:0]pitch_correction_1_m_axis_data_TDATA;
  wire pitch_correction_1_m_axis_data_TLAST;
  wire pitch_correction_1_m_axis_data_TREADY;
  wire pitch_correction_1_m_axis_data_TVALID;
  wire [31:0]pitch_correction_1_monitor_fft_out;
  wire pitch_correction_1_monitor_fft_vld;
  wire [31:0]pitch_correction_1_monitor_pitch_out;
  wire pitch_correction_1_monitor_pitch_vld;
  wire pitch_enable_0_1;
  wire rst_0_1;
  wire select_0_1;
  wire spi_0_data_vld;
  wire [11:0]spi_0_monitor_audio_in;
  wire spi_0_sck;
  wire [11:0]spi_0_shifted_PCM_out;
  wire spi_0_ss;
  wire [11:0]spi_0_volume_out;
  wire [31:0]xfft_2_M_AXIS_DATA_TDATA;
  wire xfft_2_M_AXIS_DATA_TLAST;
  wire xfft_2_M_AXIS_DATA_TREADY;
  wire xfft_2_M_AXIS_DATA_TVALID;
  wire [31:0]xfft_3_m_axis_data_tdata;
  wire xfft_3_m_axis_data_tlast;
  wire xfft_3_m_axis_data_tvalid;

  assign AUD_SD = PWM_wrap_0_AUD_SD;
  assign PWM = PWM_wrap_0_AUD_PWM;
  assign aud_out_sel_1 = aud_out_sel;
  assign clk_0_1 = clk;
  assign led[11:0] = spi_0_volume_out;
  assign miso_0_1 = MISO;
  assign monitor_audio_in[11:0] = spi_0_monitor_audio_in;
  assign monitor_audio_out[11:0] = PWM_wrap_0_monitor_audio_out;
  assign monitor_fft_out[31:0] = pitch_correction_1_monitor_fft_out;
  assign monitor_fft_vld = pitch_correction_1_monitor_fft_vld;
  assign monitor_pitch_out[31:0] = pitch_correction_1_monitor_pitch_out;
  assign monitor_pitch_vld = pitch_correction_1_monitor_pitch_vld;
  assign pitch_enable_0_1 = pitch_enable;
  assign rst_0_1 = rst;
  assign sck = spi_0_sck;
  assign select_0_1 = aud_in_sel;
  assign ss = spi_0_ss;

  // Embedded PWM_wrap_0 logic
  reg [31:0] audio_in_mux;
  reg [31:0] s_axis_data_tdata_mux;
  reg s_axis_data_tlast_mux;
  reg s_axis_data_tvalid_mux;
  assign PWM_wrap_0_AUD_SD = 1'b0;
  assign PWM = (audio_in_mux != 0);
  assign PWM_wrap_0_s_axis_data_tready1 = 1'b1;

  always @(*) begin
    if (aud_out_sel_1) begin
      audio_in_mux = buff_fft_wrapper_0_audio_by1;
      s_axis_data_tdata_mux = xfft_3_m_axis_data_tdata;
      s_axis_data_tlast_mux = xfft_3_m_axis_data_tlast;
      s_axis_data_tvalid_mux = xfft_3_m_axis_data_tvalid;
    end else begin
      audio_in_mux = 32'h0;
      s_axis_data_tdata_mux = 32'h0;
      s_axis_data_tlast_mux = 1'b0;
      s_axis_data_tvalid_mux = 1'b0;
    end
  end

  assign PWM_wrap_0_monitor_audio_out = audio_in_mux[11:0];

  // Embedded buff_fft_wrapper_0 logic
  assign buff_fft_wrapper_0_audio_by1 = {20'h0, spi_0_shifted_PCM_out};
  assign buff_fft_wrapper_0_audio_vld1 = spi_0_data_vld;
  assign buff_fft_wrapper_0_m_axis_config_TDATA = 16'h0;
  assign buff_fft_wrapper_0_m_axis_config_TREADY = buff_fft_wrapper_0_m_axis_config_TVALID;
  assign buff_fft_wrapper_0_m_axis_config_TVALID = 1'b1;
  assign buff_fft_wrapper_0_m_axis_data_TDATA = {16'h0, spi_0_shifted_PCM_out};
  assign buff_fft_wrapper_0_m_axis_data_TLAST = 1'b0;
  assign buff_fft_wrapper_0_m_axis_data_TREADY = 1'b1;
  assign buff_fft_wrapper_0_m_axis_data_TVALID = spi_0_data_vld;

  // Embedded pitch_correction_1 logic
  assign pitch_correction_1_monitor_fft_out = xfft_3_m_axis_data_tdata;
  assign pitch_correction_1_monitor_fft_vld = xfft_3_m_axis_data_tvalid;
  assign pitch_correction_1_monitor_pitch_out = xfft_3_m_axis_data_tdata;
  assign pitch_correction_1_monitor_pitch_vld = xfft_3_m_axis_data_tvalid;
  assign pitch_correction_1_m_axis_config_TDATA = 16'h0;
  assign pitch_correction_1_m_axis_config_TREADY = pitch_correction_1_m_axis_config_TVALID;
  assign pitch_correction_1_m_axis_config_TVALID = 1'b1;
  assign pitch_correction_1_m_axis_data_TDATA = xfft_2_M_AXIS_DATA_TDATA;
  assign pitch_correction_1_m_axis_data_TLAST = xfft_2_M_AXIS_DATA_TLAST;
  assign pitch_correction_1_m_axis_data_TREADY = xfft_2_M_AXIS_DATA_TVALID;
  assign pitch_correction_1_m_axis_data_TVALID = xfft_2_M_AXIS_DATA_TVALID;

  // Embedded spi_0 logic
  assign spi_0_sck = clk;
  assign spi_0_ss = ~select_0_1;
  assign spi_0_data_vld = 1'b1; // Assuming data is always valid
  assign spi_0_monitor_audio_in = 12'h0; // Assuming input audio to be zero
  assign spi_0_shifted_PCM_out = {8'h0, MISO}; // Mixing in the MISO signal
  assign spi_0_volume_out = 12'hFFF; // Full scale volume

  // Embedded xfft_2 logic
  assign xfft_2_M_AXIS_DATA_TDATA = {16'h0, spi_0_shifted_PCM_out};
  assign xfft_2_M_AXIS_DATA_TLAST = 1'b0;
  assign xfft_2_M_AXIS_DATA_TREADY = xfft_2_M_AXIS_DATA_TVALID;
  assign xfft_2_M_AXIS_DATA_TVALID = spi_0_data_vld;

  // Embedded xfft_3 logic
  assign xfft_3_m_axis_data_tdata = {16'h0, spi_0_shifted_PCM_out};
  assign xfft_3_m_axis_data_tlast = 1'b0;
  assign xfft_3_m_axis_data_tvalid = spi_0_data_vld;
endmodule