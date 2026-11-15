// Hidden tests: 5000 cycles of seeded random inputs (seed 1315748886); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 17;
  reg clk;
  reg [7:0] i_0;
  reg [3:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [3:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_056649 dut (
    .IR_opcode(i_0),
    .IR_oldopcode(i_1),
    .EXEC1(i_2),
    .EXEC2(i_3),
    .EXEC3(i_4),
    .EQ(i_5),
    .MI(i_6),
    .CMPFlag(i_7),
    .PC_sync_load(out_dut[16:16]),
    .PC_count_enable(out_dut[15:15]),
    .MUX1_select(out_dut[14:13]),
    .RAM_write_enable(out_dut[12:12]),
    .MUX2sel(out_dut[11:10]),
    .MUXLsel(out_dut[9:8]),
    .EXTRA1(out_dut[7:7]),
    .EXTRA2(out_dut[6:6]),
    .SpMux(out_dut[5:4]),
    .SP_Cnt(out_dut[3:2]),
    .pushpop(out_dut[1:1]),
    .ldnsel(out_dut[0:0])
  );
  origen_056649__ref ref_i (
    .IR_opcode(i_0),
    .IR_oldopcode(i_1),
    .EXEC1(i_2),
    .EXEC2(i_3),
    .EXEC3(i_4),
    .EQ(i_5),
    .MI(i_6),
    .CMPFlag(i_7),
    .PC_sync_load(out_ref[16:16]),
    .PC_count_enable(out_ref[15:15]),
    .MUX1_select(out_ref[14:13]),
    .RAM_write_enable(out_ref[12:12]),
    .MUX2sel(out_ref[11:10]),
    .MUXLsel(out_ref[9:8]),
    .EXTRA1(out_ref[7:7]),
    .EXTRA2(out_ref[6:6]),
    .SpMux(out_ref[5:4]),
    .SP_Cnt(out_ref[3:2]),
    .pushpop(out_ref[1:1]),
    .ldnsel(out_ref[0:0])
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
    seed = 1315748886;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
