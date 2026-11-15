module mg_05938(CLK, RESET, PB, DPB, SCEN, MCEN, CCEN);
input CLK, RESET; 
 input PB; 
 output DPB; 
 output SCEN, MCEN, CCEN; 
 parameter N_dc = 7; 
 (* fsm_encoding = "user" *) 
 reg [5:0] state; 
 reg [N_dc-1:0] debounce_count; 
 reg [3:0] MCEN_count; 
 assign {DPB, SCEN, MCEN, CCEN} = state[5:2]; 
 localparam 
  INI = 6'b000000, 
  W84 = 6'b000001, 
  SCEN_st = 6'b111100, 
  WS = 6'b100000, 
  MCEN_st = 6'b101100, 
  CCEN_st = 6'b100100, 
  MCEN_cont = 6'b101101, 
  CCR = 6'b100001, 
  WFCR = 6'b100010; 
 [MASKED] 
 endmodule