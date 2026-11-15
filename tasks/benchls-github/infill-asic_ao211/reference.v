module asic_ao211 #(parameter PROP = "DEFAULT")  (
   input  a0,
   input  a1,
   input  b0,
   input  c0,
   output z
   );

   assign z = (a0 & a1) | b0 | c0;

endmodule