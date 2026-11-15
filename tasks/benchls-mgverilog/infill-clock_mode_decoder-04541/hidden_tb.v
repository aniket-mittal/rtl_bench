// Hidden tests: 5000 cycles of seeded random inputs (seed 830972684); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 9;
  reg clk;
  reg [1:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_04541 dut (
    .funcion_conf(i_0),
    .cs_seg_hora(out_dut[8:8]),
    .cs_min_hora(out_dut[7:7]),
    .cs_hora_hora(out_dut[6:6]),
    .cs_dia_fecha(out_dut[5:5]),
    .cs_mes_fecha(out_dut[4:4]),
    .cs_jahr_fecha(out_dut[3:3]),
    .cs_seg_timer(out_dut[2:2]),
    .cs_min_timer(out_dut[1:1]),
    .cs_hora_timer(out_dut[0:0])
  );
  mg_04541__ref ref_i (
    .funcion_conf(i_0),
    .cs_seg_hora(out_ref[8:8]),
    .cs_min_hora(out_ref[7:7]),
    .cs_hora_hora(out_ref[6:6]),
    .cs_dia_fecha(out_ref[5:5]),
    .cs_mes_fecha(out_ref[4:4]),
    .cs_jahr_fecha(out_ref[3:3]),
    .cs_seg_timer(out_ref[2:2]),
    .cs_min_timer(out_ref[1:1]),
    .cs_hora_timer(out_ref[0:0])
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
    seed = 830972684;
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
