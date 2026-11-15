// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 136;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ct_lsu_rot_data dut (
    .data_in(in_vec[135:8]),
    .rot_sel(in_vec[7:0]),
    .data_settle_out(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 136'h971b6d0eaf2645f168a475fe017814ec40;
    stim[1] = 136'h68b1f320376c9d2528d0dfc6af00bde36a;
    stim[2] = 136'hff5427a2f207ae45f13f9eba24fa571fd6;
    stim[3] = 136'h053ca16f7724ae777b8f8bdca4b6469697;
    stim[4] = 136'h02414ec2b5aa897cce626044c688bfa196;
    stim[5] = 136'h150b0ddf0e696735a2327a850e67773bae;
    stim[6] = 136'heeaa8c0f302c49c66c831b3521ebc6e582;
    stim[7] = 136'h427a218fd5801178ad70e871e9bb2ce21e;
    stim[8] = 136'hf76034f70620ae517d8e5908c7a9e00eef;
    stim[9] = 136'h3a0861a4083245bf13861ab5b3e995b286;
    stim[10] = 136'hf5685cc0e4d752fd1ce8eb189b152bdec4;
    stim[11] = 136'h9acd3ce78051f0d6ff9a664afb0f5cdb8c;
    stim[12] = 136'h2b4826cbef1fa0f9aefdbf274f7dd0293c;
    stim[13] = 136'hecc719404c86a5a6059b28e5fa5962e035;
    stim[14] = 136'h5b1bc83e0db6c4197bb1f3ae57ecbb482c;
    stim[15] = 136'hd550def7955542b96576357ef3b51da212;
    stim[16] = 136'hee3895c8a82e0f1115680e3ee79a4fec21;
    stim[17] = 136'hc5c17f475c95e1ef878becec521c7c9923;
    stim[18] = 136'h52d83fc42fa8de0cdadcf04cf1ba82ad17;
    stim[19] = 136'h74314dd08c2d183aa5e2df0023d4be6ce4;
    stim[20] = 136'hb7e350d1be2221dfc2557b2f0b18e4b204;
    stim[21] = 136'h11734f7008ed452bb76acfb014f1673663;
    stim[22] = 136'hc464274a1700e45eedb404af38630d598f;
    stim[23] = 136'h7d11f025fbe143196f6ff72f45a7ac8730;
    stim[24] = 136'h16d75e7a110d1cddf004ffd7d8b1b91173;
    stim[25] = 136'h4bc632ab4ee81e24e4e538609b06259f06;
    stim[26] = 136'h5b327c467f309d15ebe72e3bc2ce89975f;
    stim[27] = 136'h524319bcdde9b10d2bd64cb94fd1de4597;
    stim[28] = 136'h9d817444f7946842ad39887bec3b53f5d1;
    stim[29] = 136'h40ffe9e332016b09b1447d85d8ecaef22e;
    stim[30] = 136'h6a3484979da516517b5fdd668c58adf35e;
    stim[31] = 136'h38836a31ed357c502dde1b1add1273fd74;
    stim[32] = 136'h1053babdbc582143bd1d907f1b4bec7219;
    stim[33] = 136'h027798b8df7a47f8edbea180d8d8ebd8ac;
    stim[34] = 136'h6bce22a8914cf76559ed2cde7f2d86891b;
    stim[35] = 136'h9a3026762b59bf40d8adf909b15d8b3327;
    stim[36] = 136'h78c4e458d0359c6152454f70d3f6992013;
    stim[37] = 136'hae97988a7c35753606581e685c63369cc5;
    stim[38] = 136'h95215aa8484dd1447486aa54beaefc8089;
    stim[39] = 136'hc04306652082bdc41af8d53dd577654c99;
    stim[40] = 136'h60c56b2a475c5b7bc20e741d3fbca1c878;
    stim[41] = 136'h82aa1c23828146322c54b67ce7b8c51cb1;
    stim[42] = 136'h9abba809a4974fc630cb313424d6bda985;
    stim[43] = 136'h70063e853280df3d0b371f140f989433d2;
    stim[44] = 136'h90f4e6a4837de7fb6a9e3d79fb56bf3e14;
    stim[45] = 136'h7d5cee5493d8ba601917be5e98cd2a7b80;
    stim[46] = 136'hd2042f684077cd4a3350541e35688c392f;
    stim[47] = 136'h50e48ca3e11720a05515b1c6242e087bf3;
    stim[48] = 136'h95b8e879b3435d03f347b1e6afd8bf1292;
    stim[49] = 136'hdc591aba838002a2f1e984885db908c314;
    stim[50] = 136'h82604259a84ac1be348f0c8502671c8044;
    stim[51] = 136'h5f4ce2072dcda885a71f28728a2ee9f63e;
    stim[52] = 136'h454dbe0528f52ffd721bc482003962d17d;
    stim[53] = 136'hdee86c625c3b35247675c74d8d77fdaec2;
    stim[54] = 136'hdaedbb4f5c57afff2313749dc1be5e16e7;
    stim[55] = 136'hbc1a7f70b7d564c0386163b005ea1992a0;
    stim[56] = 136'hc796829e0764214ffdc69fd101ee273b48;
    stim[57] = 136'h89901c8d68bc3e3f28c91ecb86197fbe21;
    stim[58] = 136'hd125da48893f05b2a9349d1c5e926c5461;
    stim[59] = 136'h43b881abd8e68a955a2e15263af8bb8bf4;
    stim[60] = 136'h6dcbaaa5756dac94ef6f63afbd4703bd4d;
    stim[61] = 136'h081c83be66bde9573faf20543ccf6cc6c8;
    stim[62] = 136'h01db288656680e27535a6b7869f5ac4276;
    stim[63] = 136'h5dc4bd013dc73a4f686fab99d1879e2bd2;
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
      expv[0] = 128'h00000000000000007dfeaf7e55fdffbf;
      expv[1] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[2] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[3] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[4] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[5] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[6] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[7] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[8] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[9] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[10] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[11] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[12] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[13] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[14] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[15] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[16] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[17] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[18] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[19] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[20] = 128'h0000000000000000e5fff7f77bffbf3a;
      expv[21] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[22] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[23] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[24] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[25] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[26] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[27] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[28] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[29] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[30] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[31] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[32] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[33] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[34] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[35] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[36] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[37] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[38] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[39] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[40] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[41] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[42] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[43] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[44] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[45] = 128'h00000000000000005ffe5e9bddba7b7d;
      expv[46] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[47] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[48] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[49] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[50] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[51] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[52] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[53] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[54] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[55] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[56] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[57] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[58] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[59] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[60] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[61] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[62] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
      expv[63] = 128'h0000000000000000xxxxxxxxxxxxxxxx;
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
