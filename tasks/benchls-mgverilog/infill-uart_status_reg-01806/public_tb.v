// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 78;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01806 dut (
    .clk_i(clk),
    .cadr_i(in_vec[77:66]),
    .cdat_i(in_vec[65:2]),
    .coe_i(in_vec[1:1]),
    .cwe_i(in_vec[0:0]),
    .cvalid_o(out_vec[64:64]),
    .cdat_o(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 78'h32aa9a99a62059510a9e;
    stim[1] = 78'h1a2f2eb598cfcdad837a;
    stim[2] = 78'h206a4f30bc45845702d1;
    stim[3] = 78'h287100525daea15fa893;
    stim[4] = 78'h0d7628fd2ed40feacdae;
    stim[5] = 78'h309b4344fadecf35e553;
    stim[6] = 78'h1e057eab104c39cf5ebe;
    stim[7] = 78'h2a9c09ddd25a1b4a2216;
    stim[8] = 78'h3f35ead2d3d9eb4ad252;
    stim[9] = 78'h1c9dfbe6171c37b832ec;
    stim[10] = 78'h3443df12f7e417acab6c;
    stim[11] = 78'h2b61f4dc2366b4e370e4;
    stim[12] = 78'h1150a7d085caf1069101;
    stim[13] = 78'h087f3392df78b9a34005;
    stim[14] = 78'h3f415cc19714ff04f982;
    stim[15] = 78'h2fd42f15bd2d22c0eca4;
    stim[16] = 78'h3be77cf21fddffc8ce57;
    stim[17] = 78'h08735828c9343a87bcf2;
    stim[18] = 78'h2ef17a78cb011aafb97a;
    stim[19] = 78'h25843d251392dd5cf7ae;
    stim[20] = 78'h1adef8700c455de0aa2b;
    stim[21] = 78'h3b13f04e741f99dd4649;
    stim[22] = 78'h344bdca2f859b712867c;
    stim[23] = 78'h2b9b6f22949b6124b245;
    stim[24] = 78'h1f92e711a3d3920127cb;
    stim[25] = 78'h14777b4cb022fa63cf44;
    stim[26] = 78'h1533b2b106691fe2df78;
    stim[27] = 78'h1a4e2d3fbd8682c85246;
    stim[28] = 78'h1a00d108b1f1e3939bb2;
    stim[29] = 78'h39efc03698d1a28da705;
    stim[30] = 78'h0dcd9ec67ed1da695786;
    stim[31] = 78'h36a138b836697dc177f5;
    stim[32] = 78'h31c7943e2f6b8cbca059;
    stim[33] = 78'h2d9ad13c80f02bf87aad;
    stim[34] = 78'h321f1a9e1ead3c48ea93;
    stim[35] = 78'h1ae04807c431445decf5;
    stim[36] = 78'h23f99247c15588f7a690;
    stim[37] = 78'h3d7216a1b72869df05e5;
    stim[38] = 78'h3020cd272385210cbc23;
    stim[39] = 78'h040a83f4b71493cdabc0;
    stim[40] = 78'h1a14a115aff5c4ca0d3d;
    stim[41] = 78'h2cb43bc84e40d67f565a;
    stim[42] = 78'h3ca5f2cf31c62d02e21d;
    stim[43] = 78'h1052d47db0c3b0ad8bd9;
    stim[44] = 78'h349633007a0e4fecad43;
    stim[45] = 78'h3df15ae27d6bd868c53f;
    stim[46] = 78'h335b807673a91fd0c662;
    stim[47] = 78'h0846e65d57b77fdd708b;
    stim[48] = 78'h1bb3f8d00ae5d8d56b0c;
    stim[49] = 78'h0c6941fcbec333a43460;
    stim[50] = 78'h04b272ac16f51ee8b518;
    stim[51] = 78'h20f108b731ab4a23b6a6;
    stim[52] = 78'h02e3b3b21f9a0bdb0239;
    stim[53] = 78'h3cb432c1a66effb3ef5f;
    stim[54] = 78'h089c24d967165f3af984;
    stim[55] = 78'h206aa851e5b53745f2c5;
    stim[56] = 78'h3323482824f572174a21;
    stim[57] = 78'h0b7c389aa2a9703ff233;
    stim[58] = 78'h3ecb28b73c04ce85cb2b;
    stim[59] = 78'h1a87fc043c84193bed5e;
    stim[60] = 78'h09d9ac82a223ea4705dc;
    stim[61] = 78'h32e0fdac6b47413c7765;
    stim[62] = 78'h29b0fdc8a16891de6a3f;
    stim[63] = 78'h3c612bbb3ad29c05d370;
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
      expv[0] = 65'h00000000000000000;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000000000000;
      expv[6] = 65'h00000000000000000;
      expv[7] = 65'h00000000000000000;
      expv[8] = 65'h00000000000000000;
      expv[9] = 65'h00000000000000000;
      expv[10] = 65'h00000000000000000;
      expv[11] = 65'h00000000000000000;
      expv[12] = 65'h00000000000000000;
      expv[13] = 65'h00000000000000000;
      expv[14] = 65'h00000000000000000;
      expv[15] = 65'h00000000000000000;
      expv[16] = 65'h00000000000000000;
      expv[17] = 65'h00000000000000000;
      expv[18] = 65'h00000000000000000;
      expv[19] = 65'h00000000000000000;
      expv[20] = 65'h00000000000000000;
      expv[21] = 65'h00000000000000000;
      expv[22] = 65'h00000000000000000;
      expv[23] = 65'h00000000000000000;
      expv[24] = 65'h00000000000000000;
      expv[25] = 65'h00000000000000000;
      expv[26] = 65'h00000000000000000;
      expv[27] = 65'h00000000000000000;
      expv[28] = 65'h00000000000000000;
      expv[29] = 65'h00000000000000000;
      expv[30] = 65'h00000000000000000;
      expv[31] = 65'h00000000000000000;
      expv[32] = 65'h00000000000000000;
      expv[33] = 65'h00000000000000000;
      expv[34] = 65'h00000000000000000;
      expv[35] = 65'h00000000000000000;
      expv[36] = 65'h00000000000000000;
      expv[37] = 65'h00000000000000000;
      expv[38] = 65'h00000000000000000;
      expv[39] = 65'h00000000000000000;
      expv[40] = 65'h00000000000000000;
      expv[41] = 65'h00000000000000000;
      expv[42] = 65'h00000000000000000;
      expv[43] = 65'h00000000000000000;
      expv[44] = 65'h00000000000000000;
      expv[45] = 65'h00000000000000000;
      expv[46] = 65'h00000000000000000;
      expv[47] = 65'h00000000000000000;
      expv[48] = 65'h00000000000000000;
      expv[49] = 65'h00000000000000000;
      expv[50] = 65'h00000000000000000;
      expv[51] = 65'h00000000000000000;
      expv[52] = 65'h00000000000000000;
      expv[53] = 65'h00000000000000000;
      expv[54] = 65'h00000000000000000;
      expv[55] = 65'h00000000000000000;
      expv[56] = 65'h00000000000000000;
      expv[57] = 65'h00000000000000000;
      expv[58] = 65'h00000000000000000;
      expv[59] = 65'h00000000000000000;
      expv[60] = 65'h00000000000000000;
      expv[61] = 65'h00000000000000000;
      expv[62] = 65'h00000000000000000;
      expv[63] = 65'h00000000000000000;
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
