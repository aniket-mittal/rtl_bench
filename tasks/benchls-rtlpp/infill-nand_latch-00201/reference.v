module rtlpp_00201 (a0, a1, q);

   input a0, a1;		
   output q;			

   wire [2:0] m;		

   nand U1 (m[0], a0, a1);
   nand U2 (m[1], a0, q);
   nand U3 (m[2], a1, q);
   assign q = ~&m;
   
endmodule