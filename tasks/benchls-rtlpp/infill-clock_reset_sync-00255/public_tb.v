// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00255 dut (
    .cmp_gclk(clk),
    .io_pwron_rst_l(in_vec[11:11]),
    .ctu_ddr0_dram_cken_dl(in_vec[10:10]),
    .ctu_ddr1_dram_cken_dl(in_vec[9:9]),
    .ctu_ddr2_dram_cken_dl(in_vec[8:8]),
    .ctu_ddr3_dram_cken_dl(in_vec[7:7]),
    .ctu_dram02_dram_cken_dl(in_vec[6:6]),
    .ctu_dram13_dram_cken_dl(in_vec[5:5]),
    .start_clk_dl(in_vec[4:4]),
    .a_grst_dl(in_vec[3:3]),
    .a_dbginit_dl(in_vec[2:2]),
    .de_grst_dsync_edge_dl(in_vec[1:1]),
    .de_dbginit_dsync_edge_dl(in_vec[0:0]),
    .start_clk_dg(out_vec[10:10]),
    .ctu_ddr0_dram_cken_dg(out_vec[9:9]),
    .ctu_ddr1_dram_cken_dg(out_vec[8:8]),
    .ctu_ddr2_dram_cken_dg(out_vec[7:7]),
    .ctu_ddr3_dram_cken_dg(out_vec[6:6]),
    .ctu_dram02_dram_cken_dg(out_vec[5:5]),
    .ctu_dram13_dram_cken_dg(out_vec[4:4]),
    .a_grst_dg(out_vec[3:3]),
    .a_dbginit_dg(out_vec[2:2]),
    .de_grst_dsync_edge_dg(out_vec[1:1]),
    .de_dbginit_dsync_edge_dg(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'h75c;
    stim[1] = 12'h428;
    stim[2] = 12'h9f4;
    stim[3] = 12'ha70;
    stim[4] = 12'h121;
    stim[5] = 12'hab7;
    stim[6] = 12'h577;
    stim[7] = 12'he77;
    stim[8] = 12'hcd5;
    stim[9] = 12'h067;
    stim[10] = 12'hf22;
    stim[11] = 12'h900;
    stim[12] = 12'hcb6;
    stim[13] = 12'ha60;
    stim[14] = 12'hda3;
    stim[15] = 12'h1b2;
    stim[16] = 12'he15;
    stim[17] = 12'h196;
    stim[18] = 12'had6;
    stim[19] = 12'hd16;
    stim[20] = 12'h354;
    stim[21] = 12'h1b2;
    stim[22] = 12'h7c5;
    stim[23] = 12'h900;
    stim[24] = 12'h554;
    stim[25] = 12'h4f3;
    stim[26] = 12'h242;
    stim[27] = 12'h230;
    stim[28] = 12'hc9f;
    stim[29] = 12'h803;
    stim[30] = 12'h2d0;
    stim[31] = 12'h5d1;
    stim[32] = 12'ha97;
    stim[33] = 12'hd42;
    stim[34] = 12'hdc6;
    stim[35] = 12'h152;
    stim[36] = 12'h054;
    stim[37] = 12'h253;
    stim[38] = 12'h177;
    stim[39] = 12'hea4;
    stim[40] = 12'hec2;
    stim[41] = 12'hf70;
    stim[42] = 12'hfd1;
    stim[43] = 12'h013;
    stim[44] = 12'hea9;
    stim[45] = 12'hc57;
    stim[46] = 12'hc71;
    stim[47] = 12'h442;
    stim[48] = 12'h437;
    stim[49] = 12'ha35;
    stim[50] = 12'h3b5;
    stim[51] = 12'hcb0;
    stim[52] = 12'hc60;
    stim[53] = 12'hfd2;
    stim[54] = 12'h943;
    stim[55] = 12'hb92;
    stim[56] = 12'hdc6;
    stim[57] = 12'h895;
    stim[58] = 12'h3a4;
    stim[59] = 12'h575;
    stim[60] = 12'hf57;
    stim[61] = 12'hac3;
    stim[62] = 12'h034;
    stim[63] = 12'h7a7;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 11'hxxx;
      expv[1] = 11'h3ac;
      expv[2] = 11'h218;
      expv[3] = 11'h4f4;
      expv[4] = 11'h130;
      expv[5] = 11'h091;
      expv[6] = 11'h157;
      expv[7] = 11'h2b7;
      expv[8] = 11'h737;
      expv[9] = 11'h265;
      expv[10] = 11'h037;
      expv[11] = 11'h392;
      expv[12] = 11'h080;
      expv[13] = 11'h656;
      expv[14] = 11'h130;
      expv[15] = 11'h2d3;
      expv[16] = 11'h0d2;
      expv[17] = 11'h305;
      expv[18] = 11'h0c6;
      expv[19] = 11'h566;
      expv[20] = 11'h286;
      expv[21] = 11'h1a4;
      expv[22] = 11'h0d2;
      expv[23] = 11'h3e5;
      expv[24] = 11'h080;
      expv[25] = 11'h2a4;
      expv[26] = 11'h273;
      expv[27] = 11'h122;
      expv[28] = 11'h110;
      expv[29] = 11'h64f;
      expv[30] = 11'h003;
      expv[31] = 11'h160;
      expv[32] = 11'h2e1;
      expv[33] = 11'h547;
      expv[34] = 11'h2a2;
      expv[35] = 11'h2e6;
      expv[36] = 11'h0a2;
      expv[37] = 11'h024;
      expv[38] = 11'h123;
      expv[39] = 11'h0b7;
      expv[40] = 11'h354;
      expv[41] = 11'h362;
      expv[42] = 11'h7b0;
      expv[43] = 11'h3e1;
      expv[44] = 11'h003;
      expv[45] = 11'h359;
      expv[46] = 11'h627;
      expv[47] = 11'h231;
      expv[48] = 11'h222;
      expv[49] = 11'h217;
      expv[50] = 11'h115;
      expv[51] = 11'h1d5;
      expv[52] = 11'h650;
      expv[53] = 11'h230;
      expv[54] = 11'h7e2;
      expv[55] = 11'h0a3;
      expv[56] = 11'h5c2;
      expv[57] = 11'h2e6;
      expv[58] = 11'h045;
      expv[59] = 11'h1d4;
      expv[60] = 11'h2b5;
      expv[61] = 11'h7a7;
      expv[62] = 11'h163;
      expv[63] = 11'h014;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
