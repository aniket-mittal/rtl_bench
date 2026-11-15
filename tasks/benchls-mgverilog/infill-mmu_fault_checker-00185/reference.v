module mg_00185(input wire iPAGING_ENA,input wire iKERNEL_ACCESS,input wire [13:0] iMMU_FLAGS,output wire [2:0] oIRQ40,output wire [2:0] oIRQ41,output wire [2:0] oIRQ42);
function [2:0] func_mmu_flags_fault_check; 
  input func_paging; 
  input func_kernel; 
  input [5:0] func_mmu_flags; 
  begin 
  if(func_paging)begin 
  if(!func_mmu_flags[0])begin 
  func_mmu_flags_fault_check = 3'h1; 
  end 
  if(!func_mmu_flags[3])begin 
  func_mmu_flags_fault_check = 3'h4; 
  end 
  else begin 
  if(func_kernel)begin 
  func_mmu_flags_fault_check = 3'h0; 
  end 
  else begin 
  if(func_mmu_flags[5:4] != 2'h0)begin 
  func_mmu_flags_fault_check = 3'h0; 
  end 
  else begin 
  func_mmu_flags_fault_check = 3'h2; 
  end 
  end 
  end 
  end 
  else begin 
  func_mmu_flags_fault_check = 3'h0; 
  end 
  end 
  endfunction 
  assign {oIRQ42, oIRQ41, oIRQ40} = func_mmu_flags_fault_check(iPAGING_ENA, iKERNEL_ACCESS, iMMU_FLAGS[5:0]); 
 endmodule