// Hidden tests: 5000 cycles of seeded random inputs (seed 605654202); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 200;
  reg clk;
  reg [17:0] i_0;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_113074 dut (
    .i_data(i_0),
    .o_data_9(out_dut[199:175]),
    .o_data_25(out_dut[174:150]),
    .o_data_43(out_dut[149:125]),
    .o_data_57(out_dut[124:100]),
    .o_data_70(out_dut[99:75]),
    .o_data_80(out_dut[74:50]),
    .o_data_87(out_dut[49:25]),
    .o_data_90(out_dut[24:0])
  );
  autovcoder_113074__ref ref_i (
    .i_data(i_0),
    .o_data_9(out_ref[199:175]),
    .o_data_25(out_ref[174:150]),
    .o_data_43(out_ref[149:125]),
    .o_data_57(out_ref[124:100]),
    .o_data_70(out_ref[99:75]),
    .o_data_80(out_ref[74:50]),
    .o_data_87(out_ref[49:25]),
    .o_data_90(out_ref[24:0])
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
    seed = 605654202;
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
