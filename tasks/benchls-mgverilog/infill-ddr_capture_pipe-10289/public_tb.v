// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10289 dut (
    .clock(clk),
    .indata(in_vec[63:32]),
    .indata180(in_vec[31:0]),
    .outdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h353c9fe289fb12c5;
    stim[1] = 64'h327491165d070007;
    stim[2] = 64'h63b823b399f3fc8c;
    stim[3] = 64'h66d6ae0ac5387bde;
    stim[4] = 64'h0914e9e7d790d0ea;
    stim[5] = 64'h74c9b78a88435ed8;
    stim[6] = 64'hc3c6b17fae34e063;
    stim[7] = 64'hfb808355e45f97f3;
    stim[8] = 64'h47d59a02551a9d2b;
    stim[9] = 64'h29b9799baf454114;
    stim[10] = 64'h54d8581e727a6734;
    stim[11] = 64'hb25bbad55a65c5e7;
    stim[12] = 64'h0073f58a7070dd70;
    stim[13] = 64'h322be426519f1201;
    stim[14] = 64'h66c1cb1db6bda426;
    stim[15] = 64'hb3694c800a588959;
    stim[16] = 64'hb1da75bd4f4ceb27;
    stim[17] = 64'h85af6f28f3284dbe;
    stim[18] = 64'h1adb65a7a78d894c;
    stim[19] = 64'h2d4a255a59cbda72;
    stim[20] = 64'h81cca248ea33ba1a;
    stim[21] = 64'h26f6423f6166b6c0;
    stim[22] = 64'h99efb80c061ab9b8;
    stim[23] = 64'h745b0aeb45650ccb;
    stim[24] = 64'hee9fb620cf7fec18;
    stim[25] = 64'hcc80e13de48c8b68;
    stim[26] = 64'h47498e2364db7de6;
    stim[27] = 64'h7cb5a12a62c65ada;
    stim[28] = 64'h8db5080e2486a4f4;
    stim[29] = 64'h9eab7ed4a6e69e93;
    stim[30] = 64'h57f265b179976780;
    stim[31] = 64'hdbc165135b0a9fce;
    stim[32] = 64'h8e570f3e9d00191b;
    stim[33] = 64'hda6d7a6b80c97dfd;
    stim[34] = 64'h1cbb7bcfa014c2c0;
    stim[35] = 64'h755e0223f4e8164d;
    stim[36] = 64'hbf9041c8458e3505;
    stim[37] = 64'h24fe56740499b2d3;
    stim[38] = 64'h6b0fcbfb7cf74c49;
    stim[39] = 64'hb122660d65e13923;
    stim[40] = 64'ha492f935bbc20e20;
    stim[41] = 64'h8db095f319e1cb6a;
    stim[42] = 64'h3f8b8cf3a9054b00;
    stim[43] = 64'h8e95e54f5b7e1372;
    stim[44] = 64'h8159584a242c3a5a;
    stim[45] = 64'h009a15477fc52793;
    stim[46] = 64'h7dd3ce6c0dc1cece;
    stim[47] = 64'he096f258d11ff939;
    stim[48] = 64'h4fb25fc830be244d;
    stim[49] = 64'hd3a95a0782cb3f79;
    stim[50] = 64'h6ab5670b83404c43;
    stim[51] = 64'h422a6e0a09d95086;
    stim[52] = 64'h6c8fc7a6f9680568;
    stim[53] = 64'hca55f4869066417f;
    stim[54] = 64'h9be23c8d8cca800f;
    stim[55] = 64'h93339894b018942a;
    stim[56] = 64'hf5314cd9484aa7c0;
    stim[57] = 64'h4b6244d46977db25;
    stim[58] = 64'h4e83451c6c3deeea;
    stim[59] = 64'hb8fc34022a5586c2;
    stim[60] = 64'hc4fa0dc0443835b0;
    stim[61] = 64'h815833a8a8fdb409;
    stim[62] = 64'he2c1009cbc72acb2;
    stim[63] = 64'h1d2a41a0d8c75434;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hxxxxxxxx;
      expv[2] = 32'hxxxx12cx;
      expv[3] = 32'h5x0x0007;
      expv[4] = 32'h1xfxac8c;
      expv[5] = 32'h45306bce;
      expv[6] = 32'h5590d0ea;
      expv[7] = 32'h804356d8;
      expv[8] = 32'haa04e063;
      expv[9] = 32'he4559373;
      expv[10] = 32'h4518992b;
      expv[11] = 32'h2d414114;
      expv[12] = 32'h725a6314;
      expv[13] = 32'h5261c5c7;
      expv[14] = 32'h7070d560;
      expv[15] = 32'h509b1201;
      expv[16] = 32'hb6b98404;
      expv[17] = 32'h02588919;
      expv[18] = 32'h074ceb25;
      expv[19] = 32'h93284dae;
      expv[20] = 32'ha789094c;
      expv[21] = 32'h09cb8a52;
      expv[22] = 32'haa33aa1a;
      expv[23] = 32'h2166b200;
      expv[24] = 32'h041ab8a8;
      expv[25] = 32'h44450ccb;
      expv[26] = 32'hce5fec18;
      expv[27] = 32'hc48c8b28;
      expv[28] = 32'h64d92d22;
      expv[29] = 32'h60c4080a;
      expv[30] = 32'h248624d4;
      expv[31] = 32'ha6e61e91;
      expv[32] = 32'h79976780;
      expv[33] = 32'h5b020f8e;
      expv[34] = 32'h9d00191b;
      expv[35] = 32'h80c979fd;
      expv[36] = 32'ha01442c0;
      expv[37] = 32'hf4c80249;
      expv[38] = 32'h458e1505;
      expv[39] = 32'h049992d3;
      expv[40] = 32'h7cb74c49;
      expv[41] = 32'h65a13921;
      expv[42] = 32'ha9820c20;
      expv[43] = 32'h19a18962;
      expv[44] = 32'ha9054900;
      expv[45] = 32'h0b5c1142;
      expv[46] = 32'h000c184a;
      expv[47] = 32'h7dc50703;
      expv[48] = 32'h0dc1ce4e;
      expv[49] = 32'hc117f918;
      expv[50] = 32'h10be244d;
      expv[51] = 32'h828b3f49;
      expv[52] = 32'h82004c43;
      expv[53] = 32'h08894086;
      expv[54] = 32'he8480520;
      expv[55] = 32'h9066412f;
      expv[56] = 32'h88c2800f;
      expv[57] = 32'hb010940a;
      expv[58] = 32'h484284c0;
      expv[59] = 32'h4963c104;
      expv[60] = 32'h6c3de40a;
      expv[61] = 32'h285584c2;
      expv[62] = 32'h443835a0;
      expv[63] = 32'ha0f93408;
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
