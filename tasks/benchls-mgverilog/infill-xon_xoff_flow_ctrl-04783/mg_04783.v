module mg_04783 (input clk, input rst,input xon_rcvd, input xoff_rcvd, output reg inhibit_tx);
reg [15:0] state; 
  [MASKED] 
  always @(posedge clk) 
  inhibit_tx <= (state != 0); 
 endmodule