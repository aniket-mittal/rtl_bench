// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 97;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04769 dut (
    .Ax(in_vec[96:81]),
    .Ay(in_vec[80:65]),
    .Az(in_vec[64:49]),
    .Bx(in_vec[48:33]),
    .By(in_vec[32:17]),
    .Bz(in_vec[16:1]),
    .ABn(in_vec[0:0]),
    .Cx(out_vec[47:32]),
    .Cy(out_vec[31:16]),
    .Cz(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 97'h01817d34ef1b96b993655972f;
    stim[1] = 97'h0e2c2b3599a465bd273208072;
    stim[2] = 97'h1a2425f1d62089cbaf5d23c86;
    stim[3] = 97'h110d651d435e6dc18dfdc8a02;
    stim[4] = 97'h09a10f845f74095df2e6b8d07;
    stim[5] = 97'h1a1fdd231bfb73890344d0dfb;
    stim[6] = 97'h1a4910f7c404df186184b58e5;
    stim[7] = 97'h141186224c406226c3a36d002;
    stim[8] = 97'h03aeb5b45013ff8b3473ba51b;
    stim[9] = 97'h1b6dce1bb6c2afe00b818eaff;
    stim[10] = 97'h0c01fca5c6bf5c7fb7eecfc6e;
    stim[11] = 97'h0f4841eaee81be36a83514127;
    stim[12] = 97'h094bd34766ce6486552d9a887;
    stim[13] = 97'h0616f98cda9b9b509cc55812d;
    stim[14] = 97'h0b44c9ef01c7fbef2c8e2d31a;
    stim[15] = 97'h0769ac7a5d20372a0a492e149;
    stim[16] = 97'h1c4912b78c5a7924d3c5293bd;
    stim[17] = 97'h08689cbd18ed63d01b3cabee5;
    stim[18] = 97'h02d6ffae841a3a5cc82d09f7e;
    stim[19] = 97'h1c052781ae5507482990b8b66;
    stim[20] = 97'h02c9563fed531e9cadbc44292;
    stim[21] = 97'h0b892dbe7a25984be21ae83a1;
    stim[22] = 97'h16bed99cfa3a932b3218dc23c;
    stim[23] = 97'h0c8f6537cc4291d97e2a2c0d0;
    stim[24] = 97'h067a0d986fbfe0aa58537f504;
    stim[25] = 97'h1d87519cdc2b13423109aae7e;
    stim[26] = 97'h1c2dd31dfc0812b592f72c621;
    stim[27] = 97'h04207133eb84ad59be8e7adb0;
    stim[28] = 97'h0577ddef8598d5e8af4a81438;
    stim[29] = 97'h1a493018541a11191ccfe98d4;
    stim[30] = 97'h1e95fff09b1853d2bf5b41ccc;
    stim[31] = 97'h037f30e11a878ffac3565b121;
    stim[32] = 97'h1b5595c1029c50ecba99b3835;
    stim[33] = 97'h03e1068ea544a3cae1ed86377;
    stim[34] = 97'h0ed0a7bc551ac0d0aa176dc38;
    stim[35] = 97'h0d399b5aaaffa7bff67fdfd94;
    stim[36] = 97'h0f710bedf3b8ea3022ca7a533;
    stim[37] = 97'h173c6588ac74e2f4ea1b3a1a8;
    stim[38] = 97'h02f6935ee912ada8bf881ee66;
    stim[39] = 97'h02ee27da1dee3f2100e047118;
    stim[40] = 97'h0b714bd77848208910182562b;
    stim[41] = 97'h0bbabeb0c5524dfc2769d7806;
    stim[42] = 97'h18c8ea36f0bae82bcf74a7724;
    stim[43] = 97'h1311b615d329660d77f6ca658;
    stim[44] = 97'h181917251ac8b9148f94412f5;
    stim[45] = 97'h11d221754d191bb72e3b74b9e;
    stim[46] = 97'h0a900064a4ca091e627037ddf;
    stim[47] = 97'h0fd706ad2318442b4a9216adb;
    stim[48] = 97'h1eca04dd04294d221743aca03;
    stim[49] = 97'h10d6e6d79c47d30abc4f0ab9f;
    stim[50] = 97'h04d6b79a69ee24824c68fbd91;
    stim[51] = 97'h06eae011966dc3f373d7d1c59;
    stim[52] = 97'h07506b1ecf27e7e5fa7833a39;
    stim[53] = 97'h100e5dc3ca5b843b281db16d4;
    stim[54] = 97'h19a814af57c01c9e3600792bb;
    stim[55] = 97'h09ea4ac9c7b542d5c8a49b878;
    stim[56] = 97'h1a4f20fe7c5a2c40a6fe289dc;
    stim[57] = 97'h1f3a7b055ff1e7920d6bbc2c2;
    stim[58] = 97'h04dddc1c5a0557de81bb2d201;
    stim[59] = 97'h0fcfc87e43774d8647ba37678;
    stim[60] = 97'h1cc492efead3af713c94f3a52;
    stim[61] = 97'h1c803b70c459d5a432aa0f6eb;
    stim[62] = 97'h0a3bef1908ba2cc4559e331ed;
    stim[63] = 97'h1c04ec9277c7122d769c5824c;
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
      expv[0] = 48'h0c0be9a778dc;
      expv[1] = 48'h2de939904039;
      expv[2] = 48'h4e5d7ae91e43;
      expv[3] = 48'h6e0c6fee4501;
      expv[4] = 48'h4d087c22fba0;
      expv[5] = 48'hd0fee918dfdb;
      expv[6] = 48'hd24887be2026;
      expv[7] = 48'h11361d1b6801;
      expv[8] = 48'h1d75ada2809f;
      expv[9] = 48'hdb6e70ddb615;
      expv[10] = 48'he3fdbf767e37;
      expv[11] = 48'h7a420f57740d;
      expv[12] = 48'h4a5e9a3b3673;
      expv[13] = 48'h30b7cc66d4dc;
      expv[14] = 48'hdf796471698d;
      expv[15] = 48'h3b4d63d2e901;
      expv[16] = 48'he24895bc62d3;
      expv[17] = 48'h4344e5e8c76b;
      expv[18] = 48'hd2e641684fbf;
      expv[19] = 48'h3a414c85c5b3;
      expv[20] = 48'hf4e56de22149;
      expv[21] = 48'h5c496df3d12c;
      expv[22] = 48'h995990c6e11e;
      expv[23] = 48'h8ecbf1516068;
      expv[24] = 48'h0552c29bfa82;
      expv[25] = 48'h9a11884d573f;
      expv[26] = 48'he16e98efe040;
      expv[27] = 48'h6acdf473d6d8;
      expv[28] = 48'haf457a540a1c;
      expv[29] = 48'h88c8e67f4c6a;
      expv[30] = 48'h9e95fada0e66;
      expv[31] = 48'h1bf98708d43c;
      expv[32] = 48'hdaacae0814e2;
      expv[33] = 48'h1f0834752a25;
      expv[34] = 48'h068550bb6e1c;
      expv[35] = 48'h3dffb3fefeca;
      expv[36] = 48'h7b885f6f9dc7;
      expv[37] = 48'h17a750d9d0d4;
      expv[38] = 48'h6d45fc40f733;
      expv[39] = 48'hf9080702388c;
      expv[40] = 48'h5b8a5ebbc241;
      expv[41] = 48'h6fe13b4ebc03;
      expv[42] = 48'h415e7ba53b92;
      expv[43] = 48'h306bbfb6532c;
      expv[44] = 48'hc0c8b928d645;
      expv[45] = 48'hddb971dba5cf;
      expv[46] = 48'h548003252650;
      expv[47] = 48'h7eb8356918c2;
      expv[48] = 48'hf65026e8214a;
      expv[49] = 48'h86b736bce23e;
      expv[50] = 48'h26b5bcd34f71;
      expv[51] = 48'h3757008cb36e;
      expv[52] = 48'h3a8358f6793f;
      expv[53] = 48'h21d940ed8b6a;
      expv[54] = 48'hcd40a57abe00;
      expv[55] = 48'h16ae4524dc3c;
      expv[56] = 48'h620537f144ee;
      expv[57] = 48'h3c906b5de161;
      expv[58] = 48'h26eee0e2d02a;
      expv[59] = 48'h6c323dd1bb3c;
      expv[60] = 48'h7b89e4a79d29;
      expv[61] = 48'he401db8622ce;
      expv[62] = 48'h51df78c845d1;
      expv[63] = 48'h916bb4e2c126;
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
