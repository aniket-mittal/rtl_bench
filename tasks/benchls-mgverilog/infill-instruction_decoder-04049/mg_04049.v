module mg_04049(input[31:0] insn, output[3:0] idxZ, idxX, output reg[3:0] idxY,output reg signed[31:0] valI, output reg[3:0] op,output[1:0] kind, output storing, loading, deref_rhs, branching);
wire [19:0] tI; 
  wire [1:0] dd; 
  assign {kind, dd, idxZ, idxX, tI} = insn; 
  [MASKED] 
  assign storing = ^dd; 
  assign loading = &dd; 
  assign deref_rhs = dd[0]; 
  assign branching = &idxZ & ~storing; 
 endmodule