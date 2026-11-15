module mg_02674(input clk, input d, output q, input rst);
reg down; 
 assign q = d & !down; 
 [MASKED] 
 endmodule