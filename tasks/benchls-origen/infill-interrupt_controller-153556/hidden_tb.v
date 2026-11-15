// Hidden tests: 5000 cycles of seeded random inputs (seed 843692012); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 121;
  reg clk;
  reg [8:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_153556 dut (
    .selector(i_0),
    .CPC(out_dut[120:105]),
    .TVEC0(out_dut[104:89]),
    .TVEC1(out_dut[88:73]),
    .TVEC2(out_dut[72:57]),
    .TVEC3(out_dut[56:41]),
    .EPC(out_dut[40:25]),
    .GIE(out_dut[24:24]),
    .PGIE(out_dut[23:23]),
    .IE0(out_dut[22:22]),
    .IE1(out_dut[21:21]),
    .IE2(out_dut[20:20]),
    .IE3(out_dut[19:19]),
    .tvec(out_dut[18:3]),
    .int0_acc(out_dut[2:2]),
    .int1_acc(out_dut[1:1]),
    .int2_acc(out_dut[0:0])
  );
  origen_153556__ref ref_i (
    .selector(i_0),
    .CPC(out_ref[120:105]),
    .TVEC0(out_ref[104:89]),
    .TVEC1(out_ref[88:73]),
    .TVEC2(out_ref[72:57]),
    .TVEC3(out_ref[56:41]),
    .EPC(out_ref[40:25]),
    .GIE(out_ref[24:24]),
    .PGIE(out_ref[23:23]),
    .IE0(out_ref[22:22]),
    .IE1(out_ref[21:21]),
    .IE2(out_ref[20:20]),
    .IE3(out_ref[19:19]),
    .tvec(out_ref[18:3]),
    .int0_acc(out_ref[2:2]),
    .int1_acc(out_ref[1:1]),
    .int2_acc(out_ref[0:0])
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
    seed = 843692012;
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
