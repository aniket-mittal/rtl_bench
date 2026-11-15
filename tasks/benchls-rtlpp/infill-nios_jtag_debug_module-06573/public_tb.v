// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 122;
  localparam OW = 53;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06573 dut (
    .clk(clk),
    .MonDReg(in_vec[121:90]),
    .break_readreg(in_vec[89:58]),
    .dbrk_hit0_latch(in_vec[57:57]),
    .dbrk_hit1_latch(in_vec[56:56]),
    .dbrk_hit2_latch(in_vec[55:55]),
    .dbrk_hit3_latch(in_vec[54:54]),
    .debugack(in_vec[53:53]),
    .monitor_error(in_vec[52:52]),
    .monitor_ready(in_vec[51:51]),
    .reset_n(in_vec[50:50]),
    .resetlatch(in_vec[49:49]),
    .tracemem_on(in_vec[48:48]),
    .tracemem_trcdata(in_vec[47:12]),
    .tracemem_tw(in_vec[11:11]),
    .trc_im_addr(in_vec[10:4]),
    .trc_on(in_vec[3:3]),
    .trc_wrap(in_vec[2:2]),
    .trigbrktype(in_vec[1:1]),
    .trigger_state_1(in_vec[0:0]),
    .jdo(out_vec[52:15]),
    .jrst_n(out_vec[14:14]),
    .st_ready_test_idle(out_vec[13:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 122'h111f16763495b8766da867610652019;
    stim[1] = 122'h040b2b671598c97c9c0bb8fb1254196;
    stim[2] = 122'h05f660a9cb92e0ee52d0e76e749f7c4;
    stim[3] = 122'h219c5ed4d2461cd8a2df6c594ec3914;
    stim[4] = 122'h0733c040a76eb3e92be1090c2bc62d5;
    stim[5] = 122'h04b0d1cdc4deb1bdde76164cb94e5ec;
    stim[6] = 122'h3fa7f438256673ac2460551adb4cbb0;
    stim[7] = 122'h1f930169e387ba471ff5722d4a641ed;
    stim[8] = 122'h1d70abf173cd0e344efa00e5be3d905;
    stim[9] = 122'h247a1522331059a84555aba535eadd6;
    stim[10] = 122'h13974972916a907b504a40ef2f2b28e;
    stim[11] = 122'h0c84fa5afafc5b1a39f8586668f4684;
    stim[12] = 122'h086bf438506a569d93e145a9d9e73c6;
    stim[13] = 122'h284600bd62fd201cc6e80bdf623dce6;
    stim[14] = 122'h212a19d379c0e9a68bd44fd5058df38;
    stim[15] = 122'h1e7192ab12e3cc3a18dce2d98423f57;
    stim[16] = 122'h0175c29082ec91792adcdd83e40a990;
    stim[17] = 122'h0d17d42fbc1c232a876ff0e5a7227b9;
    stim[18] = 122'h3e5824a49c1eeb2695ff280d39dfa95;
    stim[19] = 122'h38e23df8d5399a102878acbaa4ed95d;
    stim[20] = 122'h0cf0e35dc88b18ed5ae697f4efadbdf;
    stim[21] = 122'h2cb2330338003eb18976d6e5f16ba38;
    stim[22] = 122'h2687f103d60d17963fed5b23b2a420f;
    stim[23] = 122'h3c1c39fa998590ddc6c937bba4f55da;
    stim[24] = 122'h161bf8ea1dfab63ed3659518033a51a;
    stim[25] = 122'h25bcd4f10606ce477ae7c219ab416f5;
    stim[26] = 122'h2561517162277e60005e058edfc4b82;
    stim[27] = 122'h3f58c22c13ec058f40651a108cfdd67;
    stim[28] = 122'h39782058f609ad28ae5a58b5a61ba5e;
    stim[29] = 122'h06bf24d5ff604aa53b638b07134961d;
    stim[30] = 122'h1cbbd9b37e9b1e745d4f6b02425a73a;
    stim[31] = 122'h3fe64e3f59413c344d740f95c669715;
    stim[32] = 122'h12810ad9594e984034493538987988d;
    stim[33] = 122'h335dbcca816b8184c34e85aa3500e03;
    stim[34] = 122'h297bc86e79a213d65b7c1fc942bf1f8;
    stim[35] = 122'h218840d7475ba5f9baede098fb3a216;
    stim[36] = 122'h0ad617e0d69ecbd8f0567d1f9373d7f;
    stim[37] = 122'h0b06442b2243c94d1dff80d8fb8ff14;
    stim[38] = 122'h01d9e8f7deba3b8a0263619dc486fba;
    stim[39] = 122'h39e19d761c6b4d66a47c8a5e4c5d4e5;
    stim[40] = 122'h0b1aa9b627bcee0d876837771318596;
    stim[41] = 122'h395825debb7becac5de2e754ecb9de7;
    stim[42] = 122'h2ae243f9f0a54fa6b56624df639ca77;
    stim[43] = 122'h17e25c0c4597aff3726d6bbcddf6055;
    stim[44] = 122'h3530b6a7e5551a67bd4dfd83d531c21;
    stim[45] = 122'h386a6ca0d0dcc987fd70dbca3689ff7;
    stim[46] = 122'h3431b95e920b8953d0624fc9e8dca4c;
    stim[47] = 122'h25e5a0f5c61b9c81e8fbbc31fb9dccd;
    stim[48] = 122'h32fa8313e6f0ecb96cf2be7a0063891;
    stim[49] = 122'h1c80a96132f2ff15dedd3c1f4af12f3;
    stim[50] = 122'h2920c7f70b75e77139e8d25ce665df9;
    stim[51] = 122'h3315ab3bf51c8347c2c4f77b1de1669;
    stim[52] = 122'h11375c5bd7ad90059fc7201b1a0cc4a;
    stim[53] = 122'h389338ff18d83a3633da04f53dfc9e7;
    stim[54] = 122'h3702bad837e0216f14cf0ede38d6fcd;
    stim[55] = 122'h3c4ef5fde61414bf5bec4f06f32d537;
    stim[56] = 122'h0b46f3ac1a8828fd06f628095e1ef0a;
    stim[57] = 122'h1a40e807f4cb975cebde81e2b7dd7da;
    stim[58] = 122'h2a0c46ca5ee15b6af54359515e00c01;
    stim[59] = 122'h2f759a6c4f790fcd70d8006faed527a;
    stim[60] = 122'h1f47450b798cec36ebd8f913469f3ef;
    stim[61] = 122'h3f9d52e923c2796ccce6c65874b2d67;
    stim[62] = 122'h3a2ecf03a3658efb07fc7b2111c9ebe;
    stim[63] = 122'h12f1ba3878e3aa2be86a4393a12da36;
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
      expv[0] = 53'h0c692b70ecc01e;
      expv[1] = 53'h0e2b3192f94c01;
      expv[2] = 53'h139725c1dca100;
      expv[3] = 53'h09a48c39b121a0;
      expv[4] = 53'h014edd67d20001;
      expv[5] = 53'h1b89bd637b831c;
      expv[6] = 53'h104acce758001c;
      expv[7] = 53'h13c70f748e031c;
      expv[8] = 53'h02e79a1c68a1bc;
      expv[9] = 53'h046620b35081a0;
      expv[10] = 53'h0522d520f68803;
      expv[11] = 53'h15f5f8b6340100;
      expv[12] = 53'h10a0d4ad3b0801;
      expv[13] = 53'h1ac5fa4039a021;
      expv[14] = 53'h06f381d34d02c0;
      expv[15] = 53'h1625c798742da0;
      expv[16] = 53'h0105d922f22080;
      expv[17] = 53'h1f78384655001e;
      expv[18] = 53'h09383dd64d01bc;
      expv[19] = 53'h11aa73342003e0;
      expv[20] = 53'h1b911631daac63;
      expv[21] = 53'h0670007d6302c0;
      expv[22] = 53'h07ac1a2f2c1c03;
      expv[23] = 53'h15330b21bba002;
      expv[24] = 53'h143bf56c7d8802;
      expv[25] = 53'h020c0d9c8ea001;
      expv[26] = 53'h02c44efcc00080;
      expv[27] = 53'h1827d80b1e8021;
      expv[28] = 53'h11ec135a5117e0;
      expv[29] = 53'h0bfec0954a0003;
      expv[30] = 53'h06fd363ce88c02;
      expv[31] = 53'h1eb2827868811c;
      expv[32] = 53'h12b29d3080007f;
      expv[33] = 53'h1502d703098000;
      expv[34] = 53'h1cf34427ac8200;
      expv[35] = 53'h0e8eb74bf33c01;
      expv[36] = 53'h01ad3d97b19be0;
      expv[37] = 53'h164487929a01bc;
      expv[38] = 53'h0fbd7477140042;
      expv[39] = 53'h0c38d69acd011c;
      expv[40] = 53'h0c4f79dc1b0001;
      expv[41] = 53'h1d76f7d9588c21;
      expv[42] = 53'h13e14a9f4d1821;
      expv[43] = 53'h188b2f5fe68001;
      expv[44] = 53'h0fcaaa34cf001c;
      expv[45] = 53'h01a1b9930f9da0;
      expv[46] = 53'h1d241712a78063;
      expv[47] = 53'h0b8c373903a3e0;
      expv[48] = 53'h07cde1d972a09c;
      expv[49] = 53'h0265e5fe2bac00;
      expv[50] = 53'h0e16ebcee20042;
      expv[51] = 53'h17ea39068fa002;
      expv[52] = 53'h17af5b200b0c42;
      expv[53] = 53'h1e31b0746c19a0;
      expv[54] = 53'h106fc042de207f;
      expv[55] = 53'h1bcc28297e8c01;
      expv[56] = 53'h18351051fa22c0;
      expv[57] = 53'h0fe9972eb99600;
      expv[58] = 53'h14bdc2b6d5801c;
      expv[59] = 53'h189ef21f9aba00;
      expv[60] = 53'h16f319d86d9700;
      expv[61] = 53'h124784f2d9a421;
      expv[62] = 53'h0746cb1df603e0;
      expv[63] = 53'h10f1c754579421;
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
