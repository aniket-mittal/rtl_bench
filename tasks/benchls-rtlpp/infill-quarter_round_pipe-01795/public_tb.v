// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01795 dut (
    .clk(clk),
    .reset_n(in_vec[128:128]),
    .a(in_vec[127:96]),
    .b(in_vec[95:64]),
    .c(in_vec[63:32]),
    .d(in_vec[31:0]),
    .a_prim(out_vec[127:96]),
    .b_prim(out_vec[95:64]),
    .c_prim(out_vec[63:32]),
    .d_prim(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h07a0a50726d8463b6289f1b4783577e2f;
    stim[1] = 129'h03fcdfcffcca3129a09c070da56cb8090;
    stim[2] = 129'h147c8889d1f8c6ec63387bd52ea3cf0dd;
    stim[3] = 129'h174e200a272a46dc2256a6b11f591fbc3;
    stim[4] = 129'h112c407642ac24d60ef6034be1a3e8956;
    stim[5] = 129'h1d0372904fa79ebd72f1e3d1605561f16;
    stim[6] = 129'h1623c65a37afabc90fff2ebb9cca2eee2;
    stim[7] = 129'h1b743e246b25e9294ea602d99611b2954;
    stim[8] = 129'h1eaef115686342dac4eba892f66abc08e;
    stim[9] = 129'h106e81a401bf4d62bc0c7591da0472c8d;
    stim[10] = 129'h18d66020bff5511ab61e45924451b2477;
    stim[11] = 129'h11f793eb61c2417e1d515e321fcc22247;
    stim[12] = 129'h15e5056a14175a38d0ccc7fe51317f17f;
    stim[13] = 129'h1d437981c42b92aa1b2f01718477d1be2;
    stim[14] = 129'h1790c7ad5d5c7dceec155f140911ac494;
    stim[15] = 129'h1ee3d022e66dd647117745281222626f3;
    stim[16] = 129'h16c2daaa4a1c475ce6588eaa9da5cb6ae;
    stim[17] = 129'h1502f6ebf9ebc18c044c57522e80a57ec;
    stim[18] = 129'h1b700869d81f8e116e606d03a40141c3f;
    stim[19] = 129'h15d9461d552255f5084d38693acf7fa1e;
    stim[20] = 129'h1fc085aec72280722f192d9727becca2a;
    stim[21] = 129'h1317005c085fccae8f06756877a90e85f;
    stim[22] = 129'h1b1b4388e3ea149db6a711436ee63d8a9;
    stim[23] = 129'h1d2c4810db5ce2db9131a732a161cf474;
    stim[24] = 129'h1d37d9b2d35dd837e3ab454b7f734d6d3;
    stim[25] = 129'h1d0657dfc57a16f98321b0125410bcebe;
    stim[26] = 129'h1e2264af2a51c869da8e0a8bdf13e63ea;
    stim[27] = 129'h1bcd49cd151704f1e282195471c6498df;
    stim[28] = 129'h159bde1b39076d988e2532632053fae1e;
    stim[29] = 129'h10c6148efb86d661c7c4d8b9152fcec35;
    stim[30] = 129'h1ed708842db14e96949235a34a3995990;
    stim[31] = 129'h152f0cdb61fa3861692a2be3a3c22e550;
    stim[32] = 129'h185b58ffb70d10accaf2e2619fa690f08;
    stim[33] = 129'h1d5503b6913e5b855fbe738a64a13c495;
    stim[34] = 129'h1ff2e24ba789a2899a851e410034f810a;
    stim[35] = 129'h11a88a6a01bd18dfdfe8d490703218e19;
    stim[36] = 129'h112a76e24a807d0a1b96171150596d615;
    stim[37] = 129'h1c2f125df55694ce26a4dae0d3b8af213;
    stim[38] = 129'h114ecb8f7b2d46db575762e98d5bd73b8;
    stim[39] = 129'h1e15188d4003e9904a4aac6c06fec82ca;
    stim[40] = 129'h108d811e0df31b5015d157becbbc7b3f2;
    stim[41] = 129'h125fea44b3ca2d91b6a7e00ef52059655;
    stim[42] = 129'h1d332e81a603eb6ad0d705ff2a485e949;
    stim[43] = 129'h1624b2a471fa6be3f40bb146dc3d276c5;
    stim[44] = 129'h12deabf1ab1e71d682158dbcda86ff13f;
    stim[45] = 129'h19fbe9cf6b340f2ac41103c56f52615a3;
    stim[46] = 129'h1d1c88d2976ae1e3a76bbae770362cef0;
    stim[47] = 129'h158cebd41b4075452fcc6e8acc9583917;
    stim[48] = 129'h11899dda5dc9291a8334c3be525da8476;
    stim[49] = 129'h147e3acff84c6e88ad396a197a9ec0967;
    stim[50] = 129'h13f73c3eaa7325e87d7feab2bc0dc5386;
    stim[51] = 129'h146588e407dc2b3205ab754f9c3f81164;
    stim[52] = 129'h1b8aa36ebf7994b486335bbfd32f45c02;
    stim[53] = 129'h1a4e70f1a59476a7b912a2c542bb62a9c;
    stim[54] = 129'h1c8441ef8d302104605c2102307e7f0af;
    stim[55] = 129'h151158b8ab74ab98d245b9e8242a5b241;
    stim[56] = 129'h1ea63979970bb2779a0313cd24455c60a;
    stim[57] = 129'h1b3a2e0c97be64fe3da1ccae9ffce1496;
    stim[58] = 129'h1b223db7dfa8a3280f6547aa79fcd1d71;
    stim[59] = 129'h194c03b2ce92db6d1fdcc28dcab00e6fa;
    stim[60] = 129'h13c23225ef5c64d125416598e943245b2;
    stim[61] = 129'h152d28ebc0c29014a98ed2ce907da5d00;
    stim[62] = 129'h1462fc104c5b06c26a6b062048604d99f;
    stim[63] = 129'h19b3a9b691f8d99d2072657bf5c1e5aed;
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
      expv[0] = 128'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 128'h00000000bfb3a5509056cb809056cb80;
      expv[2] = 128'h00000000832e840dddea3cf0ddea3cf0;
      expv[3] = 128'hc6ec61f8fe101a367158e5584cf33dca;
      expv[4] = 128'h83f9bccf238a5b3bfd4c753acb417764;
      expv[5] = 128'h7291cff0882030db1a8a52af43f72039;
      expv[6] = 128'heb206792634b7b9c9451f6f719618111;
      expv[7] = 128'h774874dbe0b6e7bf29f4e9482fc8f77c;
      expv[8] = 128'h336ca6ba1b8539892e719d4c38a9b387;
      expv[9] = 128'ha5e90c19869230e669ec15ee66dd7db6;
      expv[10] = 128'h16047091ee11f9e7ec6e8143181756c2;
      expv[11] = 128'h468f931bca40e07cb4e423627ee36277;
      expv[12] = 128'hda2bb658d3a93872caa62617c39ed27d;
      expv[13] = 128'h6a9ecafe7500cd6f06c6eefa5212468b;
      expv[14] = 128'h77f2e98e8c582b61702b5441db6e6471;
      expv[15] = 128'hca24a6d4ce12fffedc499fe514ca26bb;
      expv[16] = 128'h70aa11dd7444c29424435b139b9e9ba0;
      expv[17] = 128'h61c6393542dedaf48e97470558dccd16;
      expv[18] = 128'h74051b22dd7d6864021a390945b5ddef;
      expv[19] = 128'hba8c4b5890242b40a326d56021df5627;
      expv[20] = 128'h5b0004e9c4f1fdd13251d6f10fd0bc50;
      expv[21] = 128'h4191f62ffbe503adbd853d92c0e28fcb;
      expv[22] = 128'h54a359a34b69e1471cb91783a200ac5c;
      expv[23] = 128'h499c94e9f560ff9bf3e50d848172a03f;
      expv[24] = 128'hb4654ee464a3f8d2f9699c3f703142cc;
      expv[25] = 128'he6338a94186362a9d98c989326c2c436;
      expv[26] = 128'h95177d01950471536bd4829069a4391b;
      expv[27] = 128'hf5057806d60a69b88d42a2b155e320bc;
      expv[28] = 128'h843187f1b0729f3f31febb2ec08c8ac1;
      expv[29] = 128'h5ce349ffa738dd41163568b8edf1370b;
      expv[30] = 128'h7fafd43d6e573341080faee234b36a89;
      expv[31] = 128'h4fa1af8f301c33a79a19ea665a5b28db;
      expv[32] = 128'h9cff43ac7468eacc636a04a13bcb51c0;
      expv[33] = 128'h6e1729407e5ae390518884464595d530;
      expv[34] = 128'h67facc48dd02bd4aa86027504e263215;
      expv[35] = 128'h271015e8a85031807567d06e5a6101e4;
      expv[36] = 128'hebffbd60d9bfb21f396669f9778eac09;
      expv[37] = 128'h3d2f4b3a99fc1d4d95b3c4d2f9ca1ff1;
      expv[38] = 128'hc92f7badf900d2c48dda79fa56b64ac8;
      expv[39] = 128'h1c82eb20b25ead265b330a37e4430db8;
      expv[40] = 128'hde18de1915ba2dbb7b95bd3932844e4c;
      expv[41] = 128'hef4eeb3ab2401d9ce9910d02fa5136bf;
      expv[42] = 128'hb8ff541a80ca4ba58bc4f927d0923e2c;
      expv[43] = 128'h2366eb161ca000b605bbdbe1641bb5cb;
      expv[44] = 128'h9cf43aa72b5b807275d13e954d133985;
      expv[45] = 128'h1379721b0b45605e936af2455858ecda;
      expv[46] = 128'h0f4e5507d0bb29682636019b1c049a4e;
      expv[47] = 128'h4a97076b681296079b9445ece38645d8;
      expv[48] = 128'hddbb0c2373de0c39ed6099225e252f48;
      expv[49] = 128'hac5d36cd2e63321c409b72bb776a0dca;
      expv[50] = 128'h6df4242c7228768f34e95902fb285aab;
      expv[51] = 128'hf6b79f7847e02d5840c7de66a2ba26c5;
      expv[52] = 128'hd6ee40adc9a543a41a82bd228cb642cb;
      expv[53] = 128'h172d3905596f1b7f033ba3ab82a2f0bf;
      expv[54] = 128'hadccffd02f8fe0492fdfe16df6061924;
      expv[55] = 128'hbbaf78424c5c44925f9eab12d0a1a126;
      expv[56] = 128'h164c42d98dd7f60b12ea64fa510eec95;
      expv[57] = 128'h0e52102d36e1933bfa0386acd6b4fda5;
      expv[58] = 128'he78d049cc2efb8b1d656488350b4d8ca;
      expv[59] = 128'he55cc89ee17b143c80015af95bcf300e;
      expv[60] = 128'ha671bace7fe026b82726419c3e531112;
      expv[61] = 128'hd5c773cec7188825bfac4154b745fde7;
      expv[62] = 128'h260bdfb4cb8732c65d64ae8b92074b6f;
      expv[63] = 128'h2fef30f44e2dd3b118b1455b28670a58;
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
