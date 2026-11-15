module mg_03122(input Reset,input Clock,input In,output [3:0] Out);
reg [3:0] Counter; 
 reg toggle; 
 [MASKED] 
 assign Out = Counter; 
 endmodule