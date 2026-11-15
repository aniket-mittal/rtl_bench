// Hidden tests: 5000 cycles of seeded random inputs (seed 144057091); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 148;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [63:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_008903 dut (
    .i_clk(clk),
    .i_rst(i_0),
    .i_BI_en(i_1),
    .i_rom_data(i_2),
    .o_rom_addr(out_dut[147:138]),
    .o_m0_addr(out_dut[137:134]),
    .o_m0_data(out_dut[133:70]),
    .o_m0_w_en(out_dut[69:69]),
    .o_m1_addr(out_dut[68:65]),
    .o_m1_data(out_dut[64:1]),
    .o_m1_w_en(out_dut[0:0])
  );
  autovcoder_008903__ref ref_i (
    .i_clk(clk),
    .i_rst(i_0),
    .i_BI_en(i_1),
    .i_rom_data(i_2),
    .o_rom_addr(out_ref[147:138]),
    .o_m0_addr(out_ref[137:134]),
    .o_m0_data(out_ref[133:70]),
    .o_m0_w_en(out_ref[69:69]),
    .o_m1_addr(out_ref[68:65]),
    .o_m1_data(out_ref[64:1]),
    .o_m1_w_en(out_ref[0:0])
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
    seed = 144057091;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
