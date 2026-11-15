module autovcoder_091812 (
    Reg_Write,
    Mem_to_Reg,
    Mem_Write,
    Mem_Read,
    ALU_Src,
    Reg_Dst,
    ALU_Op,
    Read_Data1_Out,
    Read_Data2_Out,
    shift_amount_out,
    Sign_Ext_out,
    rs,
    rt,
    rd,
    func_field,
    control_signal,
    Read_Data1,
    Read_Data2,
    Sign_Ext,
    IF_Inst,
    clk
);  //control unit input 

  input wire [9:0] control_signal;
  input wire [31:0] Read_Data1, Read_Data2, Sign_Ext, IF_Inst;
  input wire clk;
  output reg Reg_Write, Mem_to_Reg, Mem_Write, Mem_Read, ALU_Src, Reg_Dst;
  output reg [3:0] ALU_Op;
  output reg [31:0] Read_Data1_Out, Read_Data2_Out, Sign_Ext_out;
  output reg [4:0] rs, rt, rd, shift_amount_out;
  output reg [5:0] func_field;

  [MASKED]
endmodule

