// Hidden tests: 5000 cycles of seeded random inputs (seed 1611993097); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 38;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  reg [7:0] i_2;
  reg [7:0] i_3;
  reg [7:0] i_4;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_025952 dut (
    .reset(i_0),
    .pc(i_1),
    .inst(i_2),
    .resreg(i_3),
    .val_i(i_4),
    .val1(out_dut[37:30]),
    .val2(out_dut[29:22]),
    .wmem(out_dut[21:21]),
    .wmemaddr(out_dut[20:16]),
    .wresreg(out_dut[15:15]),
    .wpc(out_dut[14:14]),
    .pc_o(out_dut[13:6]),
    .rmem(out_dut[5:5]),
    .rmemaddr(out_dut[4:0])
  );
  origen_025952__ref ref_i (
    .reset(i_0),
    .pc(i_1),
    .inst(i_2),
    .resreg(i_3),
    .val_i(i_4),
    .val1(out_ref[37:30]),
    .val2(out_ref[29:22]),
    .wmem(out_ref[21:21]),
    .wmemaddr(out_ref[20:16]),
    .wresreg(out_ref[15:15]),
    .wpc(out_ref[14:14]),
    .pc_o(out_ref[13:6]),
    .rmem(out_ref[5:5]),
    .rmemaddr(out_ref[4:0])
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
    seed = 1611993097;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
