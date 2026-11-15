module mg_00165(sum, cout,oper1, oper2, cin);
input [3:0] oper1; 
 input [3:0] oper2; 
 input cin; 
 output [3:0] sum; 
 output cout; 
 wire [3:0] gen, prop; 
 wire [4:0] carry ; 
 assign carry[0] = cin; 
 assign gen[0] = oper1[0] & oper2[0] ; 
 assign prop[0] = oper1[0] | oper2[0] ; 
 assign sum[0] = oper1[0] ^ oper2[0] ^ carry[0] ; 
 assign carry[1] = ( carry[0] & prop[0] ) | gen[0] ; 
 assign gen[1] = oper1[1] & oper2[1] ; 
 assign prop[1] = oper1[1] | oper2[1] ; 
 assign sum[1] = oper1[1] ^ oper2[1] ^ carry[1] ; 
 assign carry[2] = ( carry[0] & prop[0] & prop[1] ) | 
  ( gen[0] & prop[1] ) | gen[1] ; 
 assign gen[2] = oper1[2] & oper2[2] ; 
 assign prop[2] = oper1[2] | oper2[2] ; 
 assign sum[2] = oper1[2] ^ oper2[2] ^ carry[2] ; 
 assign carry[3] = ( carry[0] & prop[0] & prop[1] & prop[2] ) | 
  ( gen[0] & prop[1] & prop[2] ) | 
  ( gen[1] & prop[2] ) | gen[2] ; 
 assign gen[3] = oper1[3] & oper2[3] ; 
 assign prop[3] = oper1[3] | oper2[3] ; 
 assign sum[3] = oper1[3] ^ oper2[3] ^ carry[3] ; 
 assign carry[4] = ( carry[0] & prop[0] & prop[1] & prop[2] & prop[3] ) | 
  ( gen[0] & prop[1] & prop[2] & prop[3] ) | 
  ( gen[1] & prop[2] & prop[3] ) | 
  ( gen[2] & prop[3] ) | 
  ( gen[3] ); 
 assign cout = carry[4]; 
 endmodule