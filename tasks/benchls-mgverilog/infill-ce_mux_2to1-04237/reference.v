module mg_04237 (output O,input I0, input I1,input S0, input S1,input CE0, input CE1,input IGNORE0, input IGNORE1);
parameter [0:0] INIT_OUT = 1'b0; 
  parameter [0:0] ZPRESELECT_I0 = 1'b0; 
  parameter [0:0] ZPRESELECT_I1 = 1'b0; 
  parameter [0:0] ZINV_CE0 = 1'b0; 
  parameter [0:0] ZINV_CE1 = 1'b0; 
  parameter [0:0] ZINV_S0 = 1'b0; 
  parameter [0:0] ZINV_S1 = 1'b0; 
  parameter [0:0] IS_IGNORE0_INVERTED = 1'b0; 
  parameter [0:0] IS_IGNORE1_INVERTED = 1'b0; 
  wire I0_internal = ((CE0 ^ !ZINV_CE0) ? I0 : INIT_OUT); 
  wire I1_internal = ((CE1 ^ !ZINV_CE1) ? I1 : INIT_OUT); 
  wire S0_true = (S0 ^ !ZINV_S0); 
  wire S1_true = (S1 ^ !ZINV_S1); 
  assign O = S0_true ? I0_internal : (S1_true ? I1_internal : INIT_OUT); 
 endmodule