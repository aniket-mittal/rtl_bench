// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 160;
  localparam OW = 77;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_005807 dut (
    .HCLK(clk),
    .HRESETn(in_vec[159:159]),
    .HREADY(in_vec[158:158]),
    .HMASTER(in_vec[157:154]),
    .HADDR0(in_vec[153:122]),
    .HPROT0(in_vec[121:118]),
    .HTRANS0(in_vec[117:116]),
    .HWRITE0(in_vec[115:115]),
    .HSIZE0(in_vec[114:112]),
    .HBURST0(in_vec[111:109]),
    .HWDATA0(in_vec[108:77]),
    .HADDR1(in_vec[76:45]),
    .HPROT1(in_vec[44:41]),
    .HTRANS1(in_vec[40:39]),
    .HWRITE1(in_vec[38:38]),
    .HSIZE1(in_vec[37:35]),
    .HBURST1(in_vec[34:32]),
    .HWDATA1(in_vec[31:0]),
    .HADDR(out_vec[76:45]),
    .HPROT(out_vec[44:41]),
    .HTRANS(out_vec[40:39]),
    .HWRITE(out_vec[38:38]),
    .HSIZE(out_vec[37:35]),
    .HBURST(out_vec[34:32]),
    .HWDATA(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 160'h3a4ffba54b6c470b7ba5ada692c1ef45e8ab731d;
    stim[1] = 160'h2878adc108c9848f9c2cd139733838b4e480b415;
    stim[2] = 160'hc6b3cbd28f70f71cc3f8355382f1ca8bdaf21932;
    stim[3] = 160'h1c72cfdcd69d3f548c441f545a7030ce82299f22;
    stim[4] = 160'hd49ab48e56505a3c8fa13c8cf354d24d1359e631;
    stim[5] = 160'hb26331f1a15cf4eb9cd7102927105a8c9cd491ea;
    stim[6] = 160'hfff31c6b67962cc44a2f1f6f6fa0d082338d3dfc;
    stim[7] = 160'hd3a84b6c8c17dc2891cee7fa060dfa408213f993;
    stim[8] = 160'h82262e021a9dd11461ae818f6e4858785d01352a;
    stim[9] = 160'ha4173ddc937c0750b8d8c009196a1cbcaf8df5d2;
    stim[10] = 160'ha6ff26e25d38c51eeddd8c274642e5618e9c36b5;
    stim[11] = 160'hdaf4ef5cdd20685ef688556201ac9218d102103b;
    stim[12] = 160'hc85a9f6137bd25185faa5e6e9c6b46447a4cc4d7;
    stim[13] = 160'hfe3f62bdac96a9603e096509312e58f561ca5c2d;
    stim[14] = 160'hc7d515896d30d12c9850e58fe2b6a5718a35a8b3;
    stim[15] = 160'hfbe8c85e5efe9a5643a5663f27422dfbd5281984;
    stim[16] = 160'hc2355ea4a892c3f66203c3663f547f684fab6236;
    stim[17] = 160'hdf54156d7e3749db657709180ccaf69caa7336d2;
    stim[18] = 160'hc93ada500d53cfbc2634f30ff62e84a7283a3bd5;
    stim[19] = 160'hffa97cedd52f78f046033aa69564760cbebb0170;
    stim[20] = 160'h98f7bdb09fb4fb7950581568525cb24a8cbb0d4f;
    stim[21] = 160'h9f2df463aaea3abd31d2f5080c57d40bfe4de907;
    stim[22] = 160'hc97f4e632dbbd2ec3bc3dd410f28f5663f28ddbd;
    stim[23] = 160'hfa032ade390b53c0ca4e6c63efd9ff9d76b53796;
    stim[24] = 160'hab415c34d49f352fecf2ffb43fa028626249bc72;
    stim[25] = 160'hc046a45dc8e528a811218ff3db4b36719227d07f;
    stim[26] = 160'he4370089b3a40c3863f161e796698e0d1b6f4471;
    stim[27] = 160'hc10b81da6e24001704b80af4fbf07ac4c41d468b;
    stim[28] = 160'h905ffe339332b67d9cd262ae8b036e4a494e7380;
    stim[29] = 160'hb58760f058f7eddce11d1761aae77072e777cfe1;
    stim[30] = 160'hbb0bef34ca0ee34b87a50052c7690a6342454feb;
    stim[31] = 160'hb2250d58d9b2c1dae290e3eb9d994f8941e33519;
    stim[32] = 160'hd63d0a64637af14ea26a9fcf6d3e596fc8119936;
    stim[33] = 160'he29650955195a98dede10a50f2313b5c1624a0f1;
    stim[34] = 160'ha728fc60a1c04048414b327ff107b1dfff52ad88;
    stim[35] = 160'hebd00f16a96acc42a8cbe6b6c0a28ee3e6260098;
    stim[36] = 160'h9e38f35279db2c3843322647c97167ded147ac73;
    stim[37] = 160'hc70ff611085b1baa86176cc779d75ed8c5a356e9;
    stim[38] = 160'hb2e1b7d5c7da35a52d0d1689bf875d6ebb4901f1;
    stim[39] = 160'hdaad774c0b803f80a80a2b60a3ab303e73f3ae12;
    stim[40] = 160'hc39aaa7b86056e95be283f5785826f527001b63a;
    stim[41] = 160'hb045b633c48a98094f38e4071aa8dffce6f90116;
    stim[42] = 160'hbe322c075d6ec2f32f52381dce53604dc29d537b;
    stim[43] = 160'h936684d5893b65f0bba5d820420edfd3aa7cb74f;
    stim[44] = 160'hc0c00b48f3c2c8c17ef7647d09c86e5b5bbd0df8;
    stim[45] = 160'hdd29c19673ccf58379c7a0b70180104fc826f75d;
    stim[46] = 160'he71e8069673a50bdcff6f1c87b1b15b82be988ef;
    stim[47] = 160'h60605a13137111c9f9bda6ddb32ed6591668ce98;
    stim[48] = 160'he39cb5f52fd68b61c707bcefedaab2c0a06d84fe;
    stim[49] = 160'hbf75900b06932df5b3c3fdcfed2dacb493c7f00e;
    stim[50] = 160'hadb659ba9a7477a98de6b6b0e570018277028ed1;
    stim[51] = 160'hb9a6d832cd0018b5c0ddf744894e710ab8129be8;
    stim[52] = 160'hc0ecb01a80f3078124497ba0471c4bd000f4d730;
    stim[53] = 160'hd221ce0f558e12fe187d62707853c890b04f5821;
    stim[54] = 160'hf6f579c787cb7d2b740238b709efb6d76b2bfab3;
    stim[55] = 160'h87c1bf6aa20518aa5fbf11501c5b2a95cef68158;
    stim[56] = 160'habe77b1b7ca5204aea61f3c1473c07a7d01df43f;
    stim[57] = 160'he1f374a4b251b45a76423e19d8f4f47ce55afe57;
    stim[58] = 160'hffbabe17053cc7c44e602c17d436d0d37bc33e95;
    stim[59] = 160'hc44493ccf17d0b5bafda5e110a4a3e89b8fcd662;
    stim[60] = 160'hdf55e1ee1729fc453c274c31a667a7ed108a917f;
    stim[61] = 160'hadf6844d8feb9f27436fd4591ce6c0aceb6564bf;
    stim[62] = 160'ha88305c8f82aac6ff875fb733f4b3aab8b49c7af;
    stim[63] = 160'hdb4599366f548b18c6881847d804c01fa3b2f972;
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
      expv[0] = 77'h1fffffffe000385bdd2d;
      expv[1] = 77'h1fffffffe000247ce166;
      expv[2] = 77'h155382f1ca8bb8e61fc1;
      expv[3] = 77'h1fffffffe000faa46220;
      expv[4] = 77'h1fffffffe000d1e47d09;
      expv[5] = 77'h1fffffffe00000000000;
      expv[6] = 77'h1fffffffe00000000000;
      expv[7] = 77'h1fffffffe00000000000;
      expv[8] = 77'h11317010d4ee00000000;
      expv[9] = 77'h1fffffffe00000000000;
      expv[10] = 77'h1fffffffe00000000000;
      expv[11] = 77'h1fffffffe00000000000;
      expv[12] = 77'h1fffffffe00000000000;
      expv[13] = 77'h1fffffffe00000000000;
      expv[14] = 77'h058fe2b6a57100000000;
      expv[15] = 77'h1fffffffe000d5281984;
      expv[16] = 77'h11aaf525449600000000;
      expv[17] = 77'h1fffffffe0004edb2bb8;
      expv[18] = 77'h1fffffffe00000000000;
      expv[19] = 77'h1fffffffe00000000000;
      expv[20] = 77'h1fffffffe00000000000;
      expv[21] = 77'h1fffffffe00000000000;
      expv[22] = 77'h1fffffffe00000000000;
      expv[23] = 77'h1fffffffe00000000000;
      expv[24] = 77'h1fffffffe00000000000;
      expv[25] = 77'h023522ee472900000000;
      expv[26] = 77'h1fffffffe00061c31f8b;
      expv[27] = 77'h085c0ed3712000000000;
      expv[28] = 77'h1fffffffe000b3ece693;
      expv[29] = 77'h1fffffffe0006ee708e8;
      expv[30] = 77'h1fffffffe0001a5c3d28;
      expv[31] = 77'h1fffffffe0000ed71487;
      expv[32] = 77'h1fffffffe0008a751354;
      expv[33] = 77'h1fffffffe00000000000;
      expv[34] = 77'h1fffffffe00000000000;
      expv[35] = 77'h1fffffffe00000000000;
      expv[36] = 77'h1fffffffe00000000000;
      expv[37] = 77'h0cc779d75ed800000000;
      expv[38] = 77'h1fffffffe000bb4901f1;
      expv[39] = 77'h1fffffffe00073f3ae12;
      expv[40] = 77'h1cd553dc302b00000000;
      expv[41] = 77'h1fffffffe000c04a79c7;
      expv[42] = 77'h1fffffffe00017997a91;
      expv[43] = 77'h1fffffffe0002f85dd2e;
      expv[44] = 77'h06005a479e16460bf7bb;
      expv[45] = 77'h1fffffffe000ac1bce3d;
      expv[46] = 77'h1fffffffe00000000000;
      expv[47] = 77'h1fffffffe0008e4fcded;
      expv[48] = 77'h1fffffffe0005b0e383d;
      expv[49] = 77'h1fffffffe00000000000;
      expv[50] = 77'h1fffffffe00000000000;
      expv[51] = 77'h1fffffffe00000000000;
      expv[52] = 77'h076580d4079800000000;
      expv[53] = 77'h1fffffffe00097f0c3eb;
      expv[54] = 77'h1fffffffe00000000000;
      expv[55] = 77'h11501c5b2a9500000000;
      expv[56] = 77'h1fffffffe00000000000;
      expv[57] = 77'h1fffffffe00000000000;
      expv[58] = 77'h1fffffffe00000000000;
      expv[59] = 77'h1e110a4a3e8900000000;
      expv[60] = 77'h1fffffffe000108a917f;
      expv[61] = 77'h1fffffffe00000000000;
      expv[62] = 77'h1fffffffe00000000000;
      expv[63] = 77'h1fffffffe00000000000;
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
