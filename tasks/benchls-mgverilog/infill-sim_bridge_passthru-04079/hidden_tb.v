// Hidden tests: 5000 cycles of seeded random inputs (seed 472959502); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 253;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [31:0] i_10;
  reg [31:0] i_11;
  reg [31:0] i_12;
  reg [27:0] i_13;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  mg_04079 dut (
    .clk(clk),
    .rst(i_0),
    .i_sim_in_reset(i_1),
    .i_sim_in_ready(i_2),
    .i_sim_in_command(i_3),
    .i_sim_in_address(i_4),
    .i_sim_in_data(i_5),
    .i_sim_in_data_count(i_6),
    .i_sim_out_ready(i_7),
    .i_master_ready(i_8),
    .i_oh_en(i_9),
    .i_out_status(i_10),
    .i_out_address(i_11),
    .i_out_data(i_12),
    .i_out_data_count(i_13),
    .o_sim_master_ready(out_dut[252:252]),
    .o_sim_out_en(out_dut[251:251]),
    .o_sim_out_status(out_dut[250:219]),
    .o_sim_out_address(out_dut[218:187]),
    .o_sim_out_data(out_dut[186:155]),
    .o_sim_out_data_count(out_dut[154:127]),
    .o_ih_reset(out_dut[126:126]),
    .o_ih_ready(out_dut[125:125]),
    .o_in_command(out_dut[124:93]),
    .o_in_address(out_dut[92:61]),
    .o_in_data(out_dut[60:29]),
    .o_in_data_count(out_dut[28:1]),
    .o_oh_ready(out_dut[0:0])
  );
  mg_04079__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .i_sim_in_reset(i_1),
    .i_sim_in_ready(i_2),
    .i_sim_in_command(i_3),
    .i_sim_in_address(i_4),
    .i_sim_in_data(i_5),
    .i_sim_in_data_count(i_6),
    .i_sim_out_ready(i_7),
    .i_master_ready(i_8),
    .i_oh_en(i_9),
    .i_out_status(i_10),
    .i_out_address(i_11),
    .i_out_data(i_12),
    .i_out_data_count(i_13),
    .o_sim_master_ready(out_ref[252:252]),
    .o_sim_out_en(out_ref[251:251]),
    .o_sim_out_status(out_ref[250:219]),
    .o_sim_out_address(out_ref[218:187]),
    .o_sim_out_data(out_ref[186:155]),
    .o_sim_out_data_count(out_ref[154:127]),
    .o_ih_reset(out_ref[126:126]),
    .o_ih_ready(out_ref[125:125]),
    .o_in_command(out_ref[124:93]),
    .o_in_address(out_ref[92:61]),
    .o_in_data(out_ref[60:29]),
    .o_in_data_count(out_ref[28:1]),
    .o_oh_ready(out_ref[0:0])
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
    seed = 472959502;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
