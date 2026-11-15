module rtlpp_07645
   (S_BSCAN_bscanid_en,
    S_BSCAN_capture,
    S_BSCAN_drck,
    S_BSCAN_reset,
    S_BSCAN_runtest,
    S_BSCAN_sel,
    S_BSCAN_shift,
    S_BSCAN_tck,
    S_BSCAN_tdi,
    S_BSCAN_tdo,
    S_BSCAN_tms,
    S_BSCAN_update,
    clk);
  input S_BSCAN_bscanid_en;
  input S_BSCAN_capture;
  input S_BSCAN_drck;
  input S_BSCAN_reset;
  input S_BSCAN_runtest;
  input S_BSCAN_sel;
  input S_BSCAN_shift;
  input S_BSCAN_tck;
  input S_BSCAN_tdi;
  output S_BSCAN_tdo;
  input S_BSCAN_tms;
  input S_BSCAN_update;
  input clk;

  wire S_BSCAN_1_BSCANID_EN;
  wire S_BSCAN_1_CAPTURE;
  wire S_BSCAN_1_DRCK;
  wire S_BSCAN_1_RESET;
  wire S_BSCAN_1_RUNTEST;
  wire S_BSCAN_1_SEL;
  wire S_BSCAN_1_SHIFT;
  wire S_BSCAN_1_TCK;
  wire S_BSCAN_1_TDI;
  wire S_BSCAN_1_TDO;
  wire S_BSCAN_1_TMS;
  wire S_BSCAN_1_UPDATE;
  wire clk_1;
  wire lut_buffer_m_bscan_BSCANID_EN;
  wire lut_buffer_m_bscan_CAPTURE;
  wire lut_buffer_m_bscan_DRCK;
  wire lut_buffer_m_bscan_RESET;
  wire lut_buffer_m_bscan_RUNTEST;
  wire lut_buffer_m_bscan_SEL;
  wire lut_buffer_m_bscan_SHIFT;
  wire lut_buffer_m_bscan_TCK;
  wire lut_buffer_m_bscan_TDI;
  wire lut_buffer_m_bscan_TDO;
  wire lut_buffer_m_bscan_TMS;
  wire lut_buffer_m_bscan_UPDATE;

  assign S_BSCAN_1_BSCANID_EN = S_BSCAN_bscanid_en;
  assign S_BSCAN_1_CAPTURE = S_BSCAN_capture;
  assign S_BSCAN_1_DRCK = S_BSCAN_drck;
  assign S_BSCAN_1_RESET = S_BSCAN_reset;
  assign S_BSCAN_1_RUNTEST = S_BSCAN_runtest;
  assign S_BSCAN_1_SEL = S_BSCAN_sel;
  assign S_BSCAN_1_SHIFT = S_BSCAN_shift;
  assign S_BSCAN_1_TCK = S_BSCAN_tck;
  assign S_BSCAN_1_TDI = S_BSCAN_tdi;
  assign S_BSCAN_1_TMS = S_BSCAN_tms;
  assign S_BSCAN_1_UPDATE = S_BSCAN_update;
  assign S_BSCAN_tdo = S_BSCAN_1_TDO;
  assign clk_1 = clk;

  // Logic for lut_buffer
  assign lut_buffer_m_bscan_BSCANID_EN = S_BSCAN_1_BSCANID_EN;
  assign lut_buffer_m_bscan_CAPTURE = S_BSCAN_1_CAPTURE;
  assign lut_buffer_m_bscan_DRCK = S_BSCAN_1_DRCK;
  assign lut_buffer_m_bscan_RESET = S_BSCAN_1_RESET;
  assign lut_buffer_m_bscan_RUNTEST = S_BSCAN_1_RUNTEST;
  assign lut_buffer_m_bscan_SEL = S_BSCAN_1_SEL;
  assign lut_buffer_m_bscan_SHIFT = S_BSCAN_1_SHIFT;
  assign lut_buffer_m_bscan_TCK = S_BSCAN_1_TCK;
  assign lut_buffer_m_bscan_TDI = S_BSCAN_1_TDI;
  assign S_BSCAN_1_TDO = lut_buffer_m_bscan_TDO;
  assign lut_buffer_m_bscan_TMS = S_BSCAN_1_TMS;
  assign lut_buffer_m_bscan_UPDATE = S_BSCAN_1_UPDATE;

  // Logic for xsdbm
  reg [1:0] state;
  reg TDO_reg;

  always @(posedge clk_1 or posedge lut_buffer_m_bscan_RESET) begin
    if (lut_buffer_m_bscan_RESET) begin
      state <= 2'b00;
    end else begin
      case (state)
        2'b00: if (lut_buffer_m_bscan_SEL) state <= 2'b01;
        2'b01: if (lut_buffer_m_bscan_SHIFT) state <= 2'b10;
        2'b10: if (!lut_buffer_m_bscan_SHIFT) state <= 2'b11;
        2'b11: state <= 2'b00;
      endcase
    end
  end

  always @(posedge clk_1) begin
    if (lut_buffer_m_bscan_SHIFT)
      TDO_reg <= lut_buffer_m_bscan_TDI;
  end

  assign lut_buffer_m_bscan_TDO = (state == 2'b10) ? lut_buffer_m_bscan_TDI : TDO_reg;

endmodule