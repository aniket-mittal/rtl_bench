// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 130;
  localparam OW = 129;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_143598 dut (
    .clk(clk),
    .reset(in_vec[129:129]),
    .message(in_vec[128:1]),
    .start(in_vec[0:0]),
    .hash(out_vec[128:1]),
    .done(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 130'h2628c2d69253ff67745dfd588088f0f70;
    stim[1] = 130'h39fb6b223f49ae8ddc785fb0b48b703a0;
    stim[2] = 130'h07d5a59c203fd526b51d29e6b468b2724;
    stim[3] = 130'h09ce23dc9826d992d28e45febd53b5948;
    stim[4] = 130'h146eb1ade58119e5f9046e7f3536f3847;
    stim[5] = 130'h1d802f9122361205dae253c1312650b04;
    stim[6] = 130'h0d7613a3cb23578f56c7ec864e6c3818d;
    stim[7] = 130'h1cf1f0d85b228cf66d4765e9f68d96b2a;
    stim[8] = 130'h0f20da54369b9596a8b334a5743c51323;
    stim[9] = 130'h09876a0eff225bcfc645d545b5bb817be;
    stim[10] = 130'h0513e5c19ccefef45fe1a5e705772d9e2;
    stim[11] = 130'h07fa422ea7847110e3a1ea46e61e42182;
    stim[12] = 130'h197443658d45dd72a3457018a79ec1448;
    stim[13] = 130'h17d309a5824a35293a4c9de7f0056ea61;
    stim[14] = 130'h0ef593f1fafc3308fcb09b66dfaf9b673;
    stim[15] = 130'h183b9104c5e7760d8b7ffa540c16e74e0;
    stim[16] = 130'h15ec873faa0001ec70d1315f35fc43c84;
    stim[17] = 130'h002414aadd9630ebbd9c5252dc844098b;
    stim[18] = 130'h07a35fb3b3514d62e559c9ca956922160;
    stim[19] = 130'h1f679868753b5f991358d005c373c197c;
    stim[20] = 130'h3071254449c656a69363af806485e0429;
    stim[21] = 130'h17d8286ae466188c8f746e6d6d1635afe;
    stim[22] = 130'h1417f2ccb8ac45401c336c5fee7ba8c61;
    stim[23] = 130'h09e6720cdbf85190a89da3d1d8121a98c;
    stim[24] = 130'h01974a54b8beb8f2a0b400711b6eba8c0;
    stim[25] = 130'h14cc917b76607ce5fa2eada94ba64d76e;
    stim[26] = 130'h1b4159a16b666c33e9cfe294925972630;
    stim[27] = 130'h0a2a1933d1eacad4adcb8dbe785683d12;
    stim[28] = 130'h1f8c967e2353f9878705da02b5ee2d9e3;
    stim[29] = 130'h150a17ee443b019d27e87e2775f3882ff;
    stim[30] = 130'h378c8c909fef54c4a11cd9dd2345a9649;
    stim[31] = 130'h15506610b510ff0b8f8205ef1824257ec;
    stim[32] = 130'h19b07529de589f9445bb01ea82f92a4a9;
    stim[33] = 130'h0d3753feb6ed718624475396c92d2a2f7;
    stim[34] = 130'h07bf04f56d6f64f257bc79151953c36ef;
    stim[35] = 130'h04a14338635f3864b9e8f5e2278d0a2a9;
    stim[36] = 130'h03bc09234f6c84b4fbf7fea6c6a24501c;
    stim[37] = 130'h01cc50ea4ba2e9aaed32bd4a5edee0f53;
    stim[38] = 130'h109ef1df98dee24b83d020a836f864f10;
    stim[39] = 130'h08ccea4b9e2058fe0c70bcc2e7f2da579;
    stim[40] = 130'h02a075020fcb8af82d5f234363b8bca9d;
    stim[41] = 130'h0e119b93e70a5e329eb6b8474344de72b;
    stim[42] = 130'h06792e10fcf26fc34c1bdef9e9883d7a7;
    stim[43] = 130'h055e93a005730308b71ba3fd34e8bf0d4;
    stim[44] = 130'h053404345e9b05b54a25478162075ec16;
    stim[45] = 130'h036f77cb6d9073c6e75e6a9136493f361;
    stim[46] = 130'h0234b1efc79656d8e07d881299f667837;
    stim[47] = 130'h0c30ced4692e5e91d44bb3833083a6320;
    stim[48] = 130'h0b39a6d609c9356f93a91e015e6eb0642;
    stim[49] = 130'h15656b3b534257afbcca2520103571d60;
    stim[50] = 130'h167e59f79738eb93b0f3da3c989d7e3f3;
    stim[51] = 130'h0f3917d003da4861c70cb4536d0b18657;
    stim[52] = 130'h107667fb88af320d7b4b51cd84f652878;
    stim[53] = 130'h10224074be451e7cbe0eaad1442aea06f;
    stim[54] = 130'h0be2354337c583fccfb1d72c1493f9554;
    stim[55] = 130'h0e5ed958e7468c7937737a9d09cdec115;
    stim[56] = 130'h0d524ec343dd4342a5f175ac4a4370122;
    stim[57] = 130'h1e1c67525855125394f253f9426e62bea;
    stim[58] = 130'h12c0234c18310ced6490304aa0845c958;
    stim[59] = 130'h0c6c3fda2a55b60a7308dea44cc01639a;
    stim[60] = 130'h1e39e6507ca90dbec444586db39e82dc1;
    stim[61] = 130'h0d3f41ebabb5945c71e8671008aebee8a;
    stim[62] = 130'h11b8fa3079c023fba17eb3701ca859eee;
    stim[63] = 130'h1637d51c5472a4b042ad49f043084834c;
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
      expv[0] = 129'h000000000000000000000000000000000;
      expv[1] = 129'h000000000000000000000000000000000;
      expv[2] = 129'h000000000000000000000000000000000;
      expv[3] = 129'h000000000000000000000000000000000;
      expv[4] = 129'h000000000000000000000000000000000;
      expv[5] = 129'h000000000000000000000000000000000;
      expv[6] = 129'h000000000000000000000000000000000;
      expv[7] = 129'h0000000000000000000000001f867a1ff;
      expv[8] = 129'h0000000000000000000000001f867a1ff;
      expv[9] = 129'h0000000000000000000000001f867a1ff;
      expv[10] = 129'h0000000000000000000000001f867a1ff;
      expv[11] = 129'h000000000000000000000000290de42ed;
      expv[12] = 129'h000000000000000000000000290de42ed;
      expv[13] = 129'h000000000000000000000000290de42ed;
      expv[14] = 129'h000000000000000000000000290de42ed;
      expv[15] = 129'h000000000000000000000000290de42ed;
      expv[16] = 129'h00000000000000000000000038037820b;
      expv[17] = 129'h00000000000000000000000038037820b;
      expv[18] = 129'h00000000000000000000000038037820b;
      expv[19] = 129'h00000000000000000000000038037820b;
      expv[20] = 129'h000000000000000000000000000000000;
      expv[21] = 129'h000000000000000000000000000000000;
      expv[22] = 129'h000000000000000000000000000000000;
      expv[23] = 129'h000000000000000000000000000000000;
      expv[24] = 129'h000000000000000000000000000000000;
      expv[25] = 129'h0000000000000000000000000becbc9b9;
      expv[26] = 129'h0000000000000000000000000becbc9b9;
      expv[27] = 129'h0000000000000000000000000becbc9b9;
      expv[28] = 129'h0000000000000000000000000becbc9b9;
      expv[29] = 129'h0000000000000000000000000becbc9b9;
      expv[30] = 129'h000000000000000000000000000000000;
      expv[31] = 129'h000000000000000000000000000000000;
      expv[32] = 129'h000000000000000000000000000000000;
      expv[33] = 129'h000000000000000000000000000000000;
      expv[34] = 129'h000000000000000000000000000000000;
      expv[35] = 129'h0000000000000000000000000f3d9e8d7;
      expv[36] = 129'h0000000000000000000000000f3d9e8d7;
      expv[37] = 129'h0000000000000000000000000f3d9e8d7;
      expv[38] = 129'h00000000000000000000000012f9a7b0b;
      expv[39] = 129'h00000000000000000000000012f9a7b0b;
      expv[40] = 129'h00000000000000000000000012f9a7b0b;
      expv[41] = 129'h00000000000000000000000012f9a7b0b;
      expv[42] = 129'h000000000000000000000000159a1cb2b;
      expv[43] = 129'h000000000000000000000000159a1cb2b;
      expv[44] = 129'h000000000000000000000000159a1cb2b;
      expv[45] = 129'h0000000000000000000000001af8b052b;
      expv[46] = 129'h0000000000000000000000001af8b052b;
      expv[47] = 129'h0000000000000000000000001af8b052b;
      expv[48] = 129'h0000000000000000000000001d2d62427;
      expv[49] = 129'h0000000000000000000000001d2d62427;
      expv[50] = 129'h0000000000000000000000001d2d62427;
      expv[51] = 129'h0000000000000000000000001d2d62427;
      expv[52] = 129'h0000000000000000000000001d2d62427;
      expv[53] = 129'h0000000000000000000000002c667a127;
      expv[54] = 129'h0000000000000000000000002c667a127;
      expv[55] = 129'h0000000000000000000000002c667a127;
      expv[56] = 129'h0000000000000000000000003848af559;
      expv[57] = 129'h0000000000000000000000003848af559;
      expv[58] = 129'h0000000000000000000000003848af559;
      expv[59] = 129'h0000000000000000000000003848af559;
      expv[60] = 129'h0000000000000000000000003848af559;
      expv[61] = 129'h0000000000000000000000003848af559;
      expv[62] = 129'h0000000000000000000000003848af559;
      expv[63] = 129'h0000000000000000000000004587f1413;
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
