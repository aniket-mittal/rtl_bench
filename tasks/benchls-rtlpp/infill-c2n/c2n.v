module c2n (a, b, q);

   input a;			
   input b;			
   output q;			

   wire m;			
   
   [MASKED]
   or  U2 (q, m, a);
   
endmodule