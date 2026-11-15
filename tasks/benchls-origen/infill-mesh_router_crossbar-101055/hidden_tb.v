// Hidden tests: 5000 cycles of seeded random inputs (seed 1522434574); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 80;
  reg clk;
  reg [15:0] i_0;
  reg [15:0] i_1;
  reg [15:0] i_2;
  reg [15:0] i_3;
  reg [15:0] i_4;
  reg [2:0] i_5;
  reg [2:0] i_6;
  reg [2:0] i_7;
  reg [2:0] i_8;
  reg [2:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_101055 dut (
    .N_data_i(i_0),
    .S_data_i(i_1),
    .E_data_i(i_2),
    .W_data_i(i_3),
    .L_data_i(i_4),
    .N_port_select(i_5),
    .S_port_select(i_6),
    .E_port_select(i_7),
    .W_port_select(i_8),
    .L_port_select(i_9),
    .N_data_o(out_dut[79:64]),
    .S_data_o(out_dut[63:48]),
    .E_data_o(out_dut[47:32]),
    .W_data_o(out_dut[31:16]),
    .L_data_o(out_dut[15:0])
  );
  origen_101055__ref ref_i (
    .N_data_i(i_0),
    .S_data_i(i_1),
    .E_data_i(i_2),
    .W_data_i(i_3),
    .L_data_i(i_4),
    .N_port_select(i_5),
    .S_port_select(i_6),
    .E_port_select(i_7),
    .W_port_select(i_8),
    .L_port_select(i_9),
    .N_data_o(out_ref[79:64]),
    .S_data_o(out_ref[63:48]),
    .E_data_o(out_ref[47:32]),
    .W_data_o(out_ref[31:16]),
    .L_data_o(out_ref[15:0])
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
    seed = 1522434574;
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
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
