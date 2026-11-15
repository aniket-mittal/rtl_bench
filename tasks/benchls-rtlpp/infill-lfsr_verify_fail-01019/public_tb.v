// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 62;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01019 dut (
    .clk(clk),
    .arst(in_vec[61:61]),
    .verify(in_vec[60:60]),
    .load(in_vec[59:59]),
    .load_d(in_vec[58:1]),
    .evolve(in_vec[0:0]),
    .q(out_vec[65:2]),
    .verify_fail(out_vec[1:1]),
    .verify_pass(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 62'h2131989536058dfc;
    stim[1] = 62'h364476b425fbaec6;
    stim[2] = 62'h1c39e3ac1b8a7f3a;
    stim[3] = 62'h110a9e1566097a2e;
    stim[4] = 62'h3d9d91eed3903c14;
    stim[5] = 62'h053c7357f12f7461;
    stim[6] = 62'h121d313a4606dea2;
    stim[7] = 62'h041f39515a4e9205;
    stim[8] = 62'h196a1b98f4271c4d;
    stim[9] = 62'h0f9f167371b19bd4;
    stim[10] = 62'h1b99aab34cf7ff57;
    stim[11] = 62'h1fcab3b47b807c39;
    stim[12] = 62'h053b38a276a07093;
    stim[13] = 62'h1693d2e137f35d38;
    stim[14] = 62'h06f39b8f738f470c;
    stim[15] = 62'h02d14c1e730df80e;
    stim[16] = 62'h02d88f66857acf01;
    stim[17] = 62'h140ed4b1fa11f3dc;
    stim[18] = 62'h1a5ce9c074f0d5f2;
    stim[19] = 62'h11c9bf6725d47a52;
    stim[20] = 62'h117f74950dda9aed;
    stim[21] = 62'h19fc70c36271c92d;
    stim[22] = 62'h11e1ca2da6189316;
    stim[23] = 62'h00f5e1316f2aee93;
    stim[24] = 62'h0d95519d18a37205;
    stim[25] = 62'h02e3bd0f6a3cb23b;
    stim[26] = 62'h04463a4c7306efcb;
    stim[27] = 62'h1fc1a5009e1191d6;
    stim[28] = 62'h137f509b116424b0;
    stim[29] = 62'h129fdb33d8bf6bd7;
    stim[30] = 62'h112ebfc2fdaff58e;
    stim[31] = 62'h1718e3cf6d571d26;
    stim[32] = 62'h14df27c8b3b34d03;
    stim[33] = 62'h1b34a3ac8d62b393;
    stim[34] = 62'h146d54ab4fa76908;
    stim[35] = 62'h05ead17030049240;
    stim[36] = 62'h1e6d98f43bd0c217;
    stim[37] = 62'h10e98746b7107758;
    stim[38] = 62'h037c29eb134b468f;
    stim[39] = 62'h1c052ce984026433;
    stim[40] = 62'h04f9483688ca34cb;
    stim[41] = 62'h1b096ca1448a104e;
    stim[42] = 62'h14674bb0e3ec4421;
    stim[43] = 62'h174aa2a8919f134d;
    stim[44] = 62'h1e11bd5141298dfe;
    stim[45] = 62'h1d8ba8b6e087774b;
    stim[46] = 62'h1b963f433cf9bc27;
    stim[47] = 62'h0e99228db798daa2;
    stim[48] = 62'h17d67899e52e9911;
    stim[49] = 62'h15b71b60fdbb4c30;
    stim[50] = 62'h05baf4e4f83a5753;
    stim[51] = 62'h14464d6f26fce8ab;
    stim[52] = 62'h141195a4a06e9c97;
    stim[53] = 62'h0b517f041e3d14b7;
    stim[54] = 62'h0629eb9c39341298;
    stim[55] = 62'h15504d3174c0bf3b;
    stim[56] = 62'h189107bd7a9fa99d;
    stim[57] = 62'h02959fa5959a18c6;
    stim[58] = 62'h15486b31a40c0c01;
    stim[59] = 62'h14432653c3f22df8;
    stim[60] = 62'h18576f29aa77a930;
    stim[61] = 62'h015fe6f46c19c4ec;
    stim[62] = 62'h059b3e9c89ee4828;
    stim[63] = 62'h125ff236fb47200e;
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
      expv[0] = 66'h123456789abcdef84;
      expv[1] = 66'h123456789abcdef84;
      expv[2] = 66'h123456789abcdef84;
      expv[3] = 66'h21cf1d60dc53f9d2a;
      expv[4] = 66'h123456789abcdef84;
      expv[5] = 66'h123456789abcdef84;
      expv[6] = 66'h3c20e79b5fcfffd00;
      expv[7] = 66'h3c20e79b5fcfffd02;
      expv[8] = 66'h3e8679285382f8fdc;
      expv[9] = 66'h0b50dcc7a138e26b6;
      expv[10] = 66'h3cf8b39b8d8cdea80;
      expv[11] = 66'h1ccd559a67bffabc2;
      expv[12] = 66'h3e559da3dc03e1c4e;
      expv[13] = 66'h12df6f34895dcfeac;
      expv[14] = 66'h12df6f34895dcfeae;
      expv[15] = 66'h12df6f34895dcfeac;
      expv[16] = 66'h12df6f34895dcfeac;
      expv[17] = 66'h1ec976bd82ce685ac;
      expv[18] = 66'h1ec976bd82ce685ae;
      expv[19] = 66'h12e74e03a786af98a;
      expv[20] = 66'h12e74e03a786af98a;
      expv[21] = 66'h3e9c8db6d0d6df34e;
      expv[22] = 66'h0fe3861b138e496fe;
      expv[23] = 66'h0fe3861b138e496fe;
      expv[24] = 66'h0ec69a563c0fd6c70;
      expv[25] = 66'h2caa8ce8c51b9022c;
      expv[26] = 66'h3b290d1103125aa4c;
      expv[27] = 66'h284560f58d4623fbc;
      expv[28] = 66'h3e0d2804f08c8ebfa;
      expv[29] = 66'h3e0d2804f08c8ebfa;
      expv[30] = 66'h0aab18215c36f9d2e;
      expv[31] = 66'h0aab18215c36f9d2e;
      expv[32] = 66'h0aab18215c36f9d2e;
      expv[33] = 66'h287e65a4a86e88716;
      expv[34] = 66'h19a51d646b159c9ca;
      expv[35] = 66'h19a51d646b159c9ca;
      expv[36] = 66'h19a51d646b159c9c8;
      expv[37] = 66'h336cc7a1de8610b3a;
      expv[38] = 66'h336cc7a1de8610b3a;
      expv[39] = 66'h188ce456c6b5352e8;
      expv[40] = 66'h2029674c20132196a;
      expv[41] = 66'h1219f54b29ec564e0;
      expv[42] = 66'h184b650a2450827c2;
      expv[43] = 66'h0691e38dec2dbcc6a;
      expv[44] = 66'h3fa0b802861070dfe;
      expv[45] = 66'h308dea8a094c6ff92;
      expv[46] = 66'h2c5d45b7043bba506;
      expv[47] = 66'h1cb1fa19e7cde1332;
      expv[48] = 66'h34c9146dbcc6d515c;
      expv[49] = 66'h293c96c51a673c57e;
      expv[50] = 66'h293c96c51a673c57e;
      expv[51] = 66'h05117f3e3645370f0;
      expv[52] = 66'h383345e38f3da545e;
      expv[53] = 66'h0bcf03a944fecf75a;
      expv[54] = 66'h1a8bf820f1e8a5b6c;
      expv[55] = 66'h1a8bf820f1e8a5b6c;
      expv[56] = 66'h231dd97717ef560a2;
      expv[57] = 66'h04883debd4fd4ceae;
      expv[58] = 66'h04883debd4fd4ceac;
      expv[59] = 66'h35a6806ceab877bda;
      expv[60] = 66'h35a6806ceab877bda;
      expv[61] = 66'h02bb794d53bd49822;
      expv[62] = 66'h02bb794d53bd49820;
      expv[63] = 66'h02bb794d53bd49820;
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
