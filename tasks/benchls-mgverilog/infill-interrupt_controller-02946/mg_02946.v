module mg_02946(input clock,input IEN_d,input IOF_d,input RTI_d,input branch_d,input IRQ,input [11:0] PC,output reg branch_ISR,output reg [11:0] ISR_adr);
reg [11:0] return_adr; 
  reg IEN_reg; 
  reg IRQ_reg; 
  reg I; 
  initial begin 
  IEN_reg = 0; 
  return_adr = 0; 
  end 
  always @(posedge clock) begin 
  if (IEN_d == 1) 
  IEN_reg = 1; 
  if (IOF_d == 1) 
  IEN_reg = 0; 
  if (I == 1) begin 
  IEN_reg = 0; 
  return_adr = PC; 
  end 
  IRQ_reg = IRQ; 
  end 
  [MASKED] 
 endmodule