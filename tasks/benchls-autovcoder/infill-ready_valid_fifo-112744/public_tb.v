// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 136;
  localparam OW = 139;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_112744 dut (
    .clk(clk),
    .reset_n(in_vec[135:135]),
    .in_valid(in_vec[134:134]),
    .in_data(in_vec[133:1]),
    .out_ready(in_vec[0:0]),
    .fill_level(out_vec[138:135]),
    .in_ready(out_vec[134:134]),
    .out_valid(out_vec[133:133]),
    .out_data(out_vec[132:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 136'h30e9961d93ce08b4a60a5f6b8db411e859;
    stim[1] = 136'h26971209394f62fb0991681ba0eb59bb37;
    stim[2] = 136'hcb0dc9a698510f54f4096e1057ea00f549;
    stim[3] = 136'hea6b31358a566edcb5228d150d331c3e64;
    stim[4] = 136'ha83cb491d5159a602b682f9bcbe2c59254;
    stim[5] = 136'hca655a97887cddad17bad8832b643495aa;
    stim[6] = 136'h86c42fa7a98e67412992c937def4603c20;
    stim[7] = 136'hc4754d3eb49104acc59d40a9158007acb6;
    stim[8] = 136'hf5b47b636446800bde4363645a9a21cbc6;
    stim[9] = 136'he7e2cb901d072818681d1f1f1b9025c355;
    stim[10] = 136'he1740263d0e7875e054a1a572da8909bbb;
    stim[11] = 136'hedb24aca2b4a7018ba49f1735a42fdd4f1;
    stim[12] = 136'hfabd1bcb9f323560f5b240e8b7f88f794e;
    stim[13] = 136'hc21b6338c650936149eb6f0490470c44b8;
    stim[14] = 136'h806dc3588e601aee59f423f9b68c40a7be;
    stim[15] = 136'hc40cfe71a850e99ac30ce111946472bf90;
    stim[16] = 136'hd0568397b2e08de6ac678122c1ec3844aa;
    stim[17] = 136'h82f737ad14eb56b926bc50806c14b9ae01;
    stim[18] = 136'hfe90b0c96dcc87e85495b46bff2891d57a;
    stim[19] = 136'h810256408304c1bf08c474c014d388262a;
    stim[20] = 136'hc816a0d6070bf05574cad0d9076eb7bbb7;
    stim[21] = 136'h99e527c7e1847f145e13e00f80194b0aea;
    stim[22] = 136'haee2d82a04ad332eabfcb3cae78dca6a0f;
    stim[23] = 136'he03f1efe047cd12efef95461473761259a;
    stim[24] = 136'he94980c923dde4d29392b6d02e7af3081f;
    stim[25] = 136'hfe2589caa06bf8d3d64ade8c36b4ccfb35;
    stim[26] = 136'ha03fad143b0fb394422e85f85977783233;
    stim[27] = 136'ha82b0754385be39b843690ce78b03bcced;
    stim[28] = 136'hdee74001508c2ec97b4bb299613a0ab7ed;
    stim[29] = 136'hb6b1ac876fb536ada9584f74f889f3086f;
    stim[30] = 136'hddf65e62c657e575d52ad1cf08d55a636c;
    stim[31] = 136'heb908d38d8c263fd75d00e27cff9930f3c;
    stim[32] = 136'hb630bb06dccc1e91bfa568f55250fddeee;
    stim[33] = 136'hc94c37f2c4347e361ed618a9f7b391e1ac;
    stim[34] = 136'h94281cc553775f4b22bde7a550f6e436e3;
    stim[35] = 136'hdc219b4c80e5f39b3e9197494bc7150db2;
    stim[36] = 136'h8844ec2972cfd86714d5949f72d8d0a464;
    stim[37] = 136'hb3d1f54f56d31d58251aae5ded05b526da;
    stim[38] = 136'hda56d04e950501fedeeded7476299d5e0a;
    stim[39] = 136'he9defe050ce5e3d0d8ab9f2f79a8a3fa21;
    stim[40] = 136'h8aebeb85c725b6f3a2a97ee40cfecc5197;
    stim[41] = 136'h8f92b0a252ce9f907a0beb25d79be2b84e;
    stim[42] = 136'heba02bf8ee91e09effa2c23a908eabc804;
    stim[43] = 136'ha4fbc7c4ea5f95323f570ebb8aa57ea765;
    stim[44] = 136'hb6ce691e1e2ee2877ce226989fd33369d4;
    stim[45] = 136'hff348086b43ccd28b3d509c468ca226b26;
    stim[46] = 136'hbf54ebb20283cfe7f4415c384cdb966ce9;
    stim[47] = 136'h9dcf6a0b822471abe6097f8d8f9d5be260;
    stim[48] = 136'he0dfd57a115a1913a6df22e3868ceac24f;
    stim[49] = 136'h40be4d3e23efaa99cc68995082f547045e;
    stim[50] = 136'hf60c46fda3d9b006b3870e6b51b5ed4d40;
    stim[51] = 136'h6d8ab84c054478825d2edb68a6d38f8a6e;
    stim[52] = 136'hdd2379b395afc156569e9bab058554febc;
    stim[53] = 136'ha7871ae12aa5c4112a8932b1832a3eada9;
    stim[54] = 136'hf8fb8fe9f3bbcf8e033e15061fac190a31;
    stim[55] = 136'hcbeb6ef7f3be983ad404b868c6c00db581;
    stim[56] = 136'h9379f198095fa15a62bd2507bc82ec80fa;
    stim[57] = 136'hf23a1fe03376e96fafb41b6346592d8123;
    stim[58] = 136'he14070e3dc9b8687f6024ae1de00d1bfef;
    stim[59] = 136'hd94ae07bbdbf96833085756d15ca9104dd;
    stim[60] = 136'hf1616b953881c08ef8239eefb512fecae5;
    stim[61] = 136'h90663b368c52f39963ea8ddb52dc101436;
    stim[62] = 136'hc8625d8723e80a3465f9c05f57788035f0;
    stim[63] = 136'ha968fbaf9725eb44eb42cb9ee2a530f848;
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
      expv[0] = 139'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 139'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[2] = 139'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[3] = 139'h0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[4] = 139'h16586e4d34c2887aa7a04b7082bf5007aa4;
      expv[5] = 139'h16586e4d34c2887aa7a04b7082bf5007aa4;
      expv[6] = 139'h1e586e4d34c2887aa7a04b7082bf5007aa4;
      expv[7] = 139'h1e586e4d34c2887aa7a04b7082bf5007aa4;
      expv[8] = 139'h26586e4d34c2887aa7a04b7082bf5007aa4;
      expv[9] = 139'h2e586e4d34c2887aa7a04b7082bf5007aa4;
      expv[10] = 139'h2f535989ac52b376e5a91468a86998e1f32;
      expv[11] = 139'h2e532ad4bc43e6ed68bdd6c4195b21a4ad5;
      expv[12] = 139'h2e23aa69f5a48825662cea0548ac003d65b;
      expv[13] = 139'h3623aa69f5a48825662cea0548ac003d65b;
      expv[14] = 139'h3e23aa69f5a48825662cea0548ac003d65b;
      expv[15] = 139'h3e23aa69f5a48825662cea0548ac003d65b;
      expv[16] = 139'h4223aa69f5a48825662cea0548ac003d65b;
      expv[17] = 139'h4223aa69f5a48825662cea0548ac003d65b;
      expv[18] = 139'h3fada3db1b2234005ef21b1b22d4d10e5e3;
      expv[19] = 139'h43ada3db1b2234005ef21b1b22d4d10e5e3;
      expv[20] = 139'h43ada3db1b2234005ef21b1b22d4d10e5e3;
      expv[21] = 139'h3f3f165c80e83940c340e8f8f8dc812e1aa;
      expv[22] = 139'h3f3f165c80e83940c340e8f8f8dc812e1aa;
      expv[23] = 139'h370ba0131e873c3af02a50d2b96d4484ddd;
      expv[24] = 139'h3f0ba0131e873c3af02a50d2b96d4484ddd;
      expv[25] = 139'h3f6d9256515a5380c5d24f8b9ad217eea78;
      expv[26] = 139'h3fd5e8de5cf991ab07ad920745bfc47bca7;
      expv[27] = 139'h3610db19c632849b0a4f5b782482386225c;
      expv[28] = 139'h2e2067f38d42874cd61867088ca32395fc8;
      expv[29] = 139'h2ff485864b6e643f42a4ada35ff9448eabd;
      expv[30] = 139'h2701f8f7f023e68977f7caa30a39bb092cd;
      expv[31] = 139'h2f01f8f7f023e68977f7caa30a39bb092cd;
      expv[32] = 139'h3701f8f7f023e68977f7caa30a39bb092cd;
      expv[33] = 139'h3701f8f7f023e68977f7caa30a39bb092cd;
      expv[34] = 139'h3f01f8f7f023e68977f7caa30a39bb092cd;
      expv[35] = 139'h374a4c06491eef26949c95b68173d79840f;
      expv[36] = 139'h3f4a4c06491eef26949c95b68173d79840f;
      expv[37] = 139'h3f4a4c06491eef26949c95b68173d79840f;
      expv[38] = 139'h3f4a4c06491eef26949c95b68173d79840f;
      expv[39] = 139'h434a4c06491eef26949c95b68173d79840f;
      expv[40] = 139'h3ff12c4e55035fc69eb256f461b5a667d9a;
      expv[41] = 139'h36f73a000a8461764bda5d94cb09d055bf6;
      expv[42] = 139'h36f73a000a8461764bda5d94cb09d055bf6;
      expv[43] = 139'h3ef73a000a8461764bda5d94cb09d055bf6;
      expv[44] = 139'h36efb2f31632bf2baea9568e7846aad31b6;
      expv[45] = 139'h36efb2f31632bf2baea9568e7846aad31b6;
      expv[46] = 139'h3eefb2f31632bf2baea9568e7846aad31b6;
      expv[47] = 139'h375c8469c6c6131febae80713e7fcc9879e;
      expv[48] = 139'h375c8469c6c6131febae80713e7fcc9879e;
      expv[49] = 139'h044a61bf9621a3f1b0f6b0c54fbd9c8f0d6;
      expv[50] = 139'h04efb2f31632bf2baea9568e7846aad31b6;
      expv[51] = 139'h0405f269f11f7d54ce6344ca8417aa3822f;
      expv[52] = 139'h05b06237ed1ecd80359c38735a8daf6a6a0;
      expv[53] = 139'h0d6c55c2602a23c412e976db45369c7c537;
      expv[54] = 139'h0ee91bcd9cad7e0ab2b4f4dd582c2aa7f5e;
      expv[55] = 139'h0d5c8469c6c6131febae80713e7fcc9879e;
      expv[56] = 139'h17c7dc7f4f9dde7c7019f0a830fd60c8518;
      expv[57] = 139'h17c7dc7f4f9dde7c7019f0a830fd60c8518;
      expv[58] = 139'h165f5b77bf9df4c1d6a025c34636006dac0;
      expv[59] = 139'h1791d0ff019bb74b7d7da0db1a32c96c091;
      expv[60] = 139'h170a03871ee4dc343fb012570ef0068dff7;
      expv[61] = 139'h16ca5703ddedfcb419842bab68ae548826e;
      expv[62] = 139'h16ca5703ddedfcb419842bab68ae548826e;
      expv[63] = 139'h1eca5703ddedfcb419842bab68ae548826e;
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
