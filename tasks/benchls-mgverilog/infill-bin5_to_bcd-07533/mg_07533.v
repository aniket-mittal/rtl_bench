module mg_07533(in, out);
input wire[4: 0] in; 
  output wire[5: 0] out; 
  reg[3: 0] lsb; 
  reg[1: 0] msb; 
  integer i; 
  [MASKED] 
  assign out = {msb, lsb}; 
 endmodule