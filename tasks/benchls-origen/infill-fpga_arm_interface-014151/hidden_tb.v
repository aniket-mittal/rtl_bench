// Hidden tests: 5000 cycles of seeded random inputs (seed 1543825414); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 1031;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [1023:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_014151 dut (
    .clk(clk),
    .resetn(i_0),
    .arm_to_fpga_cmd(i_1),
    .arm_to_fpga_cmd_valid(i_2),
    .arm_to_fpga_done_read(i_3),
    .arm_to_fpga_data(i_4),
    .arm_to_fpga_data_valid(i_5),
    .fpga_to_arm_data_ready(i_6),
    .arm_to_fpga_done(out_dut[1030:1030]),
    .arm_to_fpga_data_ready(out_dut[1029:1029]),
    .fpga_to_arm_data(out_dut[1028:5]),
    .fpga_to_arm_data_valid(out_dut[4:4]),
    .leds(out_dut[3:0])
  );
  origen_014151__ref ref_i (
    .clk(clk),
    .resetn(i_0),
    .arm_to_fpga_cmd(i_1),
    .arm_to_fpga_cmd_valid(i_2),
    .arm_to_fpga_done_read(i_3),
    .arm_to_fpga_data(i_4),
    .arm_to_fpga_data_valid(i_5),
    .fpga_to_arm_data_ready(i_6),
    .arm_to_fpga_done(out_ref[1030:1030]),
    .arm_to_fpga_data_ready(out_ref[1029:1029]),
    .fpga_to_arm_data(out_ref[1028:5]),
    .fpga_to_arm_data_valid(out_ref[4:4]),
    .leds(out_ref[3:0])
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
    seed = 1543825414;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      i_4 = {$random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed), $random(seed)};
      i_5 = {$random(seed)};
      i_6 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
