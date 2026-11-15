// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 275;
  localparam OW = 72;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_070141 dut (
    .clk(clk),
    .rstn(in_vec[274:274]),
    .tx_val(in_vec[273:273]),
    .tx_req_0(in_vec[272:272]),
    .tx_din_0(in_vec[271:208]),
    .tx_sop_0(in_vec[207:207]),
    .tx_eop_0(in_vec[206:206]),
    .tx_dwen_0(in_vec[205:205]),
    .tx_req_1(in_vec[204:204]),
    .tx_din_1(in_vec[203:140]),
    .tx_sop_1(in_vec[139:139]),
    .tx_eop_1(in_vec[138:138]),
    .tx_dwen_1(in_vec[137:137]),
    .tx_req_2(in_vec[136:136]),
    .tx_din_2(in_vec[135:72]),
    .tx_sop_2(in_vec[71:71]),
    .tx_eop_2(in_vec[70:70]),
    .tx_dwen_2(in_vec[69:69]),
    .tx_req_3(in_vec[68:68]),
    .tx_din_3(in_vec[67:4]),
    .tx_sop_3(in_vec[3:3]),
    .tx_eop_3(in_vec[2:2]),
    .tx_dwen_3(in_vec[1:1]),
    .tx_rdy(in_vec[0:0]),
    .tx_rdy_0(out_vec[71:71]),
    .tx_rdy_1(out_vec[70:70]),
    .tx_rdy_2(out_vec[69:69]),
    .tx_rdy_3(out_vec[68:68]),
    .tx_req(out_vec[67:67]),
    .tx_dout(out_vec[66:3]),
    .tx_sop(out_vec[2:2]),
    .tx_eop(out_vec[1:1]),
    .tx_dwen(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 275'h24fd499fcdd6404e5c24c380a78242e9898d61559cbafdb1f03acc6ee86942a7d785e;
    stim[1] = 275'h16c601c4d301434d2db308e4ce18f1328e2ad84803aa95e695543cddb7275971061c3;
    stim[2] = 275'h6121cb3b48a4f495b538f3db9147f556ed020b8886bba844296d9cc5bbf3920473cb1;
    stim[3] = 275'h7a9a848bfff55a13ffdf0e555e173e6771c13bdfea76e7703ef132afe82b5e3cde3ae;
    stim[4] = 275'h5722451a9cdf7cb5e990d74accf1e6697e497f59785417a1dd01248fae29851ee8933;
    stim[5] = 275'h4e1d5cb54eb078e4ffaaec9eb523f6aff1c48a98247034624819aef04873c5439f95c;
    stim[6] = 275'h4c780a5ef14519ca86ea9ab0d8a0578e94c0ab966065716103b109dcc9825f1680177;
    stim[7] = 275'h57194cb4754f053f23c91ca272eebfa44e2c5df10a267364eb7e115f3b82d844752e5;
    stim[8] = 275'h6663f0c30119e50f93032337a200b3ae37bbece5535bd014d318d37409baa83e83f2d;
    stim[9] = 275'h4f89f9c13049000646e706897b3793bf658b56938694a68261a18cc79640c2626a17c;
    stim[10] = 275'h419215b6da9943eff737d79edb1eb8d8f4ca61c01bfe1f80083e8f96957657b4898bd;
    stim[11] = 275'h69bd0d37fb3cb7d706074ad4089456d512f1b03cbd445c7330c07093254310b044fff;
    stim[12] = 275'h7a780b27245acbb53ba461248eb6004ad8a9c9ea4d56d5edb7e4f55d6c089e63d6447;
    stim[13] = 275'h626a8448b52ca448367104a7f0a6a36af5be4d4b53161ad1f5724b0903adf4c530911;
    stim[14] = 275'h5e927dced5907338f7ca84d91fc87eefb4844e4ae316dcf943fdd0b15771bba9092d4;
    stim[15] = 275'h436aeb8f11dade72e8e4d98e67cae7357816793457791a9c3167f853c9615a9351a1e;
    stim[16] = 275'h7861547f3ba24fffe85a3a59d1f9752177a8326e8b747213e727fe453b9071cfab217;
    stim[17] = 275'h67b1c5f54c1c99037da543a41dc21ced7afe1a0a93dca3cd10018cb0df02a8832731b;
    stim[18] = 275'h7ca0d9cd2d8c29ea2be5341304b4b74ba6d08c3a787f799804b43e7ac2224b8011bd4;
    stim[19] = 275'h555297b28c852a25beacf4abdbf7e815acb494e1b45f643474f0aa113f122f1567521;
    stim[20] = 275'h419a8bbf85bcae11b03f04843e7e9e3416155cf5aa44cabed0942885fe9df76c09fb8;
    stim[21] = 275'h5f7518a35ce9888f68958897473168c3be0613503b6581727be65588530a4ec0d73f7;
    stim[22] = 275'h7e22732357ab532c038ff1c1f58e94447ea496c227b90202ebb4a1b03afc146bf362a;
    stim[23] = 275'h4079cabfe7eff95bff3bb02519b9a89d617afe29abb2d801d294d3760846cffe4f6ee;
    stim[24] = 275'h41a42fb6fcc58963ffc30b20713b6bd802f011783f4da93c26e15fecfe62e0ed7a9d9;
    stim[25] = 275'h6160f9cd702f726d6bf3f6ab1de0a392f9796112ab2871336bc4144dac053bae5b71c;
    stim[26] = 275'h7cf5813581bcf1d2188a2415bec12b72d81f03baf4a9548b23d818f92ac2411c6dfd1;
    stim[27] = 275'h5e5632ecf99686e18e217e9a7d8e39c7a076a806abeddb2c5c9c65b014126aa7daed7;
    stim[28] = 275'h458e02bd596ea4d0766d85ca468a2ea9ea0dc585b123a0c1813daed8e30d647a87408;
    stim[29] = 275'h660425dbc909605f387e82e60077835378874e14e2aa27b688a0199a1cff65c6b738a;
    stim[30] = 275'h561e97425492d3cccfb5485f2aab6378dfbcc649b6793266a89bc15956642215d0417;
    stim[31] = 275'h4cd88299482e5d0466d578ae0aea72bc9098f71cc83b44e4cd7254a8716e50b544a7a;
    stim[32] = 275'h40cd19fe5a0caa5de3c10fa54e8957261ad57dee8a61457877ab8676b649553d66fde;
    stim[33] = 275'h44915aff8c06d84d44c1bb1c60f852fd8d282608a6a993861423232a7e9ace8af39c8;
    stim[34] = 275'h577c00c332a65771849e96cd4943f25febd26bc82196fd449f55e575e7dbca9116f35;
    stim[35] = 275'h4e3314b120bf044518d1dc0ba61fc23f664ac01392b907c0b0857d679980f3dd55d06;
    stim[36] = 275'h49e5995807be8ef8aaf08912cc969d72b463baa4c5a53b8e69e2d2e0630ef81fd26d6;
    stim[37] = 275'h4fea36862b3c828d1e1150b2fe6859a133a05715b0517f0cd5ba30fde2f5bf7a87046;
    stim[38] = 275'h716b91a058a89cf99e56b87c55640a7ee573c44d296ffcdb89da959b37206ee0507fa;
    stim[39] = 275'h6c0d9a3b4cb86671c26ca0ee072c6480ed8096a8e49ffc343c7b8c3044dd20313caa7;
    stim[40] = 275'h7a4698c91739cae3ab9bff8bc205567af2b647066532e376df3bcce332287d10d86ba;
    stim[41] = 275'h6be1e4b214cd5af35f6df709c726c42b0b3fca7ea8aeabbac95808f5cc1c4e21db9f9;
    stim[42] = 275'h4d42b552e040d7c2cb1b9a79bc7281c6618b2dea5a94a29af7a77b17787b8fbcc2862;
    stim[43] = 275'h4d4d09726de7d500f911a0639d94427abba8849ae3e7242b3f368d46015e5e5977d45;
    stim[44] = 275'h321426e8530aa9bd195fc2d32e25803573caba2420e1300bfd8c40e89f9feb64263fd;
    stim[45] = 275'h773122d1c9cad749039a3a97fe8a27a6ddf1a92bca82a1d5f8c9f805cc447435c2c71;
    stim[46] = 275'h6a32b83e53aa73cc193399cf636fb410de46af1b23333bd3d9e9eca8f44582e421dfc;
    stim[47] = 275'h722da343d86ee987785a9105dca02e39d635913f6d578c3a01080c4886f6abf09403b;
    stim[48] = 275'h43965fecad0eb954e94b1c5647d8dec24c9b0c3786732436674ec0e62dcd3de42f82c;
    stim[49] = 275'h7f457c4260d5f78245ff93731b1aec681e96d216b35fbba9249c1f19fd7751b3d2005;
    stim[50] = 275'h5d694422b4f2161b7218e7377033debc18932f36762e71f741546175f04115e6f100d;
    stim[51] = 275'h609258a5d94793de80c375781b791ac77963e07ea83d8ad75916f0280daa5acabbb5e;
    stim[52] = 275'h60108fd52245e6c01998ac1bd5a6951ec04a2a7579c4161fa0df5be8ca9062db09ecd;
    stim[53] = 275'h6a6147641758d9b3e977c685f54feb1a3e04273e010b610f427633dd43ac510152d88;
    stim[54] = 275'h72fca1c7898ac52fc310fe62739e698e373df02a427d40b6f8d376418fe67072c7d2a;
    stim[55] = 275'h4a3ca92eb8637f0032ef05decc621d0c4edeb15717003687e29918e1bfe4e65dd6936;
    stim[56] = 275'h454a5db241f2bb61ba2be94b94695be856df657b4df4aac5dea3c36fc639c0e4015e6;
    stim[57] = 275'h64b66947d42f7c1c08410f3475bef8556875853763c7470cb6a3a26b2ccf282dbacaa;
    stim[58] = 275'h5a70c92f520cdd6270de4b3ed82280da8aee81e659d6609fd97dd59e60609820d7508;
    stim[59] = 275'h54051b759579eb3eb9590facd323a10ee2493b123e5503da155fb96ad8a4f7af7824e;
    stim[60] = 275'h4d5d6daff7bcf676320f3ed1ede0ab678d691dc3c94b202925f181ed625149baff38e;
    stim[61] = 275'h68301e287e4a8febf111e775bd27b023e1f7dfad92846261801e31fe9e5a9cad093ee;
    stim[62] = 275'h670559c86d04ac540aa1ffd9b541874f06ce65909014e5fbdf3787a47334288437db6;
    stim[63] = 275'h4662af928d640696f16507535521235bb48d5b84782f76fe67152db32ab314c840708;
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
      expv[0] = 72'h027ea4cfe6eb20272e;
      expv[1] = 72'h8b6300e26980a1a696;
      expv[2] = 72'h8090e59da4527a4ada;
      expv[3] = 72'h0d4d4245fffaad09ff;
      expv[4] = 72'h8b91228d4e6fbe5af4;
      expv[5] = 72'h070eae5aa7583c727f;
      expv[6] = 72'h863c052f78a28ce543;
      expv[7] = 72'h8b8ca65a3aa7829f91;
      expv[8] = 72'h8331f861808cf287c9;
      expv[9] = 72'h07c4fce09824800323;
      expv[10] = 72'h80c90adb6d4ca1f7fb;
      expv[11] = 72'h84de869bfd9e5beb83;
      expv[12] = 72'h8d3c0593922d65da9d;
      expv[13] = 72'h813542245a9652241b;
      expv[14] = 72'h0f493ee76ac8399c7b;
      expv[15] = 72'h01b575c788ed6f3974;
      expv[16] = 72'h8c30aa3f9dd127fff4;
      expv[17] = 72'h83d8e2faa60e4c81be;
      expv[18] = 72'h0e506ce696c614f515;
      expv[19] = 72'h8aa94bd946429512df;
      expv[20] = 72'h00cd45dfc2de5708d8;
      expv[21] = 72'h8fba8c51ae74c447b4;
      expv[22] = 72'h0f113991abd5a99601;
      expv[23] = 72'h003ce55ff3f7fcadff;
      expv[24] = 72'h80d217db7e62c4b1ff;
      expv[25] = 72'h00b07ce6b817b936b5;
      expv[26] = 72'h8e7ac09ac0de78e90c;
      expv[27] = 72'h8f2b19767ccb4370c7;
      expv[28] = 72'h02c7015eacb752683b;
      expv[29] = 72'h030212ede484b02f9c;
      expv[30] = 72'h8b0f4ba12a4969e667;
      expv[31] = 72'h066c414ca4172e8233;
      expv[32] = 72'h00668cff2d06552ef1;
      expv[33] = 72'h0248ad7fc6036c26a2;
      expv[34] = 72'h8bbe006199532bb8c2;
      expv[35] = 72'h07198a58905f82228c;
      expv[36] = 72'h04f2ccac03df477c55;
      expv[37] = 72'h07f51b43159e41468f;
      expv[38] = 72'h08b5c8d02c544e7ccf;
      expv[39] = 72'h8606cd1da65c3338e1;
      expv[40] = 72'h0d234c648b9ce571d5;
      expv[41] = 72'h85f0f2590a66ad79af;
      expv[42] = 72'h06a15aa970206be165;
      expv[43] = 72'h86a684b936f3ea807c;
      expv[44] = 72'h890a1374298554de8c;
      expv[45] = 72'h8b989168e4e56ba481;
      expv[46] = 72'h05195c1f29d539e60c;
      expv[47] = 72'h8916d1a1ec3774c3bc;
      expv[48] = 72'h01cb2ff656875caa74;
      expv[49] = 72'h8fa2be21306afbc122;
      expv[50] = 72'h8eb4a2115a790b0db9;
      expv[51] = 72'h00492c52eca3c9ef40;
      expv[52] = 72'h800847ea9122f3600c;
      expv[53] = 72'h0530a3b20bac6cd9f4;
      expv[54] = 72'h097e50e3c4c56297e1;
      expv[55] = 72'h051e54975c31bf8019;
      expv[56] = 72'h02a52ed920f95db0dd;
      expv[57] = 72'h025b34a3ea17be0e04;
      expv[58] = 72'h0740f32ceb304fecbe;
      expv[59] = 72'h049d891f2a81ed0aaf;
      expv[60] = 72'h048ee1e4a5901492f8;
      expv[61] = 72'h0befd6c9423130c00f;
      expv[62] = 72'h0732c8480a72fdef9b;
      expv[63] = 72'h096d995598a6420384;
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
