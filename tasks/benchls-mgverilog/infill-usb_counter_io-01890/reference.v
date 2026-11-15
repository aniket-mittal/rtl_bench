module mg_01890(input usb_clk,input usb_rst,input io_we,input [5:0] io_a,output reg [7:0] io_do);
reg [31:0] counter; 
 always @(posedge usb_clk) begin 
  if(usb_rst) begin 
  counter <= 32'd0; 
  io_do <= 8'd0; 
  end else begin 
  io_do <= 8'd0; 
  case(io_a) 
  6'h20: io_do <= counter[7:0]; 
  6'h21: io_do <= counter[15:8]; 
  6'h22: io_do <= counter[23:16]; 
  6'h23: io_do <= counter[31:24]; 
  endcase 
  if(io_we & ((io_a == 6'h20)|(io_a == 6'h21)|(io_a == 6'h22)|(io_a == 6'h23))) 
  counter <= 32'd0; 
  else 
  counter <= counter + 32'd1; 
  end 
 end 
 endmodule