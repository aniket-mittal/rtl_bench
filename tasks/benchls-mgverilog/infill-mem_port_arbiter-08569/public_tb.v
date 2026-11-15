// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 197;
  localparam OW = 195;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08569 dut (
    .clk(clk),
    .rst(in_vec[196:196]),
    .r_data_i(in_vec[195:164]),
    .c_data_i(in_vec[163:132]),
    .mem_r_addr_i(in_vec[131:100]),
    .mem_r_read_en(in_vec[99:99]),
    .mem_c_addr_i(in_vec[98:67]),
    .mem_c_read_en(in_vec[66:66]),
    .wb_data_i(in_vec[65:34]),
    .wb_addr_i(in_vec[33:2]),
    .wb_r_we_i(in_vec[1:1]),
    .wb_c_we_i(in_vec[0:0]),
    .r_data_o(out_vec[194:163]),
    .r_addr_o(out_vec[162:131]),
    .r_we_o(out_vec[130:130]),
    .c_data_o(out_vec[129:98]),
    .c_addr_o(out_vec[97:66]),
    .c_we_o(out_vec[65:65]),
    .mem_r_data_o(out_vec[64:33]),
    .mem_c_data_o(out_vec[32:1]),
    .r_rw_conflict_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 197'h190b5bbff3cfbdd26d21daa7da7c7ca45c34a71f4478ad4f10;
    stim[1] = 197'h1558f0160cc314add403ba18993ec2a0696e0194af0aa8ee21;
    stim[2] = 197'h0cb9ee341dc9ccb4f25e502c95c44974545186944b3274725e;
    stim[3] = 197'h028f8360d7019221347edff418bbc2d07d4bac98416dcee7dd;
    stim[4] = 197'h0b33d6f4ddd9e6d78084aa18e3c9257d61afcda4ad5eca26aa;
    stim[5] = 197'h0f2e6f45a2cce4e8a3bd998e18e2a98996a04b5c4f9053047d;
    stim[6] = 197'h0a46066807cd43ebb8102bf5d626c21aba71cea187fbc9199e;
    stim[7] = 197'h0581c963699d7864bc024f4821ffbf0eca56e410934d35a87b;
    stim[8] = 197'h0ad0d021453e0fed552e587d8bb30b4a1379eeb308d6f62443;
    stim[9] = 197'h0e438a12b69613ef59ecd1d0373b0a5338b9fb578e04b028df;
    stim[10] = 197'h0f7dd1cf1b09a8fd939d790524b1b7cf25e9255a5179477f40;
    stim[11] = 197'h011832003cd97d791d84e9748d5c21658f69c63a95f7a9aa84;
    stim[12] = 197'h038160c0a3dad2378a6ba40096fd03b7d57917b2c4105d4632;
    stim[13] = 197'h07436147ddf2b377213add7d3050662e967c35eaf649a59418;
    stim[14] = 197'h1bd491433470ceecff6ef12166d7646c3efc20fd2d84ba4f10;
    stim[15] = 197'h04d8c1fb41305fb1a65c46ba8735efcee9fceb2c9b6624bb42;
    stim[16] = 197'h017b4078bc66f20d35673706f55399776f8d97fa869dfef266;
    stim[17] = 197'h0277c2da06aefdaafa08b58a08a4a5cd4fbcb9f584a2b07802;
    stim[18] = 197'h0cda3a9a69979e9dcb2aeadaa34a1f2942992c2e1f5d45ecf6;
    stim[19] = 197'h0b05639d2cf33aecf112e9bcf804bf757aa989165e9b3ac234;
    stim[20] = 197'h02d483e6b26b30bbd732166ac860f055588277c39b0cd57de8;
    stim[21] = 197'h03072ab726ad6446c9465d5151dcc65e1547e8df33de4b7b2b;
    stim[22] = 197'h0cbcb9cd6117d21507efcb2ab17639bf67f599b5e0997d8c5a;
    stim[23] = 197'h0c8e452345d058dd450f28bf11d686bb51e9afdf560f767d00;
    stim[24] = 197'h09ecc398ff76c51346e0207a172693c92a8d2d88851e0f0d04;
    stim[25] = 197'h0f19bbc7b36c09c0758af0007b7f20e6701ce4c6a784c2b1b9;
    stim[26] = 197'h0906203706052c3375ad5536d8271425f3c133af8f709e672c;
    stim[27] = 197'h07dca2e07166becea0f06f7844d09919009224d09aeff35baf;
    stim[28] = 197'h03180c514dfec012f79678fa67243da2de5b43847eecfe8d35;
    stim[29] = 197'h068370c71e51c9df86d593aae026712e18062a838f881790ce;
    stim[30] = 197'h006f000d5dab5b0d45af7d867caa99fbd3a029029b42ce2307;
    stim[31] = 197'h0ee550b3138008998da9444796a348fbe699be7966ae020600;
    stim[32] = 197'h0c3f42630f47526eedea0e511b3b17e116778ef596603f761a;
    stim[33] = 197'h066698a4f620635b2909b431c93b5a5658ec04dde1ada518d9;
    stim[34] = 197'h04efab319103e9761cbaf6f4b14f9679b2bd49465363bdabdb;
    stim[35] = 197'h0003d6f48e334833e2eb57c961cdc6e78fea02d80e0a814abe;
    stim[36] = 197'h0dd7b767acf930f0c0998ee9398978801be6504967586e5c7a;
    stim[37] = 197'h0caf53c56823602ac1e6931a2656cb0fd8956ac19cc2ed49d4;
    stim[38] = 197'h02990a4fc1aa959466cb4616fe62b95dbb208c3a7281a97f3f;
    stim[39] = 197'h0f5f36e9245bedf276727a6aa87eece0f45abc6b19b95045e6;
    stim[40] = 197'h09bdd29c78adf3cf3bc9dea60bf3f653f62b45470304dc40d1;
    stim[41] = 197'h02dc41585c00f8cd4e363893869a826ac1b255ab29f9e7798b;
    stim[42] = 197'h0099712065fc9c15fc261156ff2d5d9db58c0c9050669e8131;
    stim[43] = 197'h06a04c95e970678db24a46d9d1fd1e8775d15f2673e688ac59;
    stim[44] = 197'h0596ff101c665c5299ec0def28acf9f2fd6be496a15d4dfe8c;
    stim[45] = 197'h0d519e0c1cb4fd2cf585dbdfed498a605b918b9e4d26d85e3b;
    stim[46] = 197'h0658812c4cd1f37b986289ddb8415a621c28fe31dd286df9f9;
    stim[47] = 197'h032dd98e8ef5b48d615ed7a326063ba81c27a5d5ddd39b72c5;
    stim[48] = 197'h0f617dc763ebe463b53e0f6a4c456fd8568464e73e1a31040b;
    stim[49] = 197'h08df0ab6f9e5c3e57c88684e127461f17a61d0019f9e071ba1;
    stim[50] = 197'h0c338dd215555907ae55c51af5a4cc0b0586c082c15733e1a9;
    stim[51] = 197'h06048ee2c764058a8f25838913fc329758fa101163b45e582d;
    stim[52] = 197'h0fe663d39649fc574be3e92f02dcecb51d7f04f04a13f280ba;
    stim[53] = 197'h0ed8795ee9773e17f4ec1695f38c1dee209b9f34b04f142755;
    stim[54] = 197'h0a0df20b9e6e67213a45a4673fba13e2686b423dafce478d4a;
    stim[55] = 197'h0b888a880cbb7d08cc787581f637d039d6ff1f9dd6cf5064ca;
    stim[56] = 197'h0bb36042373d11e02a33fb2237b7c934d2b85bfcd15837e344;
    stim[57] = 197'h0c0e5d400e725ad400f39da11e96544aa0d6275dcd16807fd9;
    stim[58] = 197'h0d7a58ae68711b469c512e8221b716bb58976daedfbe920ddb;
    stim[59] = 197'h020461e835cdfb0f59c87a0991ca6f0dddc68a08decc155632;
    stim[60] = 197'h01d4b329a73291cdacf0dd20ca3dc0d5065117396c5ba6d417;
    stim[61] = 197'h0decfaf41bfae6e0d89f10be50b9024c509285c9e9eb94818d;
    stim[62] = 197'h0b8867f04162352a6f5b9ec22b1cb4157a7ee71ecb98c05100;
    stim[63] = 197'h09bb4c86e4613ccab81051f987ae15519a9337e0806d25e84a;
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
      expv[0] = 195'h0694e3e8e90ed53e8000000013e3e522xxxxxxxxxxxxxxxxx;
      expv[1] = 195'h2dc03295a01dd0c48000000009f6150340000000000000000;
      expv[2] = 195'h0a30d289664e8e4bc00000002e224ba280000000000000000;
      expv[3] = 195'h2975930823f6ffa08000000005de1683c4bca0592e0324426;
      expv[4] = 195'h35f9b495abd944d5400000001e492beb1667ade9bbb3cdaf0;
      expv[5] = 195'h54096b899deccc708000000007154c4c81095431cf2495f58;
      expv[6] = 195'h4e39d430ff792333c0000000313610d5d48c0cd00f9a87d76;
      expv[7] = 195'h4adc821269a6b50f400000000ffdf876502057ebb89b086ae;
      expv[8] = 195'h6f3dd6611adec488400000001d985a5098049e9047fefc3b3;
      expv[9] = 195'h173f6af1c096051bc000000039d85299dc8714256ecc2d284;
      expv[10] = 195'h3d24ab4a1cebc82900000000258dbe7913d9a3a07cec294ce;
      expv[11] = 195'h6d38c752ec274ba4000000002ae10b2c473af20a59b2faf22;
      expv[12] = 195'h2f22f658820ba8c64000000037e81dbe8702c18147b5a46f0;
      expv[13] = 195'h4f86bd5e89d6ebe9800000000283317494d748013be566ee4;
      expv[14] = 195'h5f841fa5fb77890b0000000036bb2361c275bafa68e19dd9e;
      expv[15] = 195'h3f9d65936cc497684000000039af7e7740000000000000000;
      expv[16] = 195'h71b2ff50d3bfde4cc00000002a9ccbbb4cb88d751cd7bf3ba;
      expv[17] = 195'h77973eb094560f004000000005252e6a4ace6e0ded5dfb55f;
      expv[18] = 195'h532585c3eba8bd9ec00000001a50f94a19b47534d32f3d3b8;
      expv[19] = 195'h553122cb88974de7800000000025fbabd655d5b54d287ca50;
      expv[20] = 195'h104ef8733990b35600000000030782aac5a907cd6012fdd5e;
      expv[21] = 195'h28fd1be67bc96f65400000000ee632f0860e556e4183c1556;
      expv[22] = 195'h7eb336bc132fb18b400000000bb1cdfb128cbaa2a22fa42a0;
      expv[23] = 195'h3d35fbeaa87945f8800000000eb435da8fdf96556ba0b1ba8;
      expv[24] = 195'h51a5b110b70103d08000000039349e494a1e517e275a1aed4;
      expv[25] = 195'h039c98d4ac578003800000001bf907338dc040f43c9a4f24a;
      expv[26] = 195'h782675f1ad6aa9b6800000000138a12f920c406e0dfc8399c;
      expv[27] = 195'h12449a135dfe6b75c00000002684c8c80fb945c0e09c5097c;
      expv[28] = 195'h4b68708fbcb3c7d3000000003921ed16c1e0def0934264640;
      expv[29] = 195'h00c55071f102f219c000000001338970cf2cf1f4dca393bf0;
      expv[30] = 195'h740520536859c460c00000002554cfde8dab2755c099c4b87;
      expv[31] = 195'h5337cf2ced4a223c80000000351a47df1dcaa16632aa67ef4;
      expv[32] = 195'h4ef1deb2cc07eec34000000019d8bf089b52888f3e8ea4ddd;
      expv[33] = 195'h1d809bbc484da18e0000000009dad2b2cccd3149ec40c6b64;
      expv[34] = 195'h57a928ca6c77b57b400000000a7cb3cd89df566324ed69596;
      expv[35] = 195'h7d405b01c1502957c00000000e6e373c5975ede9653e59e6c;
      expv[36] = 195'h7cca092ceb0dcb8f400000000c4bc400c5d6af92d9f261e19;
      expv[37] = 195'h12ad58338f3498d10000000032b6587ed95ea78ac625e2006;
      expv[38] = 195'h6411874e50352fe7c00000003315caedc3cd2634595b2c3f7;
      expv[39] = 195'h0b578d63372a08bcc000000003f767079ebe6dd2598ae576f;
      expv[40] = 195'h4568a8e05e4ef530000000001f9fb29f937ba538f15be79e6;
      expv[41] = 195'h364ab5653f3cef314000000034d4135605b882b0b801f19a8;
      expv[42] = 195'h3181920a61308ab780000000396aeced9c6c71271a6a09ab0;
      expv[43] = 195'h3a2be4ce125236ce800000000fe8f43b8d40992bd2e0cf1b6;
      expv[44] = 195'h2d7c92d44f606f79000000000567cf97c4948db3b8ccb8a52;
      expv[45] = 195'h723173c9a4db0bc7400000002a4c5302daa33c183969fa59f;
      expv[46] = 195'h051fc63bc3144eed80000000020ad310ccb10258952629816;
      expv[47] = 195'h04f4babb8af6bd19000000003031dd40c65bb31d1deb691ac;
      expv[48] = 195'h508c9ce7c346208140000000222b7ec282bdaf4647d7c8c77;
      expv[49] = 195'h4c3a0033e44342708000000013a30f8bd1be156df3cb87cae;
      expv[50] = 195'h30d8105872ae28d7800000002d2660581910d09c29d187c5e;
      expv[51] = 195'h1f42022c792c1c48800000001fe194badcab8a35eec80b150;
      expv[52] = 195'h2fe09e09427e50174000000016e765a8de4b07122ff0ca5d6;
      expv[53] = 195'h1373e6962760b4af800000001c60ef7117c7d25e12ee7c2fe;
      expv[54] = 195'h0d6847b5f9c8f1a9400000003dd09f1349d82d2bee3077b89;
      expv[55] = 195'h5fe3f3bad9ea0c994000000031be81ce971115101ee84f89a;
      expv[56] = 195'h570b7f9a519fd911800000003dbe49a698f0eb03ee7a23c04;
      expv[57] = 195'h1ac4ebb9879ced088000000034b2a2551467f6447edf24d34;
      expv[58] = 195'h12edb5dbf7d241bb400000000db8b5dadaf4b15cda59512a8;
      expv[59] = 195'h38d1411bd982aac6400000000e53786ed8a25d0446dc5aed6;
      expv[60] = 195'h4a22e72d8b74da82c000000011ee06a81390f4132e65239b5;
      expv[61] = 195'h1250b93d44f885f28000000005c812629bd9f5e837f5cdc1a;
      expv[62] = 195'h4fdce3d97adcf6110000000018e5a0abd13e217ca2e409314;
      expv[63] = 195'h5266fc100da4bd09400000003d70aa8cd376990dcc72d055e;
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
