module ct_fcnvt_htos_sh(
  htos_sh_cnt,
  htos_sh_f_v,
  htos_sh_src
);

// &Ports; @23
input   [9 :0]  htos_sh_src; 
output  [5 :0]  htos_sh_cnt; 
output  [10:0]  htos_sh_f_v; 

// &Regs; @24
reg     [5 :0]  htos_sh_cnt; 
reg     [10:0]  htos_sh_f_v; 

// &Wires; @25
wire    [9 :0]  htos_sh_src; 


// &CombBeg; @27
[MASKED]


// &ModuleEnd; @77
endmodule