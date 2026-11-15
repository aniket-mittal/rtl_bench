module mg_03776(input rst_n,input clk,input se0,output usb_rst);
reg[18:0] cntr; 
 assign usb_rst = cntr == 1'b0; 
 always @(posedge clk or negedge rst_n) begin 
  if (!rst_n) begin 
  cntr <= 1'b0; 
  end else begin 
  if (se0) begin 
  if (!usb_rst) 
  cntr <= cntr - 1'b1; 
  end else begin 
  cntr <= 19'd480000; 
  end 
  end 
 end 
 endmodule