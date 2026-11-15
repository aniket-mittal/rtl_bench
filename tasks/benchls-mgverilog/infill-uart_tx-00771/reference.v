module mg_00771 (clk,tx_clk,reset,load,data,load_request,txd);
parameter START_BITS_PP = 1; 
  parameter DATA_BITS_PP = 8; 
  parameter STOP_BITS_PP = 1; 
  parameter CLOCK_FACTOR_PP = 16; 
  parameter TX_BIT_COUNT_BITS_PP = 4; 
  parameter m1_idle = 0; 
  parameter m1_waiting = 1; 
  parameter m1_sending = 3; 
  parameter m1_sending_last_bit = 2; 
  input clk; 
  input tx_clk; 
  input reset; 
  input load; 
  input[DATA_BITS_PP-1:0] data; 
  output load_request; 
  output txd; 
  reg load_request; 
  `define TOTAL_BITS START_BITS_PP + DATA_BITS_PP + STOP_BITS_PP 
  reg [`TOTAL_BITS-1:0] q; 
  reg [TX_BIT_COUNT_BITS_PP-1:0] tx_bit_count_l; 
  reg [3:0] prescaler_count_l; 
  reg [1:0] m1_state; 
  reg [1:0] m1_next_state; 
  wire [`TOTAL_BITS-1:0] tx_word = {{STOP_BITS_PP{1'b1}}, 
  data, 
  {START_BITS_PP{1'b0}}}; 
  wire begin_last_bit; 
  wire start_sending; 
  wire tx_clk_1x; 
  always @(posedge clk) 
  begin 
  if (reset) prescaler_count_l <= 0; 
  else if (tx_clk) 
  begin 
  if (prescaler_count_l == (CLOCK_FACTOR_PP-1)) prescaler_count_l <= 0; 
  else prescaler_count_l <= prescaler_count_l + 1; 
  end 
  end 
  assign tx_clk_1x = ((prescaler_count_l == (CLOCK_FACTOR_PP-1) ) && tx_clk); 
  always @(posedge clk) 
  begin 
  if (start_sending) tx_bit_count_l <= 0; 
  else if (tx_clk_1x) 
  begin 
  if (tx_bit_count_l == (`TOTAL_BITS-2)) tx_bit_count_l <= 0; 
  else tx_bit_count_l <= tx_bit_count_l + 1; 
  end 
  end 
  assign begin_last_bit = ((tx_bit_count_l == (`TOTAL_BITS-2) ) && tx_clk_1x); 
  assign start_sending = (tx_clk_1x && load); 
  always @(posedge clk) 
  begin : state_register 
  if (reset) m1_state <= m1_idle; 
  else m1_state <= m1_next_state; 
  end 
  always @(m1_state or tx_clk_1x or load or begin_last_bit) 
  begin : state_logic 
  load_request <= 0; 
  case (m1_state) 
  m1_idle : 
  begin 
  load_request <= tx_clk_1x; 
  if (tx_clk_1x && load) m1_next_state <= m1_sending; 
  else m1_next_state <= m1_idle; 
  end 
  m1_sending : 
  begin 
  if (begin_last_bit) m1_next_state <= m1_sending_last_bit; 
  else m1_next_state <= m1_sending; 
  end 
  m1_sending_last_bit : 
  begin 
  load_request <= tx_clk_1x; 
  if (load & tx_clk_1x) m1_next_state <= m1_sending; 
  else if (tx_clk_1x) m1_next_state <= m1_idle; 
  else m1_next_state <= m1_sending_last_bit; 
  end 
  default : 
  begin 
  m1_next_state <= m1_idle; 
  end 
  endcase 
  end 
  always @(posedge clk) 
  begin : txd_shifter 
  if (reset) q <= 0; 
  else if (start_sending) q <= ~tx_word; 
  else if (tx_clk_1x) q <= {1'b0,q[`TOTAL_BITS-1:1]}; 
  end 
  assign txd = ~q[0]; 
 endmodule