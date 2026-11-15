// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 258;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_113290 dut (
    .clk(clk),
    .rst(in_vec[257:257]),
    .GrnPixels(in_vec[256:1]),
    .gameover(in_vec[0:0]),
    .ten_digit(out_vec[7:4]),
    .one_digit(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 258'h38fc518b13a83eb93181801b38402f704c9dac8133166c9bf297521e788207f7d;
    stim[1] = 258'h3eacc3e4109f2d7e632d2683000a14a1e2e01133b3082ccc1c96cba571952c676;
    stim[2] = 258'h0c0a7de087a81fac0aa6111a880765b60fea7a4b1ce27e009d156d09decb2c838;
    stim[3] = 258'h08b51eb507e2792d95fc553c0ffc343dd947faf01199e93421d472475fa14a561;
    stim[4] = 258'h0a54c5ee3aaa04706894baf39208feb80ce113165837a8ee9f93afc9c7308f696;
    stim[5] = 258'h1ebf7f5734992cad4ef31de0e3a7eb75f7abbfdb193961a7e638d6a62bdb4c3a8;
    stim[6] = 258'h059a73cf6d99245151556895750a3166e724375f4c89bfcd889acb82ecb18b59a;
    stim[7] = 258'h1450cfbdb082597592d5ca101deb48a82289ffb1f6910f402c3cb23fb4004ea26;
    stim[8] = 258'h129fb7e25fffbe62b3ad1f6efe59e1c59dae9cb4c77bc14d17142fbb00c2ef11a;
    stim[9] = 258'h127e3d725dbbd1411b24b671a9534ef080d00f954d604429d84e89d34e741b1db;
    stim[10] = 258'h1ac66d18eae8a66a5281d9e70e6206061f451b773acfe362eceb8584b0b8d6558;
    stim[11] = 258'h18718c886311ef129a862a8ba3c5dc2a2369e60385e87c5e2f362adbc8b48b9bf;
    stim[12] = 258'h14535d2c832aeefe05ed28dd538419b08d4e4ea606869e09a61750cfc799aae5d;
    stim[13] = 258'h1837504fcaa2a2d1bd47b6d363a54a8cd55a62e8b4007cfd1ab5357446b9d7777;
    stim[14] = 258'h176b0878e13fd72b96eda879ba53920ec4d88cd2fe9940d52e8152bf3a0eb585c;
    stim[15] = 258'h0f3e9cd99d8e9affcefdf2f2cc208b6116e148cc84da5a66ff311876e988f4ae1;
    stim[16] = 258'h08906623f23318c9240e8df8e1de4411c1d73fccb3810ac5512bc9ed82602657a;
    stim[17] = 258'h12520a4f51bb3f1cb1543212a099926efe865021f59e3697b41db51a98078e0a6;
    stim[18] = 258'h0137d5c7f9be95f9db6ffd60c7eac0c41223162110f1c498506e07b0631747834;
    stim[19] = 258'h1ec033105ae9c438f8d50f3436f7496ae3f3847fa67b79fef7107f4164d4e7da9;
    stim[20] = 258'h05e6116fc340c36dad887b5d49124f088df0e3318020110fbee8c79699fc85b89;
    stim[21] = 258'h11e2519fcab811ccb52eb2a8dd8ed365fab38b77b8bed3631e5bcc0474f204e94;
    stim[22] = 258'h1dbf8f974568446ed822f4bb3925013af91fed157f7e7f315865afe6c0a2b61ac;
    stim[23] = 258'h02b22571dc1c04b5af431be5432e1f9e6df0b6f69a83c82f2f7d6602cba9fcf5c;
    stim[24] = 258'h1322b0b3a6637e6f16ecfc40c7dd962c5da7889d0d73c9327b482205de0b98ad2;
    stim[25] = 258'h0b203091b5aca6e95fb7175bb166731c68883851a24e5917cd1fb871722461a86;
    stim[26] = 258'h18c48433352f48df9013f4eba9c4f84c35771fd5c76ea6f0dfca20a7a36ad345b;
    stim[27] = 258'h1812ac16553de78c8483dd884aac13db943bf992cf6049a51a48ab3e685d3b4b1;
    stim[28] = 258'h188abe0c11fc9758b98758ea3aa0a4ee6ba1d8b4ea69e02c13ee8ec45dd2e413f;
    stim[29] = 258'h10486359aa428f84c422e178b56cbd916594d97e731d4b25eafa063b10ec65e4d;
    stim[30] = 258'h0852606f7e337126cc42f4499a068c0c9e287423376be8b886221b1a6abecd4e0;
    stim[31] = 258'h19f6d22210a00594f28a9531688e0da8985d56e20571b60ffc1ca34c585a3ba02;
    stim[32] = 258'h18df8580887f35aa9d57c5932e0a41c3bd042630fa6b3021ba9117098a776bb1a;
    stim[33] = 258'h13eb601a95f4217198c5edf4a48d6c2a5a9e1b9db184a1e37cdab6da0e8d33e95;
    stim[34] = 258'h0df6aa607de5e48c56a1053c9b78e87a792cb7a535851b2e60fd149ffb4b07208;
    stim[35] = 258'h14a7337b5e8155f75e4f2c7d50fd247c488d47d7aa68ac6693da5878d0a47ce75;
    stim[36] = 258'h056b372b736114050001b4a81039d83f919be99c336b349df2b86b1166bad3452;
    stim[37] = 258'h11f2d580576b0e262fcd19d88916a587d30b4ac329fa5f1bc8a7bfcb4b2a7bd5b;
    stim[38] = 258'h1e7c801953ac0a70d16e12194a1882626af075e0d1d01f458e002b7cb5c0d3d79;
    stim[39] = 258'h0514be0cbfeda91ed3062b255419ac6d4b96b5dc50582810d761a8b7bcfe6f5da;
    stim[40] = 258'h1eb5566b7ac4d2fa13a6b084721cbd814df974a1f1a87d46fab5181fe3ceb7b4b;
    stim[41] = 258'h1722482545452c5e810c0a7122b38c5c412847535c231fd7e6c6c3412ffe6cfad;
    stim[42] = 258'h0b24463dae9b18b058600db477b81b36cc9fa394b09610c423d111751328ef37d;
    stim[43] = 258'h1771acc44a4f7a43b544262c29b8a3064264792cec389b9dc0528105acf06b968;
    stim[44] = 258'h06da8faf790df612d2a3795ddd2969fcbeab3f97cb785e99951c413fa09f329b4;
    stim[45] = 258'h1c33d6ff8e1e724d7a201706a378824bedfbb5a22808ce7698f80f36b85afad77;
    stim[46] = 258'h1ccf7d6d8fc871cd457a290a25d53acf02d91bb32ec98a0b76295dc116af2b1d8;
    stim[47] = 258'h1ce3c54cc133b38a6786017c05175d754c67ff7cc055e0afb3a08cb7ab1a6e47e;
    stim[48] = 258'h1f9c45eaf233f4fc9e4ca816cfc17007a57d6118ea54803ae3107bac264e92532;
    stim[49] = 258'h0a50b22f4da14802b71d962a8295fe41836a78912e07dcadb6a6783f587458b1f;
    stim[50] = 258'h0714b7954cdc3c335f907eff01b7c2ac0a8d768decaf4fb1205f0607c7c42b9cd;
    stim[51] = 258'h0b77ef164b06d9ce9cbc46484a7a61351d601dde50cbe8bf0b98ac19f6a2e73f0;
    stim[52] = 258'h11b69bfeb352f4b0b16c8d4a100a53845274b2114b2d2339f0f5b7d9b713fa63e;
    stim[53] = 258'h0352599010f60496e6c6414ef36f84f4904fa1da3507c91848546592fdb2f8136;
    stim[54] = 258'h1f813dc05822eb65566d91a2fcfa3f7c719bcfa39662d2e5a701b43ec3ea33fd6;
    stim[55] = 258'h15371866ac50122580115de40a23b6b8e23137631e0c1570e04946a5ff6949edf;
    stim[56] = 258'h1128481b1b5a5317aad246c6f0fbb90789c321b097c985c57770c0451deb02d6b;
    stim[57] = 258'h16b39693e0ac07ea104bc53fbfff62bab4f78548deb9b17a3b45ac3a20ad6bad9;
    stim[58] = 258'h137bf158d7eec70637e576b904eae290c437355ea4e3fc40db0177769e7c2694c;
    stim[59] = 258'h17d304d9d86c5b792b3d8737bdc1d200aa3dc85126ec7b2aea3fd194b105dacec;
    stim[60] = 258'h1fddfef2d67737eff7c564c3f166e4dd4e54ce29bb3e6be98c5e7efbe8ca5008c;
    stim[61] = 258'h051a309cd1a8a4645dd22dc55ff6b5763da8fb9189ce8f44d74e4c7d1bf8b2c47;
    stim[62] = 258'h1eaffff5c043e1eec7d00979a63fa85cb0f5253dde0b7cc89e378199ca353cb3e;
    stim[63] = 258'h004981f1c6b720f86c0b1f30dada4a877e97543d9a83b904dc49447f1af20f6e6;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h01;
      expv[4] = 8'h01;
      expv[5] = 8'h01;
      expv[6] = 8'h01;
      expv[7] = 8'h01;
      expv[8] = 8'h01;
      expv[9] = 8'h01;
      expv[10] = 8'h01;
      expv[11] = 8'h01;
      expv[12] = 8'h01;
      expv[13] = 8'h01;
      expv[14] = 8'h01;
      expv[15] = 8'h01;
      expv[16] = 8'h01;
      expv[17] = 8'h01;
      expv[18] = 8'h01;
      expv[19] = 8'h01;
      expv[20] = 8'h01;
      expv[21] = 8'h01;
      expv[22] = 8'h01;
      expv[23] = 8'h02;
      expv[24] = 8'h02;
      expv[25] = 8'h02;
      expv[26] = 8'h02;
      expv[27] = 8'h02;
      expv[28] = 8'h02;
      expv[29] = 8'h02;
      expv[30] = 8'h02;
      expv[31] = 8'h03;
      expv[32] = 8'h03;
      expv[33] = 8'h03;
      expv[34] = 8'h03;
      expv[35] = 8'h04;
      expv[36] = 8'h04;
      expv[37] = 8'h04;
      expv[38] = 8'h04;
      expv[39] = 8'h04;
      expv[40] = 8'h04;
      expv[41] = 8'h04;
      expv[42] = 8'h04;
      expv[43] = 8'h04;
      expv[44] = 8'h04;
      expv[45] = 8'h04;
      expv[46] = 8'h04;
      expv[47] = 8'h04;
      expv[48] = 8'h04;
      expv[49] = 8'h04;
      expv[50] = 8'h04;
      expv[51] = 8'h04;
      expv[52] = 8'h04;
      expv[53] = 8'h04;
      expv[54] = 8'h04;
      expv[55] = 8'h04;
      expv[56] = 8'h04;
      expv[57] = 8'h04;
      expv[58] = 8'h04;
      expv[59] = 8'h04;
      expv[60] = 8'h05;
      expv[61] = 8'h05;
      expv[62] = 8'h05;
      expv[63] = 8'h06;
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
