// Hidden tests: 5000 cycles of seeded random inputs (seed 512682975); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 105;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [3:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [1:0] i_9;
  reg [31:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_154490 dut (
    .clk(clk),
    .rst_n(i_0),
    .cpu_wr(i_1),
    .cpu_rd(i_2),
    .cpu_byte(i_3),
    .cpu_addr(i_4),
    .cpu_wdata(i_5),
    .a_ready(i_6),
    .d_ready(i_7),
    .d_valid(i_8),
    .d_opcode(i_9),
    .d_data(i_10),
    .cpu_rdata_v(out_dut[104:104]),
    .cpu_rdata(out_dut[103:72]),
    .a_valid(out_dut[71:71]),
    .a_opcode(out_dut[70:69]),
    .a_mask(out_dut[68:65]),
    .a_address(out_dut[64:33]),
    .a_data(out_dut[32:1]),
    .trans_over(out_dut[0:0])
  );
  origen_154490__ref ref_i (
    .clk(clk),
    .rst_n(i_0),
    .cpu_wr(i_1),
    .cpu_rd(i_2),
    .cpu_byte(i_3),
    .cpu_addr(i_4),
    .cpu_wdata(i_5),
    .a_ready(i_6),
    .d_ready(i_7),
    .d_valid(i_8),
    .d_opcode(i_9),
    .d_data(i_10),
    .cpu_rdata_v(out_ref[104:104]),
    .cpu_rdata(out_ref[103:72]),
    .a_valid(out_ref[71:71]),
    .a_opcode(out_ref[70:69]),
    .a_mask(out_ref[68:65]),
    .a_address(out_ref[64:33]),
    .a_data(out_ref[32:1]),
    .trans_over(out_ref[0:0])
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
    seed = 512682975;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b0 : 1'b1;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
