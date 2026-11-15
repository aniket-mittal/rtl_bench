module mg_05665 (input CLK,input RESETn,input signalMask,input signalIn,input requestWR,input requestIn,output reg requestOut);
wire request = requestWR ? requestIn : 
  (signalMask & signalIn | requestOut); 
  [MASKED] 
 endmodule