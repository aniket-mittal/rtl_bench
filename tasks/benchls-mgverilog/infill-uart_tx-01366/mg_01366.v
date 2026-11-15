module mg_01366(input [7:0] RxD_par,input RxD_start,input RTS,input sys_clk,input BaudTick,output reg TxD_ser);
reg [3:0] state=0; 
  reg [7:0] RxD_buff=0; 
  [MASKED] 
  always @(posedge sys_clk) 
  begin 
  TxD_ser <= (state < 3) | (state[3] & RxD_buff[0]); 
  end 
 endmodule