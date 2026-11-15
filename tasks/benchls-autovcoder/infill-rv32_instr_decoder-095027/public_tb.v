// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_095027 dut (
    .ifu_qed_instruction(in_vec[31:0]),
    .shamt(out_vec[64:60]),
    .IS_SW(out_vec[59:59]),
    .imm12(out_vec[58:47]),
    .IS_R(out_vec[46:46]),
    .rd(out_vec[45:41]),
    .funct3(out_vec[40:38]),
    .opcode(out_vec[37:31]),
    .rs2(out_vec[30:26]),
    .funct7(out_vec[25:19]),
    .IS_I(out_vec[18:18]),
    .IS_LW(out_vec[17:17]),
    .imm5(out_vec[16:12]),
    .rs1(out_vec[11:7]),
    .imm7(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h0f22c4f5;
    stim[1] = 32'h37575bb6;
    stim[2] = 32'hed2f894e;
    stim[3] = 32'h4d5d9887;
    stim[4] = 32'h51e8d6a1;
    stim[5] = 32'h48fa5290;
    stim[6] = 32'h591f089e;
    stim[7] = 32'hcfebd7a0;
    stim[8] = 32'h6458a5d5;
    stim[9] = 32'h3fd75135;
    stim[10] = 32'ha2fe6660;
    stim[11] = 32'he6676f41;
    stim[12] = 32'h9cf3219f;
    stim[13] = 32'h093b047f;
    stim[14] = 32'h6ab964c4;
    stim[15] = 32'hb4bc854a;
    stim[16] = 32'h48dba667;
    stim[17] = 32'h05a5807e;
    stim[18] = 32'h02a09464;
    stim[19] = 32'h7f49f723;
    stim[20] = 32'h13b1391a;
    stim[21] = 32'hfa949992;
    stim[22] = 32'hb20a610c;
    stim[23] = 32'h8031e734;
    stim[24] = 32'hfd899fef;
    stim[25] = 32'h1ce4bfce;
    stim[26] = 32'hdee5425c;
    stim[27] = 32'h5848c815;
    stim[28] = 32'h5f0c0df0;
    stim[29] = 32'hdd3d7174;
    stim[30] = 32'h264ef2d7;
    stim[31] = 32'h0af8edee;
    stim[32] = 32'h6d0b58ea;
    stim[33] = 32'he1a994fd;
    stim[34] = 32'h30c35a10;
    stim[35] = 32'h0237e888;
    stim[36] = 32'h7e2d7da4;
    stim[37] = 32'hb8bec1d0;
    stim[38] = 32'h370d0007;
    stim[39] = 32'hbcf1afcd;
    stim[40] = 32'h1a28306f;
    stim[41] = 32'h125153d1;
    stim[42] = 32'hcd799d7b;
    stim[43] = 32'hcf09955f;
    stim[44] = 32'h2936eb3f;
    stim[45] = 32'he1028004;
    stim[46] = 32'h352ba737;
    stim[47] = 32'h4cd5fccc;
    stim[48] = 32'h8afded1a;
    stim[49] = 32'hcb5b09f8;
    stim[50] = 32'hb1378ffe;
    stim[51] = 32'h1df9af8b;
    stim[52] = 32'h2a45cf15;
    stim[53] = 32'h9b57de62;
    stim[54] = 32'h85914aef;
    stim[55] = 32'hc1978584;
    stim[56] = 32'hd4f6944b;
    stim[57] = 32'h26fe25f7;
    stim[58] = 32'h6247c741;
    stim[59] = 32'hca6a0b0d;
    stim[60] = 32'h223d4c71;
    stim[61] = 32'hf4464773;
    stim[62] = 32'h33f67544;
    stim[63] = 32'h125133db;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 65'h12079133ac8389287;
      expv[1] = 65'h151baaf5b54d9771b;
      expv[2] = 65'h1276924274bb12ff6;
      expv[3] = 65'h1526aa243d5311da6;
      expv[4] = 65'h1e28f1b50f940d8a8;
      expv[5] = 65'h0f2478b483d205a24;
      expv[6] = 65'h112c8a20f45611f2c;
      expv[7] = 65'h1e67f1f507b38fbe7;
      expv[8] = 65'h0532296aa9590b8b2;
      expv[9] = 65'h1d1fe855af4f8271f;
      expv[10] = 65'h0f51799b03e88ce51;
      expv[11] = 65'h067333da09b99e773;
      expv[12] = 65'h0f4e7868fbe70334e;
      expv[13] = 65'h13049903fcc208b04;
      expv[14] = 65'h0b35593a22da89935;
      expv[15] = 65'h0b5a594252ed0acda;
      expv[16] = 65'h0d24698b3b520cba4;
      expv[17] = 65'h1a02d003f68100582;
      expv[18] = 65'h0a015107228088081;
      expv[19] = 65'h143fa1dd1d1f8e9bf;
      expv[20] = 65'h1b09da4cd6c492109;
      expv[21] = 65'h097d4a64927e934fd;
      expv[22] = 65'h00590058602c82a59;
      expv[23] = 65'h034019d9a0e00e1c0;
      expv[24] = 65'h187ec3e77e3f1f9fe;
      expv[25] = 65'h0e0e73ee73871f48e;
      expv[26] = 65'h0e6f7092e3b78456f;
      expv[27] = 65'h042c2210a916108ac;
      expv[28] = 65'h102f836384179bc2f;
      expv[29] = 65'h136e985fa4f702d6e;
      expv[30] = 65'h041320beb90985e93;
      expv[31] = 65'h0f057b7b73c29b885;
      expv[32] = 65'h10368237541b11b36;
      expv[33] = 65'h1a70d127eeb8099f0;
      expv[34] = 65'h0c186294830c14318;
      expv[35] = 65'h03011a3840c091781;
      expv[36] = 65'h023f137d209f9bd3f;
      expv[37] = 65'h0b5c587282ee03edc;
      expv[38] = 65'h101b80003c0d80d1b;
      expv[39] = 65'h0f5e7bea6bef1f1de;
      expv[40] = 65'h020d100f78868080d;
      expv[41] = 65'h050928f6894487109;
      expv[42] = 65'h1766bb47ddf31a9e6;
      expv[43] = 65'h10678146fc338a9e7;
      expv[44] = 65'h13149ad9fcca16694;
      expv[45] = 65'h107080002438002f0;
      expv[46] = 65'h121a91c9bc8d0eb9a;
      expv[47] = 65'h0d266b3e6353195a6;
      expv[48] = 65'h0f457b58d3e29adc5;
      expv[49] = 65'h1565aa63c57293b65;
      expv[50] = 65'h13589be3f4ec1f7d8;
      expv[51] = 65'h1f0efbe85fc71f98e;
      expv[52] = 65'h041523d0a90a9e595;
      expv[53] = 65'h154dab9715669c7cd;
      expv[54] = 65'h1942cab37e6115142;
      expv[55] = 65'h1960c96026700b7e0;
      expv[56] = 65'h0f6a79065bf5086ea;
      expv[57] = 65'h0f13796bbbc98be13;
      expv[58] = 65'h043121d209188e7b1;
      expv[59] = 65'h066532c069b296a65;
      expv[60] = 65'h03111b1388c898d11;
      expv[61] = 65'h047a21d3993d0e67a;
      expv[62] = 65'h1f19f95e27cc8a619;
      expv[63] = 65'h050928eed94487109;
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
