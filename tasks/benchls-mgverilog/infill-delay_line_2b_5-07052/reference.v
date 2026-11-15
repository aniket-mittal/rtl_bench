module mg_07052 (datain, dataout, clk);
input[2 - 1:0] datain; 
  output[2 - 1:0] dataout; 
  wire[2 - 1:0] dataout; 
  input clk; 
  reg[2 - 1:0] buff0; 
  reg[2 - 1:0] buff1; 
  reg[2 - 1:0] buff2; 
  reg[2 - 1:0] buff3; 
  reg[2 - 1:0] buff4; 
  assign dataout = buff4 ; 
  always @(posedge clk) 
  begin 
  buff0 <= datain ; 
  buff1 <= buff0; 
  buff2 <= buff1; 
  buff3 <= buff2; 
  buff4 <= buff3; 
  end 
  endmodule