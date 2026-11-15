module mg_03823 (input [15:0] wdata,input wen,input [4:0] waddr,input wclk,output [15:0] rdata,input [4:0] raddr,input rclk);
reg [15:0] memory[0:31]; 
  reg [4:0] raddr_r; 
  always @(posedge wclk) begin 
  if(wen) begin 
  memory[waddr] <= wdata; 
  end 
  end 
  always @(posedge rclk) begin 
  raddr_r <= raddr; 
  end 
  assign rdata = memory[raddr_r]; 
 endmodule