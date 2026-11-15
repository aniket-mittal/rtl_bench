// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 102;
  localparam OW = 133;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_145321 dut (
    .clk(clk),
    .rst(in_vec[101:101]),
    .rcn_in(in_vec[100:32]),
    .rdata(in_vec[31:0]),
    .rcn_out(out_vec[132:64]),
    .cs(out_vec[63:63]),
    .wr(out_vec[62:62]),
    .mask(out_vec[61:54]),
    .addr(out_vec[53:32]),
    .wdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 102'h320f81e1d9c0ea1ba3feca2ed4;
    stim[1] = 102'h2990fded8a4f22280164d11ad2;
    stim[2] = 102'h023e667a6a34fcf9ae740c0985;
    stim[3] = 102'h106acfa3bb936139f3185f69e1;
    stim[4] = 102'h1fb4a52ba1dbd6a8ef8d06fd61;
    stim[5] = 102'h1583d7dc624db1eb503a423d4d;
    stim[6] = 102'h02bee1ab9a70f48fb2ba961ded;
    stim[7] = 102'h05629d35d39796afbabf075a16;
    stim[8] = 102'h0b2985de7560e5e5f0bf9da954;
    stim[9] = 102'h044c99eb9879f21817a6b0c43e;
    stim[10] = 102'h0e10115a3318e94d7d50108d2e;
    stim[11] = 102'h08283af0bfabb2d3c8666f9d8a;
    stim[12] = 102'h0f7235423b33a70c6128c70f8f;
    stim[13] = 102'h1200e635a30e09b33e91a3323f;
    stim[14] = 102'h123bb54cff9e56e9eb20744b21;
    stim[15] = 102'h023485607eac40502a4d907d02;
    stim[16] = 102'h11fbb2a7f2bb922bddd84c8404;
    stim[17] = 102'h09b70c112abdf1dbb11bc45c04;
    stim[18] = 102'h0c6b37d2ec07c2333cfcf5572d;
    stim[19] = 102'h0e8fd9b3e1a97576fa1aaca87c;
    stim[20] = 102'h0873a524c5470c7e10e8e83e7d;
    stim[21] = 102'h1a3ea4f218a157bd03c84d1b41;
    stim[22] = 102'h027bcad7835a5e3bf3bfa64494;
    stim[23] = 102'h00b3b3a6393b1c0fadd0b15a03;
    stim[24] = 102'h11f4ae68a14df38125db55cfe7;
    stim[25] = 102'h1b8b3da763f809a85181087f1b;
    stim[26] = 102'h1c0f78fab88a438e3cd054fd21;
    stim[27] = 102'h14a01489d87750fa8a275bd2b2;
    stim[28] = 102'h00a3a4867e279570aae94e1109;
    stim[29] = 102'h0497adda85771e9760b56d28a4;
    stim[30] = 102'h10d422288b4d559e376ace40aa;
    stim[31] = 102'h09ed78a0b73789a7d768d0f263;
    stim[32] = 102'h08dc1f525594aa2edb36f93aee;
    stim[33] = 102'h04b9aed77196fb5545d69b1be3;
    stim[34] = 102'h0ee17172648281661fdbc3ae15;
    stim[35] = 102'h10383ac800e83b2e4bc29fb58e;
    stim[36] = 102'h0ed4f18b9993b64b10265135c0;
    stim[37] = 102'h10e783b7c7ec122470fe4a1319;
    stim[38] = 102'h011c1a12bc1312045416ba0b6f;
    stim[39] = 102'h02ded4857ec8092c794ecabe10;
    stim[40] = 102'h112a45f2259e85f2de2b61be88;
    stim[41] = 102'h1bc9dd67db05216fd225ecb78f;
    stim[42] = 102'h18ab15ee9e9ed5c8ca016e3f61;
    stim[43] = 102'h133bcb09a738d084d5daf86f24;
    stim[44] = 102'h16deeeb7fa2f7fd7980fcf5a25;
    stim[45] = 102'h055608eaa4bc2cabc4a55a43a3;
    stim[46] = 102'h134c4daa4f3ad2c255ff8aed26;
    stim[47] = 102'h27f09b211a29f37608fe08491c;
    stim[48] = 102'h06db5ced6d6f24c74920609cf7;
    stim[49] = 102'h17dfde328e062805f6bbb71f93;
    stim[50] = 102'h0621c6bc6d760e9ca134248e09;
    stim[51] = 102'h1b18d65f02d976e6563b0ffef8;
    stim[52] = 102'h06cabb37bb58fdd8b1ea394a24;
    stim[53] = 102'h11700c8bab8285603e5545f2b8;
    stim[54] = 102'h0bf52ed80f6667ea1523c114b7;
    stim[55] = 102'h11f57d9ea110d799bdcda92820;
    stim[56] = 102'h06bd9c32c45de24bd22a5b1c39;
    stim[57] = 102'h17daf0deecfdcedc94e9535eed;
    stim[58] = 102'h171d8f54d5eecdb4d2802a72e2;
    stim[59] = 102'h0e82e1d6e2201f8fdd4c6e8a9a;
    stim[60] = 102'h0f6c9c20a7cd08d80f7eaeac79;
    stim[61] = 102'h09eb164f8ad98bc2b8ec61faa8;
    stim[62] = 102'h13a4e17f20ec30eebaa504a29e;
    stim[63] = 102'h1d8b6635fbef4f4b7a168b1b7f;
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
      expv[0] = 133'h0000000000000000000000000000000000;
      expv[1] = 133'h0000000000000000000000000000000000;
      expv[2] = 133'h0000000000000000000000000000000000;
      expv[3] = 133'h00000000000000000023599e9a34fcf9ae;
      expv[4] = 133'h0000000000000000003933e8ee936139f3;
      expv[5] = 133'h0000000000000000001da94ae8dbd6a8ef;
      expv[6] = 133'h00000000000000000024f5f7184db1eb50;
      expv[7] = 133'h00000000000000000027386ae670f48fb2;
      expv[8] = 133'h00000000000000000039674d749796afba;
      expv[9] = 133'h0000000000000000001621779d60e5e5f0;
      expv[10] = 133'h00000000000000000007a67ae679f21817;
      expv[11] = 133'h0000000000000000003184568c18e94d7d;
      expv[12] = 133'h0000000000000000003a8ebc2fabb2d3c8;
      expv[13] = 133'h000000000000000000330d508e33a70c61;
      expv[14] = 133'h00000000000000000030f98d680e09b33e;
      expv[15] = 133'h00000000000000000039ed533f9e56e9eb;
      expv[16] = 133'h0000000000000000002ae1581fac40502a;
      expv[17] = 133'h0000000000000000002baca9fcbb922bdd;
      expv[18] = 133'h0000000000000000002bc3044abdf1dbb1;
      expv[19] = 133'h000000000000000000004df4bb07c2333c;
      expv[20] = 133'h0000000000000000001ab66cf8a97576fa;
      expv[21] = 133'h00000000000000000014694931470c7e10;
      expv[22] = 133'h0000000000000000000a293c86a157bd03;
      expv[23] = 133'h00000000000000000035b2b5e05a5e3bf3;
      expv[24] = 133'h00000000000000000013ace98e3b1c0fad;
      expv[25] = 133'h00000000000000000014eb9a284df38125;
      expv[26] = 133'h0000000000000000003f8f69d8f809a851;
      expv[27] = 133'h000000000000000000089e3eae8a438e3c;
      expv[28] = 133'h000000000000000000074522767750fa8a;
      expv[29] = 133'h0000000000000000002269219f279570aa;
      expv[30] = 133'h000000000000000000176b76a1771e9760;
      expv[31] = 133'h00000000000000000034c88a224d559e37;
      expv[32] = 133'h000000000000000000335e282d3789a7d7;
      expv[33] = 133'h0000000000000000001947d49594aa2edb;
      expv[34] = 133'h000000000000000000196bb5dc96fb5545;
      expv[35] = 133'h000000000000000000081c5c998281661f;
      expv[36] = 133'h0000000000000000000e8eb200e83b2e4b;
      expv[37] = 133'h000000000000000000193c62e693b64b10;
      expv[38] = 133'h0000000000000000003ee0edf1ec122470;
      expv[39] = 133'h000000000000000000010684af13120454;
      expv[40] = 133'h0000000000000000002cb5215fc8092c79;
      expv[41] = 133'h00000000000000000019d17c899e85f2de;
      expv[42] = 133'h000000000000000000307759f605216fd2;
      expv[43] = 133'h00000000000000000029c57ba79ed5c8ca;
      expv[44] = 133'h00000000000000000033b2c26938d084d5;
      expv[45] = 133'h00000000000000000022fbadfe2f7fd798;
      expv[46] = 133'h0000000000000000000bc23aa9bc2cabc4;
      expv[47] = 133'h0000000000000000000000000000000000;
      expv[48] = 133'h0000000000000000000000000000000000;
      expv[49] = 133'h00000000000000000016d73b5b6f24c749;
      expv[50] = 133'h00000000000000000020778ca3062805f6;
      expv[51] = 133'h0000000000000000001771af1b760e9ca1;
      expv[52] = 133'h0000000000000000002db597c0d976e656;
      expv[53] = 133'h00000000000000000035aecdee58fdd8b1;
      expv[54] = 133'h000000000000000000380322ea8285603e;
      expv[55] = 133'h000000000000000000364bb6036667ea15;
      expv[56] = 133'h000000000000000000111f67a810d799bd;
      expv[57] = 133'h00000000000000000005e70cb15de24bd2;
      expv[58] = 133'h0000000000000000000ffc37bbfdcedc94;
      expv[59] = 133'h0000000000000000001ee3d535eecdb4d2;
      expv[60] = 133'h000000000000000000223875b8201f8fdd;
      expv[61] = 133'h0000000000000000003ce70829cd08d80f;
      expv[62] = 133'h0000000000000000002d8593e2d98bc2b8;
      expv[63] = 133'h0000000000000000000ef85fc8ec30eeba;
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
