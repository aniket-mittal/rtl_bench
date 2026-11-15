module asic_xor3 #(parameter PROP = "DEFAULT")  (
   input  a,
   input  b,
   input  c,
   output z
   );

   assign z =  a ^ b ^ c;

endmodule