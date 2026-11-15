// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 169;
  localparam OW = 203;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10596 dut (
    .clk_i(clk),
    .IF_addr_i(in_vec[168:137]),
    .IF_req_i(in_vec[136:136]),
    .MEM_req_i(in_vec[135:135]),
    .MEM_we_i(in_vec[134:134]),
    .MEM_addr_i(in_vec[133:102]),
    .MEM_data_i(in_vec[101:70]),
    .MEM_bwsel_i(in_vec[69:66]),
    .dmem_ack_i(in_vec[65:65]),
    .dmem_data_i(in_vec[64:33]),
    .imem_ack_i(in_vec[32:32]),
    .imem_inst_i(in_vec[31:0]),
    .ID_inst_o(out_vec[202:171]),
    .WB_data_o(out_vec[170:139]),
    .dmem_cyc_o(out_vec[138:138]),
    .dmem_stb_o(out_vec[137:137]),
    .dmem_waddr_o(out_vec[136:105]),
    .dmem_raddr_o(out_vec[104:73]),
    .dmem_we_o(out_vec[72:72]),
    .dmem_bwsel_o(out_vec[71:68]),
    .dmem_data_o(out_vec[67:36]),
    .imem_cyc_o(out_vec[35:35]),
    .imem_stb_o(out_vec[34:34]),
    .imem_addr_o(out_vec[33:2]),
    .dmem_rdy_o(out_vec[1:1]),
    .imem_rdy_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 169'h179078352f4945361a0f4ab0a36f5e694ba5210d340;
    stim[1] = 169'h1f35e080c995e201afcc7edb4500a644eb2183c2f2e;
    stim[2] = 169'h1e554cf501d0fd331af5e950f535b4f1521fb376317;
    stim[3] = 169'h1c15ffdcdca37d019d248233df7d146a6bb059c3c83;
    stim[4] = 169'h12274eff7e413858e6b9b03746192883aca6614ed94;
    stim[5] = 169'h1c305edb4b032928508720ccc707c6cc03024809ca9;
    stim[6] = 169'h01998b9d348b3c8a284deb91f7409fd519c330ca7e3;
    stim[7] = 169'h16698784bccd613c3b0511aa4384d246d6c7651497c;
    stim[8] = 169'h15657dbf39e76fefafd25c7510cc20256b081dbe38c;
    stim[9] = 169'h09f58a8c385d7b11115be5934a3f569d4a574e0c048;
    stim[10] = 169'h0da805d96bfd77b650ded186f1fbad87225f169b732;
    stim[11] = 169'h0ffe0018be824a33e35d520ebb3fcb3b1849fd2ca77;
    stim[12] = 169'h143463b2f3fe3f62acc6c2452375af816b75a1fab35;
    stim[13] = 169'h06d575abae34065bedaece4b92d53d1f07281d61773;
    stim[14] = 169'h191332b54d99a41a0374059ee3cdfa58c99f80fb17b;
    stim[15] = 169'h0b761cf0a29bcc303a31f9812b74a96adf69725872d;
    stim[16] = 169'h1b4581a9a6919a29579fad415307b99046d1aeec973;
    stim[17] = 169'h06980157a57466ac365246bee87f8a6c584f6f00c12;
    stim[18] = 169'h0199ba20e4eeb9bed117957c21723bd25643d8dbb4a;
    stim[19] = 169'h1a919e70e588bb4d524e95e7887d2bcbaeebdb22b6b;
    stim[20] = 169'h0f2a25d404578c2f9b05e4f547b7e82356c12269942;
    stim[21] = 169'h049af559cb2ef32dd49f333c6ac9ebeb49411fe1830;
    stim[22] = 169'h0e1dbdd76adc258beda44b7ae4f598ee3b75057fc81;
    stim[23] = 169'h05a8e6119d3d3d53bddb074c848c8e9647bc82b04b5;
    stim[24] = 169'h01445603f4528b40c28b1c66c06affbaca36ca6ba59;
    stim[25] = 169'h11cd079d486bcb3186358da2a6e6257b8460ca86cc6;
    stim[26] = 169'h131819eb3368d0336fd383f964605a9740f11f211ba;
    stim[27] = 169'h18425d0f099e7d90548d17cd6adbcd0a572c08c87b6;
    stim[28] = 169'h14441d83a2e56964b299158c9079f313646ab946121;
    stim[29] = 169'h1361bb86d2913d59ce0ece2ef8ca6c9a025955d7b62;
    stim[30] = 169'h0fd184cdbe2a33ea7b63a81e263ef38827bd58584cf;
    stim[31] = 169'h135bef699c6ee19319bf3a36fa76ce9081289b3db2e;
    stim[32] = 169'h0de98ffcec8e98fc3a4627a5a4d4389595f184c579c;
    stim[33] = 169'h16842ab012d7aa9eff3663368428d202a829990379a;
    stim[34] = 169'h17909dc51aa4a07e7f5724f358c8a4ddbac7f65fb7c;
    stim[35] = 169'h058c02ea06a6a49d6bfa37cc0cd296792e08a88af10;
    stim[36] = 169'h0dc6d42827687e24249e36b49c98fda7b794e7af633;
    stim[37] = 169'h0e71665f87dac68f931e16cd15414ed2d0d1999a5ac;
    stim[38] = 169'h1d2853a0df11841103baa9481fb58bae8c1ad6d30ec;
    stim[39] = 169'h0815f7be3e771dc562ad0112f6d2c52138ee18c8447;
    stim[40] = 169'h0545f99fe0969d156e4b7cb842a7a0e8068558f8314;
    stim[41] = 169'h199aac5b4c771564047b2916beee3d5df89a4d77ac1;
    stim[42] = 169'h124a8a65a609bc5fb0af40a2e08a8d7f6113ca2218a;
    stim[43] = 169'h1a5f15be9d22db97919462597900fdf6b00a43f5dfb;
    stim[44] = 169'h0a2427aabdb2a04bb2831a7d00309cc4b6375d5e41e;
    stim[45] = 169'h0246de0133f67c493f4b23edf4597522ab42f3f2082;
    stim[46] = 169'h0dfddc26b1ec8c4d7a727ae87acafbd82ca792127aa;
    stim[47] = 169'h0955207a17e0015deac27552166a1ab75711b67ee3e;
    stim[48] = 169'h009f7fadee30b6f329152f9c14a8832a7b756be4db6;
    stim[49] = 169'h11ba19aeb2dde6d4240708899489853234a628d12ca;
    stim[50] = 169'h052d2fc9a4840710a8e53a5404fa46146d674b2c1de;
    stim[51] = 169'h16a25c917f1bddf07b72c1063b4e14fee37cfd63696;
    stim[52] = 169'h17c0c9d892805217d8a30485db1e3b944fb67934ca6;
    stim[53] = 169'h0d2e8f32c2bbced1937b0b1b847afc403984fc910a7;
    stim[54] = 169'h13b5814939d8961be51298e92a44cc496496a3493af;
    stim[55] = 169'h08b4051f332de7912562bdc930acb3770f4b4c66bb3;
    stim[56] = 169'h1ed17695d7ee0fc1842751390bf19ce96d7ac4d10b0;
    stim[57] = 169'h0bcc2a03f272ed3042accf3739da7b1822a4e38c4c5;
    stim[58] = 169'h11f5a92615f395a084c96e7fb9dd997bd10e17d7ab5;
    stim[59] = 169'h0a58db29b5380b012ee1177fc8f8872af5e1f7e2a84;
    stim[60] = 169'h0027dce9c35fdf412a1f03c9925deffb1a8f51842b3;
    stim[61] = 169'h093af353618688361c4c93181325e37fb6045df03f0;
    stim[62] = 169'h0ece6eefffeb65ab2cdcee43b93dc443a6d46c463a8;
    stim[63] = 169'h06c12adc1bd24b6e3a8a88711ce4e1c0a1c49bfe6be;
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
      expv[0] = 203'h290869a03d79a52efa4a29b09a4a29b09d83d2ac282f20f06ax;
      expv[1] = 203'h0c1e1797029913acecaf100d0caf100d04f31fb6d13e6bc1019;
      expv[2] = 203'h7d9bb18bd6d3c5480e87e9988e87e99884bd7a543d3caa99ea3;
      expv[3] = 203'h02ce1e41f451a9aee51be80c851be80c9d49208cf7f82bffb9b;
      expv[4] = 203'h330a76ca64a20eb2f209c2c71209c2c718ae6c0dd1e44e9dfec;
      expv[5] = 203'h12404e549f1b300c78194942981949428c21c833313860bdb68;
      expv[6] = 203'h198653f1827f54670459e4510459e4511d137ae47dc333173a5;
      expv[7] = 203'h3b28a4be13491b5b666b09e1866b09e19ec1446a90ecd30f096;
      expv[8] = 203'h40edf1c6308095ac6f3b7f7d0f3b7f7d03f4971d44eacafb7e4;
      expv[9] = 203'h3a7060247d5a752962ebd88882ebd8888856f964d2d3eb15187;
      expv[10] = 203'h78b4db996eb61c897febbdb29febbdb28737b461bc1b500bb2f;
      expv[11] = 203'h4fe9653bff2cec617412519f1412519f1cd75483aedffc00317;
      expv[12] = 203'h2d0fd59ad6be05ad9ff1fb151ff1fb150d31b09148e868c765f;
      expv[13] = 203'h40eb0bb9d4f47c1cf1a032df11a032df1b6bb392e40daaeb576;
      expv[14] = 203'h7c07d8bdb7e963266ccd20d00ccd20d01fdd0167b83226656a9;
      expv[15] = 203'h4b92c396d2a5ab7d94de618194de61818d8c7e604a16ec39e17;
      expv[16] = 203'h0d7764b99ee6411b148cd14a948cd14a9ce7eb5054368b03537;
      expv[17] = 203'h7b7806097e29b1610ba335618ba33561919491afba0d3002af7;
      expv[18] = 203'h1ec6dda548ef49590775cdf68775cdf69545e55f0803337441f;
      expv[19] = 203'h5ed915b5f4af2ebb8c45da6a8c45da6a9193a579e235233ce1f;
      expv[20] = 203'h09134ca15fa08d5b02bc617c82bc617c9ec1793d511e544ba83;
      expv[21] = 203'h08ff0c1827afad257977996e9977996e8b27cccf1a0935eab3b;
      expv[22] = 203'h282bfe40d663b8edf6e12c5f16e12c5f036912deb91c3b7baef;
      expv[23] = 203'h6415825ab23a591ee9e9ea9d89e9ea9d9276c1d321cb51cc231;
      expv[24] = 203'h36535d2cabfeeb2882945a0602945a0611a2c719b0c288ac07f;
      expv[25] = 203'h065436631895ee11e35e598c035e598c0b8d6368a9239a0f3aa;
      expv[26] = 203'h08f908dd016a5d039b46819b1b46819b01f4e0fe59e63033d67;
      expv[27] = 203'h604643db6f34295cecf3ec828cf3ec828b2345f35a3084ba1e2;
      expv[28] = 203'h55ca3090e7cc4d91972b4b25972b4b2581a645632428883b077;
      expv[29] = 203'h4aaebdb129b268091489eace1489eace0383b38bbee6c3770db;
      expv[30] = 203'h6ac2c267fbce209ef1519f5391519f5398d8ea0789dfa3099b7;
      expv[31] = 203'h44d9ed975b3a4204e3770c9883770c98996fce8dbee6b7ded32;
      expv[32] = 203'h0c262bce50e25657e474c7e18474c7e1939189e9691bd31ff9d;
      expv[33] = 203'h4cc81bcd23480aa096bd54f796bd54f780cd98cda1ed0855603;
      expv[34] = 203'h3fb2fdbe229376eb752503f3952503f383d5c93cd6ef213b8a2;
      expv[35] = 203'h454457884a59e4b8153524eb153524eb13fe8df3030b1805d40;
      expv[36] = 203'h273d7b19e3f69ede1b43f1211b43f12112278dad271b8da8507;
      expv[37] = 203'h0cccd2d6053b4b431ed6347c9ed6347c95c785b3451ce2ccbf3;
      expv[38] = 203'h56b69876562eba30788c2088188c20881eeeaa5207fa50a741b;
      expv[39] = 203'h70c64223cb1484e3f3b8ee2b13b8ee2b1bab4044bdd02bef7c4;
      expv[40] = 203'h2ac7c18a1e83a01a04b4e8ab04b4e8ab0a92df2e100a8bf33fe;
      expv[41] = 203'h526bbd60b8f577e263b8ab2003b8ab201b1eca45af333558b6b;
      expv[42] = 203'h1e5110c52a35fd84104de2fd904de2fd922bd028b8249514cb5;
      expv[43] = 203'h521faefd83f7dac06916dcbc8916dcbc946518965ef4be2b7d3;
      expv[44] = 203'h3aeaf20f427312d8ed95025d8d95025d90a0c69f40d4484f557;
      expv[45] = 203'h179f904165d48aad1fb3e2499fb3e24981d2c8fb7dc48dbc024;
      expv[46] = 203'h3c9093d52bef60b28f64626b8f64626b8b9c9eba1edbfbb84d6;
      expv[47] = 203'h0db3f71f286add5c1f000aef1f000aef19b09d5485d2aa40f43;
      expv[48] = 203'h2b5f26db220ca9edf185b7991185b79912454be705013eff5bf;
      expv[49] = 203'h314689652614c8d296ef36a116ef36a10201c22265e374335d5;
      expv[50] = 203'h3a5960ef691851b5842038850420388513394e95010a5a5f936;
      expv[51] = 203'h67eb1b4b3853fb8df8deef8398deef839ddcb0418eed44b922f;
      expv[52] = 203'h33c9a65378ee513e940290be940290be8c28c12176ef8193b11;
      expv[53] = 203'h27e48853ebf100e615de768c95de768c81dec2c6e11a5d1e65a;
      expv[54] = 203'h351a49d7933125926ec4b0df0ec4b0df0944a63a4ae76b02927;
      expv[55] = 203'h5a6335d9b2cddc3d196f3c89196f3c890258af724cd1680a3e6;
      expv[56] = 203'h562688584673a5b59f707e0c1f707e0c1f09d44e42fda2ed2bb;
      expv[57] = 203'h271c6262e9ec608a939769821397698207ab33cdced7985407e;
      expv[58] = 203'h70bebd5af665ef440f9cad040f9cad0417325b9feee3eb524c2;
      expv[59] = 203'h0fbf1542621cabd789c0580909c0580913b845dff2d4b1b6536;
      expv[60] = 203'h7a8c2159f7bfec6a1afefa091afefa090987c0f264004fb9d3a;
      expv[61] = 203'h22ef81f8178dfed80c3441b08c3441b08c1324c6041275e6a6f;
      expv[62] = 203'h236231d477110e9b7f5b2d591f5b2d5914373b90eedd9cdddff;
      expv[63] = 203'h24dff35f138702877e925b719e925b7183a2a21c47cd8255b82;
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
