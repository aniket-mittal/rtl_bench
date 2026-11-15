// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 466;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_021115 dut (
    .iClock(clk),
    .iEnable(in_vec[465:465]),
    .iIn0(in_vec[464:434]),
    .iIn1(in_vec[433:403]),
    .iIn2(in_vec[402:372]),
    .iIn3(in_vec[371:341]),
    .iIn4(in_vec[340:310]),
    .iIn5(in_vec[309:279]),
    .iIn6(in_vec[278:248]),
    .iIn7(in_vec[247:217]),
    .iIn8(in_vec[216:186]),
    .iIn9(in_vec[185:155]),
    .iIn10(in_vec[154:124]),
    .iIn11(in_vec[123:93]),
    .iIn12(in_vec[92:62]),
    .iIn13(in_vec[61:31]),
    .iIn14(in_vec[30:0]),
    .oMinimum(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 466'h19b96b21df24b7538f2ffc0ec384d3cbbe940578577ee23d72c82287ce0b2dd33744bbdbcf7fefb7409c558916f36c407f1670e82f78e03a2504d;
    stim[1] = 466'h1de19ec1d6f703a5657d3853e62d892d20e730b2c9c011e064105d34fda1ad60694d2b82cd67a5318761a0c3554d548a0749a41389c9a0bde2a00;
    stim[2] = 466'h21f5636a98047dfc49c1f6c766607648757ca8435e775e6aa504dee65607754a4a9250dd531e74ea6c64ff1ddf5f6a9aa3a097647ff357bfe48d3;
    stim[3] = 466'h1c6fc554648c193cb8ad1ce8356e7b04fcf5f9740ee361a05a240d590f1160d7f4fac38e8206639b3b948553dd0906d61e3e3970f8451034b0642;
    stim[4] = 466'h26cff5842f16c3f9344c8bdba5338a34d942dc554d0c688728b6fb92985c9f08dede439d0fb9d0e4a6944e0762bd1cdaa2bac58a49f290ede1198;
    stim[5] = 466'h1edcfcd07b1a61dbbdbe62ce6781882add41bca8fb6ab32d95db73ac6f62e794ca774224ee4367408d3099a8a204ec4a198397ec701317cec1c2e;
    stim[6] = 466'h18faa70910ce1d93c063eee298a2b043f08975df2dcb9a851ec0664f66ab454b938eb3ac0e154316645057e6f88e4a139f936b987121caf602c84;
    stim[7] = 466'h0d9645827ec0f5820f8284f1bcb0636158d1b60ba8cd2e9ecbe4d7176e0276abc3c5ead643dd393b9d9a20e201bffc3c3a3bed06a79fbe7638e6c;
    stim[8] = 466'h1234925b0c4a68f2121b10ca06957018e8a5651d27ab6442ff64cd1b1f6b0d76dd7300b3a27c974fbeed98637e6b0c9411c1f5c1110c303257516;
    stim[9] = 466'h30c468bfec8beaa5ca6fda670e199041eb447737f0f7c6d267ccaec9a5bfbb8bba505365d35adc75e5751b91d16d8953c03e0c7f29c1dd411640e;
    stim[10] = 466'h3ed9694fe44b23dbff17feef6ec9cfde6104babf9ddceead7d015d275c46be8e4109e44776fd78f1519e00bc8e00f45013c41070b0940ed7a2bca;
    stim[11] = 466'h01b41faa5241e9f70d823f3e6daa053f7cd7c7ea7fbc1857c4b9fc8d74a1e93589ff9c8a888fe07eab180b1957036905ad0dffcbf81dc0971b92c;
    stim[12] = 466'h06606ab51be69ffb925a7e7b04e9250de7a676e8dc5bf8d2183845d63909ba9fa858d284ccc786df455228a39865e6ea6c04ea18f7c8d19ddab0b;
    stim[13] = 466'h11d01cb1188087ded3353113dad52168c9dc55e7a4002e4f80e1b6f9812dd54f86961fe8ed794e0862d3dfd50dc8f05327ef8b1528c40ba6d7aee;
    stim[14] = 466'h178c39d548d6fdbd09d1320981e3a260ba58dbc0ae6300860926c12221fa21b3eebc589c2e8d0c0ff99e8041db1e8d09742452be4282b84508e55;
    stim[15] = 466'h04e3e929b385cc05f6ac1d852f5d92097c82c0a4f5abd2d2be04a0ff0ef9986a0f88cfedec07a91948f0e24ba136187e7df0e07b8847e2dc96f8c;
    stim[16] = 466'h1d875dace2c8a38ade6cee5d55e201fbac042af25d0ca5449c773e826a048d4b7612fb4315c4f10eca2cc604adc683acaa8246849748947f1d5e8;
    stim[17] = 466'h0a841056adc57ba3be92ba769dd0ffac606eb69a37f8ac3b5f4caa3f4606e3c370cc06bf9a5bdd9de77f7e24689367a743edf13fa42315b236a7e;
    stim[18] = 466'h245743f96cba9e12b97e1c9d2dd98b269eeda5744ee09e8b544a8c8796630ffb6371e4e9fea59ec75715a783791a289bfe0080ffe569fdff06ba4;
    stim[19] = 466'h2f9a05bcc2de512438d2956c6a6b862cbeae208b857327866b48f1a89e7468ee85a338c549b6e4a9eeb7f8449d8854de3e2010e0c9ee6f9e1ce02;
    stim[20] = 466'h374fc70c472754f5b319665b8da8e7e772cb11ba885969e0f8410b6f8c67fecf27388a62e35f96753fc6e1a186df03e7f55fa66311c618ce5ccc4;
    stim[21] = 466'h0fd8466d4edf3af01cd6ab4d9f443b7c4ee7d8c5245c8c8eae139b3ffdb818a36105433833fbb939abc620c58efa6dbb426b4d224207fda195b73;
    stim[22] = 466'h1639cd4ed37b4751327f12732f8c129794e035a0928070e978ecf8ba8438b79a6591f50a9625e5a778fc04574b8eb47955c1819ffa4608ae38dfe;
    stim[23] = 466'h0646e63cbedfc066564bd539cb4da2e993dc587baa32ac13ca62349d4744e58c70526a7bc869a4efe3bcad701753b1cf0767404d03bb388869abe;
    stim[24] = 466'h265920eaa368369afc31b478dd7f5fd00eeae8eeee8c65eb201e43301959dfd3c0aff93011eeb5b6f9815d3fc004a15a8a2ef738a50f934074f41;
    stim[25] = 466'h1de0c08056faaaf2f887da87f8b864e8fa83478cc13dcdbb4d3cd0e8569d28c47aeea3691a7ab0f36565a41b6de7afb1e460e570b8571829e7151;
    stim[26] = 466'h246c3033be6ca41ad17e175d2861906e45f1fdf6e67e347a62c7286a8e2f6e0345552b218f67eea31598cbcc6214cf1a8725569bde179168d6725;
    stim[27] = 466'h2ae83ca2b33da5ca0b09953aeff8cdce41e977b7722d5e53c28e231275d13e200907978f8560b55456dfe2620e8b0f3797f84dc2db23d8b260132;
    stim[28] = 466'h1858910006b3eb7a0eee953ee7c4c171e1636e7462471e0a7cd95113a80451dd5f201e8f60c71feaaab9bb4743b1d5d09d3c8b89b980c28885023;
    stim[29] = 466'h30b6ad475d35beec4fffc4bd9f75fd423b2bae63d038f978b046bc1bdb1499cdfe0b0986af3984180533704a914495133314b9bbd6036703c56a5;
    stim[30] = 466'h20f93cb77f4e1fe83d3e5c528299aa5702d02f5663173aeb8ccea62219fa410fffa6e318cfd91fa734e1fd97d1c44c0b95f688c13bcd6165ef7c3;
    stim[31] = 466'h290de115d62ddd808d0ffafe683fa19b0a26fd58ccb7901abd349a9e6a72feeb1e357010c013f8cc515dc723f3258d6a2c6cf82049951f5836426;
    stim[32] = 466'h34405fc8206a6ce8973163df5f9e7f7ee84699e1a92d676ef395d0ea811e906b91a93bc6fd314a9ad4d03004eda973bcad873ff85f8315aef6095;
    stim[33] = 466'h26d974fbb2e5049f7eb5cfded3f51e0956ca640c851e10149806541b37d14bd88eb902c1e80cd0cc0ec36e704dcd278e4bba8ffa0d67c461dacbd;
    stim[34] = 466'h3414cb5f5df26c3c50419802323516e307a6cb63569e540c19fdaac5c37d72d7e080f4c7b328d0ba0e6805f5fa3e9eabffb39603709ec6c378740;
    stim[35] = 466'h3a4b087fe8964a5cd63d4bb8ae615e3baa3f91995624cf57b5fbfed83e8c62285fc7c73176cdecaab38f6790399bc69d99df63f80bc094c2d0f2b;
    stim[36] = 466'h12c65cabcd1d5c772838b3a977cc7fb1802378780899873debc0187396232e945c403beeb95793583469fc26ca4aa181a3ba71ffbbf097c390882;
    stim[37] = 466'h1cdb4dd447816c9b17d6536b63ec20d6ca21422166180d3e9759d491afa239fa6e066cf925508aba7ea73d7833c3277965d0f1ff6a34fbc6e4d67;
    stim[38] = 466'h1909cb794ae661b138980b2e3e649946464d72bb5f4c8ac3ad238aac67b4493686c3a4e3b45dc8da0b7ec9b367e8901c7ab83177abf627ae3db70;
    stim[39] = 466'h2df20247e6bcc74e7558a9ca4df5bac06106675aff1e5658da653578330d1c35cd49faedebdf2698ad6f8a1025f5fdf97030d544631b6026f90ef;
    stim[40] = 466'h2a20bee698717fb413c15120bcfb6958324ca0ead5383a5624489669daea4296276eab69e489edd9b90742006731c2c191d7de740e0d8bb6294b8;
    stim[41] = 466'h012ffa3e992fed176c52e93c757a14541f057d866f6e19d68adfa305aaac28587056e3df28179c9716dc583b02432851a7674b19d7997e12a74a5;
    stim[42] = 466'h3bce857e2004152c030ce324abdf7f9d41be774d6a33cf72597d50d49ed18963c36f35c6d562369da04bea591c0e2bcfb7988a280ffdef3bc8815;
    stim[43] = 466'h1087040ab51a98f456fee4b9f73a799054bd044728185e5d451aa9f456ed8de4a6b66fd152aabf7ec58b58a792118693c46b9dea45cfa35af90c4;
    stim[44] = 466'h1eec3211f3cedbac9fb8a3e96703373fd6df4786416b0a245a0fb4174d8820591818f942e26dfead7934d06a71763ed0d95cc5654863a06a7bee5;
    stim[45] = 466'h237d595636905c60b6871b52c297a0e6e55657f6429ba2323a72534e5215b3d59f8d576b716f513ae716e766c5102e22767dad65ed57b69c7858b;
    stim[46] = 466'h262235ec56166f90ef57a7993f5b84d867cf3459374e11352c02428f715b15d6b64477d6c71b803a1a20589f95c8615b7d4e646f1e451d494d482;
    stim[47] = 466'h146bd6bbdf1ef0c3ca0fa5ab262cb0e88f3618963ecf4099a21ca3c99c589f127b3c12bc5ab029da932c21344d9124b53a9d0487be42fe11e2710;
    stim[48] = 466'h2bb7c8470ab0310e63612e41c29b5dcce83d1da22abb01f0ef1dd00fa64bda39cf678cb4370372d47409d298a16931261e5ff1eac29ea91894771;
    stim[49] = 466'h0c0f24694eb170807931145f0b4bf58c986f5c2520912925b1059374e238f9283d3d50d413b71ccbefaa26f61f32cd038a6f61a24af1bf27ed281;
    stim[50] = 466'h24418b15191c31428c98635e3b73c4b04be8d385765ea6c37f19e0d2ffb11bc04719c88067a3879fed94c83779475cccf24a99a6e59bf6d2119c4;
    stim[51] = 466'h0d2687d3d29d04ea48a3aa403b8bba36c42511a3fdfb5c5e2c17671d2a554571bc11d7ac9e06f3be1e3e7734f29c537ab0089a6c2447c9d3808b6;
    stim[52] = 466'h3e67fe2748f64466167f93ed5a81169da3e402feba3f975bca63a3617e56a1cd00d3d5e465fe07a059fbbc73f24f0ee9c0fb8e90998088c6a94b2;
    stim[53] = 466'h1077a7b181db54ff8d393be2f4e3d43efde70ba78e3fa6960b6b4d45915af05969b72f4a2577dbd499a07f84fe1d71e5355b7573de7adced148ef;
    stim[54] = 466'h283fe0fd2bdb8f974108ae8577570981e64816af76d142cca4b14cac49783609b3cf20851b17432b6ef6e27cfe853d99e9e60cd8d0d8aab9d8b5b;
    stim[55] = 466'h1639e2750acbd4f13b3013be37d2d262a07794eb9a5bc3b2f9bb1bc4237a0b5558786a6b0d0251de762840cd4ad67e0f3ce384edd9c7cb683d123;
    stim[56] = 466'h1b6114a5bb1ab2c7cf4c2214477003194ddd607e4789a4a67b0e9b4eaa90f107d22f759829830dc1fb3d17e5ffa25e91ccb852074273182a3ac36;
    stim[57] = 466'h097b5b2e9c4d919eabbe7c5ff6edd09a8071e6d755c3ac05df2c09e70493057e8f00d1637025075f9d49fc371f53aadd3cd5920f8a30e8b2283bc;
    stim[58] = 466'h3e0c98765d8b913150f3716281f19fea8da0b324a61a356590ac6c0cf5039eb2e0f31663bf02fbe037f52cba3bda1bf6cbe9968e1aea1a3474315;
    stim[59] = 466'h2c14eab48dc968110361288f0e413d9813fec2a7efac262c228f25cd818c919a81cf6f50333959c209302026b868fdad85cbbd4796dfe4b1140b7;
    stim[60] = 466'h15140fdaa0dfe3d48e465c0de5eaf00a3236de41ca0d8bcf74b43ced4927415cce2e09f9cc502f8e5f3d7c02039ef40c20c8de4bfd31dfee648a7;
    stim[61] = 466'h3a1f3b83ef3c39b7e66f0a6b68ea771c61d0d654984933d60de90fc76f0d069df6b8d4da8b0ede06c19c6913c93aecb2756718f19bd054ada3688;
    stim[62] = 466'h0d9369b8104543b23299df52a18a639724903c039979a217a1ee4e73009b68d2a90fbd16dd7c4e316028a84e871c332606db67ca909485e6f4643;
    stim[63] = 466'h206054b0ef0133d6b53bd4a4a52435404aefdfdbf24a68c5f4fb91a66b0cddfb4969ef146d68e80a211ed5708e8542c006e3afc1603eb00c22d9a;
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
      expv[0] = 4'hx;
      expv[1] = 4'hx;
      expv[2] = 4'hx;
      expv[3] = 4'hx;
      expv[4] = 4'hx;
      expv[5] = 4'hx;
      expv[6] = 4'hx;
      expv[7] = 4'hx;
      expv[8] = 4'hx;
      expv[9] = 4'hx;
      expv[10] = 4'hx;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'hb;
      expv[20] = 4'h3;
      expv[21] = 4'hd;
      expv[22] = 4'hd;
      expv[23] = 4'hd;
      expv[24] = 4'hd;
      expv[25] = 4'h5;
      expv[26] = 4'h5;
      expv[27] = 4'h1;
      expv[28] = 4'he;
      expv[29] = 4'he;
      expv[30] = 4'h7;
      expv[31] = 4'h8;
      expv[32] = 4'h8;
      expv[33] = 4'h6;
      expv[34] = 4'hc;
      expv[35] = 4'hd;
      expv[36] = 4'hb;
      expv[37] = 4'hb;
      expv[38] = 4'hb;
      expv[39] = 4'hb;
      expv[40] = 4'h9;
      expv[41] = 4'h9;
      expv[42] = 4'h9;
      expv[43] = 4'h8;
      expv[44] = 4'h8;
      expv[45] = 4'h8;
      expv[46] = 4'he;
      expv[47] = 4'hb;
      expv[48] = 4'hb;
      expv[49] = 4'h2;
      expv[50] = 4'h2;
      expv[51] = 4'hc;
      expv[52] = 4'hc;
      expv[53] = 4'hd;
      expv[54] = 4'hd;
      expv[55] = 4'h6;
      expv[56] = 4'h6;
      expv[57] = 4'h6;
      expv[58] = 4'h6;
      expv[59] = 4'h9;
      expv[60] = 4'h7;
      expv[61] = 4'h7;
      expv[62] = 4'h9;
      expv[63] = 4'h9;
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
