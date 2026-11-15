module mg_02643 (clk ,nrst ,hd_a ,hd_b ,start ,vin ,vout ,dout);
input clk ; 
 input nrst ; 
 input hd_a ; 
 input hd_b ; 
 input start ; 
 input vin ; 
 output vout ; 
 output [7:0] dout ; 
 reg [7:2] tmpd ; 
 reg [1:0] cnt ; 
 wire [1:0] data_2b ; 
 assign data_2b = {hd_a, hd_b} ; 
 [MASKED] 
 always @ (posedge clk or negedge nrst) 
  if (~nrst) 
  cnt <= 0 ; 
  else if (start) 
  cnt <= 0 ; 
  else if (vin) 
  cnt <= cnt +1 ; 
 assign vout = vin & (cnt == 3) ; 
 assign dout = {tmpd, data_2b} ; 
 endmodule