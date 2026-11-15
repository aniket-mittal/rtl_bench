module mg_06547(addr, cs0, cs1, cs2, cs3, cs4, cs5, cs6, cs7, cs_);
input [31:0] addr; 
  input cs_; 
  output cs0; 
  output cs1; 
  output cs2; 
  output cs3; 
  output cs4; 
  output cs5; 
  output cs6; 
  output cs7; 
 reg cs0 = 1; 
 reg cs1 = 1; 
 reg cs2 = 1; 
 reg cs3 = 1; 
 reg cs4 = 1; 
 reg cs5 = 1; 
 reg cs6 = 1; 
 reg cs7 = 1; 
 [MASKED] 
 endmodule