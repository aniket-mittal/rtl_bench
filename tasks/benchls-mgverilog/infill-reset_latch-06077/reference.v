module mg_06077 (RST, VAL);
input RST; 
 output VAL; 
 reg VAL; 
 always @ (RST or VAL) 
 begin 
 if (RST == 1) 
 VAL=1'b0; 
 end 
 endmodule