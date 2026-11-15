// Hidden tests: 5000 cycles of seeded random inputs (seed 1505560953); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 160;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [31:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_113939 dut (
    .clock(clk),
    .reset(i_0),
    .io_in_pc(i_1),
    .io_in_instruction(i_2),
    .io_in_sextImm(i_3),
    .io_in_readdata1(i_4),
    .io_in_readdata2(i_5),
    .io_flush(i_6),
    .io_valid(i_7),
    .io_data_pc(out_dut[159:128]),
    .io_data_instruction(out_dut[127:96]),
    .io_data_sextImm(out_dut[95:64]),
    .io_data_readdata1(out_dut[63:32]),
    .io_data_readdata2(out_dut[31:0])
  );
  autovcoder_113939__ref ref_i (
    .clock(clk),
    .reset(i_0),
    .io_in_pc(i_1),
    .io_in_instruction(i_2),
    .io_in_sextImm(i_3),
    .io_in_readdata1(i_4),
    .io_in_readdata2(i_5),
    .io_flush(i_6),
    .io_valid(i_7),
    .io_data_pc(out_ref[159:128]),
    .io_data_instruction(out_ref[127:96]),
    .io_data_sextImm(out_ref[95:64]),
    .io_data_readdata1(out_ref[63:32]),
    .io_data_readdata2(out_ref[31:0])
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
    seed = 1505560953;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
