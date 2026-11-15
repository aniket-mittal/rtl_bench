module xpm_counter_updn # (
  parameter integer               COUNTER_WIDTH        = 4,
  parameter integer               RESET_VALUE          = 0

) (
  input  wire                     rst,
  input  wire                     clk,
  input  wire                     cnt_en,
  input  wire                     cnt_up,
  input  wire                     cnt_down,
  output wire [COUNTER_WIDTH-1:0] count_value
);
  reg [COUNTER_WIDTH-1:0]          count_value_i = RESET_VALUE;
  assign count_value = count_value_i;
  [MASKED]
endmodule