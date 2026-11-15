// Hidden tests: 5000 cycles of seeded random inputs (seed 3747526177); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 84;
  reg clk;
  reg [31:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_209013 dut (
    .instr(i_0),
    .over(i_1),
    .Gez(i_2),
    .NPCOp(out_dut[83:82]),
    .RFWr(out_dut[81:81]),
    .EXTOp(out_dut[80:80]),
    .ALUOp(out_dut[79:77]),
    .DMWr(out_dut[76:76]),
    .A3Sel(out_dut[75:74]),
    .WDSel(out_dut[73:72]),
    .DMSel(out_dut[71:71]),
    .BSel(out_dut[70:70]),
    .imm16(out_dut[69:54]),
    .addr26(out_dut[53:28]),
    .rs(out_dut[27:23]),
    .rt(out_dut[22:18]),
    .rd(out_dut[17:13]),
    .A3(out_dut[12:8]),
    .Tuse_rs(out_dut[7:6]),
    .Tuse_rt(out_dut[5:4]),
    .Tnew_E(out_dut[3:2]),
    .Tnew_M(out_dut[1:0])
  );
  origen_209013__ref ref_i (
    .instr(i_0),
    .over(i_1),
    .Gez(i_2),
    .NPCOp(out_ref[83:82]),
    .RFWr(out_ref[81:81]),
    .EXTOp(out_ref[80:80]),
    .ALUOp(out_ref[79:77]),
    .DMWr(out_ref[76:76]),
    .A3Sel(out_ref[75:74]),
    .WDSel(out_ref[73:72]),
    .DMSel(out_ref[71:71]),
    .BSel(out_ref[70:70]),
    .imm16(out_ref[69:54]),
    .addr26(out_ref[53:28]),
    .rs(out_ref[27:23]),
    .rt(out_ref[22:18]),
    .rd(out_ref[17:13]),
    .A3(out_ref[12:8]),
    .Tuse_rs(out_ref[7:6]),
    .Tuse_rt(out_ref[5:4]),
    .Tnew_E(out_ref[3:2]),
    .Tnew_M(out_ref[1:0])
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
    seed = 3747526177;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
