module rtlpp_07847
   (clk,
    coeff_14,
    coeff_8,
    dx,
    dy,
    dz,
    frc_valid,
    fx,
    fy,
    fz,
    r2,
    term_0_14,
    term_0_8,
    term_1_14,
    term_1_8,
    term_valid);

  input clk;
  input [31:0] coeff_14;
  input [31:0] coeff_8;
  input [31:0] dx;
  input [31:0] dy;
  input [31:0] dz;
  output reg frc_valid;
  output reg [31:0] fx;
  output reg [31:0] fy;
  output reg [31:0] fz;
  input [31:0] r2;
  input [31:0] term_0_14;
  input [31:0] term_0_8;
  input [31:0] term_1_14;
  input [31:0] term_1_8;
  input term_valid;

  reg [31:0] MUL_ADD_TERM_14_m_axis_result_tdata;
  reg [31:0] MUL_ADD_TERM_8_m_axis_result_tdata;
  reg MUL_ADD_TERM_8_m_axis_result_tvalid;
  reg [31:0] MUL_COEFF_14_m_axis_result_tdata;
  reg MUL_COEFF_14_m_axis_result_tvalid;
  reg [31:0] MUL_COEFF_8_m_axis_result_tdata;
  reg MUL_COEFF_8_m_axis_result_tvalid;
  reg [31:0] MUL_FX1_m_axis_result_tdata;
  reg [31:0] MUL_FX2_m_axis_result_tdata;
  reg [31:0] MUL_FX_m_axis_result_tdata;
  reg MUL_FY_m_axis_result_tvalid;
  reg [31:0] SUB_BASE_FORCE_m_axis_result_tdata;
  reg SUB_BASE_FORCE_m_axis_result_tvalid;

  // Logic for MUL_ADD_TERM_14
  always @(posedge clk) begin
    if (term_valid) begin
      MUL_ADD_TERM_14_m_axis_result_tdata <= term_1_14 * r2 + term_0_14;
    end
  end

  // Logic for MUL_ADD_TERM_8
  always @(posedge clk) begin
    if (term_valid) begin
      MUL_ADD_TERM_8_m_axis_result_tdata <= term_1_8 * r2 + term_0_8;
      MUL_ADD_TERM_8_m_axis_result_tvalid <= term_valid;
    end
  end

  // Logic for MUL_COEFF_14
  always @(posedge clk) begin
    if (MUL_ADD_TERM_8_m_axis_result_tvalid) begin
      MUL_COEFF_14_m_axis_result_tdata <= coeff_14 * MUL_ADD_TERM_14_m_axis_result_tdata;
      MUL_COEFF_14_m_axis_result_tvalid <= 1;
    end else begin
      MUL_COEFF_14_m_axis_result_tvalid <= 0;
    end
  end

  // Logic for MUL_COEFF_8
  always @(posedge clk) begin
    if (MUL_ADD_TERM_8_m_axis_result_tvalid) begin
      MUL_COEFF_8_m_axis_result_tdata <= coeff_8 * MUL_ADD_TERM_8_m_axis_result_tdata;
      MUL_COEFF_8_m_axis_result_tvalid <= 1;
    end else begin
      MUL_COEFF_8_m_axis_result_tvalid <= 0;
    end
  end
  
  // Logic for SUB_BASE_FORCE
  always @(posedge clk) begin
    if (MUL_COEFF_14_m_axis_result_tvalid && MUL_COEFF_8_m_axis_result_tvalid) begin
      SUB_BASE_FORCE_m_axis_result_tdata <= MUL_COEFF_14_m_axis_result_tdata - MUL_COEFF_8_m_axis_result_tdata;
      SUB_BASE_FORCE_m_axis_result_tvalid <= 1;
    end else begin
      SUB_BASE_FORCE_m_axis_result_tvalid <= 0;
    end
  end

  // Logic for force multiplication
  always @(posedge clk) begin
    if (SUB_BASE_FORCE_m_axis_result_tvalid) begin
      MUL_FX_m_axis_result_tdata <= dx * SUB_BASE_FORCE_m_axis_result_tdata;
      MUL_FX1_m_axis_result_tdata <= dy * SUB_BASE_FORCE_m_axis_result_tdata;
      MUL_FX2_m_axis_result_tdata <= dz * SUB_BASE_FORCE_m_axis_result_tdata;
      frc_valid <= 1;
      fx <= MUL_FX_m_axis_result_tdata;
      fy <= MUL_FX1_m_axis_result_tdata;
      fz <= MUL_FX2_m_axis_result_tdata;
    end else begin
      frc_valid <= 0;
    end
  end

endmodule