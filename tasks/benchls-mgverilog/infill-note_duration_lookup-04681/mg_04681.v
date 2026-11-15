module mg_04681 (input [3:0] lookup, output [15:0] duration);
parameter 
  BREVE = 16'd48000, 
  SEMIBREVE = 16'd24000, 
  DOTTED_MINIM = 16'd18000, 
  MINIM = 16'd12000, 
  DOTTED_CROTCHET = 16'd9000, 
  CROTCHET = 16'd6000, 
  DOTTED_QUAVER = 16'd4500, 
  QUAVER = 16'd3000, 
  TUPLET = 16'd2000, 
  SEMIQUAVER = 16'd1500, 
  UNDEF = 16'd1000; 
  [MASKED] 
 endmodule