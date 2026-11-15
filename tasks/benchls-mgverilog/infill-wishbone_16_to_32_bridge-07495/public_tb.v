// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 76;
  localparam OW = 78;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07495 dut (
    .wb_clk_i(clk),
    .wb_rst_i(in_vec[75:75]),
    .wb16_adr_i(in_vec[74:52]),
    .wb16_dat_i(in_vec[51:36]),
    .wb16_cyc_i(in_vec[35:35]),
    .wb16_stb_i(in_vec[34:34]),
    .wb16_we_i(in_vec[33:33]),
    .wbm_dat_i(in_vec[32:1]),
    .wbm_ack_i(in_vec[0:0]),
    .wb16_dat_o(out_vec[77:62]),
    .wb16_ack_o(out_vec[61:61]),
    .wbm_adr_o(out_vec[60:39]),
    .wbm_dat_o(out_vec[38:7]),
    .wbm_cyc_o(out_vec[6:6]),
    .wbm_stb_o(out_vec[5:5]),
    .wbm_we_o(out_vec[4:4]),
    .wbm_sel_o(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 76'hf007b0507e85755eec1;
    stim[1] = 76'hd2cfd608049da4e792a;
    stim[2] = 76'h5fc08e10cb44e365d79;
    stim[3] = 76'h20c4eb66f13ba67e75f;
    stim[4] = 76'h682753c38a72c4a01ca;
    stim[5] = 76'h10da366919d4014dae3;
    stim[6] = 76'h3c0f8ea17ecfc16627d;
    stim[7] = 76'h3106a4dc28e766326e3;
    stim[8] = 76'h669f10b00d18d51650b;
    stim[9] = 76'h76da686e7a150e411dc;
    stim[10] = 76'h1fe17745ed882ce3e4d;
    stim[11] = 76'h4e83a35a49344613857;
    stim[12] = 76'h1fe1b1afd7501817054;
    stim[13] = 76'h5b1654a691070850ef7;
    stim[14] = 76'h7f87d341096bde0dd1f;
    stim[15] = 76'h04009a2f006e1277cd4;
    stim[16] = 76'h6f75a9e19ef226a80e5;
    stim[17] = 76'h1b53f00d284c37a69de;
    stim[18] = 76'h30ebf2d6cc761e05c44;
    stim[19] = 76'h0e2ef602fd699f5cab0;
    stim[20] = 76'h7049b799d48913c48f2;
    stim[21] = 76'h51f9cb6fb6dc85160d5;
    stim[22] = 76'h0aff46d21459e8a9fcc;
    stim[23] = 76'h4e29709f75618f26278;
    stim[24] = 76'h21ff5231fe855d0a1a9;
    stim[25] = 76'h021db0466693299321f;
    stim[26] = 76'h7460d0366dd1ef1382a;
    stim[27] = 76'h5216b21426a0c2a3179;
    stim[28] = 76'h6d62b454e9cdbd6f1fb;
    stim[29] = 76'h3a84cc545cbc74f833d;
    stim[30] = 76'h5e770df2ee436331d30;
    stim[31] = 76'h698ddccf328b2bf9112;
    stim[32] = 76'h5e852e31fa79d2e713c;
    stim[33] = 76'h2a0cdcfca80f5ce92a4;
    stim[34] = 76'h61ba0856fecc3c91d4b;
    stim[35] = 76'h58b27a9e65430428faf;
    stim[36] = 76'h366ad8e92c6229144b7;
    stim[37] = 76'h06b29de6552ad26552f;
    stim[38] = 76'h06a932aad1230b43071;
    stim[39] = 76'h302d0cb3c6cf96f386a;
    stim[40] = 76'h58bee7d3e69e9b7fdae;
    stim[41] = 76'h52885744f99e2b8ecea;
    stim[42] = 76'h1f80465524207f961b6;
    stim[43] = 76'h7c3ae667aa83a927aba;
    stim[44] = 76'h540c6522fdb7db89ccc;
    stim[45] = 76'h19e22852795aeac61be;
    stim[46] = 76'h66110d9a84b88dc489e;
    stim[47] = 76'h7e8350eaff464cfc4a8;
    stim[48] = 76'h0aa7d8177d774230bb6;
    stim[49] = 76'h0a3ac120c74cf1e1f41;
    stim[50] = 76'h6b852c235a891de2995;
    stim[51] = 76'h77c61b6bba51f57f667;
    stim[52] = 76'h45c992632ba013a8f5a;
    stim[53] = 76'h68a97d3868da187391c;
    stim[54] = 76'h6ee01bfd021bf9b2dd7;
    stim[55] = 76'h5da08d09201cbe8018f;
    stim[56] = 76'h68b109cd280ef4a4832;
    stim[57] = 76'h7617b94b9bc2782a58d;
    stim[58] = 76'h0e1c2f51b0d2b655603;
    stim[59] = 76'h6fdd7a1c1057f33d153;
    stim[60] = 76'h0f648be440eefc19bd3;
    stim[61] = 76'h7b8b8745b9d65d23774;
    stim[62] = 76'h13aedf91c85b4b4ed25;
    stim[63] = 76'h671d561b0c191e19744;
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
      expv[0] = 78'h3dd81c01ec283fxxxxxf;
      expv[1] = 78'h0f2554b3f58402xxxxxf;
      expv[2] = 78'h0baf17f0238865xxxxxf;
      expv[3] = 78'hxxxxx8313ab378xxxxxf;
      expv[4] = 78'hxxxxxa09d4e1c5xxxxxf;
      expv[5] = 78'h1b5c64368db48cxxxxxf;
      expv[6] = 78'h0c4faf03e3d0bf50056f;
      expv[7] = 78'h24dc6c41a96e143f059f;
      expv[8] = 78'h2ca159a7c45806ee140f;
      expv[9] = 78'h023b9db69a373d6e140f;
      expv[10] = 78'h370a07f85da2f6ee140f;
      expv[11] = 78'h370a13a0e8ad24ee141f;
      expv[12] = 78'h370a07f86c57ebee140f;
      expv[13] = 78'h21ded6c5955348ee140f;
      expv[14] = 78'h370a1fe1f4a084ee141f;
      expv[15] = 78'h2f9a81002697806e141f;
      expv[16] = 78'h370a3bdd6a70cf6e147f;
      expv[17] = 78'h0d3bc6d4fc06946e140f;
      expv[18] = 78'h0b888c3afceb666e141f;
      expv[19] = 78'h3956038bbd817eee141f;
      expv[20] = 78'h370a1c126dccea6e140f;
      expv[21] = 78'h370a347e72b7db6e140f;
      expv[22] = 78'h13f982bfd1e90a6e140f;
      expv[23] = 78'h0c4f138a5c4fbaee141f;
      expv[24] = 78'h1435087fd498ff6e140f;
      expv[25] = 78'h2643c0876c23336e140f;
      expv[26] = 78'h27055d18341b36ee146f;
      expv[27] = 78'h062f1485ac8a136e141f;
      expv[28] = 78'h1e3f7b58ad2a74ee146f;
      expv[29] = 78'h30678ea1332a2e36f59f;
      expv[30] = 78'h1b7ad79dc3797736f58f;
      expv[31] = 78'h32225a6377679936f58f;
      expv[32] = 78'h0e2797a14b98fd36f59f;
      expv[33] = 78'h12548a83377e5436f58f;
      expv[34] = 78'h23a9786e822b7f36f5ef;
      expv[35] = 78'h11f5d62c9ecf32b0f20f;
      expv[36] = 78'h2896cd9ab6749630f21f;
      expv[37] = 78'h187901aca7732ab0f21f;
      expv[38] = 78'h060e01aa4cd568b0f21f;
      expv[39] = 78'h270d4c0b4359e330f26f;
      expv[40] = 78'h1879162fb9e9f330f20f;
      expv[41] = 78'h187914a215a27cb0f20f;
      expv[42] = 78'h2c36c7e011aa9230f21f;
      expv[43] = 78'h0f575f0eb9b3d530f20f;
      expv[44] = 78'h1879150319117eb0f21f;
      expv[45] = 78'h0c37c6788a293cb0f20f;
      expv[46] = 78'h18791984434d4230f21f;
      expv[47] = 78'h38951fa0d4757fb0f20f;
      expv[48] = 78'h2176c2a9f60bbeb0f21f;
      expv[49] = 78'h1879028eb01063b0f20f;
      expv[50] = 78'h05329ae14b11ad30f20f;
      expv[51] = 78'h18791df186b5dd30f20f;
      expv[52] = 78'h11eb517264b195b0f21f;
      expv[53] = 78'h18793a2a5f1c3430f20f;
      expv[54] = 78'h18791bb806fe8130f20f;
      expv[55] = 78'h1879176823049030f20f;
      expv[56] = 78'h18791a2c42669430f20f;
      expv[57] = 78'h18793d85ee25cdb0f20f;
      expv[58] = 78'h187923870ba8d830f20f;
      expv[59] = 78'h3a2a5bf75e8e0830f20f;
      expv[60] = 78'h187923d922f22030f27f;
      expv[61] = 78'h18793ee2e1a2dcb0f20f;
      expv[62] = 78'h187904ebb7c8e430f20f;
      expv[63] = 78'h32e899c7558d8630f20f;
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
