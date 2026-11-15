module mg_03272 (IN0,IN1,CIN,COUT,SUM);
input IN0, IN1, CIN; 
  output COUT, SUM; 
  assign SUM = IN0^IN1^CIN; 
  [MASKED] 
 endmodule