module rtlpp_00076 (
  input wire clk,
  input wire rst,
  input wire clk0,
  input wire clk1,
  input wire clk2,
  input wire counter_we,
  input wire [31 : 0] counter_val,
  input wire [1 : 0] counter_ch,
  output wire counter0_OUT,
  output wire counter1_OUT,
  output wire counter2_OUT,
  output wire [31 : 0] counter_out
);

  reg [31:0] counter0, counter1, counter2;
  reg counter0_flag, counter1_flag, counter2_flag;
  
  [MASKED]
  
  assign counter0_OUT = counter0_flag;
  assign counter1_OUT = counter1_flag;
  assign counter2_OUT = counter2_flag;
  assign counter_out = (counter_ch == 2'b00) ? counter0 :
                       (counter_ch == 2'b01) ? counter1 :
                       (counter_ch == 2'b10) ? counter2 : 32'b0;
endmodule