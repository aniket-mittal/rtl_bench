// Hidden tests: 5000 cycles of seeded random inputs (seed 676898157); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 160;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [2:0] i_3;
  reg [3:0] i_4;
  reg [3:0] i_5;
  reg [3:0] i_6;
  reg [31:0] i_7;
  reg [31:0] i_8;
  reg [31:0] i_9;
  reg [31:0] i_10;
  reg [7:0] i_11;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_212132 dut (
    .slow_clock(clk),
    .enable(i_0),
    .reset(i_1),
    .fast_clock(i_2),
    .control(i_3),
    .register_source_A(i_4),
    .register_source_B(i_5),
    .register_Dest(i_6),
    .ALU_result(i_7),
    .data_from_memory(i_8),
    .new_SP(i_9),
    .new_PC(i_10),
    .special_register(i_11),
    .read_data_A(out_dut[159:128]),
    .read_data_B(out_dut[127:96]),
    .current_PC(out_dut[95:64]),
    .current_SP(out_dut[63:32]),
    .memory_output(out_dut[31:0])
  );
  origen_212132__ref ref_i (
    .slow_clock(clk),
    .enable(i_0),
    .reset(i_1),
    .fast_clock(i_2),
    .control(i_3),
    .register_source_A(i_4),
    .register_source_B(i_5),
    .register_Dest(i_6),
    .ALU_result(i_7),
    .data_from_memory(i_8),
    .new_SP(i_9),
    .new_PC(i_10),
    .special_register(i_11),
    .read_data_A(out_ref[159:128]),
    .read_data_B(out_ref[127:96]),
    .current_PC(out_ref[95:64]),
    .current_SP(out_ref[63:32]),
    .memory_output(out_ref[31:0])
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
    seed = 676898157;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
