// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 257;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_143266 dut (
    .clk(clk),
    .rst(in_vec[256:256]),
    .state_in(in_vec[255:128]),
    .key_in(in_vec[127:0]),
    .state_out(out_vec[127:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 257'h1aa1ca12b769207a9f1065f00b3a763d3652a0725ec2dc26b96baa19253efda3d;
    stim[1] = 257'h1c7407c965aa14e4111d3365a1cc883d2484243dc0850a52697a2ace150990600;
    stim[2] = 257'h0abfd2ad02d2626573766deb77bdfdebf2f53f9ba1408536e29046726c609d278;
    stim[3] = 257'h06d49b0e59ed65e16d349802bb870071c037a8a2f278b4179b980299f954126b7;
    stim[4] = 257'h0d36392203441437768a76f3d67b0f9ba923e1ae457c91eb7333f71ae0c7d0f51;
    stim[5] = 257'h0042d4c86c23fe9d739c06da6faffe97390903abe7b738a7b1b1eb58643c9b50f;
    stim[6] = 257'h05cab7b2e8d8e31abf4d0be5695382c45866f548db0b3005d1aced7450702ad30;
    stim[7] = 257'h034523ea64a4cb2474804468a1730943c89730e3971eab83b37a723f4745c6f90;
    stim[8] = 257'h0875462b74e1b11a93481ed11197c7e17c4b65446db9bba44e2bbc5d814b75e37;
    stim[9] = 257'h05ce36d74ca34bbc8c679690b45d940eabfbf744ae8edc433f8ed40c3bceadcbb;
    stim[10] = 257'h0cba95e89904b84857606f7b2e1447aeb4e06e0b33c2734f458a0d8072205dbfb;
    stim[11] = 257'h02a517b8a163439c26954b980752a34671aba89aa65cf348c12131d5b3feeea6e;
    stim[12] = 257'h0dd4f83cba805bbf1e6eb482ed903ce195aa01ae2523d0c558253026079958897;
    stim[13] = 257'h00c2ef580d4f18a1f28388ac3b77db76f61d6311c2e047e263d0ea87ec6f2961c;
    stim[14] = 257'h05a7a135692bc62c72f89e232fccd8ad8528d3bbfb18d1517af9857ec114a1a6e;
    stim[15] = 257'h03eb384e728c4fa081c1a9a0ea370b8a935ba31d4ba8d7502a47bd103bfdbb18f;
    stim[16] = 257'h09a25efee3c702e2af60d974df74dad6566ea73f3846ed0f9df25d5b51349d659;
    stim[17] = 257'h002ba3f63727af58490ae3531a6b164a8b06fa8fec41e1ef7d9b9810e796f47d1;
    stim[18] = 257'h0116669dc455211828e835c54df67bec6ca93f3b681aeaaff3dc2b31c52b5b226;
    stim[19] = 257'h0a7c90d206e2cd6a667d4b839bce9ab97d27f990fc5c03d583a500246e61dd6aa;
    stim[20] = 257'h07b9dc2f16bdf7c2f1475089437d8496083d6c5e139d1379da9d7fc8b0d7fea4a;
    stim[21] = 257'h0cccfe3eba7d3c3930d8b878dfe5074a60e069e1504339e5020ac02039d6c00f9;
    stim[22] = 257'h059ca27384f61f636d1e7146050cc6eace05bfa47dd6348c60e9f02b85f86e399;
    stim[23] = 257'h00d84df1ebee4e5123988c6dfd1b9abe4b648b488a4a24239b6a3719a19a93d5c;
    stim[24] = 257'h01810e8b1b5343a14483c5c0e5f6054201e8f64a10470a371cb0c332727d49c60;
    stim[25] = 257'h0ae29c836dda4c25397d7ee9fce13600347609128bdfeac45cb3912540baaf636;
    stim[26] = 257'h023fafe14ed8fce3f9fd67a94eed4380ec50cc4026a7b6f97e28387c6b45a2707;
    stim[27] = 257'h02ec9c0f8f9261812e1fb2d20fca75d844587f232210ce85f46b893328949d3d0;
    stim[28] = 257'h01e4b1c33925ce5940c04885c8830b58fabdc0b23e4aac3c630cbb6104e9e2a03;
    stim[29] = 257'h0ad0c6a4dc15d973d692a08877a063ca7c8d93bc3a0a77fa5905e6892aa7f8677;
    stim[30] = 257'h0dd8611d222edfbf714ff0ed7d66bd1e3017450b331d99c4a6830a12f6d7135ba;
    stim[31] = 257'h00d050a21469a4ce042237da200d04fd00ed0fe5d5cc8d037718b6cebb99c571d;
    stim[32] = 257'h017365a036d538a4599ec6e9181a7a5f399777e26f41a56c38d7473c30d254c6a;
    stim[33] = 257'h0810541be910726f36a9be3c8dbdc80dc76263a9699456f59546af8fa60850c1e;
    stim[34] = 257'h0fd2b1ab3ebcaececfc699ce2bf07e96ada773ae05482dab30f550a34c6d34abc;
    stim[35] = 257'h0f4467b399a0b89145ccc7359ff599268f7c621fa75f9bd9e1dbca24cf931c5d1;
    stim[36] = 257'h13065e24f921174fa353238883688f030e73e35ca574b1de539c65eba1fa64346;
    stim[37] = 257'h08977dd9fd7a61f6160f886ffe327426c1d43a4b397c0612b3cebfdd50bbd99ec;
    stim[38] = 257'h0c312adf863fad9c81ef6bcf417842231b4c0d56e254302db3a5d6f054fc69825;
    stim[39] = 257'h08ed99f77781971509cd09bc10cae5dc15e794618e5972c174b9568e7f8ffc43a;
    stim[40] = 257'h08d747efd70a7734f9806122b7937ef1236457300713a96745baf8cdfe0b76a19;
    stim[41] = 257'h0987bc3f957640963aa5623ba8ed0f907b7a7b515256e03d173012837dfc3fc30;
    stim[42] = 257'h022a9bdf213d181d03c48e828c8229da92121e7b3fc5fbb8db37a93f82007f6e2;
    stim[43] = 257'h063a138467888a9c48606b70646625ae3c6926efc81b60d1639590fc32e9b84f2;
    stim[44] = 257'h03d3c8259b52b85003994bf5ae34e3a0a914ce8f34a9c42e5aef8edf297f6646f;
    stim[45] = 257'h0e2cf291200de87393fdbdac1e7ea2433c8b85f07a5d29244f3712ee802790c42;
    stim[46] = 257'h0e12259d35257c9d2904d77e5f55c239b926c43e7e9a7f6d3c89618a8990eb796;
    stim[47] = 257'h0c0a76f78190923e3c1b445f8d71290d5e979d7014e2be5f7800bf091b08f1c19;
    stim[48] = 257'h07966a7aa8f0a77258ed7a02f1376c8753fa33352367506c08f7aa9c08f8330f8;
    stim[49] = 257'h07b933a7d7ee3de706c20753dcf5b7d6e2c18e31adf9fbd1672b706ed70f5d3f2;
    stim[50] = 257'h0d50980e734f386a19aa48329a51bd2f92a33c1ddf77d98e1451d1826eef77daa;
    stim[51] = 257'h04d0226333f62f6002d715ed3e8bacc449f1c323ca49932e2276e4f73d04f0182;
    stim[52] = 257'h0f46c98da3c16ef11a3825e36b45c1311bbb6e06e3695f31689a8024405716865;
    stim[53] = 257'h04d15900ed6dad85bd27593d458312e26021e796f816ef16e32c389f4401d1b7c;
    stim[54] = 257'h061cd1c238cbe87a380cee82b8c07f353f52e07c24a3bcc5ccb19ec4346807e65;
    stim[55] = 257'h017cb8e0f1c0ee940e12b93937d94632ff1db3080e52e47643ca2b65ce4be16a6;
    stim[56] = 257'h07d878bef4fd32c2cedf0b3e8d446463e573b12fbfbd7bd57610ea4e34bc74656;
    stim[57] = 257'h0efb5cccb690726a6148cc31289d29f120c19d7474541017a6163117b439e84d7;
    stim[58] = 257'h19ed41ecd3257bf439e2bf53915aac3538d0ffe3f4f4b0530687f8f1a4d0688de;
    stim[59] = 257'h01f70642df77c423f5b573a78f8af49d71a696e3d31de798ff2872b4173e96abf;
    stim[60] = 257'h05fb5556bf4349aae69ec7e9c5bd3c298e2c1b9a3464d5f1a243bd3c1d1f72357;
    stim[61] = 257'h07c2898b8c2211b72708e6fac3c3d720a3d4d6b5dcac1439e845a3c63ec79e937;
    stim[62] = 257'h0f73252e18084cda4a8fe1bf521856f0cc4e5ec207ac218409413cbcb6fa4320e;
    stim[63] = 257'h0f34ecc99e7e995391a04254cc18c22dd20dd52175c688a0400cce16f99fa1d31;
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
      expv[0] = 128'h00000000000000000000000000000000;
      expv[1] = 128'h00000000000000000000000000000000;
      expv[2] = 128'h00000000000000000000000000000000;
      expv[3] = 128'habfd2ad02d2626573766deb77bdfdebf;
      expv[4] = 128'h6d49b0e59ed65e16d349802bb870071c;
      expv[5] = 128'hd36392203441437768a76f3d67b0f9ba;
      expv[6] = 128'h042d4c86c23fe9d739c06da6faffe973;
      expv[7] = 128'h5cab7b2e8d8e31abf4d0be5695382c45;
      expv[8] = 128'h34523ea64a4cb2474804468a1730943c;
      expv[9] = 128'h875462b74e1b11a93481ed11197c7e17;
      expv[10] = 128'h5ce36d74ca34bbc8c679690b45d940ea;
      expv[11] = 128'hcba95e89904b84857606f7b2e1447aeb;
      expv[12] = 128'h2a517b8a163439c26954b980752a3467;
      expv[13] = 128'hdd4f83cba805bbf1e6eb482ed903ce19;
      expv[14] = 128'h0c2ef580d4f18a1f28388ac3b77db76f;
      expv[15] = 128'h5a7a135692bc62c72f89e232fccd8ad8;
      expv[16] = 128'h3eb384e728c4fa081c1a9a0ea370b8a9;
      expv[17] = 128'h9a25efee3c702e2af60d974df74dad65;
      expv[18] = 128'h02ba3f63727af58490ae3531a6b164a8;
      expv[19] = 128'h116669dc455211828e835c54df67bec6;
      expv[20] = 128'ha7c90d206e2cd6a667d4b839bce9ab97;
      expv[21] = 128'h7b9dc2f16bdf7c2f1475089437d84960;
      expv[22] = 128'hcccfe3eba7d3c3930d8b878dfe5074a6;
      expv[23] = 128'h59ca27384f61f636d1e7146050cc6eac;
      expv[24] = 128'h0d84df1ebee4e5123988c6dfd1b9abe4;
      expv[25] = 128'h1810e8b1b5343a14483c5c0e5f605420;
      expv[26] = 128'hae29c836dda4c25397d7ee9fce136003;
      expv[27] = 128'h23fafe14ed8fce3f9fd67a94eed4380e;
      expv[28] = 128'h2ec9c0f8f9261812e1fb2d20fca75d84;
      expv[29] = 128'h1e4b1c33925ce5940c04885c8830b58f;
      expv[30] = 128'had0c6a4dc15d973d692a08877a063ca7;
      expv[31] = 128'hdd8611d222edfbf714ff0ed7d66bd1e3;
      expv[32] = 128'h0d050a21469a4ce042237da200d04fd0;
      expv[33] = 128'h17365a036d538a4599ec6e9181a7a5f3;
      expv[34] = 128'h810541be910726f36a9be3c8dbdc80dc;
      expv[35] = 128'hfd2b1ab3ebcaececfc699ce2bf07e96a;
      expv[36] = 128'h00000000000000000000000000000000;
      expv[37] = 128'h00000000000000000000000000000000;
      expv[38] = 128'h8977dd9fd7a61f6160f886ffe327426c;
      expv[39] = 128'hc312adf863fad9c81ef6bcf417842231;
      expv[40] = 128'h8ed99f77781971509cd09bc10cae5dc1;
      expv[41] = 128'h8d747efd70a7734f9806122b7937ef12;
      expv[42] = 128'h987bc3f957640963aa5623ba8ed0f907;
      expv[43] = 128'h22a9bdf213d181d03c48e828c8229da9;
      expv[44] = 128'h63a138467888a9c48606b70646625ae3;
      expv[45] = 128'h3d3c8259b52b85003994bf5ae34e3a0a;
      expv[46] = 128'he2cf291200de87393fdbdac1e7ea2433;
      expv[47] = 128'he12259d35257c9d2904d77e5f55c239b;
      expv[48] = 128'hc0a76f78190923e3c1b445f8d71290d5;
      expv[49] = 128'h7966a7aa8f0a77258ed7a02f1376c875;
      expv[50] = 128'h7b933a7d7ee3de706c20753dcf5b7d6e;
      expv[51] = 128'hd50980e734f386a19aa48329a51bd2f9;
      expv[52] = 128'h4d0226333f62f6002d715ed3e8bacc44;
      expv[53] = 128'hf46c98da3c16ef11a3825e36b45c1311;
      expv[54] = 128'h4d15900ed6dad85bd27593d458312e26;
      expv[55] = 128'h61cd1c238cbe87a380cee82b8c07f353;
      expv[56] = 128'h17cb8e0f1c0ee940e12b93937d94632f;
      expv[57] = 128'h7d878bef4fd32c2cedf0b3e8d446463e;
      expv[58] = 128'h00000000000000000000000000000000;
      expv[59] = 128'h00000000000000000000000000000000;
      expv[60] = 128'h1f70642df77c423f5b573a78f8af49d7;
      expv[61] = 128'h5fb5556bf4349aae69ec7e9c5bd3c298;
      expv[62] = 128'h7c2898b8c2211b72708e6fac3c3d720a;
      expv[63] = 128'hf73252e18084cda4a8fe1bf521856f0c;
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
