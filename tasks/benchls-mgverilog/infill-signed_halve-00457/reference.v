module mg_00457 (In1,Out1);
input signed [35:0] In1; 
  output signed [35:0] Out1; 
  wire signed [35:0] Data_Type_Conversion_out1; 
  assign Data_Type_Conversion_out1 = {In1[35], In1[35:1]}; 
  assign Out1 = Data_Type_Conversion_out1; 
 endmodule