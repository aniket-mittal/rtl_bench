// Hidden tests: 5000 cycles of seeded random inputs (seed 1516784186); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 112;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [3:0] i_3;
  reg [31:0] i_4;
  reg [0:0] i_5;
  reg [31:0] i_6;
  reg [0:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [3:0] i_10;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_142515 dut (
    .clk(clk),
    .rst(i_0),
    .addrbase(i_1),
    .addrofs(i_2),
    .lsu_op(i_3),
    .lsu_datain(i_4),
    .du_stall(i_5),
    .dcpu_dat_i(i_6),
    .dcpu_ack_i(i_7),
    .dcpu_rty_i(i_8),
    .dcpu_err_i(i_9),
    .dcpu_tag_i(i_10),
    .except_align(out_dut[111:111]),
    .except_dtlbmiss(out_dut[110:110]),
    .except_dmmufault(out_dut[109:109]),
    .except_dbuserr(out_dut[108:108]),
    .lsu_dataout(out_dut[107:76]),
    .lsu_stall(out_dut[75:75]),
    .lsu_unstall(out_dut[74:74]),
    .dcpu_adr_o(out_dut[73:42]),
    .dcpu_cycstb_o(out_dut[41:41]),
    .dcpu_we_o(out_dut[40:40]),
    .dcpu_sel_o(out_dut[39:36]),
    .dcpu_tag_o(out_dut[35:32]),
    .dcpu_dat_o(out_dut[31:0])
  );
  origen_142515__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .addrbase(i_1),
    .addrofs(i_2),
    .lsu_op(i_3),
    .lsu_datain(i_4),
    .du_stall(i_5),
    .dcpu_dat_i(i_6),
    .dcpu_ack_i(i_7),
    .dcpu_rty_i(i_8),
    .dcpu_err_i(i_9),
    .dcpu_tag_i(i_10),
    .except_align(out_ref[111:111]),
    .except_dtlbmiss(out_ref[110:110]),
    .except_dmmufault(out_ref[109:109]),
    .except_dbuserr(out_ref[108:108]),
    .lsu_dataout(out_ref[107:76]),
    .lsu_stall(out_ref[75:75]),
    .lsu_unstall(out_ref[74:74]),
    .dcpu_adr_o(out_ref[73:42]),
    .dcpu_cycstb_o(out_ref[41:41]),
    .dcpu_we_o(out_ref[40:40]),
    .dcpu_sel_o(out_ref[39:36]),
    .dcpu_tag_o(out_ref[35:32]),
    .dcpu_dat_o(out_ref[31:0])
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
    seed = 1516784186;
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
      i_9 = {$random(seed)};
      i_10 = {$random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
