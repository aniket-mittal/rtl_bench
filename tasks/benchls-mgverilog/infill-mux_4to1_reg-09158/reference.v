module mg_09158 (input clk,input reset,input [1:0]sel,input [3:0]in,output reg out);
always @(posedge clk or posedge reset) 
  begin 
  if (reset) out <= 0; 
  else 
  begin 
  case (sel) 
  2'd0: out <= in[0]; 
  2'd1: out <= in[1]; 
  2'd2: out <= in[2]; 
  2'd3: out <= in[3]; 
  endcase 
  end 
  end 
 endmodule