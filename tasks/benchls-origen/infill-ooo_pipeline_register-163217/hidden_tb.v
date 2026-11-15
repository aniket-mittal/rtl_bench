// Hidden tests: 5000 cycles of seeded random inputs (seed 2617679591); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 229;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [63:0] i_6;
  reg [0:0] i_7;
  reg [7:0] i_8;
  reg [0:0] i_9;
  reg [63:0] i_10;
  reg [0:0] i_11;
  reg [4:0] i_12;
  reg [4:0] i_13;
  reg [5:0] i_14;
  reg [7:0] i_15;
  reg [0:0] i_16;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_163217 dut (
    .i_Clk(clk),
    .i_Reset_n(i_0),
    .i_Flush(i_1),
    .i_Stall(i_2),
    .i_PC(i_3),
    .i_Value_Predicted(i_4),
    .i_Instruction(i_5),
    .i_ALU_Result(i_6),
    .i_Mem_Valid(i_7),
    .i_Mem_Mask(i_8),
    .i_Mem_Read_Write_n(i_9),
    .i_Mem_Write_Data(i_10),
    .i_Writes_Back(i_11),
    .i_VWrite_Addr(i_12),
    .i_PWrite_Addr(i_13),
    .i_Phys_Active_List_Index(i_14),
    .i_Checkpoint(i_15),
    .i_Is_Branch(i_16),
    .o_PC(out_dut[228:197]),
    .o_Value_Predicted(out_dut[196:196]),
    .o_Instruction(out_dut[195:164]),
    .o_ALU_Result(out_dut[163:100]),
    .o_Mem_Valid(out_dut[99:99]),
    .o_Mem_Mask(out_dut[98:91]),
    .o_Mem_Read_Write_n(out_dut[90:90]),
    .o_Mem_Write_Data(out_dut[89:26]),
    .o_Writes_Back(out_dut[25:25]),
    .o_VWrite_Addr(out_dut[24:20]),
    .o_PWrite_Addr(out_dut[19:15]),
    .o_Phys_Active_List_Index(out_dut[14:9]),
    .o_Checkpoint(out_dut[8:1]),
    .o_Is_Branch(out_dut[0:0])
  );
  origen_163217__ref ref_i (
    .i_Clk(clk),
    .i_Reset_n(i_0),
    .i_Flush(i_1),
    .i_Stall(i_2),
    .i_PC(i_3),
    .i_Value_Predicted(i_4),
    .i_Instruction(i_5),
    .i_ALU_Result(i_6),
    .i_Mem_Valid(i_7),
    .i_Mem_Mask(i_8),
    .i_Mem_Read_Write_n(i_9),
    .i_Mem_Write_Data(i_10),
    .i_Writes_Back(i_11),
    .i_VWrite_Addr(i_12),
    .i_PWrite_Addr(i_13),
    .i_Phys_Active_List_Index(i_14),
    .i_Checkpoint(i_15),
    .i_Is_Branch(i_16),
    .o_PC(out_ref[228:197]),
    .o_Value_Predicted(out_ref[196:196]),
    .o_Instruction(out_ref[195:164]),
    .o_ALU_Result(out_ref[163:100]),
    .o_Mem_Valid(out_ref[99:99]),
    .o_Mem_Mask(out_ref[98:91]),
    .o_Mem_Read_Write_n(out_ref[90:90]),
    .o_Mem_Write_Data(out_ref[89:26]),
    .o_Writes_Back(out_ref[25:25]),
    .o_VWrite_Addr(out_ref[24:20]),
    .o_PWrite_Addr(out_ref[19:15]),
    .o_Phys_Active_List_Index(out_ref[14:9]),
    .o_Checkpoint(out_ref[8:1]),
    .o_Is_Branch(out_ref[0:0])
  );

  task check;
    begin
      bad = 0;
      for (b = 0; b < OW; b = b + 1)
        if (out_ref[b] !== 1'bx && out_dut[b] !== out_ref[b]) bad = 1;
      if (bad) begin
        mismatches = mismatches + 1;
        if (shown < 10) begin
          $display("MISMATCH cycle %0d: expected=%h got=%h", c, out_ref, out_dut);
          shown = shown + 1;
        end
      end
    end
  endtask

  initial begin
    seed = 2617679591;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed), $random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed), $random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
