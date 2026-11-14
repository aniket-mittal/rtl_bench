// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 184;
  localparam OW = 168;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01408 dut (
    .clock(clk),
    .aout_Special(in_vec[183:151]),
    .bout_Special(in_vec[150:118]),
    .cout_Special(in_vec[117:82]),
    .zout_Special(in_vec[81:46]),
    .sout_Special(in_vec[45:14]),
    .modeout_Special(in_vec[13:12]),
    .operationout_Special(in_vec[11:11]),
    .NatLogFlagout_Special(in_vec[10:10]),
    .InsTag_Special(in_vec[9:2]),
    .idle_Special(in_vec[1:0]),
    .idle_Multiply(out_vec[167:166]),
    .cout_Multiply(out_vec[165:130]),
    .zout_Multiply(out_vec[129:94]),
    .sout_Multiply(out_vec[93:62]),
    .modeout_Multiply(out_vec[61:60]),
    .operationout_Multiply(out_vec[59:59]),
    .NatLogFlagout_Multiply(out_vec[58:58]),
    .productout_Multiply(out_vec[57:8]),
    .InsTag_Multiply(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 184'h693433863abbdbc6779ad08cea7cde96043baca9ff172d;
    stim[1] = 184'h357ed1c67c9e901c1af170e48e97bc160251d0d1218cd2;
    stim[2] = 184'h5a79899a6db41b7b118f334ca16b1d21aa334e1af4b099;
    stim[3] = 184'hb09fef8c455337cf0c4d337c4306b328aed2dde54be445;
    stim[4] = 184'h47ee4b0e4edefb530d1ff692fe32e0bcecb3e088204893;
    stim[5] = 184'h8530cfe934963219d167e361b65ca47632188ad9e124d0;
    stim[6] = 184'h591aa351694327c85ee555881932c7dc63656e0f5fdc49;
    stim[7] = 184'h6ed8180ffae2d4a9325010c1f0d32fc7dcc356be3aca18;
    stim[8] = 184'h8dd1898a2580cb378c1d0ff085e53f95c37c928cf38fe3;
    stim[9] = 184'h5a51fa513d9c1f61c324e25e690d7e224ec3d704233d6e;
    stim[10] = 184'ha6196c61b7262d9f643a9f27a5c1129b859eedb5e4f19e;
    stim[11] = 184'h7853477c38380c284b2c46b5277c43f0c8b015e3326e6c;
    stim[12] = 184'h81b6a8d47eb28a9f1d7b01f6ad152c5e34c193483824b8;
    stim[13] = 184'h8060deb322af0067732afaaeb97f7870acacb7d8c58582;
    stim[14] = 184'h5b204c525722e2eff51d48e5b24d18950d520f3d5cb0b9;
    stim[15] = 184'h52e364c7da46cabf7ef9665b7346f61b0d736a55d52eea;
    stim[16] = 184'h9826f68a710b11d40dee4be98ab971ddb91c570bcb1c27;
    stim[17] = 184'hf71e8b4879183ae12169eaa9233e3849760b2571ea4b6b;
    stim[18] = 184'hc80568f3351cfa60672f5c6fce1d39914a603227b4c5e2;
    stim[19] = 184'h705be6fbd1c4ff7c756e80ab60afd704c8ec63bcbc7d5a;
    stim[20] = 184'hb01a5e6b518bdc863fe393b56bcbc08971b83fdda40abf;
    stim[21] = 184'h3167d8b9119191df79dc5424698f4b18f6d00b3e178a4c;
    stim[22] = 184'hc6dc735fc5e0dd5b0fd29c0e22fdcb00c7884f8ddac4e8;
    stim[23] = 184'h4b708df5bb20f30901e7ce3b4ee16546fb66e7bb11c406;
    stim[24] = 184'hdd1732d3eea9c546dfdfcffd9d8d7a9b7c96734a1ec037;
    stim[25] = 184'h173160081725b22c3850504a494b03ddd4a281fca4530a;
    stim[26] = 184'h56c141e2997bbed75ca8312abbda046af63402ee10d914;
    stim[27] = 184'h1038e4fdd3e189caeb221b50033c539457f67e8e918c70;
    stim[28] = 184'hbd39281c79503b28a17f9298b50b59e37155ab28d41ca8;
    stim[29] = 184'h177b14f2315ae42f50d8578b81c9d687eef842ac3f55ec;
    stim[30] = 184'h7d30de21a26e7a9313a49ff2b7adc03237ce8a3390aa21;
    stim[31] = 184'ha68df43e3233a191779f30f317e915902caee5bba82fbf;
    stim[32] = 184'h9569f472b8c5bc362e5b8ccd091d22ef402cf3b1552052;
    stim[33] = 184'h4608d273ca64fa1de111841096571758032cf42847f907;
    stim[34] = 184'h9db20b3f861742871ce636121e60fbb0e08d68e5e114a2;
    stim[35] = 184'h5ca187f8d2ed06e276e3e40399cbb560ed4edf5ddb16ec;
    stim[36] = 184'hb01b89f6c2fc2f13a4ceb3ce36266bbde4cef32de476ea;
    stim[37] = 184'h551bf8ea0210db6296251e9ae403dccd19428c7fcde74d;
    stim[38] = 184'hcf59f301055ee8ea8297236f6c42a6fc337d57a49a1ad3;
    stim[39] = 184'hd519141747e33b08c37054ec4b2ba63a4ec7beb13a11a9;
    stim[40] = 184'h10f1767bde298b7a93242c6698c8fc44704463bfdd6d50;
    stim[41] = 184'he82f95b77de231fe7163840c9d190a1f9bab5c1fe8eb33;
    stim[42] = 184'he3c1e3d327de75242f78dba77fa0da854578f47ad26a5f;
    stim[43] = 184'h1ca2d29d83e4394506cd11a043e019515231defa4c1ec8;
    stim[44] = 184'h21ae4e86cfecdad8ed1d08893836e675aaefe75c7f3627;
    stim[45] = 184'h2b7af6777a679d1424f0dcd8511a7a9c26d278d7c6aa73;
    stim[46] = 184'hfd08bba92b9b5302af3a3f7ffe9b842ba29034d601f5a2;
    stim[47] = 184'h7aceb04e871e2c80706e2812ea4a6e10d8b4b4db102a34;
    stim[48] = 184'h4746c9a646795d51b173bc2b4c0a9efb509299da1e9819;
    stim[49] = 184'hf941442b92c3ec77f053f4c995c335868908caf87fd7e8;
    stim[50] = 184'he207e6b965c0e4f3d72977d918c8aee754937514554bbd;
    stim[51] = 184'h35607d22156b619ce1757a774f342c51b930ad49b80e3c;
    stim[52] = 184'he0e15e7dc1ec51ded3ba3ba956ee99eef9228475183f70;
    stim[53] = 184'hd0d372daf7d936ac4f0e8599cdeb3980357e4d615baf2c;
    stim[54] = 184'h57b04150d2706f181a75dac8bd42f9d57c063382c12a25;
    stim[55] = 184'hc8f11659c5a2b84729ba2adf45c2746817bbb7baedf089;
    stim[56] = 184'h635825633cd4cf9f488a34b7acade91292358c0df84b24;
    stim[57] = 184'hf6b2434a3054dd3fcd352e0ed08d417f23fdfbb1cc34b2;
    stim[58] = 184'h3b0ba8cbafd99227a9d8df0cfe3d5ef8b87fd5c2f67ba1;
    stim[59] = 184'h61f41ce653a426f1a0a3e0692be5376adeccfe077e9894;
    stim[60] = 184'hcf3e31c19c594eacce45f2fc7eca3c215e17e35a26e397;
    stim[61] = 184'h9454a61337d38bc1f7c5ad1efa82822e7eb8e16e2f3ee1;
    stim[62] = 184'hc27a29048a736d9ec0ba8ff5a27b62cb98b6af96a5ae57;
    stim[63] = 184'hf810d151ba1344b94a4680bcb6d08066408b7ffe55c35a;
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
      expv[0] = 168'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 168'h779ad08cea7cde96043baca9ff1xxxxxxxxxxxxxcb;
      expv[2] = 168'h9af170e48e97bc160251d0d1218xxxxxxxxxxxxx34;
      expv[3] = 168'h518f334ca16b1d21aa334e1af4bxxxxxxxxxxxxx26;
      expv[4] = 168'h4c4d337c4306b328aed2dde54bexxxxxxxxxxxxx11;
      expv[5] = 168'hcd1ff692fe32e0bcecb3e088204xxxxxxxxxxxxx24;
      expv[6] = 168'h1167e361b7be000000188ad9e124876d714d75f834;
      expv[7] = 168'h5ee555881932c7dc63656e0f5fdc876d714d75f812;
      expv[8] = 168'h325010c1f1960000000356be3ac97f8c0477077086;
      expv[9] = 168'hcc1d0ff085e53f95c37c928cf38d7f8c04770770f8;
      expv[10] = 168'h8324e25e690d7e224ec3d704233d7f8c047707705b;
      expv[11] = 168'ha43a9f27a5c1129b859eedb5e4f17f8c0477077067;
      expv[12] = 168'h0b2c46b525a60000003015e3326e4772f239a7e09b;
      expv[13] = 168'h1d7b01f6ac00000000019348382559524ba475802e;
      expv[14] = 168'hb32afaaeb97f7870acacb7d8c58559524ba4758060;
      expv[15] = 168'h751d48e5b24d18950d520f3d5cb159524ba475802e;
      expv[16] = 168'hbef9665b7346f61b0d736a55d52d59524ba47580ba;
      expv[17] = 168'hcdee4be98ab971ddb91c570bcb1d59524ba4758009;
      expv[18] = 168'he169eaa9233e3849760b2571ea4959524ba47580da;
      expv[19] = 168'ha72f5c6fce1d39914a603227b4c559524ba4758078;
      expv[20] = 168'hb56e80ab60afd704c8ec63bcbc7d59524ba4758056;
      expv[21] = 168'hffe393b56bcbc08971b83fdda40959524ba47580af;
      expv[22] = 168'h39dc54246b56000000100b3e1788e41213310aa893;
      expv[23] = 168'h0fd29c0e234e000000084f8ddac57bcb8cce8e503a;
      expv[24] = 168'h81e7ce3b4ee16546fb66e7bb11c57bcb8cce8e5001;
      expv[25] = 168'hdfdfcffd9d8d7a9b7c96734a1ec17bcb8cce8e500d;
      expv[26] = 168'hb850504a494b03ddd4a281fca4517bcb8cce8e50c2;
      expv[27] = 168'h1ca8312ab82a0000003402ee10d9e75a9f08164445;
      expv[28] = 168'h2b221b5000e4000000367e8e918cee848910a8a41c;
      expv[29] = 168'h217f9298b4c400000015ab28d41c73f6e1298dc02a;
      expv[30] = 168'h10d8578b81ec0000003842ac3f559dbabe64b5507b;
      expv[31] = 168'h53a49ff2b7adc03237ce8a3390a99dbabe64b55088;
      expv[32] = 168'hf79f30f317e915902caee5bba82d9dbabe64b550ef;
      expv[33] = 168'hae5b8ccd091d22ef402cf3b155219dbabe64b55014;
      expv[34] = 168'he111841096571758032cf42847f99dbabe64b55041;
      expv[35] = 168'h9ce636121e60fbb0e08d68e5e1159dbabe64b55028;
      expv[36] = 168'h36e3e4039a0e0000000edf5ddb14bcb9b017cbe4bb;
      expv[37] = 168'ha4ceb3ce36266bbde4cef32de474bcb9b017cbe4ba;
      expv[38] = 168'h56251e9ae403dccd19428c7fcde4bcb9b017cbe4d3;
      expv[39] = 168'hc297236f6c42a6fc337d57a49a18bcb9b017cbe4b4;
      expv[40] = 168'h437054ec4b2ba63a4ec7beb13a10bcb9b017cbe46a;
      expv[41] = 168'h13242c669b380000000463bfdd6e4d396cf8131854;
      expv[42] = 168'hf163840c9d190a1f9bab5c1fe8ea4d396cf81318cc;
      expv[43] = 168'hef78dba77fa0da854578f47ad26a4d396cf8131897;
      expv[44] = 168'h06cd11a0409600000031defa4c1c9dad0dbabe70b2;
      expv[45] = 168'hed1d08893836e675aaefe75c7f349dad0dbabe7089;
      expv[46] = 168'he4f0dcd8511a7a9c26d278d7c6a89dad0dbabe709c;
      expv[47] = 168'haf3a3f7ffe9b842ba29034d601f49dad0dbabe7068;
      expv[48] = 168'h306e2812ea2800000034b4db102928cadd8a2a748d;
      expv[49] = 168'h7173bc2b4c0a9efb509299da1e9928cadd8a2a7406;
      expv[50] = 168'h3053f4c9968000000008caf87fd42002bc47ab24fa;
      expv[51] = 168'h572977d918c8aee75493751455482002bc47ab24ef;
      expv[52] = 168'h21757a774d8400000030ad49b80e0b39e69012308f;
      expv[53] = 168'h13ba3ba95796000000228475183e1b6c2615a664dc;
      expv[54] = 168'h0f0e8599cf060000003e4d615bad070136d3d094cb;
      expv[55] = 168'h5a75dac8bd42f9d57c063382c129070136d3d09489;
      expv[56] = 168'h69ba2adf45c2746817bbb7baedf1070136d3d09422;
      expv[57] = 168'h088a34b7ad78000000358c0df848e54d1989dab8c9;
      expv[58] = 168'h8d352e0ed08d417f23fdfbb1cc34e54d1989dab82c;
      expv[59] = 168'h69d8df0cfe3d5ef8b87fd5c2f678e54d1989dab8e8;
      expv[60] = 168'h20a3e0692a280000000cfe077e9a0cb7456cdf2025;
      expv[61] = 168'hce45f2fc7eca3c215e17e35a26e20cb7456cdf20e5;
      expv[62] = 168'h77c5ad1efa82822e7eb8e16e2f3e0cb7456cdf20b8;
      expv[63] = 168'hc0ba8ff5a27b62cb98b6af96a5ae0cb7456cdf2095;
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
