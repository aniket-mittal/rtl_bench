module mg_04072 (In1,Out1);
input signed [31:0] In1; 
  output signed [31:0] Out1; 
  wire signed [31:0] Data_Type_Conversion_out1; 
  [MASKED] 
  assign Out1 = Data_Type_Conversion_out1; 
 endmodule