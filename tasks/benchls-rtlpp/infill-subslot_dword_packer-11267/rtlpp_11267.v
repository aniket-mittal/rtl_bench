module rtlpp_11267 (
  input  wire         clk,
  input  wire         reset,
  input  wire         rx_byte_start,
  input  wire         rx_byte_stop,
  input  wire         rx_byte_rdy,
  input  wire [7:0]   rx_byte_d,
  output reg  [8:0]   subslot_ctrl
);

  reg [3:0]     byte_cnt;
  reg [31:0]    dword_sr;
  reg           rx_byte_rdy_p1;
  reg           rx_byte_rdy_p2;
  reg           rx_byte_rdy_p3;
  reg           rx_byte_stop_p1;
  reg           rx_byte_stop_p2;
  reg           rx_byte_stop_p3;

  [MASKED]

endmodule