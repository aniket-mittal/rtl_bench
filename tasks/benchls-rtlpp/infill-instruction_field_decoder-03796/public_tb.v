// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_03796 dut (
    .instruction(in_vec[31:0]),
    .r_dst(out_vec[36:32]),
    .r_src(out_vec[31:27]),
    .r_tgt(out_vec[26:22]),
    .immed(out_vec[21:6]),
    .opcode(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hef03781f;
    stim[1] = 32'ha325fed9;
    stim[2] = 32'h23c729f7;
    stim[3] = 32'hb3ab65d4;
    stim[4] = 32'ha32fb4aa;
    stim[5] = 32'ha13599b8;
    stim[6] = 32'hb9a4e603;
    stim[7] = 32'ha5f533c6;
    stim[8] = 32'h5214c3db;
    stim[9] = 32'hf5bd1a4a;
    stim[10] = 32'hddfe932a;
    stim[11] = 32'hb514f379;
    stim[12] = 32'hf7533511;
    stim[13] = 32'h8bf4e0a0;
    stim[14] = 32'h5e72eb6e;
    stim[15] = 32'he6badd5b;
    stim[16] = 32'he62abbdc;
    stim[17] = 32'h1244c683;
    stim[18] = 32'h9706170f;
    stim[19] = 32'h45d7f22e;
    stim[20] = 32'h490cd355;
    stim[21] = 32'hbfe72880;
    stim[22] = 32'ha679f98c;
    stim[23] = 32'h06ff8638;
    stim[24] = 32'h5274e100;
    stim[25] = 32'h44d55d9d;
    stim[26] = 32'he80a1ad3;
    stim[27] = 32'h2668bc4f;
    stim[28] = 32'h55b13439;
    stim[29] = 32'hea8f300d;
    stim[30] = 32'h794cbf97;
    stim[31] = 32'h2c26c2bd;
    stim[32] = 32'h7a17c4ee;
    stim[33] = 32'h2755691f;
    stim[34] = 32'hbf98829f;
    stim[35] = 32'hc9659751;
    stim[36] = 32'ha4e3fa92;
    stim[37] = 32'h83eaa1d7;
    stim[38] = 32'h2a46b5c4;
    stim[39] = 32'hfe3fb434;
    stim[40] = 32'h0222a7c2;
    stim[41] = 32'h43393fd3;
    stim[42] = 32'h1cb56dc7;
    stim[43] = 32'h04244f4e;
    stim[44] = 32'h71b8a178;
    stim[45] = 32'h33015370;
    stim[46] = 32'he5613ec0;
    stim[47] = 32'hf375406f;
    stim[48] = 32'hcd73134d;
    stim[49] = 32'h09b8c3f1;
    stim[50] = 32'h731fa379;
    stim[51] = 32'hd4e5e619;
    stim[52] = 32'hd841f545;
    stim[53] = 32'hce009450;
    stim[54] = 32'h6979f4dd;
    stim[55] = 32'h5d01cdbc;
    stim[56] = 32'hb5fcf284;
    stim[57] = 32'h47cd8e7a;
    stim[58] = 32'h42b61cc7;
    stim[59] = 32'hc38f9963;
    stim[60] = 32'h8235e6aa;
    stim[61] = 32'h354fcb0c;
    stim[62] = 32'hc2168ec8;
    stim[63] = 32'h0e624b24;
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
      expv[0] = 37'h181bc007fb;
      expv[1] = 37'h192fc1b668;
      expv[2] = 37'h1e39407dc8;
      expv[3] = 37'h1d5b01752c;
      expv[4] = 37'h197d812aa8;
      expv[5] = 37'h09acc06e28;
      expv[6] = 37'h0d270180ee;
      expv[7] = 37'h0fa980f1a9;
      expv[8] = 37'h10a600f6d4;
      expv[9] = 37'h0de8c092bd;
      expv[10] = 37'h0ff480cab7;
      expv[11] = 37'h08a780de6d;
      expv[12] = 37'h1a9981447d;
      expv[13] = 37'h1fa7002822;
      expv[14] = 37'h139740db97;
      expv[15] = 37'h15d6c156f9;
      expv[16] = 37'h1155c0f739;
      expv[17] = 37'h122601a0c4;
      expv[18] = 37'h183081c3e5;
      expv[19] = 37'h0ebf808b91;
      expv[20] = 37'h086680d552;
      expv[21] = 37'h1f3940202f;
      expv[22] = 37'h13cfc06329;
      expv[23] = 37'h17fc018e01;
      expv[24] = 37'h13a7004014;
      expv[25] = 37'h06aac16751;
      expv[26] = 37'h0050c0b4fa;
      expv[27] = 37'h1345c113c9;
      expv[28] = 37'h0d89810e55;
      expv[29] = 37'h147980037a;
      expv[30] = 37'h0a65c1e5de;
      expv[31] = 37'h013600af4b;
      expv[32] = 37'h10be013b9e;
      expv[33] = 37'h1aab4047c9;
      expv[34] = 37'h1cc400a7ef;
      expv[35] = 37'h0b2c81d472;
      expv[36] = 37'h071fc0a4a9;
      expv[37] = 37'h1f550075e0;
      expv[38] = 37'h123581710a;
      expv[39] = 37'h11fd810d3f;
      expv[40] = 37'h111501f080;
      expv[41] = 37'h19c9c1f4d0;
      expv[42] = 37'h05ab4171c7;
      expv[43] = 37'h012241d381;
      expv[44] = 37'h0dc5005e1c;
      expv[45] = 37'h180a80dc0c;
      expv[46] = 37'h0b09c1b039;
      expv[47] = 37'h1baa001bfc;
      expv[48] = 37'h0b9880d373;
      expv[49] = 37'h0dc600fc42;
      expv[50] = 37'h18fd00de5c;
      expv[51] = 37'h072f018675;
      expv[52] = 37'h020f815176;
      expv[53] = 37'h1004811433;
      expv[54] = 37'h0bcf81375a;
      expv[55] = 37'h080e416f17;
      expv[56] = 37'h0fe780a12d;
      expv[57] = 37'h1e6c419e91;
      expv[58] = 37'h15b0c131d0;
      expv[59] = 37'h1c7cc058f0;
      expv[60] = 37'h11af01aaa0;
      expv[61] = 37'h0a7e40c30d;
      expv[62] = 37'h10b441b230;
      expv[63] = 37'h131240c903;
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
