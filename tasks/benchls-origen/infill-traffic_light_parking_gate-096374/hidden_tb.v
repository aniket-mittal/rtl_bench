// Hidden tests: 5000 cycles of seeded random inputs (seed 2452926647); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 108;
  reg clk;
  reg [7:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_096374 dut (
    .clk_2(clk),
    .SWI(i_0),
    .LED(out_dut[107:100]),
    .SEG(out_dut[99:92]),
    .lcd_a(out_dut[91:84]),
    .lcd_b(out_dut[83:76]),
    .lcd_instruction(out_dut[75:68]),
    .lcd_registrador(out_dut[67:60]),
    .lcd_pc(out_dut[59:52]),
    .lcd_SrcA(out_dut[51:44]),
    .lcd_SrcB(out_dut[43:36]),
    .lcd_ALUResult(out_dut[35:28]),
    .lcd_Result(out_dut[27:20]),
    .lcd_WriteData(out_dut[19:12]),
    .lcd_ReadData(out_dut[11:4]),
    .lcd_MemWrite(out_dut[3:3]),
    .lcd_Branch(out_dut[2:2]),
    .lcd_MemtoReg(out_dut[1:1]),
    .lcd_RegWrite(out_dut[0:0])
  );
  origen_096374__ref ref_i (
    .clk_2(clk),
    .SWI(i_0),
    .LED(out_ref[107:100]),
    .SEG(out_ref[99:92]),
    .lcd_a(out_ref[91:84]),
    .lcd_b(out_ref[83:76]),
    .lcd_instruction(out_ref[75:68]),
    .lcd_registrador(out_ref[67:60]),
    .lcd_pc(out_ref[59:52]),
    .lcd_SrcA(out_ref[51:44]),
    .lcd_SrcB(out_ref[43:36]),
    .lcd_ALUResult(out_ref[35:28]),
    .lcd_Result(out_ref[27:20]),
    .lcd_WriteData(out_ref[19:12]),
    .lcd_ReadData(out_ref[11:4]),
    .lcd_MemWrite(out_ref[3:3]),
    .lcd_Branch(out_ref[2:2]),
    .lcd_MemtoReg(out_ref[1:1]),
    .lcd_RegWrite(out_ref[0:0])
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
    seed = 2452926647;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
