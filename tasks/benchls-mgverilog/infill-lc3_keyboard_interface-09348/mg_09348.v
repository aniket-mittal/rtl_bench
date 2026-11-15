module mg_09348(input clk,input reset,input LD_KBSR,input RD_KBDR,input [15:0] DATA,input [7:0] I_char,input LD_char,output reg[15:0] KBDR,output reg[15:0] KBSR,output KB_INT);
[MASKED] 
  assign KB_INT=KBSR[15]&KBSR[14]; 
 endmodule