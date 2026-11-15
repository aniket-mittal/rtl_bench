module mg_03940(clk_i,rst_i,ena_i,strobe_i,mask_i,pn_o);
parameter width = 16; 
  input clk_i; 
  input rst_i; 
  input ena_i; 
  input strobe_i; 
  input [width-1:0] mask_i; 
  output pn_o; 
  reg [width-1:0] shifter; 
  wire parity = ^(shifter & mask_i); 
  [MASKED] 
  assign pn_o = shifter[0]; 
 endmodule