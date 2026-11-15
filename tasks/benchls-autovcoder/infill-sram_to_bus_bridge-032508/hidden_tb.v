// Hidden tests: 5000 cycles of seeded random inputs (seed 3253380184); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 101;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [31:0] i_2;
  reg [3:0] i_3;
  reg [31:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  autovcoder_032508 dut (
    .clk(clk),
    .rst(i_0),
    .data_sram_en(i_1),
    .data_sram_addr(i_2),
    .data_sram_wen(i_3),
    .data_sram_wdata(i_4),
    .data_rdata(i_5),
    .data_addr_ok(i_6),
    .data_data_ok(i_7),
    .longest_stall(i_8),
    .data_sram_rdata(out_dut[100:69]),
    .d_stall(out_dut[68:68]),
    .data_req(out_dut[67:67]),
    .data_wr(out_dut[66:66]),
    .data_size(out_dut[65:64]),
    .data_addr(out_dut[63:32]),
    .data_wdata(out_dut[31:0])
  );
  autovcoder_032508__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .data_sram_en(i_1),
    .data_sram_addr(i_2),
    .data_sram_wen(i_3),
    .data_sram_wdata(i_4),
    .data_rdata(i_5),
    .data_addr_ok(i_6),
    .data_data_ok(i_7),
    .longest_stall(i_8),
    .data_sram_rdata(out_ref[100:69]),
    .d_stall(out_ref[68:68]),
    .data_req(out_ref[67:67]),
    .data_wr(out_ref[66:66]),
    .data_size(out_ref[65:64]),
    .data_addr(out_ref[63:32]),
    .data_wdata(out_ref[31:0])
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
    seed = 3253380184;
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
      i_8 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
