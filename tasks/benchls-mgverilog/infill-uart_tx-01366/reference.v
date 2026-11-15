module mg_01366(input [7:0] RxD_par,input RxD_start,input RTS,input sys_clk,input BaudTick,output reg TxD_ser);
reg [3:0] state=0; 
  reg [7:0] RxD_buff=0; 
  always @(posedge sys_clk) 
  begin 
  if (RxD_start & state<2) begin 
  RxD_buff <= RxD_par; 
  end else if (state[3] & BaudTick) begin 
  RxD_buff <= (RxD_buff >> 1); 
  end 
  case(state) 
  4'b0000: if(RxD_start & RTS) state <= 4'b0010; 
  4'b0010: if(BaudTick) state <= 4'b0011; 
  4'b0011: if(BaudTick) state <= 4'b1000; 
  4'b1000: if(BaudTick) state <= 4'b1001; 
  4'b1001: if(BaudTick) state <= 4'b1010; 
  4'b1010: if(BaudTick) state <= 4'b1011; 
  4'b1011: if(BaudTick) state <= 4'b1100; 
  4'b1100: if(BaudTick) state <= 4'b1101; 
  4'b1101: if(BaudTick) state <= 4'b1110; 
  4'b1110: if(BaudTick) state <= 4'b1111; 
  4'b1111: if(BaudTick) state <= 4'b0001; 
  4'b0001: if(BaudTick) begin 
  if(RxD_start & RTS) begin 
  state <= 4'b0011; 
  end else begin 
  state <= 4'b0000; 
  end 
  end 
  default: if(BaudTick) state <= 4'b0000; 
  endcase 
  end 
  always @(posedge sys_clk) 
  begin 
  TxD_ser <= (state < 3) | (state[3] & RxD_buff[0]); 
  end 
 endmodule