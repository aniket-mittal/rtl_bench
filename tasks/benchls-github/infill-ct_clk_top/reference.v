module BUFGCE(
  I,
  CE,
  O
);

input  I;
input  CE ;
output O;

reg    clk_en_af_latch;
always @(I or CE)
begin
  if(!I)
    clk_en_af_latch <= CE;
end

reg clk_en ;
always @ (clk_en_af_latch )
begin
    clk_en <= clk_en_af_latch;
end
assign O = I && clk_en ;
   
endmodule

module ct_clk_top(
  biu_xx_dbg_wakeup,
  biu_xx_int_wakeup,
  biu_xx_normal_work,
  biu_xx_pmp_sel,
  biu_xx_snoop_vld,
  coreclk,
  cp0_xx_core_icg_en,
  forever_coreclk,
  had_xx_clk_en,
  pll_core_clk
);

// &Ports; @23
input        biu_xx_dbg_wakeup; 
input        biu_xx_int_wakeup; 
input        biu_xx_normal_work; 
input        biu_xx_pmp_sel;    
input        biu_xx_snoop_vld;  
input        cp0_xx_core_icg_en; 
input        had_xx_clk_en;     
input        pll_core_clk;      
output       coreclk;           
output       forever_coreclk;   

// &Regs; @24

// &Wires; @25
wire         biu_xx_dbg_wakeup; 
wire         biu_xx_int_wakeup; 
wire         biu_xx_normal_work; 
wire         biu_xx_pmp_sel;    
wire         biu_xx_snoop_vld;  
wire         core_clk_en;       
wire         cp0_xx_core_icg_en; 
wire         forever_coreclk;   
wire         had_xx_clk_en;     
wire         pll_core_clk;      


// &Force("output", "forever_coreclk"); @27

assign forever_coreclk = pll_core_clk;
//==============================================================================
//      global ICG for core 
//==============================================================================
assign core_clk_en = biu_xx_normal_work |
                     biu_xx_int_wakeup | 
                     biu_xx_dbg_wakeup | 
                     biu_xx_snoop_vld |
                     had_xx_clk_en | 
                     biu_xx_pmp_sel |
                     cp0_xx_core_icg_en ;
// &Force("nonport","core_clk_en"); @41
// &Force("output","coreclk"); @42
BUFGCE core_clk_buf
(.O   (coreclk),
 .I   (forever_coreclk),
 .CE  (core_clk_en)
);
// &Instance("gated_clk_cell", "x_core_gated_clk"); @49
// &Connect(.clk_in      (forever_coreclk     ), @50
//          .external_en (1'b0                ), @51
//          .global_en   (1'b1                ), @52
//          .module_en   (1'b0                ), @53
//          .local_en    (core_clk_en         ), @54
//          .clk_out     (coreclk             )); @55

// &ModuleEnd; @58
endmodule