module rtlpp_01394
(
  input  wire         reset,
  input  wire         clk,
  input  wire [7:0]   tx_byte,
  input  wire         tx_en,
  output reg          tx_busy,
  output reg          txd,
  input  wire         baud_lock,
  input  wire [15:0]  baud_rate
); 

  reg  [15:0]   tx_cnt_16b;
  reg  [3:0]    tx_bit_cnt;
  reg  [9:0]    tx_sr;
  reg           txd_loc;
  reg           tx_shift;
  reg           tx_now;
  reg           tx_en_p1;
  reg           baud_lock_p1;
  reg           send_lf;

  [MASKED] 

endmodule