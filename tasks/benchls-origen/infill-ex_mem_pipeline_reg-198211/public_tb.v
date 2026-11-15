// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 141;
  localparam OW = 140;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_198211 dut (
    .clk(clk),
    .pc_value(in_vec[140:109]),
    .pc_plus_imm(in_vec[108:77]),
    .alu_result(in_vec[76:45]),
    .rd2(in_vec[44:13]),
    .rd(in_vec[12:8]),
    .mem_read(in_vec[7:7]),
    .mem_write(in_vec[6:6]),
    .memToReg(in_vec[5:5]),
    .branch(in_vec[4:4]),
    .reg_write(in_vec[3:3]),
    .zero(in_vec[2:2]),
    .flush(in_vec[1:1]),
    .prediction(in_vec[0:0]),
    .pc_value_reg(out_vec[139:108]),
    .pc_plus_imm_reg(out_vec[107:76]),
    .alu_result_reg(out_vec[75:44]),
    .rd2_reg(out_vec[43:12]),
    .rd_reg(out_vec[11:7]),
    .mem_read_reg(out_vec[6:6]),
    .mem_write_reg(out_vec[5:5]),
    .memToReg_reg(out_vec[4:4]),
    .branch_reg(out_vec[3:3]),
    .reg_write_reg(out_vec[2:2]),
    .zero_reg(out_vec[1:1]),
    .prediction_reg(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 141'h0de1a1c371562e098d9920f249a87672bff3;
    stim[1] = 141'h0864c928d35744b290ac982844fabf351d37;
    stim[2] = 141'h0e645ca693cfa11556e491fb2ac9ddefece9;
    stim[3] = 141'h0826c2f1f23d56542812e0ac40e68ab4ad59;
    stim[4] = 141'h08ea2fe5e6d9e046844471180b94b3c8229f;
    stim[5] = 141'h1e4050092cf1df00c790ac1a8721167b4f9c;
    stim[6] = 141'h143b750352af17f4dbdae61ffaae184110cc;
    stim[7] = 141'h10962567787cabd3ba5d9a7b2fc6d0c6b2c7;
    stim[8] = 141'h1d7c51f4fb806f284f92f6d9aea162706f9b;
    stim[9] = 141'h1dd5b2e2ff862c7ef4e796ae5b24b3dae9e9;
    stim[10] = 141'h031026aa60b36bee333c920475d0f505943a;
    stim[11] = 141'h010bca4fe0d2120bce384333460ce5050a48;
    stim[12] = 141'h071cd033d53cb443f80b1402a57a75f69cf2;
    stim[13] = 141'h1dd60c8ebc76587d555d3d4b7dd431979059;
    stim[14] = 141'h0eba85db1b1d0112742eaad5d1e1baadd272;
    stim[15] = 141'h1f2293f18b7a6145f7313575771cae444f5b;
    stim[16] = 141'h1c0bd61e4c98f79858932e7e91d8cb6079aa;
    stim[17] = 141'h11ef407a7839878d5237fb4e47583097124a;
    stim[18] = 141'h100db7d49896434d886532c973e7edead797;
    stim[19] = 141'h1790e2891c6450eb9cdc84f437c7092999ad;
    stim[20] = 141'h06eb91ee22f389e30518a458ae35617eed6a;
    stim[21] = 141'h13c7407beba5f1f7390681e44567438756c2;
    stim[22] = 141'h180b0f5d4abbdadc9d89053286095774c930;
    stim[23] = 141'h1bfd0d94acc5b02a27e1509a70d7880f2aa8;
    stim[24] = 141'h1ea87aacca4d6aa484b28c3f066de165a9a0;
    stim[25] = 141'h0748825978a304fb27bff8bae330d99fcc54;
    stim[26] = 141'h07f22192c79ceffe60a7ca52a62125fe972a;
    stim[27] = 141'h06833711a4c776e48809f046eac5976886ea;
    stim[28] = 141'h1194861ae7ff4ad984ce8ee2485323c553ce;
    stim[29] = 141'h1cdc03bdb4e4260c01c24e38bb2be59264a7;
    stim[30] = 141'h0ad408e152642353ae904711c36deb2e674a;
    stim[31] = 141'h192cce65062e7d60ec4af571e658b7cc4ae8;
    stim[32] = 141'h1f25cbfd94295eff3974143721943e5d9136;
    stim[33] = 141'h119d642722c8a66c9d53fe587f85870d9b94;
    stim[34] = 141'h0fb042173cc9074c9da31cd139022f148b0c;
    stim[35] = 141'h0b8ae0119376aa3679f1f6b694d89aeea5c6;
    stim[36] = 141'h1db0e249913bb13e6ecc061083d0c4dab10e;
    stim[37] = 141'h0ac3c58904adec2bda82c8aecacb241fd895;
    stim[38] = 141'h055b3cf6cc2733bf46e302c6409c2d72ec5d;
    stim[39] = 141'h0d18e3c804fe4d4895b24f6608803f5e2e5c;
    stim[40] = 141'h114f5fb082ad518484c1bf4b1ed396defd69;
    stim[41] = 141'h02e0d0b85a84b3a576bf0beab0d28747f97a;
    stim[42] = 141'h1d541c1d9a4aaf6b9e7925306f1792afc198;
    stim[43] = 141'h18e0b3645b7570cc18084cef2abd71e8d332;
    stim[44] = 141'h1a856635d70088306000c2d96a41956177f8;
    stim[45] = 141'h1acd021112e11bb691fae1b3de9bb6829784;
    stim[46] = 141'h13aff37eafcbd0d51e573c9396ae87e3a85c;
    stim[47] = 141'h08b9b3b5a842b2f77a09439ddc98703f3d46;
    stim[48] = 141'h0a59b77de9873134e31c49e5695a0d753a81;
    stim[49] = 141'h14c4242c66e32f1d75b25c6c51f08d825a2f;
    stim[50] = 141'h16461f8083e6cca9a5715ac27bfe10bff3c1;
    stim[51] = 141'h185de3e5b8beeaa8ad5f5313da0e4973258a;
    stim[52] = 141'h05bff91f4fe0d9e70268e0f65ff8429c75bf;
    stim[53] = 141'h1dd6a284ff90597878ea78574ba310e4f4c5;
    stim[54] = 141'h1c8125820bcf4369caa90f7fb69f8318d2c7;
    stim[55] = 141'h13b85e4a28bf0db2a5876affc7d9d12e4735;
    stim[56] = 141'h1e7ba9c940d7d12fa91cf84b9bac05b3f884;
    stim[57] = 141'h090d6a80f9eb42076c219ca044e6ec97c7ec;
    stim[58] = 141'h03c850a00fc214b7ef4696ab5259185b606b;
    stim[59] = 141'h1bdbea39797ad93617d75c012af2159141d1;
    stim[60] = 141'h1c06266e191511e6b8ffc246b21b74b1c649;
    stim[61] = 141'h1359bd87199d397a3a2617d1e448dfc81e7f;
    stim[62] = 141'h06f245018326d0cdc8bf228e8c4c63e1d488;
    stim[63] = 141'h136465d17a8d0ed927a22d6fe3ee9ddd7e63;
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
      expv[0] = 140'h00000000000000000000000000000000000;
      expv[1] = 140'h6f0d0e1b8ab1704c6cc907924d43b395f81;
      expv[2] = 140'h432649469aba25948564c14227d5f9a8e83;
      expv[3] = 140'h7322e5349e7d08aab7248fd9564eef7f675;
      expv[4] = 140'h4136178f91eab2a140970562073455a56ad;
      expv[5] = 140'h47517f2f36cf0234222388c05ca59e41103;
      expv[6] = 140'hf2028049678ef8063c8560d43908b3da7ce;
      expv[7] = 140'ha1dba81a9578bfa6ded730ffd570c208866;
      expv[8] = 140'h84b12b3bc3e55e9dd2ecd3d97e368635903;
      expv[9] = 140'hebe28fa7dc0379427c97b6cd750b1383781;
      expv[10] = 140'heead9717fc3163f7a73cb572d9259ed74f5;
      expv[11] = 140'h18813553059b5f7199e49023ae87a82ca00;
      expv[12] = 140'h085e527f0690905e71c2199a30672828524;
      expv[13] = 140'h38e6819ea9e5a21fc058a0152bd3afb4e00;
      expv[14] = 140'heeb06475e3b2c3eaaae9ea5beea18cbc82d;
      expv[15] = 140'h75d42ed8d8e80893a17556ae8f0dd56e900;
      expv[16] = 140'hf9149f8c5bd30a2fb989ababb8e57222781;
      expv[17] = 140'he05eb0f264c7bcc2c49973f48ec65b03c80;
      expv[18] = 140'h8f7a03d3c1cc3c6a91bfda723ac184b8900;
      expv[19] = 140'h806dbea4c4b21a6c4329964b9f3f6f56b83;
      expv[20] = 140'hbc871448e322875ce6e427a1be38494ccd7;
      expv[21] = 140'h375c8f71179c4f1828c522c571ab0bf7680;
      expv[22] = 140'h9e3a03df5d2f8fb9c8340f222b3a1c3ab00;
      expv[23] = 140'hc0587aea55ded6e4ec482994304abba6498;
      expv[24] = 140'hdfe86ca5662d81513f0a84d386bc4079554;
      expv[25] = 140'hf543d566526b5524259461f8336f0b2d4d0;
      expv[26] = 140'h3a4412cbc51827d93dffc5d71986ccfe62a;
      expv[27] = 140'h3f910c963ce77ff3053e529531092ff4b80;
      expv[28] = 140'h3419b88d263bb724404f8237562cbb44300;
      expv[29] = 140'h8ca430d73ffa56cc2674771242991e2a982;
      expv[30] = 140'he6e01deda72130600e1271c5d95f2c93203;
      expv[31] = 140'h56a0470a93211a9d7482388e1b6f5973380;
      expv[32] = 140'hc96673283173eb076257ab8f32c5be62574;
      expv[33] = 140'hf92e5feca14af7f9cba0a1b90ca1f2ec882;
      expv[34] = 140'h8ceb213916453364ea9ff2c3fc2c386cdca;
      expv[35] = 140'h7d8210b9e6483a64ed18e689c81178a4586;
      expv[36] = 140'h5c57008c9bb551b3cf8fb5b4a6c4d775282;
      expv[37] = 140'hed87124c89dd89f3766030841e8626d5882;
      expv[38] = 140'h561e2c48256f615ed4164576565920fec4b;
      expv[39] = 140'h2ad9e7b661399dfa3718163204e16b9762f;
      expv[40] = 140'h68c71e4027f26a44ad927b304401faf172e;
      expv[41] = 140'h8a7afd84156a8c24260dfa58f69cb6f7eb5;
      expv[42] = 140'h170685c2d4259d2bb5f85f5586943a3fc80;
      expv[43] = 140'heaa0e0ecd2557b5cf3c9298378bc957e0cc;
      expv[44] = 140'hc7059b22dbab8660c042677955eb8f46980;
      expv[45] = 140'hd42b31aeb8044183000616cb520cab0bbfc;
      expv[46] = 140'hd66810889708ddb48fd70d9ef4ddb414bc2;
      expv[47] = 140'h9d7f9bf57e5e86a8f2b9e49cb5743f1d42e;
      expv[48] = 140'h45cd9dad421597bbd04a1ceee4c381f9e82;
      expv[49] = 140'h52cdbbef4c3989a718e24f2b4ad06ba9d41;
      expv[50] = 140'ha6212163371978ebad92e3628f846c12d03;
      expv[51] = 140'hb230fc041f36654d2b8ad613dff085ff9e1;
      expv[52] = 140'hc2ef1f2dc5f755456afa989ed0724b99280;
      expv[53] = 140'h2dffc8fa7f06cf38134707b2ffc214e3a83;
      expv[54] = 140'heeb51427fc82cbc3c753c2ba5d188727a63;
      expv[55] = 140'he4092c105e7a1b4e55487bfdb4fc18c6903;
      expv[56] = 140'h9dc2f25145f86d952c3b57fe3ece897239b;
      expv[57] = 140'hf3dd4e4a06be897d48e7c25cdd602d9fc42;
      expv[58] = 140'h486b5407cf5a103b610ce502273764be3f6;
      expv[59] = 140'h1e4285007e10a5bf7a34b55a92c8c2db001;
      expv[60] = 140'hdedf51cbcbd6c9b0bebae0095790ac8a0e9;
      expv[61] = 140'he0313370c8a88f35c7fe123590dba58e325;
      expv[62] = 140'h9acdec38cce9cbd1d130be8f2246fe40f03;
      expv[63] = 140'h3792280c1936866e45f9147462631f0ea44;
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
