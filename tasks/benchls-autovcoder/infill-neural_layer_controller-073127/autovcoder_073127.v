module autovcoder_073127 #(
    parameter Nums_Pipeline_Stages = 4,
    parameter Pipeline_Tail = Nums_Pipeline_Stages - 1,
    parameter Weight_Nums = 4,
    parameter Output_Nums = 8,
    parameter Total_Computation_Steps_in_bits = 6,
    parameter Total_Computation_Steps = Weight_Nums * Output_Nums + Pipeline_Tail,
    parameter L0_Weight_Nums = 2,
    parameter L0_Input_Nums = 8,
    parameter L0_Output_Nums = 8,
    parameter L0_Computation_Steps_in_bits = 5,
    parameter L0_Computation_Steps = L0_Weight_Nums * L0_Output_Nums + Pipeline_Tail,
    parameter Loading_From_Mem_Cycles_Start_Overhead = 100,
    parameter LO_Weight_Loading_From_Mem_Cycles = Loading_From_Mem_Cycles_Start_Overhead + L0_Weight_Nums,
    parameter LO_Input_Loading_From_Mem_Cycles = Loading_From_Mem_Cycles_Start_Overhead + L0_Input_Nums,
    parameter LO_Output_Loading_From_Mem_Cycles = Loading_From_Mem_Cycles_Start_Overhead + L0_Output_Nums
) (
    clk,
    Computing_Signal,
    Computation_Step_Counter,
    L0_Computation_Step_Counter,
    L0_Weight_Loading_Counter,
    L0_Input_Loading_Counter,
    L0_Output_Loading_Counter,
    L0_Weight_Status,
    L0_Input_Status,
    L0_Output_Status
);

  input clk;
  input Computing_Signal;
  input [Total_Computation_Steps_in_bits - 1:0] Computation_Step_Counter;
  input [L0_Computation_Steps_in_bits - 1:0] L0_Computation_Step_Counter;
  input [10:0] L0_Weight_Loading_Counter, L0_Input_Loading_Counter, L0_Output_Loading_Counter;
  output reg [1:0] L0_Weight_Status, L0_Input_Status, L0_Output_Status;
  //L0 Status
  [MASKED]
endmodule

