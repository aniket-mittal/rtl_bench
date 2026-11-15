// Hidden tests: 5000 cycles of seeded random inputs (seed 872101491); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 104;
  reg clk;
  reg [0:0] i_0;
  reg [7:0] i_1;
  reg [7:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_200555 dut (
    .write_s(clk),
    .reset(i_0),
    .pico_out(i_1),
    .id_port(i_2),
    .seg(out_dut[103:96]),
    .min(out_dut[95:88]),
    .hora(out_dut[87:80]),
    .dia(out_dut[79:72]),
    .mes(out_dut[71:64]),
    .year(out_dut[63:56]),
    .seg_tim(out_dut[55:48]),
    .min_tim(out_dut[47:40]),
    .hora_tim(out_dut[39:32]),
    .swt(out_dut[31:24]),
    .flecha(out_dut[23:16]),
    .operacion(out_dut[15:8]),
    .agarre(out_dut[7:0])
  );
  origen_200555__ref ref_i (
    .write_s(clk),
    .reset(i_0),
    .pico_out(i_1),
    .id_port(i_2),
    .seg(out_ref[103:96]),
    .min(out_ref[95:88]),
    .hora(out_ref[87:80]),
    .dia(out_ref[79:72]),
    .mes(out_ref[71:64]),
    .year(out_ref[63:56]),
    .seg_tim(out_ref[55:48]),
    .min_tim(out_ref[47:40]),
    .hora_tim(out_ref[39:32]),
    .swt(out_ref[31:24]),
    .flecha(out_ref[23:16]),
    .operacion(out_ref[15:8]),
    .agarre(out_ref[7:0])
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
    seed = 872101491;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
