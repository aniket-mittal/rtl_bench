module rtlpp_00304
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

  reg PWM_wrap_0_AUD_PWM;
  reg PWM_wrap_0_AUD_SD;
  reg [11:0]PWM_wrap_0_monitor_audio_out;
  reg PWM_wrap_0_s_axis_data_tready1;
  wire aud_out_sel_1;
  reg [31:0]buff_fft_wrapper_0_audio_by1;
  reg buff_fft_wrapper_0_audio_vld1;
  reg [15:0]buff_fft_wrapper_0_m_axis_config_TDATA;
  reg buff_fft_wrapper_0_m_axis_config_TREADY;
  reg buff_fft_wrapper_0_m_axis_config_TVALID;
  reg [31:0]buff_fft_wrapper_0_m_axis_data_TDATA;
  reg buff_fft_wrapper_0_m_axis_data_TLAST;
  reg buff_fft_wrapper_0_m_axis_data_TREADY;
  reg buff_fft_wrapper_0_m_axis_data_TVALID;
  wire clk_0_1;
  wire miso_0_1;
  reg [15:0]pitch_correction_1_m_axis_config_TDATA;
  reg pitch_correction_1_m_axis_config_TREADY;
  reg pitch_correction_1_m_axis_config_TVALID;
  reg [31:0]pitch_correction_1_m_axis_data_TDATA;
  reg pitch_correction_1_m_axis_data_TLAST;
  reg pitch_correction_1_m_axis_data_TREADY;
  reg pitch_correction_1_m_axis_data_TVALID;
  reg [31:0]pitch_correction_1_monitor_fft_out;
  reg pitch_correction_1_monitor_fft_vld;
  reg [31:0]pitch_correction_1_monitor_pitch_out;
  reg pitch_correction_1_monitor_pitch_vld;
  wire pitch_enable_0_1;
  wire rst_0_1;
  wire select_0_1;
  reg spi_0_data_vld;
  reg [11:0]spi_0_monitor_audio_in;
  reg spi_0_sck;
  reg [11:0]spi_0_shifted_PCM_out;
  reg spi_0_ss;
  reg [11:0]spi_0_volume_out;
  reg [31:0]xfft_2_M_AXIS_DATA_TDATA;
  reg xfft_2_M_AXIS_DATA_TLAST;
  reg xfft_2_M_AXIS_DATA_TREADY;
  reg xfft_2_M_AXIS_DATA_TVALID;
  reg [31:0]xfft_3_m_axis_data_tdata;
  reg xfft_3_m_axis_data_tlast;
  reg xfft_3_m_axis_data_tvalid;

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

  // PWM_wrap_0 logic implementation
  always @(posedge clk_0_1) begin
    if (rst_0_1) begin
      PWM_wrap_0_AUD_SD <= 1'b0;
      PWM_wrap_0_AUD_PWM <= 1'b0;
    end else begin
      // Add internal logic for PWM_wrap_0
    end
  end

  // buff_fft_wrapper_0 logic implementation
  always @(posedge clk_0_1 or posedge rst_0_1) begin
    if (rst_0_1) begin
      buff_fft_wrapper_0_audio_by1 <= 32'd0;
      buff_fft_wrapper_0_audio_vld1 <= 1'b0;
      buff_fft_wrapper_0_m_axis_config_TDATA <= 16'd0;
      buff_fft_wrapper_0_m_axis_config_TREADY <= 1'b0;
      buff_fft_wrapper_0_m_axis_config_TVALID <= 1'b0;
      buff_fft_wrapper_0_m_axis_data_TDATA <= 32'd0;
      buff_fft_wrapper_0_m_axis_data_TLAST <= 1'b0;
      buff_fft_wrapper_0_m_axis_data_TREADY <= 1'b0;
      buff_fft_wrapper_0_m_axis_data_TVALID <= 1'b0;
    end else begin
      // Add internal logic for buff_fft_wrapper_0
    end
  end

  // pitch_correction_1 logic implementation
  always @(posedge clk_0_1 or posedge rst_0_1) begin
    if (rst_0_1) begin
      pitch_correction_1_m_axis_config_TDATA <= 16'd0;
      pitch_correction_1_m_axis_config_TREADY <= 1'b0;
      pitch_correction_1_m_axis_config_TVALID <= 1'b0;
      pitch_correction_1_m_axis_data_TDATA <= 32'd0;
      pitch_correction_1_m_axis_data_TLAST <= 1'b0;
      pitch_correction_1_m_axis_data_TREADY <= 1'b0;
      pitch_correction_1_m_axis_data_TVALID <= 1'b0;
      pitch_correction_1_monitor_fft_out <= 32'd0;
      pitch_correction_1_monitor_fft_vld <= 1'b0;
      pitch_correction_1_monitor_pitch_out <= 32'd0;
      pitch_correction_1_monitor_pitch_vld <= 1'b0;
    end else begin
      // Add internal logic for pitch_correction_1
    end
  end

  // spi_0 logic implementation
  always @(posedge clk_0_1 or posedge rst_0_1) begin
    if (rst_0_1) begin
      spi_0_data_vld <= 1'b0;
      spi_0_monitor_audio_in <= 12'd0;
      spi_0_sck <= 1'b0;
      spi_0_shifted_PCM_out <= 12'd0;
      spi_0_ss <= 1'b0;
      spi_0_volume_out <= 12'd0;
    end else begin
      // Add internal logic for spi_0
    end
  end

  // xfft_2 logic implementation
  always @(posedge clk_0_1 or posedge rst_0_1) begin
    if (rst_0_1) begin
      xfft_2_M_AXIS_DATA_TDATA <= 32'd0;
      xfft_2_M_AXIS_DATA_TLAST <= 1'b0;
      xfft_2_M_AXIS_DATA_TREADY <= 1'b0;
      xfft_2_M_AXIS_DATA_TVALID <= 1'b0;
    end else begin
      // Add internal logic for xfft_2
    end
  end

  // xfft_3 logic implementation
  always @(posedge clk_0_1 or posedge rst_0_1) begin
    if (rst_0_1) begin
      xfft_3_m_axis_data_tdata <= 32'd0;
      xfft_3_m_axis_data_tlast <= 1'b0;
      xfft_3_m_axis_data_tvalid <= 1'b0;
    end else begin
      // Add internal logic for xfft_3
    end
  end
endmodule