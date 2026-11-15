module autovcoder_115064 (
    hard_reset,
    clk_2_b,
    refclk_b_in,
    scan_mode,
    rxpcs_rst,
    txpcs_rst,
    rxrst_int,
    txrst_int
);

  input hard_reset;
  input clk_2_b;
  input refclk_b_in;
  input scan_mode;
  input rxpcs_rst;
  input txpcs_rst;

  output rxrst_int;
  output txrst_int;

  reg txrst_sync1, txrst_sync2;
  reg rxrst_sync1, rxrst_sync2;
  wire txrst_int, rxrst_int;


  always @(posedge hard_reset or posedge clk_2_b) begin
    if (hard_reset) begin
      rxrst_sync2 <= 1'b1;
      rxrst_sync1 <= 1'b1;
    end else begin
      rxrst_sync2 <= #1 rxrst_sync1;
      rxrst_sync1 <= rxpcs_rst;
    end
  end

  always @(posedge hard_reset or posedge refclk_b_in) begin
    if (hard_reset) begin
      txrst_sync2 <= 1'b1;
      txrst_sync1 <= 1'b1;
    end else begin
      txrst_sync2 <= #1 txrst_sync1;
      txrst_sync1 <= txpcs_rst;
    end
  end

  // 06-14-02 BT Changed SCAN_SHIFT signal to SCAN_MODE
  //assign rxrst_int = !SCAN_SHIFT & rxrst_sync2;
  //assign txrst_int = !SCAN_SHIFT & txrst_sync2;
  assign rxrst_int = !scan_mode & rxrst_sync2;
  assign txrst_int = !scan_mode & txrst_sync2;

endmodule

