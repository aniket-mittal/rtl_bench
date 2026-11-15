module mg_02433 (input clk,input rst,input rd,input wr,input [6:0] addr,input [15:0] data_in,output reg [15:0] data_out,output reg valid,input jtaglocked,input busy,input drdy,input eoc,input eos,input [4:0] channel,input [15:0] dout,output reg dwe,output reg den,output reg [6:0] daddr,output reg [15:0] din);
parameter [1:0] 
  IDLE = 2'b00, 
  WRITE = 2'b01, 
  READ = 2'b10; 
 reg [1:0] state; 
 initial begin 
  state <= IDLE; 
  din <= 16'h0000; 
  daddr <= 7'h00; 
  den <= 1'b0; 
  dwe <= 1'b0; 
  valid <= 1'b0; 
  data_out <= 16'h0000; 
 end 
 [MASKED] 
 endmodule