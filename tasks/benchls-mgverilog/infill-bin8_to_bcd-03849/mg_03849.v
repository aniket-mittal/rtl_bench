module mg_03849 (input clk,input [7:0] count,input calculate,output reg [3:0] centenas,output reg [3:0] decenas,output reg [3:0] unidades,output reg C,output reg De,output reg U);
reg [7:0] digitT; 
  reg i; 
  initial 
  begin 
  digitT = 0; 
  C = 0; 
  De = 0; 
  U = 0; 
  centenas = 0; 
  decenas = 0; 
  unidades = 0; 
  i = 1; 
  end 
  [MASKED] 
 endmodule