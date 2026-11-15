// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 140;
  localparam OW = 156;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01800 dut (
    .clk(clk),
    .rst(in_vec[139:139]),
    .din(in_vec[138:131]),
    .mvalid(in_vec[130:130]),
    .done(in_vec[129:129]),
    .sready(in_vec[128:128]),
    .ciphered(in_vec[127:64]),
    .odat(in_vec[63:0]),
    .ready(out_vec[155:155]),
    .tx_enable(out_vec[154:154]),
    .svalid(out_vec[153:153]),
    .sdata(out_vec[152:145]),
    .idat(out_vec[144:81]),
    .key(out_vec[80:1]),
    .load(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 140'had446284fce318180240d51e530e0663edb;
    stim[1] = 140'heb0b61bbe8bfae82f3280c8973105f567b1;
    stim[2] = 140'h234b4a6ffbaa1a91345f900e7acdd61831d;
    stim[3] = 140'h3fb49d0d60878f7839820989e4268669d5f;
    stim[4] = 140'h18da5da78a0f144b0e343233c166f881e15;
    stim[5] = 140'h0b0555af562409cfbd8b6a48638facce916;
    stim[6] = 140'h472d01a7e23842bdc5ed6f8993b8a7dd2e6;
    stim[7] = 140'hcb6c61fed50d70861c26ee65cbc92d98845;
    stim[8] = 140'h3ac0e4f168899c683e250b98d1e95b1be92;
    stim[9] = 140'h0ee6a49eeb502ebfd740ee2229478e69943;
    stim[10] = 140'h1452f6a101ef12e7225277e14ff05182074;
    stim[11] = 140'h1756d468f86783b9fbea2f5521d1c66fb54;
    stim[12] = 140'h5c3fd1b430edf376fd3c26a9418ab460ef1;
    stim[13] = 140'h46b19c59ceba82079ffd6f9d226a2e5c1f3;
    stim[14] = 140'h4c50e8b8e830b4c5e2a3be92dfb47708288;
    stim[15] = 140'h2fed2f91339dd2708233ef29bdeb91a3f19;
    stim[16] = 140'h4679788f4a6ed25c08840dcda7a541e8ffb;
    stim[17] = 140'h2d87ed023a54eada15782912b44d1bda4f4;
    stim[18] = 140'h4f16e608991985485088986cc612b72366f;
    stim[19] = 140'h6e9b3de43c607bf13273cc92269b4ae4dcf;
    stim[20] = 140'h0ddac6d02445fa286f3918cc34a84952f46;
    stim[21] = 140'h277447c4cb8f911b13a5d07559febfa50d3;
    stim[22] = 140'h17142f3a941b33183f93203911840a44057;
    stim[23] = 140'h23b283c976578d4636a911e860b33d2ea84;
    stim[24] = 140'h94b0f8b4ccec2ce8eae09013cb542c847e5;
    stim[25] = 140'h0417519f449e46a88aa836b9534315dd5b0;
    stim[26] = 140'h1ac415ac93dca90a1d3a51c113ad19cf10a;
    stim[27] = 140'h0e53d2192eb891eaa6abae9bff921a5cd6c;
    stim[28] = 140'h4232ec6159db0a44487c668c76c3bf2762b;
    stim[29] = 140'h38e54b3896111253096fb771421772e1309;
    stim[30] = 140'h357de10cd04b76b20d35f3efd0d94b5efd9;
    stim[31] = 140'h4a8c28f8d1b6d8fbeed673f8e7d5a80b423;
    stim[32] = 140'h0bdf74954001bea0edc0f6ec83624222a73;
    stim[33] = 140'h7392affbe6bd628b47785d16b15c77a84a1;
    stim[34] = 140'h08a3f980385642aa12117546fe544c8dfa7;
    stim[35] = 140'h6049e20c7b8c937e1248224a5dcbb966327;
    stim[36] = 140'h251f8bd947bfcd19d2131668308045ae32f;
    stim[37] = 140'h25c2254854cab6a2cc5a58c370ce0346f40;
    stim[38] = 140'h79efb4d1a59b4424f3b173a5ceb8b0a1c90;
    stim[39] = 140'h733995db3c14e7f2a5e97c55997670f3075;
    stim[40] = 140'h34d2fc9cfc341e85238b0cf27147bf5c4e6;
    stim[41] = 140'h77b817d7b5fd2e79a2cde275cc2587058c8;
    stim[42] = 140'h073b5b824efa55b4f2dbe885bc9a76a2f3b;
    stim[43] = 140'h693e5ea4ba319a58f3d9eebd19779c9bf23;
    stim[44] = 140'h7713980b4e102840e1e5dd479f42c793831;
    stim[45] = 140'h7f1f98431f027411f7369ba62f982297bf8;
    stim[46] = 140'h3e8b655fe9bd285bf1a772cd7dc6adddda0;
    stim[47] = 140'h091080a8ad10c23130b499f69ec97af6104;
    stim[48] = 140'h75e6a58a76180e5895e16f025917d48d1d9;
    stim[49] = 140'h2465bee6588c38e74712b171a3a98bc7bac;
    stim[50] = 140'h5a519912a69f52e9e09c2c7dc1d705fcab9;
    stim[51] = 140'h68a3932b5a11164ce73c121bd41a6495ce8;
    stim[52] = 140'h69e9bcc5c1cf976dd62b2ad718c744fa902;
    stim[53] = 140'h238dba9080817d66b0ec1af1212c9c209e8;
    stim[54] = 140'h25ab66ca19a9d03e16b82c1872be081b436;
    stim[55] = 140'h1ba4fb9c89cf37995ae2d334749831cd2f6;
    stim[56] = 140'h48362a563c5b4d47cff8db11a03b33838a8;
    stim[57] = 140'h0594d4d2e749ee2aae03cb7b8dcf1aee7e0;
    stim[58] = 140'h33fab1327de51d61f14cc4385d1be25b2ff;
    stim[59] = 140'h28b281f30d3281edcb54b69c459392438fd;
    stim[60] = 140'h40f446f96e86ddeb1124757350b1c9ad1ce;
    stim[61] = 140'h6a675808ff786328fba54abd2d1a86ef5db;
    stim[62] = 140'h4c8a7f2bc4e04a4e0db85fec116933bfe97;
    stim[63] = 140'h42bc06fc25ca510b88c33ee2f062cc3eec0;
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
      expv[0] = 156'h000000000000000000000000000000000000000;
      expv[1] = 156'h000000000000000000000000000000000000000;
      expv[2] = 156'h000000000000000000000000000000000000000;
      expv[3] = 156'h000000000000000000000000000000000000000;
      expv[4] = 156'h000000000000000000000000000000000000000;
      expv[5] = 156'he634bb4f141e28961c68646782cdf103c2b5555;
      expv[6] = 156'h0634bb4f141e28961c68646782cdf103c2b5554;
      expv[7] = 156'h000000000000000000000000000000000000000;
      expv[8] = 156'h000000000000000000000000000000000000000;
      expv[9] = 156'h000000000000000000000000000000000000000;
      expv[10] = 156'h000000000000000000000000000000000000000;
      expv[11] = 156'he505ed4203de25ce44a4efc29fe0a3040e95555;
      expv[12] = 156'he5cda8d1f0cf0773f7d45eaa43a38cdf6a95555;
      expv[13] = 156'h05cda8d1f0cf0773f7d45eaa43a38cdf6a95554;
      expv[14] = 156'h05cda8d1f0cf0773f7d45eaa43a38cdf6a95554;
      expv[15] = 156'hf301d171d061698bc5477d25bf68ee105115555;
      expv[16] = 156'h1301d171d061698bc5477d25bf68ee105115554;
      expv[17] = 156'hf192f11e94dda4b811081b9b4f4a83d1ff75555;
      expv[18] = 156'h1192f11e94dda4b811081b9b4f4a83d1ff75554;
      expv[19] = 156'h1192f11e94dda4b811081b9b4f4a83d1ff75554;
      expv[20] = 156'h1192f11e94dda4b811081b9b4f4a83d1ff75554;
      expv[21] = 156'he3758da0488bf450de723198695092a5e8d5555;
      expv[22] = 156'he9c88f89971f2236274ba0eab3fd7f4a1a75555;
      expv[23] = 156'h09c88f89971f2236274ba0eab3fd7f4a1a75554;
      expv[24] = 156'h000000000000000000000000000000000000000;
      expv[25] = 156'h000000000000000000000000000000000000000;
      expv[26] = 156'h000000000000000000000000000000000000000;
      expv[27] = 156'h000000000000000000000000000000000000000;
      expv[28] = 156'he387a4325d7123d54d575d37ff2434b9ad95555;
      expv[29] = 156'h0387a4325d7123d54d575d37ff2434b9ad95554;
      expv[30] = 156'h0387a4325d7123d54d575d37ff2434b9ad95554;
      expv[31] = 156'hed5bc219a096ed641a6be7dfa1b296bdfb35555;
      expv[32] = 156'h0d5bc219a096ed641a6be7dfa1b296bdfb35554;
      expv[33] = 156'he2fee92a80037d41db81edd906c484454e75555;
      expv[34] = 156'h02fee92a80037d41db81edd906c484454e75554;
      expv[35] = 156'h02fee92a80037d41db81edd906c484454e75554;
      expv[36] = 156'h02fee92a80037d41db81edd906c484454e75554;
      expv[37] = 156'h02fee92a80037d41db81edd906c484454e75554;
      expv[38] = 156'h02fee92a80037d41db81edd906c484454e75554;
      expv[39] = 156'h02fee92a80037d41db81edd906c484454e75554;
      expv[40] = 156'h02fee92a80037d41db81edd906c484454e75554;
      expv[41] = 156'hed25f939f8683d0a471619e4e28f7eb89cd5555;
      expv[42] = 156'h0d25f939f8683d0a471619e4e28f7eb89cd5554;
      expv[43] = 156'h0d25f939f8683d0a471619e4e28f7eb89cd5554;
      expv[44] = 156'h0d25f939f8683d0a471619e4e28f7eb89cd5554;
      expv[45] = 156'h0d25f939f8683d0a471619e4e28f7eb89cd5554;
      expv[46] = 156'h0d25f939f8683d0a471619e4e28f7eb89cd5554;
      expv[47] = 156'h0d25f939f8683d0a471619e4e28f7eb89cd5554;
      expv[48] = 156'h0d25f939f8683d0a471619e4e28f7eb89cd5554;
      expv[49] = 156'h0d25f939f8683d0a471619e4e28f7eb89cd5554;
      expv[50] = 156'h0d25f939f8683d0a471619e4e28f7eb89cd5554;
      expv[51] = 156'hf68332254d3ea5d3c13858fb83ae0bf95735555;
      expv[52] = 156'h168332254d3ea5d3c13858fb83ae0bf95735554;
      expv[53] = 156'h168332254d3ea5d3c13858fb83ae0bf95735554;
      expv[54] = 156'h168332254d3ea5d3c13858fb83ae0bf95735554;
      expv[55] = 156'h168332254d3ea5d3c13858fb83ae0bf95735554;
      expv[56] = 156'h168332254d3ea5d3c13858fb83ae0bf95735554;
      expv[57] = 156'h168332254d3ea5d3c13858fb83ae0bf95735554;
      expv[58] = 156'h168332254d3ea5d3c13858fb83ae0bf95735554;
      expv[59] = 156'hecf56264fbca3ac3e2998870ba37c4b65ff5555;
      expv[60] = 156'h0cf56264fbca3ac3e2998870ba37c4b65ff5554;
      expv[61] = 156'hf0288df2dd0dbbd62248eae6a163935a39d5555;
      expv[62] = 156'h10288df2dd0dbbd62248eae6a163935a39d5554;
      expv[63] = 156'h10288df2dd0dbbd62248eae6a163935a39d5554;
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
