// Hidden tests: 5000 cycles of seeded random inputs (seed 2998527997); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 14;
  reg clk;
  reg [7:0] i_0;
  reg [7:0] i_1;
  reg [7:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_11075 dut (
    .clock(clk),
    .Dn(i_0),
    .Xn(i_1),
    .Wn(i_2),
    .memory_Dn_active(i_3),
    .memory_Xn_active(i_4),
    .memory_bobot_active(i_5),
    .y_active(i_6),
    .e_active(i_7),
    .w_active(i_8),
    .sys_reset_active(i_9),
    .z(out_dut[13:6]),
    .done_read_Dn(out_dut[5:5]),
    .done_read_Xn(out_dut[4:4]),
    .done_yn(out_dut[3:3]),
    .done_en(out_dut[2:2]),
    .done_write_wn(out_dut[1:1]),
    .done_wn1(out_dut[0:0])
  );
  rtlpp_11075__ref ref_i (
    .clock(clk),
    .Dn(i_0),
    .Xn(i_1),
    .Wn(i_2),
    .memory_Dn_active(i_3),
    .memory_Xn_active(i_4),
    .memory_bobot_active(i_5),
    .y_active(i_6),
    .e_active(i_7),
    .w_active(i_8),
    .sys_reset_active(i_9),
    .z(out_ref[13:6]),
    .done_read_Dn(out_ref[5:5]),
    .done_read_Xn(out_ref[4:4]),
    .done_yn(out_ref[3:3]),
    .done_en(out_ref[2:2]),
    .done_write_wn(out_ref[1:1]),
    .done_wn1(out_ref[0:0])
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
    seed = 2998527997;
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
      i_9 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
