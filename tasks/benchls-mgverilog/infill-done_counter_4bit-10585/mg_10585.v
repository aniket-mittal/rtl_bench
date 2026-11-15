module mg_10585 (input wire clk,input wire rst_n,output wire done);
reg [3:0] counter; 
  [MASKED] 
  assign done = rst_n & (counter == 4'd15); 
 endmodule