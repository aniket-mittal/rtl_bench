// Hidden tests: 5000 cycles of seeded random inputs (seed 3956179639); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 67;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_069169 dut (
    .clk(clk),
    .res(i_0),
    .cached_instr_req(i_1),
    .cached_instr_adr(i_2),
    .instr_gnt(i_3),
    .instr_rvalid(i_4),
    .instr_read(i_5),
    .cached_instr_gnt(out_dut[66:66]),
    .cached_instr_rvalid(out_dut[65:65]),
    .cached_instr_read(out_dut[64:33]),
    .instr_req(out_dut[32:32]),
    .instr_adr(out_dut[31:0])
  );
  autovcoder_069169__ref ref_i (
    .clk(clk),
    .res(i_0),
    .cached_instr_req(i_1),
    .cached_instr_adr(i_2),
    .instr_gnt(i_3),
    .instr_rvalid(i_4),
    .instr_read(i_5),
    .cached_instr_gnt(out_ref[66:66]),
    .cached_instr_rvalid(out_ref[65:65]),
    .cached_instr_read(out_ref[64:33]),
    .instr_req(out_ref[32:32]),
    .instr_adr(out_ref[31:0])
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
    seed = 3956179639;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
