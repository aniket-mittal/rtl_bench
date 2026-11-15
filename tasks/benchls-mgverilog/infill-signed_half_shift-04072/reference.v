module mg_04072 (In1,Out1);
input signed [31:0] In1; 
  output signed [31:0] Out1; 
  wire signed [31:0] Data_Type_Conversion_out1; 
  assign Data_Type_Conversion_out1 = {In1[31], In1[31:1]}; 
  assign Out1 = Data_Type_Conversion_out1; 
 endmodule