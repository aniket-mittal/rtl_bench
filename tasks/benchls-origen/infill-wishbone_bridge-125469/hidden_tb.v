// Hidden tests: 5000 cycles of seeded random inputs (seed 4098021632); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 282;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [31:0] i_2;
  reg [3:0] i_3;
  reg [0:0] i_4;
  reg [0:0] i_5;
  reg [0:0] i_6;
  reg [31:0] i_7;
  reg [0:0] i_8;
  reg [0:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [0:0] i_12;
  reg [31:0] i_13;
  reg [3:0] i_14;
  reg [31:0] i_15;
  reg [0:0] i_16;
  reg [70:0] i_17;
  reg [31:0] i_18;
  reg [70:0] i_19;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  origen_125469 dut (
    .clk(clk),
    .rst(i_0),
    .wbs_data_i(i_1),
    .wb_addr_i(i_2),
    .wb_sel_i(i_3),
    .wb_we_i(i_4),
    .wb_cyc_i(i_5),
    .wb_stb_i(i_6),
    .wbm_data_i(i_7),
    .wb_ack_i(i_8),
    .wb_err_i(i_9),
    .wb_rty_i(i_10),
    .mast_go(i_11),
    .mast_we(i_12),
    .mast_adr(i_13),
    .mast_sel(i_14),
    .mast_din(i_15),
    .pt_sel_i(i_16),
    .mast_pt_in(i_17),
    .slv_dout(i_18),
    .slv_pt_in(i_19),
    .wbs_data_o(out_dut[281:250]),
    .wb_ack_o(out_dut[249:249]),
    .wb_err_o(out_dut[248:248]),
    .wb_rty_o(out_dut[247:247]),
    .wbm_data_o(out_dut[246:215]),
    .wb_addr_o(out_dut[214:183]),
    .wb_sel_o(out_dut[182:179]),
    .wb_we_o(out_dut[178:178]),
    .wb_cyc_o(out_dut[177:177]),
    .wb_stb_o(out_dut[176:176]),
    .mast_dout(out_dut[175:144]),
    .mast_err(out_dut[143:143]),
    .mast_drdy(out_dut[142:142]),
    .mast_wait(out_dut[141:141]),
    .mast_pt_out(out_dut[140:104]),
    .slv_adr(out_dut[103:72]),
    .slv_din(out_dut[71:40]),
    .slv_re(out_dut[39:39]),
    .slv_we(out_dut[38:38]),
    .pt_sel_o(out_dut[37:37]),
    .slv_pt_out(out_dut[36:0])
  );
  origen_125469__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .wbs_data_i(i_1),
    .wb_addr_i(i_2),
    .wb_sel_i(i_3),
    .wb_we_i(i_4),
    .wb_cyc_i(i_5),
    .wb_stb_i(i_6),
    .wbm_data_i(i_7),
    .wb_ack_i(i_8),
    .wb_err_i(i_9),
    .wb_rty_i(i_10),
    .mast_go(i_11),
    .mast_we(i_12),
    .mast_adr(i_13),
    .mast_sel(i_14),
    .mast_din(i_15),
    .pt_sel_i(i_16),
    .mast_pt_in(i_17),
    .slv_dout(i_18),
    .slv_pt_in(i_19),
    .wbs_data_o(out_ref[281:250]),
    .wb_ack_o(out_ref[249:249]),
    .wb_err_o(out_ref[248:248]),
    .wb_rty_o(out_ref[247:247]),
    .wbm_data_o(out_ref[246:215]),
    .wb_addr_o(out_ref[214:183]),
    .wb_sel_o(out_ref[182:179]),
    .wb_we_o(out_ref[178:178]),
    .wb_cyc_o(out_ref[177:177]),
    .wb_stb_o(out_ref[176:176]),
    .mast_dout(out_ref[175:144]),
    .mast_err(out_ref[143:143]),
    .mast_drdy(out_ref[142:142]),
    .mast_wait(out_ref[141:141]),
    .mast_pt_out(out_ref[140:104]),
    .slv_adr(out_ref[103:72]),
    .slv_din(out_ref[71:40]),
    .slv_re(out_ref[39:39]),
    .slv_we(out_ref[38:38]),
    .pt_sel_o(out_ref[37:37]),
    .slv_pt_out(out_ref[36:0])
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
    seed = 4098021632;
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
      i_11 = {$random(seed)};
      i_12 = {$random(seed)};
      i_13 = {$random(seed)};
      i_14 = {$random(seed)};
      i_15 = {$random(seed)};
      i_16 = {$random(seed)};
      i_17 = {$random(seed), $random(seed), $random(seed)};
      i_18 = {$random(seed)};
      i_19 = {$random(seed), $random(seed), $random(seed)};
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
