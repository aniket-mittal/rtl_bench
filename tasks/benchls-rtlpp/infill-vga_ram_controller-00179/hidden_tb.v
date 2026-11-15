// Hidden tests: 5000 cycles of seeded random inputs (seed 237796247); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 60;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [11:0] i_2;
  reg [7:0] i_3;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_00179 dut (
    .Clock(clk),
    .Reset_L(i_0),
    .CPU_WANNA_DO(i_1),
    .Address(i_2),
    .Data(i_3),
    .crx_oreg(out_dut[59:52]),
    .cry_oreg(out_dut[51:44]),
    .ctl_oreg(out_dut[43:36]),
    .ram_weA(out_dut[35:35]),
    .ram_weB(out_dut[34:34]),
    .VGABLANKING_L(out_dut[33:33]),
    .ram_diA(out_dut[32:25]),
    .ram_adA(out_dut[24:13]),
    .ram_diB(out_dut[12:5]),
    .vga_state(out_dut[4:0])
  );
  rtlpp_00179__ref ref_i (
    .Clock(clk),
    .Reset_L(i_0),
    .CPU_WANNA_DO(i_1),
    .Address(i_2),
    .Data(i_3),
    .crx_oreg(out_ref[59:52]),
    .cry_oreg(out_ref[51:44]),
    .ctl_oreg(out_ref[43:36]),
    .ram_weA(out_ref[35:35]),
    .ram_weB(out_ref[34:34]),
    .VGABLANKING_L(out_ref[33:33]),
    .ram_diA(out_ref[32:25]),
    .ram_adA(out_ref[24:13]),
    .ram_diB(out_ref[12:5]),
    .vga_state(out_ref[4:0])
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
    seed = 237796247;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = (c < 2 || ($random(seed) & 63) == 0) ? 1'b1 : 1'b0;
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      i_3 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
