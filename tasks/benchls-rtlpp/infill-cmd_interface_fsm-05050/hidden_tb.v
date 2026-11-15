// Hidden tests: 5000 cycles of seeded random inputs (seed 4172453684); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 53;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [7:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [7:0] i_6;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_05050 dut (
    .clk(clk),
    .rst(i_0),
    .i_cmd_write_stb(i_1),
    .i_cmd_read_stb(i_2),
    .i_cmd_data(i_3),
    .i_enable(i_4),
    .i_cmd_parameter(i_5),
    .i_data_in(i_6),
    .debug(out_dut[52:21]),
    .o_cmd_data(out_dut[20:13]),
    .o_cmd_finished(out_dut[12:12]),
    .o_cmd_mode(out_dut[11:11]),
    .o_write(out_dut[10:10]),
    .o_read(out_dut[9:9]),
    .o_data_out(out_dut[8:1]),
    .o_data_out_en(out_dut[0:0])
  );
  rtlpp_05050__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .i_cmd_write_stb(i_1),
    .i_cmd_read_stb(i_2),
    .i_cmd_data(i_3),
    .i_enable(i_4),
    .i_cmd_parameter(i_5),
    .i_data_in(i_6),
    .debug(out_ref[52:21]),
    .o_cmd_data(out_ref[20:13]),
    .o_cmd_finished(out_ref[12:12]),
    .o_cmd_mode(out_ref[11:11]),
    .o_write(out_ref[10:10]),
    .o_read(out_ref[9:9]),
    .o_data_out(out_ref[8:1]),
    .o_data_out_en(out_ref[0:0])
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
    seed = 4172453684;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
