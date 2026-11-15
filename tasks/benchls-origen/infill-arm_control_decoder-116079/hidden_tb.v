// Hidden tests: 5000 cycles of seeded random inputs (seed 2280184511); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 16;
  reg clk;
  reg [1:0] i_0;
  reg [5:0] i_1;
  reg [3:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_116079 dut (
    .Intr_Mode(i_0),
    .I_Function_S(i_1),
    .Rdestiny(i_2),
    .wFlag_bools(out_dut[15:14]),
    .PCS(out_dut[13:13]),
    .wregister_boolean(out_dut[12:12]),
    .wmemory_boolean(out_dut[11:11]),
    .MemtoReg(out_dut[10:10]),
    .B_ALU_selec(out_dut[9:9]),
    .Imm_selec(out_dut[8:7]),
    .registers_selec_mux(out_dut[6:5]),
    .ALU_selec(out_dut[4:1]),
    .mov_selec(out_dut[0:0])
  );
  origen_116079__ref ref_i (
    .Intr_Mode(i_0),
    .I_Function_S(i_1),
    .Rdestiny(i_2),
    .wFlag_bools(out_ref[15:14]),
    .PCS(out_ref[13:13]),
    .wregister_boolean(out_ref[12:12]),
    .wmemory_boolean(out_ref[11:11]),
    .MemtoReg(out_ref[10:10]),
    .B_ALU_selec(out_ref[9:9]),
    .Imm_selec(out_ref[8:7]),
    .registers_selec_mux(out_ref[6:5]),
    .ALU_selec(out_ref[4:1]),
    .mov_selec(out_ref[0:0])
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
    seed = 2280184511;
    clk = 1'b0;
    mismatches = 0;
    shown = 0;
    for (c = 0; c < N; c = c + 1) begin
      i_0 = {$random(seed)};
      i_1 = {$random(seed)};
      i_2 = {$random(seed)};
      #1 check;
      #1;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
