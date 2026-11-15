module mg_03450 (input clk,input inc,output reg [7:0] o);
initial o = 8'd0; 
  always @(posedge clk) if (inc) o <= o + 1; 
 endmodule