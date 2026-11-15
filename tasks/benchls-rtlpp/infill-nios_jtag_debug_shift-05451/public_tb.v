// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05451 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[50:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h253da98c6f7;
    stim[1] = 42'h29cfeeaac09;
    stim[2] = 42'h388f9661adc;
    stim[3] = 42'h18474cb4948;
    stim[4] = 42'h3289011aaa2;
    stim[5] = 42'h24c53053f11;
    stim[6] = 42'h349a1bb828d;
    stim[7] = 42'h001bf3dfb2e;
    stim[8] = 42'h029c6821343;
    stim[9] = 42'h03899b9fc2a;
    stim[10] = 42'h2796416933a;
    stim[11] = 42'h2fbdf713705;
    stim[12] = 42'h14a2abf11e3;
    stim[13] = 42'h256b83ac5a3;
    stim[14] = 42'h3a736ba7199;
    stim[15] = 42'h0671eec70b2;
    stim[16] = 42'h219284cc926;
    stim[17] = 42'h1c68788ad46;
    stim[18] = 42'h311f8a4d868;
    stim[19] = 42'h336e86d14e1;
    stim[20] = 42'h255e13b350f;
    stim[21] = 42'h0687a55eb1d;
    stim[22] = 42'h05e714177d4;
    stim[23] = 42'h3264e4f3e74;
    stim[24] = 42'h1948f463f81;
    stim[25] = 42'h00bc74d96de;
    stim[26] = 42'h0bb4ab8ce41;
    stim[27] = 42'h0a16f0f58ce;
    stim[28] = 42'h3509424ff57;
    stim[29] = 42'h11f0bdb4c45;
    stim[30] = 42'h399a6d8c688;
    stim[31] = 42'h2e892c0911a;
    stim[32] = 42'h06d4e2578b3;
    stim[33] = 42'h042136761de;
    stim[34] = 42'h098ddefaf51;
    stim[35] = 42'h1b18e2ee2fc;
    stim[36] = 42'h08e383eb0a5;
    stim[37] = 42'h1c90d7d7393;
    stim[38] = 42'h336a40bd42a;
    stim[39] = 42'h14754b05972;
    stim[40] = 42'h1cde4df7b2c;
    stim[41] = 42'h13cb1cc2af9;
    stim[42] = 42'h3243f8cf019;
    stim[43] = 42'h3d36c893467;
    stim[44] = 42'h2b0b48ee411;
    stim[45] = 42'h1c2ce053406;
    stim[46] = 42'h28a71607f9d;
    stim[47] = 42'h1ed8083043c;
    stim[48] = 42'h0c145adfe9d;
    stim[49] = 42'h02ccb74647e;
    stim[50] = 42'h10bd7bba54a;
    stim[51] = 42'h1ffa8bf4548;
    stim[52] = 42'h016ac7c9414;
    stim[53] = 42'h2d82d01411d;
    stim[54] = 42'h2bda3e5f1a7;
    stim[55] = 42'h0de8b41865b;
    stim[56] = 42'h253bc871c72;
    stim[57] = 42'h15c643f2d44;
    stim[58] = 42'h1f1f5fb6e9f;
    stim[59] = 42'h1463cbf688d;
    stim[60] = 42'h0960b13d042;
    stim[61] = 42'h0309df7d7de;
    stim[62] = 42'h148426b39f7;
    stim[63] = 42'h2bbd9ac5768;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'hxxxxxxxxxxxxx;
      expv[2] = 51'hxxxxxxxxxxxxx;
      expv[3] = 51'hxxxxxxxxxxxxx;
      expv[4] = 51'hxxxxxxxxxxxxx;
      expv[5] = 51'hxxxxxxxxxx000;
      expv[6] = 51'hxxxxxxxxxx000;
      expv[7] = 51'hxxxxxxxxxx000;
      expv[8] = 51'h00df9efd960xx;
      expv[9] = 51'h00df9efd96000;
      expv[10] = 51'h00df9efd96000;
      expv[11] = 51'h3cb20b499c100;
      expv[12] = 51'h3cb20b499c000;
      expv[13] = 51'h3cb20b499c000;
      expv[14] = 51'h3cb20b499c000;
      expv[15] = 51'h3cb20b499c000;
      expv[16] = 51'h338f763858000;
      expv[17] = 51'h338f763858000;
      expv[18] = 51'h338f763858000;
      expv[19] = 51'h08fc526c34000;
      expv[20] = 51'h08fc526c34000;
      expv[21] = 51'h08fc526c34000;
      expv[22] = 51'h08fc526c34000;
      expv[23] = 51'h08fc526c34000;
      expv[24] = 51'h1327279f3a100;
      expv[25] = 51'h1327279f3a000;
      expv[26] = 51'h1327279f3a000;
      expv[27] = 51'h1327279f3a000;
      expv[28] = 51'h1327279f3a000;
      expv[29] = 51'h284a127faa200;
      expv[30] = 51'h284a127faa000;
      expv[31] = 51'h4cd36c6344020;
      expv[32] = 51'h4cd36c6344000;
      expv[33] = 51'h4cd36c6344000;
      expv[34] = 51'h4cd36c6344000;
      expv[35] = 51'h4c6ef7d7a9000;
      expv[36] = 51'h4c6ef7d7a8000;
      expv[37] = 51'h4c6ef7d7a8000;
      expv[38] = 51'h4c6ef7d7a8000;
      expv[39] = 51'h4c6ef7d7a8000;
      expv[40] = 51'h4c6ef7d7a8000;
      expv[41] = 51'h66f26fbd96020;
      expv[42] = 51'h66f26fbd96000;
      expv[43] = 51'h66f26fbd96000;
      expv[44] = 51'h66f26fbd96000;
      expv[45] = 51'h66f26fbd96000;
      expv[46] = 51'h66f26fbd96000;
      expv[47] = 51'h4538b03fcf000;
      expv[48] = 51'h4538b03fce000;
      expv[49] = 51'h60a2d6ff4e800;
      expv[50] = 51'h60a2d6ff4e000;
      expv[51] = 51'h60a2d6ff4e000;
      expv[52] = 51'h60a2d6ff4e000;
      expv[53] = 51'h0b563e4a0a001;
      expv[54] = 51'h0b563e4a0a000;
      expv[55] = 51'h0b563e4a0a000;
      expv[56] = 51'h0b563e4a0a000;
      expv[57] = 51'h0b563e4a0a000;
      expv[58] = 51'h2e321f96a2008;
      expv[59] = 51'h2e321f96a2000;
      expv[60] = 51'h2e321f96a2000;
      expv[61] = 51'h2e321f96a2000;
      expv[62] = 51'h184efbebee100;
      expv[63] = 51'h184efbebee000;
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
