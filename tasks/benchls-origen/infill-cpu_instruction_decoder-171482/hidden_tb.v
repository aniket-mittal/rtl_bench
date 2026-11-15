// Hidden tests: 5000 cycles of seeded random inputs (seed 2020494812); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 20;
  reg clk;
  reg [15:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_171482 dut (
    .in(i_0),
    .RBData1_SL(out_dut[19:18]),
    .RBDataIn_SL(out_dut[17:16]),
    .ALUData_SL(out_dut[15:14]),
    .Seg_SL(out_dut[13:12]),
    .LED_SL(out_dut[11:10]),
    .RB_WE(out_dut[9:9]),
    .Seg_WE(out_dut[8:8]),
    .Led_WE(out_dut[7:7]),
    .DM_WE(out_dut[6:6]),
    .branch(out_dut[5:5]),
    .IMAdd_SL(out_dut[4:4]),
    .ALU_OP(out_dut[3:0])
  );
  origen_171482__ref ref_i (
    .in(i_0),
    .RBData1_SL(out_ref[19:18]),
    .RBDataIn_SL(out_ref[17:16]),
    .ALUData_SL(out_ref[15:14]),
    .Seg_SL(out_ref[13:12]),
    .LED_SL(out_ref[11:10]),
    .RB_WE(out_ref[9:9]),
    .Seg_WE(out_ref[8:8]),
    .Led_WE(out_ref[7:7]),
    .DM_WE(out_ref[6:6]),
    .branch(out_ref[5:5]),
    .IMAdd_SL(out_ref[4:4]),
    .ALU_OP(out_ref[3:0])
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
    seed = 2020494812;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
