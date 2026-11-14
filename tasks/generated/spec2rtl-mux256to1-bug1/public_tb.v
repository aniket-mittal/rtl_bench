// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 264;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[263:8]),
    .sel(in_vec[7:0]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 264'ha27891822438ffdb647c3303e430aac1dc564b8af13e4a2dd134736f8fefc4b604;
    stim[1] = 264'h7000af4e899b2d867994a02e71faac1225554f377418de32ca97b667e84b8a2c81;
    stim[2] = 264'h8dad312842a1a3fb26c7b13ab6a4a09c3bfd8cbd4639987c8f3dec24837f35f08a;
    stim[3] = 264'h2e3c9b1a5c82693db9ed233b8c0e2b7072de815ae758ffdc5b3cf3c8d24520d0db;
    stim[4] = 264'hb6925ac4d4905b24fa260816027f9cf8237fc7fd14efc36d4163b3cf2bb77eeb37;
    stim[5] = 264'h576166db684c92dca5c80fa436af75e14fdc37b16a95f6258b9f907b79de9c6c05;
    stim[6] = 264'h4c920159a38a43359c0445e8d35b8fc0333dbdf50a56fcaf0f163a7632c8ddb0a8;
    stim[7] = 264'h5fa44af5d990a50ff42d924ca350e80861b442e6aefff3b9e299b620e8ffc10804;
    stim[8] = 264'h7b2855a3271f52455bb713a9f97ee6739f18a41eab639c9697ca28218df8fe27a0;
    stim[9] = 264'hf91d422ccee8f138d0bf0cff60ad7c313f356968c78aae9452c4fcc119f644b556;
    stim[10] = 264'h3a5c7bed4c01886ff9eafc6cec086de59a80eda56c4d26fc8c7631a2fe693513c6;
    stim[11] = 264'hf543567b433a23addeb1fc3bd12a23a491bc797c8833966e972b3ab8a09eb68be8;
    stim[12] = 264'hc75254b9806081881f8122f5992dc545a5729bdfa84773e3708322b0f41168d884;
    stim[13] = 264'h3833117f226cc81212aa3a83606a2dd097583da98400158f34bcd31b8f2ebe9684;
    stim[14] = 264'ha2b11eac2380031cd5070c0abfad6a43f63c5bef986976f5c31eb9ed915128e78f;
    stim[15] = 264'he29eb16b144381893cefbe01a5420198b86a07bbbb3ed5a31df426eb736d5ab791;
    stim[16] = 264'h76136b399153f1d64b9e7070a15b2ec10eb8f98cf7489003b276a8f409982c3bf8;
    stim[17] = 264'hd8f7c8060973fd4a6866e8b7039e04eb57f4c92c7fffd65d95b98b06f79d7bf99e;
    stim[18] = 264'h0d0e8febe6c99c98ea0c133e19391f6bde40345e17274e2df4285d366b4a6ac1e6;
    stim[19] = 264'h26a6ab42721a9e1ee2a818c37e941b0c29234359760d05efa9386163bd22c22a3b;
    stim[20] = 264'h22f0ffb664d8f64fa364722979decc3746235df5d7319e11f4f314c77ab9b62762;
    stim[21] = 264'had9bf4a8b8916cf7023b42d776fbac99ee7b11d52f68d6c92be90c867c2cbf1a2a;
    stim[22] = 264'h9b13e18bdd1d751945f7c529b152be049a034b56039335869740d341d480e024d5;
    stim[23] = 264'h07dd4e1d083612f4a7afa83e1d81c77aa0a7362a9045c592a84d3933e51f8b466c;
    stim[24] = 264'h16f0fd611e2b81f42db86dc85fadd3872b99cad9623a7ece60ad0cabca1372dec6;
    stim[25] = 264'h6fe066b0b972ee834600a5eb2ac47ef7ad86c5cfb40c37a21c3c90bc213d45e7f8;
    stim[26] = 264'hecf7df5fe84b7448fd81415addd45446e11ecc4ab40ebbfcf76e44d7a24adadd33;
    stim[27] = 264'h97a2ee8c69ca6965879d2a627db922201b767e97dac35ed5aa5b545071819386be;
    stim[28] = 264'hf9768ce5b0b7642845bacf0739e27ff713cddd8db93edf0e9d1402555231d84c6a;
    stim[29] = 264'h5629848aadbf5fbc95bd2855c4beb1b276c79d690daec79019c065ebc584cdaaee;
    stim[30] = 264'hb36ce15e43878605def9429b4acb9fb248b7cc1066bda192a94ff116e5108f23de;
    stim[31] = 264'h769a44dfaa986f6420c9b3b09cb945c8272f2bd1e85742cf4d5e12263b62e6d6bb;
    stim[32] = 264'ha77e1e69cf0f9fce8cc048328d379c1d6d4aae443f85bf7af089b44f8ba68aeeb3;
    stim[33] = 264'h229d9a292f66340d1f025528e34abec724eef0bcc9b487ec3bf3842e1dbb2a0932;
    stim[34] = 264'hbc9b1037dbeac93acaae9cf6c22ea168048ab3bdf5f9f62286e33059aa0fc25b94;
    stim[35] = 264'h55cc1b34d616215c56efcdc247c9aacfe397e63e48726c24ffd73c5f32a2b00a7f;
    stim[36] = 264'hfcd94de3822308a7f886349d1882d7ddd0d26831997443ae89bfa73e7876018491;
    stim[37] = 264'h4d99730a2e87e63113ddecfb07063bc25d1739da8821d8aeed6fb35e81c866ebb7;
    stim[38] = 264'hd206ff1544c458f7a92d470c2bfa4422104cce3b6c11383dfaa1befcbe07fbd9c1;
    stim[39] = 264'hb34b6f480bafe9697360ddf40943fe99f12740495eefe3be06d5f4ed94b90afcc0;
    stim[40] = 264'h43c54c0197ead04ef82d500a49d76066fa6b3d4b8b52a083acb5bf3157f8f0b9fe;
    stim[41] = 264'hcc2bdf63824d69942766297be7450b16d26f122389d962e20a2f5828218351f477;
    stim[42] = 264'hda5cbd771fe6e50a1cf85041f33636a36f2451d03fd8158a2bdade6640b16e2854;
    stim[43] = 264'h8157ac8bf4da4b9646af6e57c35ac244a83e8eba32c304ea49d8bf80dd658c9679;
    stim[44] = 264'h4791497ab0b80ba4d997339924bc5752f2518ebce83274f70691f575fc5d48b67c;
    stim[45] = 264'h808b03c4cae289f77245b00898720583a97fb977d625e4ff6bc032c6bed22be5b8;
    stim[46] = 264'hcc4449ffee1055fed9488175eccb32e1db7c911fcf191cf3de72702da67b49d9f5;
    stim[47] = 264'h54942d6b0a55db12b6cb2af1da9564f08cf71eb6d9c18c23bfa538d8cf70e2b720;
    stim[48] = 264'hd667a61763fb1a0b18dd9e841b00da37049736a7babc6ea90b8f70cea094a209cc;
    stim[49] = 264'hb4bf5d8d1a4e04032e59da67c87b4d01508859baac67f64371619a6c5ccb3f1af9;
    stim[50] = 264'h3148332a423f73f51d3a47adabd1cda88ac137b39998299aebf8bdae49715d8eb0;
    stim[51] = 264'h7f218afb271252102abf6f55daf52f4547594ee3aec56b03337c5d044fb5799623;
    stim[52] = 264'h93b6444b14b0ea5a52f5099e6a8f51afe8c73fb0e0e67e49a67e4e7522042bc106;
    stim[53] = 264'ha1c81459b174c290f4297d60847be250912a9e71216022bb2bb5b8613e2f3867b5;
    stim[54] = 264'h4966a4a731a903a6ea975057cf076c8113c8542fa6651d482b16d5678be678fc4c;
    stim[55] = 264'hc94729c3f48904fe214672a6b594d9b99d1e762c2d016114c5cfd47d06422183ec;
    stim[56] = 264'hcabcae095ac289504698221c2bd784ddd93be47bf1955ed5b0e37b259343472202;
    stim[57] = 264'h71d9ffadfd95cc3f3a386b6bed29da07d2730000a25ed1229567cd799280c33390;
    stim[58] = 264'h535bd96ef24fba1af5e96bcad6fd0aa553eb601f65bed418cdc8942a61131213dd;
    stim[59] = 264'h3aaa0224b2e03b1439742557cc2c8a54e96537bff35183a938ea691bbc07aa4d6d;
    stim[60] = 264'he6eefc4a335d3ebfe4fdceff6fe0282180f76dcb48027e33cf11ef927506231900;
    stim[61] = 264'h511a51e2850eb5c1f0bd31459713ee44f05ff1dfe417c17c32778d142b875e601d;
    stim[62] = 264'ha68ba8b0f2b41ab14371901609fd5c44b9d962f917e519dbb36d4d59134a723b97;
    stim[63] = 264'he125a9faa3f7d2f6fdbc5e56f4fa47fdccca4a4e1aa3a85a6b3158d434c5fe5e8c;
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
      expv[0] = 1'h1;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h0;
      expv[5] = 1'h1;
      expv[6] = 1'h1;
      expv[7] = 1'h0;
      expv[8] = 1'h1;
      expv[9] = 1'h0;
      expv[10] = 1'h1;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h1;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h1;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h1;
      expv[34] = 1'h0;
      expv[35] = 1'h1;
      expv[36] = 1'h0;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h1;
      expv[43] = 1'h0;
      expv[44] = 1'h1;
      expv[45] = 1'h0;
      expv[46] = 1'h1;
      expv[47] = 1'h0;
      expv[48] = 1'h1;
      expv[49] = 1'h1;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h1;
      expv[55] = 1'h0;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h0;
      expv[60] = 1'h1;
      expv[61] = 1'h0;
      expv[62] = 1'h1;
      expv[63] = 1'h0;
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
