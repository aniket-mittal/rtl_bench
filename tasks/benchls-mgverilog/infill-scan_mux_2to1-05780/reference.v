module mg_05780 (S,CI,DI,O);
input S,CI,DI; 
 output O; 
 reg O; 
 always @* begin #0.1; O = (S) ? CI : DI; end 
 endmodule