module mg_03892 (input wire clk,input wire rst,input wire [3:0] AD,input wire [7:0] DI,output reg [7:0] DO,input wire rw,input wire cs,output wire irq,input wire clk_in,output reg [7:0] leds,output reg [7:0] led7hi,output reg [7:0] led7lo,output reg [2:0] rgb1,output reg [2:0] rgb2,input wire [3:0] switches,input wire [3:0] keys);
reg [23:0] timer_cnt; 
  reg [23:0] timer_prescaler; 
  reg [7:0] timer_mode; 
  reg timer_eq_flag; 
  assign irq = timer_mode[7] & timer_mode[6]; 
  always @ (posedge clk_in) begin 
  if (rst) begin 
  timer_cnt <= 0; 
  timer_eq_flag <= 0; 
  end else begin 
  if (timer_mode[0]) begin 
  if (timer_cnt == timer_prescaler) begin 
  timer_eq_flag <= 1; 
  timer_cnt <= 0; 
  end else begin 
  timer_cnt <= timer_cnt + 1'b1; 
  if (timer_mode[7]) timer_eq_flag <= 0; 
  end 
  end 
  end 
  end 
  [MASKED] 
 endmodule