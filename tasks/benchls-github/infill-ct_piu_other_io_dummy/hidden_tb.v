// Hidden tests: 5000 cycles of seeded random inputs (seed 510678249); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 146;
  reg clk;
  reg [0:0] i_0;
  reg [0:0] i_1;
  reg [0:0] i_2;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  ct_piu_other_io_dummy dut (
    .l2cif_piu_read_data_vld(i_0),
    .psel_l2pmp_x(i_1),
    .regs_piu_cmplt(i_2),
    .perr_l2pmp_x(out_dut[145:145]),
    .piu_l2cif_read_data(out_dut[144:144]),
    .piu_l2cif_read_data_ecc(out_dut[143:143]),
    .piu_l2cif_read_index(out_dut[142:122]),
    .piu_l2cif_read_req(out_dut[121:121]),
    .piu_l2cif_read_tag(out_dut[120:120]),
    .piu_l2cif_read_tag_ecc(out_dut[119:119]),
    .piu_l2cif_read_way(out_dut[118:115]),
    .piu_regs_op(out_dut[114:99]),
    .piu_regs_sel(out_dut[98:98]),
    .piu_regs_wdata(out_dut[97:34]),
    .piu_xx_regs_no_op(out_dut[33:33]),
    .pready_l2pmp_x(out_dut[32:32]),
    .x_prdata_l2pmp(out_dut[31:0])
  );
  ct_piu_other_io_dummy__ref ref_i (
    .l2cif_piu_read_data_vld(i_0),
    .psel_l2pmp_x(i_1),
    .regs_piu_cmplt(i_2),
    .perr_l2pmp_x(out_ref[145:145]),
    .piu_l2cif_read_data(out_ref[144:144]),
    .piu_l2cif_read_data_ecc(out_ref[143:143]),
    .piu_l2cif_read_index(out_ref[142:122]),
    .piu_l2cif_read_req(out_ref[121:121]),
    .piu_l2cif_read_tag(out_ref[120:120]),
    .piu_l2cif_read_tag_ecc(out_ref[119:119]),
    .piu_l2cif_read_way(out_ref[118:115]),
    .piu_regs_op(out_ref[114:99]),
    .piu_regs_sel(out_ref[98:98]),
    .piu_regs_wdata(out_ref[97:34]),
    .piu_xx_regs_no_op(out_ref[33:33]),
    .pready_l2pmp_x(out_ref[32:32]),
    .x_prdata_l2pmp(out_ref[31:0])
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
    seed = 510678249;
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
