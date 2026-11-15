module mg_10155 (input clk,input rst,input key1_press,input key2_press,input key3_press,input key4_press,output reg [1:0]game_status,input hit_wall,input hit_body,output reg die_flash,output reg restart);
localparam RESTART = 2'b00; 
  localparam START = 2'b01; 
  localparam PLAY = 2'b10; 
  localparam DIE = 2'b11; 
  reg[31:0]clk_cnt; 
  [MASKED] 
 endmodule