// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 194;
  localparam OW = 72;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_087584 dut (
    .clk(clk),
    .ra(in_vec[193:187]),
    .re(in_vec[186:186]),
    .ore(in_vec[185:185]),
    .wa(in_vec[184:178]),
    .we(in_vec[177:177]),
    .di(in_vec[176:105]),
    .byp_sel(in_vec[104:104]),
    .dbyp(in_vec[103:32]),
    .pwrbus_ram_pd(in_vec[31:0]),
    .dout(out_vec[71:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 194'h0c618792a2495cb6c6a7297a27ab003a7c3d479057d87dfa2;
    stim[1] = 194'h220986f7fdd88f531baf3cec35ad5c50c9d37e91d922ed890;
    stim[2] = 194'h195eba3f8956f6057737de28c9129c02deab53fa41ed8fa8a;
    stim[3] = 194'h3b6318302e55bb02923893d79e864fdee6317e1e26f1cef92;
    stim[4] = 194'h17d53fa251591a89436c094d913d5665897b725abe20d1193;
    stim[5] = 194'h2becb7d9d670c49f5f613be69c90a9f7993e325ac86611533;
    stim[6] = 194'h1ec8c54cb767508c4f80889eaea5ce0c3894d1b0af3b3baae;
    stim[7] = 194'h0e1ecb2538817610644680465ca10cdfc9d1a3439a9e3f9ab;
    stim[8] = 194'h2a3977fe34ed3c262f1d71f48c290f02337a44abec4263b7b;
    stim[9] = 194'h2bcedc572b0639befcda68b27dc82eee650337fbc023b9692;
    stim[10] = 194'h0179abd340957f4ba8d7f19fcf2d149ab15b046ce0c8527b2;
    stim[11] = 194'h2e3043f3e31be8350b6610330e7e0dd4e9ea397ebe6873bc9;
    stim[12] = 194'h23472e8d5711c1dea08dd970b762225e7cd099977ffac0f52;
    stim[13] = 194'h2cc729603de38a56f500aa4009d00d97de6e38e1bfa160d44;
    stim[14] = 194'h0877cfb94e3b150c585e766832b53bd4c5ad3e55acc74454d;
    stim[15] = 194'h17c4f3bbd3636cfd1223650bd9a78f3bed8e856606c673b82;
    stim[16] = 194'h16ff889dd970c196f086342d94a6f19b507d845812d0053dd;
    stim[17] = 194'h0a8eaa46874a58736213b9608e5d469c48d7bc2cf1a57624e;
    stim[18] = 194'h062598a333790aee34b5a728c6380f39a66dfdedfa3067b07;
    stim[19] = 194'h30ef6fd7fbc2406c25c2e24ab9ccf7035d6921f7f983e226e;
    stim[20] = 194'h24a5a9902afd7c079beaa631d69b88201f34159cc4491d516;
    stim[21] = 194'h239a87e58e2541cf74b9d7d10c13545921640cf5ddc4567b7;
    stim[22] = 194'h1ac6ed3fdfefdad3326ae26eb88444c751506fdf7bbef8e55;
    stim[23] = 194'h12fe7cdb512258217182bcf543331ace04afef4c2b6b3549d;
    stim[24] = 194'h3ab52bb654bb1742204dd41e76e5da84657a5a721903b799f;
    stim[25] = 194'h3262e76d0a28f2a84bf529e77b062c464879aaee20679e889;
    stim[26] = 194'h305588b6d3a3b9bc8906c957d2f1cbd4c592158d77d0359c5;
    stim[27] = 194'h1fbe47f73646a994677d3cbb746556972ac6c7070ba22fc4f;
    stim[28] = 194'h3ae0358117d80aa06b5a0bd8d6544aed8053b0e6f181aaada;
    stim[29] = 194'h29e92bef9b2b9dd8e47724eef0146bb4a4cd94c10fa59293f;
    stim[30] = 194'h05813cee59c72eb86ce4c3e3a3d0688dbdd77278773be2651;
    stim[31] = 194'h2e21dc1dfe4fecaf3a14df6200693b7d9d95b4a3bbd5f069f;
    stim[32] = 194'h2011b2bbe507108f3ad572a037dcc8ad978b5e4ec7c280395;
    stim[33] = 194'h0bcb7ab1182489d86465e2f69f14c2b0d090382ac180dfdfb;
    stim[34] = 194'h38b10d43e8a9924537d8ab4c21a8f03efe9f94ca7e4b4f882;
    stim[35] = 194'h09767fbd7f5222e788faa675d012d0b62eef2bb360f350a5a;
    stim[36] = 194'h29de39c674684ebc7cf67141f25c818346ae2a85c677da903;
    stim[37] = 194'h3d92268251c162d6fc17973f9c16fecb3327429ce8e52855f;
    stim[38] = 194'h028bd99611a1704b4445631ffcfa717a8de1440862f907e4a;
    stim[39] = 194'h20b99cedd73cf5b81693fc19ca847f1bcdaad7c26b397f031;
    stim[40] = 194'h00821ed9baecf902ced0313c32888f34294238a617199fb47;
    stim[41] = 194'h0272a8b33951eb7348ba6ea9a081fb3b6081fb2a6532bca98;
    stim[42] = 194'h274cdc8c87769d768b596f265a8bb5e4e5ed536a9830d50e6;
    stim[43] = 194'h30086b46d67ca50dec4c535e62b2755189e70880af86ccb63;
    stim[44] = 194'h327625d01b857609aabaa66af0ed57868e7ddf8d6c9dcb4ce;
    stim[45] = 194'h3ece5ded2db24df3cdfb612651b67e133ca475df0521c9cee;
    stim[46] = 194'h3a3315112cc04cfb750e0d008828792eabaa39558e5c2be5b;
    stim[47] = 194'h375e36f8dc1e5609a1fd21268918228ea8f4e232624931bb8;
    stim[48] = 194'h046d8f998f6a093d82556c7ce7023a42410b008a225fe7e2d;
    stim[49] = 194'h06834c78f8b86dbb874568debdf875f8dec2c0b242065fbd4;
    stim[50] = 194'h1388c2af416df08fa8174af644b972f9ef86ed4207ccd7fe8;
    stim[51] = 194'h064fbe5f258272e0770133a37d2ae00fb7a91a7fe53d7f534;
    stim[52] = 194'h1d3f764896f8aa61922d8f21b0d8898595e8b3fa6e74fc272;
    stim[53] = 194'h263e6fb648f884e52d6d8801794a73e86ba035d86eee5fddc;
    stim[54] = 194'h057291da7cf4786bd9f36a7066d31dc55ee7f8e70d9225e76;
    stim[55] = 194'h3d9f69c081951cc1a0e40c74c232f46f9f67320807120170c;
    stim[56] = 194'h036a2035d2964a716e891fd946923f84ba84d24560d31bc1c;
    stim[57] = 194'h2640c0568ee74009abb091d5407b375b055d1e865e9746172;
    stim[58] = 194'h02af72a8944392e23dbb24e43a5bf57614000684465a4fbb4;
    stim[59] = 194'h3274f3ec5355a99d6d69885c9b62e63a888d6a0249ec97899;
    stim[60] = 194'h28a3e35370104c035bd8317cc7eb2e4a0b82ccea0e99b1fc4;
    stim[61] = 194'h31ab8f43fb6c854ab2d26014798417eb9a1db5c775f806ac8;
    stim[62] = 194'h32f14b48bbdb86d43b6adabc728af7edd8f9acf420e9375da;
    stim[63] = 194'h1b13f1164159c8020d9be369d4ec7b3ef0d71c9f748a28ea2;
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
      expv[0] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[1] = 72'ha27ab003a7c3d47905;
      expv[2] = 72'ha27ab003a7c3d47905;
      expv[3] = 72'ha27ab003a7c3d47905;
      expv[4] = 72'h79e864fdee6317e1e2;
      expv[5] = 72'h79e864fdee6317e1e2;
      expv[6] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[7] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[8] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[9] = 72'h48c290f02337a44abe;
      expv[10] = 72'h48c290f02337a44abe;
      expv[11] = 72'hfcf2d149ab15b046ce;
      expv[12] = 72'h30e7e0dd4e9ea397eb;
      expv[13] = 72'h30e7e0dd4e9ea397eb;
      expv[14] = 72'h30e7e0dd4e9ea397eb;
      expv[15] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[16] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[17] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[18] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[19] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[20] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[21] = 72'h1d69b88201f34159cc;
      expv[22] = 72'h1d69b88201f34159cc;
      expv[23] = 72'h1d69b88201f34159cc;
      expv[24] = 72'h543331ace04afef4c2;
      expv[25] = 72'he76e5da84657a5a721;
      expv[26] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[27] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[28] = 72'hb746556972ac6c7070;
      expv[29] = 72'h8d6544aed8053b0e6f;
      expv[30] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[31] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[32] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[33] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[34] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[35] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[36] = 72'h5d012d0b62eef2bb36;
      expv[37] = 72'h5d012d0b62eef2bb36;
      expv[38] = 72'h5d012d0b62eef2bb36;
      expv[39] = 72'h5d012d0b62eef2bb36;
      expv[40] = 72'h9ca847f1bcdaad7c26;
      expv[41] = 72'h9ca847f1bcdaad7c26;
      expv[42] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[43] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[44] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[45] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[46] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[47] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[48] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[49] = 72'hce7023a42410b008a2;
      expv[50] = 72'hce7023a42410b008a2;
      expv[51] = 72'hce7023a42410b008a2;
      expv[52] = 72'hce7023a42410b008a2;
      expv[53] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[54] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[55] = 72'h066d31dc55ee7f8e70;
      expv[56] = 72'h066d31dc55ee7f8e70;
      expv[57] = 72'h946923f84ba84d2456;
      expv[58] = 72'h946923f84ba84d2456;
      expv[59] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[60] = 72'hc9b62e63a888d6a024;
      expv[61] = 72'hcc7eb2e4a0b82ccea0;
      expv[62] = 72'h4798417eb9a1db5c77;
      expv[63] = 72'hc728af7edd8f9acf42;
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
