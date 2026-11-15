module mg_09515 (input [(16 - 1):0] input_port,output [(16 - 1):0] output_port,input clk,input ce,input clr);
wire [(16 - 1):0] input_port_1_40; 
  wire signed [(16 - 1):0] output_port_5_5_force; 
  [MASKED] 
  assign output_port = output_port_5_5_force; 
 endmodule