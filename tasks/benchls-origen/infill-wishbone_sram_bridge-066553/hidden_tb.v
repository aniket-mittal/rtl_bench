// Hidden tests: 5000 cycles of seeded random inputs (seed 3721301949); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 106;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  reg [29:0] i_3;
  reg [3:0] i_4;
  reg [0:0] i_5;
  reg [31:0] i_6;
  reg [47:0] i_7;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_066553 dut (
    .wbs_clk_i(clk),
    .wbs_rst_i(i_0),
    .wbs_cyc_i(i_1),
    .wbs_stb_i(i_2),
    .wbs_addr_i(i_3),
    .wbs_sel_i(i_4),
    .wbs_we_i(i_5),
    .wbs_data_i(i_6),
    .sram_din(i_7),
    .wbs_data_o(out_dut[105:74]),
    .wbs_ack_o(out_dut[73:73]),
    .sram_ce_n(out_dut[72:72]),
    .sram_oe_n(out_dut[71:71]),
    .sram_we_n(out_dut[70:70]),
    .sram_addr(out_dut[69:48]),
    .sram_dout(out_dut[47:0])
  );
  origen_066553__ref ref_i (
    .wbs_clk_i(clk),
    .wbs_rst_i(i_0),
    .wbs_cyc_i(i_1),
    .wbs_stb_i(i_2),
    .wbs_addr_i(i_3),
    .wbs_sel_i(i_4),
    .wbs_we_i(i_5),
    .wbs_data_i(i_6),
    .sram_din(i_7),
    .wbs_data_o(out_ref[105:74]),
    .wbs_ack_o(out_ref[73:73]),
    .sram_ce_n(out_ref[72:72]),
    .sram_oe_n(out_ref[71:71]),
    .sram_we_n(out_ref[70:70]),
    .sram_addr(out_ref[69:48]),
    .sram_dout(out_ref[47:0])
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
    seed = 3721301949;
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
      i_7 = {$random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
