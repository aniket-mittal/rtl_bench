module mg_02056(iRST,iCLK,oRESET);
input iCLK; 
 input iRST; 
 output reg oRESET; 
 reg [27:0] Cont; 
 always@(posedge iCLK or negedge iRST) 
 begin 
  if(!iRST) 
  begin 
  oRESET <= 1'b0; 
  Cont <= 28'h0000000; 
  end 
  else 
  begin 
  if(Cont!=28'h4FFFFFF) 
  begin 
  Cont <= Cont+1; 
  oRESET <= 1'b0; 
  end 
  else 
  oRESET <= 1'b1; 
  end 
 end 
 endmodule