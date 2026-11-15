module ct_fcnvt_stod_sh(
  stod_sh_cnt,
  stod_sh_f_v,
  stod_sh_src
);

// &Ports; @23
input   [22:0]  stod_sh_src; 
output  [11:0]  stod_sh_cnt; 
output  [23:0]  stod_sh_f_v; 

// &Regs; @24
reg     [11:0]  stod_sh_cnt; 
reg     [23:0]  stod_sh_f_v; 

// &Wires; @25
wire    [22:0]  stod_sh_src; 


// &CombBeg; @27
[MASKED]


// &ModuleEnd; @129
endmodule