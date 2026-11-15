module asic_csa32 #(parameter PROP = "DEFAULT")
   (
     input  a,
     input  b,
     input  c,
     output sum,
     output carry
     );

   assign sum = a ^ b ^ c;
   assign carry = (a & b) | (b & c) | (c & a);

endmodule