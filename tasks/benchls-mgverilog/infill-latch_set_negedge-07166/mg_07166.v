module mg_07166 (input wire Clock,input wire Reset,input wire Enable,input wire S,output reg Q);
reg Q_next; 
 always @ (negedge Clock) 
 begin 
  Q <= Q_next; 
 end 
 [MASKED] 
 endmodule