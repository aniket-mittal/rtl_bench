module mg_07231 (output oTD_Stable,input iTD_VS,input iTD_HS,input iRST_N);
reg NTSC; 
 reg PAL; 
 reg Pre_VS; 
 reg [7:0] Stable_Cont; 
 assign oTD_Stable = NTSC || PAL; 
 [MASKED] 
 endmodule