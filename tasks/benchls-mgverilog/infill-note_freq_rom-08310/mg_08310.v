module mg_08310(clk, note, adder);
input wire clk; 
 input wire [6:0] note; 
 output [31:0] adder; 
 (* romstyle = "logic" *) reg [31:0] table_values; 
 reg [4:0] addr_reg; 
 wire [3:0] diap = (note < 12) ? 4'd00 : 
  (note < 24) ? 4'd01 : 
  (note < 36) ? 4'd02 : 
  (note < 48) ? 4'd03 : 
  (note < 60) ? 4'd04 : 
  (note < 72) ? 4'd05 : 
  (note < 84) ? 4'd06 : 
  (note < 96) ? 4'd07 : 
  (note < 108) ? 4'd08 : 
  (note < 120) ? 4'd09 : 4'd010 ; 
 wire [6:0] c_addr = note - (diap * 4'd012); 
 wire [3:0] divider = 4'd010 - diap; 
 [MASKED] 
 assign adder = table_values >> divider; 
 endmodule