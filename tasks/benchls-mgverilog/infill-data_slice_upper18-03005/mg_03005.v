module mg_03005 (In1,Out1);
input signed [35:0] In1; 
  output signed [17:0] Out1; 
  wire signed [17:0] Data_Type_Conversion_out1; 
  [MASKED] 
  assign Out1 = Data_Type_Conversion_out1; 
 endmodule