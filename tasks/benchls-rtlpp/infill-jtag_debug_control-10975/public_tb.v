// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10975 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[47:10]),
    .take_action_break_a(out_vec[9:9]),
    .take_action_break_b(out_vec[8:8]),
    .take_action_break_c(out_vec[7:7]),
    .take_action_ocimem_a(out_vec[6:6]),
    .take_action_ocimem_b(out_vec[5:5]),
    .take_action_tracectrl(out_vec[4:4]),
    .take_no_action_break_a(out_vec[3:3]),
    .take_no_action_break_b(out_vec[2:2]),
    .take_no_action_break_c(out_vec[1:1]),
    .take_no_action_ocimem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h15f196bfe1f;
    stim[1] = 42'h27adcbfa68a;
    stim[2] = 42'h241a0fa32d7;
    stim[3] = 42'h215ba09d392;
    stim[4] = 42'h19b9da68da1;
    stim[5] = 42'h1f2092d6b04;
    stim[6] = 42'h2358eb259f3;
    stim[7] = 42'h343dddbaa96;
    stim[8] = 42'h38af470ca19;
    stim[9] = 42'h1a2b75b79bc;
    stim[10] = 42'h03a014257ed;
    stim[11] = 42'h1031cedb1a4;
    stim[12] = 42'h143b5879f02;
    stim[13] = 42'h2dab8203be2;
    stim[14] = 42'h05b3e2323ed;
    stim[15] = 42'h014db5c20bf;
    stim[16] = 42'h1b9700dd440;
    stim[17] = 42'h22dd1de287f;
    stim[18] = 42'h25cb41fe55f;
    stim[19] = 42'h3292a421826;
    stim[20] = 42'h01e9b5e0c3b;
    stim[21] = 42'h0429fa19658;
    stim[22] = 42'h0c85035c92f;
    stim[23] = 42'h1ade3c99094;
    stim[24] = 42'h3b4de38308a;
    stim[25] = 42'h193f6d2bb05;
    stim[26] = 42'h353a27cd54a;
    stim[27] = 42'h2f5e7fe9b2b;
    stim[28] = 42'h2eb659c84a8;
    stim[29] = 42'h385c72beddc;
    stim[30] = 42'h25eefe0a9fa;
    stim[31] = 42'h0faeb804146;
    stim[32] = 42'h3384797ed2e;
    stim[33] = 42'h239f538c348;
    stim[34] = 42'h29b1d8e5bea;
    stim[35] = 42'h339b8f568b7;
    stim[36] = 42'h1e57b18135c;
    stim[37] = 42'h150121cd95a;
    stim[38] = 42'h267be181240;
    stim[39] = 42'h13104e44329;
    stim[40] = 42'h2e08af28cd5;
    stim[41] = 42'h061a52208c8;
    stim[42] = 42'h0e78f2fdd3e;
    stim[43] = 42'h013697dec90;
    stim[44] = 42'h0d02613ee35;
    stim[45] = 42'h3c5df303f94;
    stim[46] = 42'h0a1a6da602e;
    stim[47] = 42'h30cfb708c3e;
    stim[48] = 42'h2a97f833c26;
    stim[49] = 42'h03508cd35d2;
    stim[50] = 42'h3eb8d8d09f4;
    stim[51] = 42'h3f39f0e240a;
    stim[52] = 42'h382e6547bda;
    stim[53] = 42'h2f49591b9f6;
    stim[54] = 42'h25f40882971;
    stim[55] = 42'h32e99f82325;
    stim[56] = 42'h24b366d1886;
    stim[57] = 42'h3b828f101ab;
    stim[58] = 42'h3f9cdcfe242;
    stim[59] = 42'h016e1d41cc5;
    stim[60] = 42'h2c25fc0eda3;
    stim[61] = 42'h28573fe3a59;
    stim[62] = 42'h0cc3ca339cd;
    stim[63] = 42'h3fd120e2f52;
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
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'hxxxxxxxxxxxx;
      expv[2] = 48'hxxxxxxxxxxxx;
      expv[3] = 48'hxxxxxxxxxxxx;
      expv[4] = 48'hxxxxxxxxxxxx;
      expv[5] = 48'hxxxxxxxxxx00;
      expv[6] = 48'hxxxxxxxxxx00;
      expv[7] = 48'hxxxxxxxxxx00;
      expv[8] = 48'hxxxxxxxxxx00;
      expv[9] = 48'hxxxxxxxxxx00;
      expv[10] = 48'ha2b75b79bc00;
      expv[11] = 48'ha2b75b79bc00;
      expv[12] = 48'ha2b75b79bc00;
      expv[13] = 48'ha2b75b79bc00;
      expv[14] = 48'ha2b75b79bc00;
      expv[15] = 48'ha2b75b79bc00;
      expv[16] = 48'h14db5c20bc08;
      expv[17] = 48'h14db5c20bc00;
      expv[18] = 48'h14db5c20bc00;
      expv[19] = 48'h5cb41fe55c04;
      expv[20] = 48'h5cb41fe55c00;
      expv[21] = 48'h1e9b5e0c3840;
      expv[22] = 48'h1e9b5e0c3800;
      expv[23] = 48'h1e9b5e0c3800;
      expv[24] = 48'h1e9b5e0c3800;
      expv[25] = 48'h1e9b5e0c3800;
      expv[26] = 48'h93f6d2bb0400;
      expv[27] = 48'h93f6d2bb0400;
      expv[28] = 48'hf5e7fe9b2800;
      expv[29] = 48'hf5e7fe9b2800;
      expv[30] = 48'h85c72bedde00;
      expv[31] = 48'h85c72beddc00;
      expv[32] = 48'h85c72beddc00;
      expv[33] = 48'h85c72beddc00;
      expv[34] = 48'h39f538c34808;
      expv[35] = 48'h39f538c34800;
      expv[36] = 48'h39f538c34800;
      expv[37] = 48'h39f538c34800;
      expv[38] = 48'h50121cd95804;
      expv[39] = 48'h50121cd95800;
      expv[40] = 48'h50121cd95800;
      expv[41] = 48'he08af28cd480;
      expv[42] = 48'he08af28cd400;
      expv[43] = 48'he08af28cd400;
      expv[44] = 48'he08af28cd400;
      expv[45] = 48'he08af28cd400;
      expv[46] = 48'hc5df303f9401;
      expv[47] = 48'hc5df303f9400;
      expv[48] = 48'hc5df303f9400;
      expv[49] = 48'hc5df303f9400;
      expv[50] = 48'h3508cd35d000;
      expv[51] = 48'h3508cd35d000;
      expv[52] = 48'h3508cd35d000;
      expv[53] = 48'h3508cd35d000;
      expv[54] = 48'h3508cd35d000;
      expv[55] = 48'h5f4088297000;
      expv[56] = 48'h5f4088297000;
      expv[57] = 48'h5f4088297000;
      expv[58] = 48'h5f4088297000;
      expv[59] = 48'h5f4088297000;
      expv[60] = 48'h16e1d41cc400;
      expv[61] = 48'h16e1d41cc400;
      expv[62] = 48'h16e1d41cc400;
      expv[63] = 48'h16e1d41cc400;
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
