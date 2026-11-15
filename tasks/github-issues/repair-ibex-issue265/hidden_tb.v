// Hidden tests: 5000 cycles of seeded random inputs (seed 2181069061); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 100;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [31:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  ibex_prefetch_buffer dut (
    .clk_i(clk),
    .rst_ni(i_0),
    .req_i(i_1),
    .branch_i(i_2),
    .addr_i(i_3),
    .ready_i(i_4),
    .instr_gnt_i(i_5),
    .instr_rdata_i(i_6),
    .instr_err_i(i_7),
    .instr_pmp_err_i(i_8),
    .instr_rvalid_i(i_9),
    .valid_o(out_dut[99:99]),
    .rdata_o(out_dut[98:67]),
    .addr_o(out_dut[66:35]),
    .err_o(out_dut[34:34]),
    .instr_req_o(out_dut[33:33]),
    .instr_addr_o(out_dut[32:1]),
    .busy_o(out_dut[0:0])
  );
  ibex_prefetch_buffer__ref ref_i (
    .clk_i(clk),
    .rst_ni(i_0),
    .req_i(i_1),
    .branch_i(i_2),
    .addr_i(i_3),
    .ready_i(i_4),
    .instr_gnt_i(i_5),
    .instr_rdata_i(i_6),
    .instr_err_i(i_7),
    .instr_pmp_err_i(i_8),
    .instr_rvalid_i(i_9),
    .valid_o(out_ref[99:99]),
    .rdata_o(out_ref[98:67]),
    .addr_o(out_ref[66:35]),
    .err_o(out_ref[34:34]),
    .instr_req_o(out_ref[33:33]),
    .instr_addr_o(out_ref[32:1]),
    .busy_o(out_ref[0:0])
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
    seed = 2181069061;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
