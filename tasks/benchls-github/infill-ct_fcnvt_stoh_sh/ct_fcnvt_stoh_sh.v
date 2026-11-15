module ct_fcnvt_stoh_sh(
  stoh_sh_cnt,
  stoh_sh_f_v,
  stoh_sh_f_x,
  stoh_sh_src
);

// &Ports; @17
input   [7 :0]  stoh_sh_cnt; 
input   [22:0]  stoh_sh_src; 
output  [10:0]  stoh_sh_f_v; 
output  [24:0]  stoh_sh_f_x; 

// &Regs; @18
reg     [10:0]  stoh_sh_f_v; 
reg     [24:0]  stoh_sh_f_x; 

// &Wires; @19
wire    [7 :0]  stoh_sh_cnt; 
wire    [22:0]  stoh_sh_src; 



// &CombBeg; @22
[MASKED]


// &ModuleEnd; @80
endmodule