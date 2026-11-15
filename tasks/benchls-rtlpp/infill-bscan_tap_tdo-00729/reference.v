module rtlpp_00729 (
  input wire clk,
  input wire S_BSCAN_bscanid_en,
  input wire S_BSCAN_capture,
  input wire S_BSCAN_drck,
  input wire S_BSCAN_reset,
  input wire S_BSCAN_runtest,
  input wire S_BSCAN_sel,
  input wire S_BSCAN_shift,
  input wire S_BSCAN_tck,
  input wire S_BSCAN_tdi,
  output wire S_BSCAN_tdo,
  input wire S_BSCAN_tms,
  input wire S_BSCAN_update
);

  // Internal signals to replace the functionality of the 'bd_a493' module
  // (Exact replacement logic is needed here, assuming basic operations as an example)

  reg tdo_reg;
  assign S_BSCAN_tdo = tdo_reg;

  always @(posedge clk) begin
    if (S_BSCAN_reset) begin
      tdo_reg <= 0;
    end else if (S_BSCAN_capture) begin
      tdo_reg <= S_BSCAN_tdi;
    end else if (S_BSCAN_shift) begin
      tdo_reg <= ~tdo_reg;
    end else if (S_BSCAN_update) begin
      tdo_reg <= S_BSCAN_tdi & S_BSCAN_tms;
    end
  end

endmodule