// Hidden tests: 5000 cycles of seeded random inputs (seed 2928500214); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 68;
  reg clk;
  reg [0:0] i_0;
  reg [47:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [47:0] i_7;
  reg [31:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_136391 dut (
    .clk(clk),
    .rst(i_0),
    .host_cmd(i_1),
    .host_dat_in(i_2),
    .host_cmd_en(i_3),
    .host_dat_en(i_4),
    .host_dat_dir(i_5),
    .host_dat_ack(i_6),
    .device_cmd(i_7),
    .device_dat_in(i_8),
    .device_cmd_en(i_9),
    .device_dat_en(i_10),
    .device_dat_dir(i_11),
    .device_dat_ack(i_12),
    .host_cmd_ack(out_dut[67:67]),
    .host_dat_rdy(out_dut[66:66]),
    .host_dat_out(out_dut[65:34]),
    .device_cmd_ack(out_dut[33:33]),
    .device_dat_rdy(out_dut[32:32]),
    .device_dat_out(out_dut[31:0])
  );
  origen_136391__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .host_cmd(i_1),
    .host_dat_in(i_2),
    .host_cmd_en(i_3),
    .host_dat_en(i_4),
    .host_dat_dir(i_5),
    .host_dat_ack(i_6),
    .device_cmd(i_7),
    .device_dat_in(i_8),
    .device_cmd_en(i_9),
    .device_dat_en(i_10),
    .device_dat_dir(i_11),
    .device_dat_ack(i_12),
    .host_cmd_ack(out_ref[67:67]),
    .host_dat_rdy(out_ref[66:66]),
    .host_dat_out(out_ref[65:34]),
    .device_cmd_ack(out_ref[33:33]),
    .device_dat_rdy(out_ref[32:32]),
    .device_dat_out(out_ref[31:0])
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
    seed = 2928500214;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed), $random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      i_7 = {$random(seed), $random(seed)};
      i_8 = {$random(seed)};
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
