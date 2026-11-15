// Hidden tests: 5000 cycles of seeded random inputs (seed 2246521930); the submission must match reference.v
// cycle by cycle. Reference outputs that are x are don't care. Verifier only; the grader renames reference.v's
// modules to <name>__ref before compiling.
`timescale 1ns/1ps
module tb;
  localparam N = 5000;
  localparam OW = 111;
  reg clk;
  reg [0:0] i_0;
  reg [31:0] i_1;
  reg [0:0] i_2;
  reg [0:0] i_3;
  reg [0:0] i_4;
  reg [31:0] i_5;
  reg [0:0] i_6;
  reg [0:0] i_7;
  reg [3:0] i_8;
  reg [3:0] i_9;
  reg [0:0] i_10;
  reg [0:0] i_11;
  reg [31:0] i_12;
  wire [OW-1:0] out_dut, out_ref;
  integer seed, c, b, bad, mismatches, shown;

  rtlpp_02662 dut (
    .clk(clk),
    .rst(i_0),
    .icbiu_dat_i(i_1),
    .icbiu_ack_i(i_2),
    .icbiu_err_i(i_3),
    .ic_en(i_4),
    .icqmem_adr_i(i_5),
    .icqmem_cycstb_i(i_6),
    .icqmem_ci_i(i_7),
    .icqmem_sel_i(i_8),
    .icqmem_tag_i(i_9),
    .spr_cs(i_10),
    .spr_write(i_11),
    .spr_dat_i(i_12),
    .icbiu_dat_o(out_dut[110:79]),
    .icbiu_adr_o(out_dut[78:47]),
    .icbiu_cyc_o(out_dut[46:46]),
    .icbiu_stb_o(out_dut[45:45]),
    .icbiu_we_o(out_dut[44:44]),
    .icbiu_sel_o(out_dut[43:40]),
    .icbiu_cab_o(out_dut[39:39]),
    .icqmem_dat_o(out_dut[38:7]),
    .icqmem_ack_o(out_dut[6:6]),
    .icqmem_rty_o(out_dut[5:5]),
    .icqmem_err_o(out_dut[4:4]),
    .icqmem_tag_o(out_dut[3:0])
  );
  rtlpp_02662__ref ref_i (
    .clk(clk),
    .rst(i_0),
    .icbiu_dat_i(i_1),
    .icbiu_ack_i(i_2),
    .icbiu_err_i(i_3),
    .ic_en(i_4),
    .icqmem_adr_i(i_5),
    .icqmem_cycstb_i(i_6),
    .icqmem_ci_i(i_7),
    .icqmem_sel_i(i_8),
    .icqmem_tag_i(i_9),
    .spr_cs(i_10),
    .spr_write(i_11),
    .spr_dat_i(i_12),
    .icbiu_dat_o(out_ref[110:79]),
    .icbiu_adr_o(out_ref[78:47]),
    .icbiu_cyc_o(out_ref[46:46]),
    .icbiu_stb_o(out_ref[45:45]),
    .icbiu_we_o(out_ref[44:44]),
    .icbiu_sel_o(out_ref[43:40]),
    .icbiu_cab_o(out_ref[39:39]),
    .icqmem_dat_o(out_ref[38:7]),
    .icqmem_ack_o(out_ref[6:6]),
    .icqmem_rty_o(out_ref[5:5]),
    .icqmem_err_o(out_ref[4:4]),
    .icqmem_tag_o(out_ref[3:0])
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
    seed = 2246521930;
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
      #4 check;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
    else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    $finish;
  end
endmodule
