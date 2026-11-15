module ct_hpcp_cntinten_reg(
  cntinten_wen_x,
  cntinten_x,
  cpurst_b,
  hpcp_clk,
  hpcp_wdata_x
);

// &Ports; @23
input        cntinten_wen_x; 
input        cpurst_b;      
input        hpcp_clk;      
input        hpcp_wdata_x;  
output       cntinten_x;    

// &Regs; @24
reg          cntinten_x;    

// &Wires @25
wire         cntinten_wen_x; 
wire         cpurst_b;      
wire         hpcp_clk;      
wire         hpcp_wdata_x;  


[MASKED]

// &Force("output","cntinten_x"); @37
// &ModuleEnd; @38
endmodule