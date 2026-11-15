// Hidden tests: 5000 cycles of seeded random inputs (seed 114653518); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 288;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [7:0] i_2;
  reg [9:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_008607 dut (
    .Clk(clk),
    .rst_l(i_0),
    .static_ctl_en(i_1),
    .static_len(i_2),
    .rom_addr_ptr_ff(i_3),
    .rom_addr(i_4),
    .rom_data(i_5),
    .cmd_out_mw(out_dut[287:160]),
    .cmd_data(out_dut[159:128]),
    .cmd_out_mr(out_dut[127:0])
  );
  autovcoder_008607__ref ref_i (
    .Clk(clk),
    .rst_l(i_0),
    .static_ctl_en(i_1),
    .static_len(i_2),
    .rom_addr_ptr_ff(i_3),
    .rom_addr(i_4),
    .rom_data(i_5),
    .cmd_out_mw(out_ref[287:160]),
    .cmd_data(out_ref[159:128]),
    .cmd_out_mr(out_ref[127:0])
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
    seed = 114653518;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
