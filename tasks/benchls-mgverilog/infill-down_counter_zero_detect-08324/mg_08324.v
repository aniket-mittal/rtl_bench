module mg_08324 (input Reset_n_i,input Clk_i,input Preset_i,input Enable_i,input[31:0] PresetVal_i,output Zero_o);
reg [31:0] Value; 
  [MASKED] 
  assign Zero_o = (Value == 0 ? 1'b1 : 1'b0); 
 endmodule