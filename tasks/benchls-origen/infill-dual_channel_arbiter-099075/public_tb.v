// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 101;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_099075 dut (
    .clk(clk),
    .rst_n(in_vec[100:100]),
    .request_ch0_i(in_vec[99:99]),
    .address_ch0_i(in_vec[98:67]),
    .UID_ch0_i(in_vec[66:51]),
    .request_ch1_i(in_vec[50:50]),
    .address_ch1_i(in_vec[49:18]),
    .UID_ch1_i(in_vec[17:2]),
    .grant_i(in_vec[1:1]),
    .Flag_i(in_vec[0:0]),
    .grant_ch0_o(out_vec[50:50]),
    .grant_ch1_o(out_vec[49:49]),
    .address_o(out_vec[48:17]),
    .request_o(out_vec[16:16]),
    .UID_o(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 101'h055063c7c293a8421166e9175a;
    stim[1] = 101'h0b81206d11695be67739576c15;
    stim[2] = 101'h169ad1f03234b41742beb19c03;
    stim[3] = 101'h17bc6a1412ab49f0dc5d67a4d2;
    stim[4] = 101'h1c97021e02570cfba6080c1525;
    stim[5] = 101'h18b0f226b66d96480313a682a9;
    stim[6] = 101'h17418e6a81694292e64399e117;
    stim[7] = 101'h1c409ad369af353c6e39da1055;
    stim[8] = 101'h1b91d64a579e96978b89e458b5;
    stim[9] = 101'h1bfa3472888b29879017ca1057;
    stim[10] = 101'h176afc670af6272e48ccf1f924;
    stim[11] = 101'h137ea35f07eb5f4d6b3cb787e9;
    stim[12] = 101'h147d95598bedbf39c497636d06;
    stim[13] = 101'h1e2d80ae912fcdfa1b8de08533;
    stim[14] = 101'h1e56cc58236330f4b11f67adb5;
    stim[15] = 101'h16a4cb7421fea5446bd87ae841;
    stim[16] = 101'h13f458cb8b5e9349c93df6b0da;
    stim[17] = 101'h1d620ce8c1d7146efcca49dc6b;
    stim[18] = 101'h1cf08c57721b131e99533c673c;
    stim[19] = 101'h1cd9f92d95976ec576113150b2;
    stim[20] = 101'h175922ee39fd5bf7d2065987ef;
    stim[21] = 101'h1c18e384548b65c7fa96235f87;
    stim[22] = 101'h187cf8a9eefc5becfecb33c6ca;
    stim[23] = 101'h1cfd3cabc88d64e587b15cbcc9;
    stim[24] = 101'h1155639994a54f5ea0d16329ff;
    stim[25] = 101'h10a364fb8b365f50d0baf81620;
    stim[26] = 101'h110c157ba599f6b3cfd0f2942b;
    stim[27] = 101'h1036e9c4b757d349bde7cc71a7;
    stim[28] = 101'h1a28721c798a255db5ffc3e3a1;
    stim[29] = 101'h1b83274f9692f7c23e95733658;
    stim[30] = 101'h14da53b443f30a0d2f131b0969;
    stim[31] = 101'h15b6a91ae6c7e2c9257b811b71;
    stim[32] = 101'h154a9d4c793b0a6113a6affdca;
    stim[33] = 101'h17567918c113461db4084a889d;
    stim[34] = 101'h1bfcd32cabc7af57d75e5e1e1f;
    stim[35] = 101'h1429efae2c19d981d80f4a08f4;
    stim[36] = 101'h14878d7a306b88437a481ee35e;
    stim[37] = 101'h199f3e9d728bfd486c401f6e53;
    stim[38] = 101'h1c634f8246f69536a9ec84cb9d;
    stim[39] = 101'h14f9c5c353d189d519b7207b58;
    stim[40] = 101'h1f49d25e955e1733996e1357f2;
    stim[41] = 101'h1dc46831f2b4d693b9eb1795f5;
    stim[42] = 101'h1cd789ecf90af5806cd7260a74;
    stim[43] = 101'h1fa5d4e7cb4a43a1b6887c7ecc;
    stim[44] = 101'h1ca3fbf5e32617fef3085fb712;
    stim[45] = 101'h11b83e9b86eae596598c8fabb9;
    stim[46] = 101'h194e2f7458f8f389e85f150101;
    stim[47] = 101'h0b996c0d80f0722c161a87a1eb;
    stim[48] = 101'h18cc247f7ddcd2984d190fe2d8;
    stim[49] = 101'h1c2a8eb0d209a0197924bf647d;
    stim[50] = 101'h184e8105e585a979c998a98dd0;
    stim[51] = 101'h145cb8b886565b65c6e0318d7a;
    stim[52] = 101'h1ce2da6ca16f88e963651d6ebc;
    stim[53] = 101'h12e4d4609e25964c6640afbaf6;
    stim[54] = 101'h12c354525410f63ae5d7b5c2ef;
    stim[55] = 101'h0eaf2ec65444be1927f9081276;
    stim[56] = 101'h166f4883654dd8f9934c507f17;
    stim[57] = 101'h14247265930ef202723a27a85f;
    stim[58] = 101'h1c2a6711ef442262b30a498fa8;
    stim[59] = 101'h13f309b1c1222d39e86ef761b5;
    stim[60] = 101'h1aff13d6f97e8d0f49e98a4fb9;
    stim[61] = 101'h1e63410cc170df734b6f8bad6f;
    stim[62] = 101'h1e321bd690204618065a0ac17c;
    stim[63] = 101'h17b82c87a53cb92c3d497fab91;
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
      expv[0] = 51'h02108b37445d6;
      expv[1] = 51'h4e0481b452d2b;
      expv[2] = 51'h20ba15f596700;
      expv[3] = 51'h0f86e2eb2e934;
      expv[4] = 51'h07dd304070549;
      expv[5] = 51'h1240189d3a0aa;
      expv[6] = 51'h1497321cc7845;
      expv[7] = 51'h09e371ced8415;
      expv[8] = 51'h14bc5c4f3162d;
      expv[9] = 51'h4fe8d1ca31165;
      expv[10] = 51'h3972466797e49;
      expv[11] = 51'h3a6b59e5be1fa;
      expv[12] = 51'h39ce24bb1db41;
      expv[13] = 51'h2fd0dc6f1214c;
      expv[14] = 51'h595b316096c66;
      expv[15] = 51'h2a235ec3dba10;
      expv[16] = 51'h1a4e49efaac36;
      expv[17] = 51'h2377e6525771a;
      expv[18] = 51'h53c2315dd4362;
      expv[19] = 51'h5367e4b65b2ed;
      expv[20] = 51'h1fbe9032c61fb;
      expv[21] = 51'h2e3fd4b11d7e1;
      expv[22] = 51'h41f3e2a7bdf8b;
      expv[23] = 51'h072c3d8af2f32;
      expv[24] = 51'h3af5068b1ca7f;
      expv[25] = 51'h3a8685d7d0588;
      expv[26] = 51'h359e7e879a50a;
      expv[27] = 51'h1a4def3e61c69;
      expv[28] = 51'h0aedaffe1f8e8;
      expv[29] = 51'h0e0c9d3e5d25e;
      expv[30] = 51'h10697898cc25a;
      expv[31] = 51'h16492bdc046dc;
      expv[32] = 51'h13089d356ff72;
      expv[33] = 51'h30eda0425a227;
      expv[34] = 51'h3abebaf2f8787;
      expv[35] = 51'h0c0ec07a4823d;
      expv[36] = 51'h021bd240eb8d7;
      expv[37] = 51'h2a436200fdb94;
      expv[38] = 51'h09b54f64332e7;
      expv[39] = 51'h0ea8cdb901ed6;
      expv[40] = 51'h5d27497a5abc2;
      expv[41] = 51'h149dcf58be57d;
      expv[42] = 51'h135e27b3f215e;
      expv[43] = 51'h5e97539f36948;
      expv[44] = 51'h528fefd7964c2;
      expv[45] = 51'h2cb2cc647eaee;
      expv[46] = 51'h4538bdd171f1e;
      expv[47] = 51'h4e65b03611e0e;
      expv[48] = 51'h433091fdfbb9a;
      expv[49] = 51'h50aa3ac354134;
      expv[50] = 51'h413a04179b0b5;
      expv[51] = 51'h1b2e37018635e;
      expv[52] = 51'h538b69b292df1;
      expv[53] = 51'h326332057eebd;
      expv[54] = 51'h31d72ebdb70bb;
      expv[55] = 51'h5abcbb1958897;
      expv[56] = 51'h07cc9a6281fc5;
      expv[57] = 51'h101391d12ea17;
      expv[58] = 51'h50a99c47be884;
      expv[59] = 51'h29cf4377bd86d;
      expv[60] = 51'h087a4f4c593ee;
      expv[61] = 51'h3b9a5b7c5eb5b;
      expv[62] = 51'h18c86f5a50408;
      expv[63] = 51'h0961ea4beeae4;
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
