module mg_05480(input clock,input [10:0] vcounter,input [11:0] hcounter,input [2:0] block,output [4:0] sel_row, sel_col,output reg [3:0] out);
parameter LEFT = 160; 
 parameter TOP = 0; 
 parameter MAXX = 320; 
 parameter MAXY = 480; 
 wire range; 
 assign range = hcounter >= LEFT && hcounter < LEFT+MAXX && vcounter >= TOP && vcounter < TOP+MAXY; 
 assign sel_col = (hcounter-LEFT)/32; 
 assign sel_row = (vcounter-TOP)/16; 
 reg rev; 
 always @(posedge clock) 
  rev <= ~rev; 
 [MASKED] 
 endmodule