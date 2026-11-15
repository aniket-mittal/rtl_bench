module mg_10033 (input wire clk_in,input wire rst_in,input wire sig_in,output reg sig_debounced_out);
parameter NDELAY = 25000000; 
  parameter NBITS = 26; 
  reg [NBITS-1:0] count0; 
  reg [NBITS-1:0] count1; 
  reg xnew0; 
  reg xnew1; 
  reg toggle0; 
  reg toggle1; 
  wire RST_in; 
  wire cnt_done0; 
  wire cnt_done1; 
  assign RST_in = rst_in; 
  assign cnt_done0 = (count0 == NDELAY); 
  always @(posedge clk_in or posedge RST_in) begin 
  if (RST_in) count0 <= 0; 
  else if (sig_in != xnew0) count0 <= 0; 
  else count0 <= count0 + 1; 
  end 
  always @(posedge clk_in or posedge RST_in) begin 
  if (RST_in) xnew0 <= sig_in; 
  else if (sig_in != xnew0) xnew0 <= sig_in; 
  else xnew0 <= xnew0; 
  end 
  always @(posedge clk_in or posedge RST_in) begin 
  if (RST_in) toggle0 <= 0; 
  else if (xnew0) toggle0 <= 1; 
  else if (cnt_done0) toggle0 <= 0; 
  else toggle0 <= toggle0; 
  end 
  always @(posedge clk_in or posedge RST_in) begin 
  if (RST_in) sig_debounced_out <= sig_in; 
  else if (cnt_done0 & toggle0 & sig_in) sig_debounced_out <= 1; 
  else sig_debounced_out <= 0; 
  end 
 endmodule