module mg_09299 (input clk,input clk28m,input [8:1] reg_address_in,input [11:0] data_in,input [5:0] select,input a1k,output reg [11:0] rgb);
parameter COLORBASE = 9'h180; 
 reg [11:0] colortable [31:0]; 
 wire [11:0] selcolor; 
 always @(posedge clk) 
  if (reg_address_in[8:6]==COLORBASE[8:6]) 
  colortable[reg_address_in[5:1]] <= data_in[11:0]; 
 assign selcolor = colortable[select[4:0]]; 
 always @(posedge clk28m) 
  if (select[5] && !a1k) 
  rgb <= {1'b0,selcolor[11:9],1'b0,selcolor[7:5],1'b0,selcolor[3:1]}; 
  else 
  rgb <= selcolor; 
 endmodule