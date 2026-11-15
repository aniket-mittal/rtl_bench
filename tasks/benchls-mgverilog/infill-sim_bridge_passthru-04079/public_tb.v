// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 258;
  localparam OW = 253;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04079 dut (
    .clk(clk),
    .rst(in_vec[257:257]),
    .i_sim_in_reset(in_vec[256:256]),
    .i_sim_in_ready(in_vec[255:255]),
    .i_sim_in_command(in_vec[254:223]),
    .i_sim_in_address(in_vec[222:191]),
    .i_sim_in_data(in_vec[190:159]),
    .i_sim_in_data_count(in_vec[158:127]),
    .i_sim_out_ready(in_vec[126:126]),
    .i_master_ready(in_vec[125:125]),
    .i_oh_en(in_vec[124:124]),
    .i_out_status(in_vec[123:92]),
    .i_out_address(in_vec[91:60]),
    .i_out_data(in_vec[59:28]),
    .i_out_data_count(in_vec[27:0]),
    .o_sim_master_ready(out_vec[252:252]),
    .o_sim_out_en(out_vec[251:251]),
    .o_sim_out_status(out_vec[250:219]),
    .o_sim_out_address(out_vec[218:187]),
    .o_sim_out_data(out_vec[186:155]),
    .o_sim_out_data_count(out_vec[154:127]),
    .o_ih_reset(out_vec[126:126]),
    .o_ih_ready(out_vec[125:125]),
    .o_in_command(out_vec[124:93]),
    .o_in_address(out_vec[92:61]),
    .o_in_data(out_vec[60:29]),
    .o_in_data_count(out_vec[28:1]),
    .o_oh_ready(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 258'h29df1b584f6b9643022aa19eeaadbe433da785310ddf53af525c0d3c58e247edb;
    stim[1] = 258'h2aae8ecacc426ccb01adb240340841f45ab28fee8e415bbc44dea6d251b40361d;
    stim[2] = 258'h12f452d7c731761aa204a926e1c870594e00cad5fa76fcf52bed55094cde0b316;
    stim[3] = 258'h0ff61f8f2f001742999d70eefea21df2a59dddffe43fe84887e160a28382440b2;
    stim[4] = 258'h1f2cbeb769f3aa4f44191e100bff4dfae31bae6cf76ed980c7e66cef215a510c6;
    stim[5] = 258'h03d96f825c98af1cde5bc31e45f792fc3930f3e29caa144513ff18e84bef99c98;
    stim[6] = 258'h09ffdb74293ef86f6f828eb57d9e1057bceec2cdbf69b330265d1832d25d60b69;
    stim[7] = 258'h008cebbeca82613443562d807e68e8891c3fa9d2e2bd24b414387b36e8e95276d;
    stim[8] = 258'h129cbfae8f47543fbe1b9ba928928458ec363b086ac1a37893440fb4b882cbae2;
    stim[9] = 258'h20b71b25f271fcd06dde0e7e6411371c8d8216d6493d318ede8cd1f579e7bc025;
    stim[10] = 258'h1c4695829694900405d2b1c6527c1cf224efb226e0a8741cbbcd86894e90e2362;
    stim[11] = 258'h10c076cdc348760b7932d16d25b4352a9424925b8291248b153f7ed887ed1a046;
    stim[12] = 258'h0c65699b03955035ca0ff38af6e6e9f60602d58ae64667752f0df34eef2316894;
    stim[13] = 258'h158b3f60d4f1b33f774fa433be38d3b1de4251499cc3e68b261d2c9e1a7167eb1;
    stim[14] = 258'h1a5585d9662e853795c3b00502efb8345be083c9a88759ae34881d791856b8be7;
    stim[15] = 258'h1a42b2cf27d8612251972ab92b8b7e16e600aecff6e1f67937efdc6753d72a022;
    stim[16] = 258'h117a1a3755d099c10ffec2b683971ab52e901dba8712fc9ba4f13c85f2146c034;
    stim[17] = 258'h0c9055f662fbfad95ccddb393cf37581b26c9121d21b5718e6db24fae122c3a56;
    stim[18] = 258'h0b620184e128e1e5f80e6e1a8d81d6d4c735eca4df86a6db23fea880f91d44842;
    stim[19] = 258'h1bd2378c0bdaeed94765ca143059eb0ce01bfe0501587d9ca204f1792b91ab00f;
    stim[20] = 258'h1b84a85ce4ff85f37494ea5af0bb0e2cf7479be8f80c3be96e0cf92d44a038afa;
    stim[21] = 258'h15af2f1e65fc4e9c0ccb9cfb2d72f48b85514121d2a06a4edb06bce77fc01be85;
    stim[22] = 258'h1cd5379e73dc5777ad428c0ec9bc274f0e9a3fc4a3ac383152dbd1d11bf148279;
    stim[23] = 258'h026b6d6f8ca2940dd050e36631ae1f242996963dbaf43b5109e2d2c2a57154828;
    stim[24] = 258'h0126edecedcda3b8bb902cff1f379a7c749902467c905ecfcdc33f5c636ad90c2;
    stim[25] = 258'h00c0eae3f8d5d18d6969d0d1e45863bfbf8fedaf6cd6904c119a1b50c6309e223;
    stim[26] = 258'h0a7879b4b5cec64988ac4526dc6346ef136e1c9a39590ccd4e76f04c47ffda163;
    stim[27] = 258'h1e7f0f433d676e53b74ec7383105cd3a2404bc6ed6e1aa5f923f6483d4404f00b;
    stim[28] = 258'h12312f35b1dc9932e4a32c068025de436800fb824061539f3e3c3a8e88ab863f7;
    stim[29] = 258'h237020a1ffc9f25dc171713f837fb3c65a040394f28837fe3fa0069b4a1148750;
    stim[30] = 258'h00506600156cde32c31192bb651392b0015ca81dd061a804fe3661f6ce146dadf;
    stim[31] = 258'h0506f61ce534cca1dd5a8fd5106ada95748b0a15768381ea88a4ac09f8fdbc19b;
    stim[32] = 258'h11b91c5ccf95f9a687dab802edba8a89119dfba4e42d4b2c026d24a0b7ea919ad;
    stim[33] = 258'h0e3f7fd5708997062142a2925f6db961c416f58ae74b51bad49855719d2b678d9;
    stim[34] = 258'h0e405f2ad23ec5321408bb5650442d009aae748d08984b9034fcd3af001eb08be;
    stim[35] = 258'h000fb959489c597f8f2c029da307bbc4b6c113614987082e663465946a0a57c68;
    stim[36] = 258'h1f18a3fdaa09b56e028a1c2f0f015c7a3c300c8a866ee0083c733f1862f64b18b;
    stim[37] = 258'h243db33ba9355a3ebc9d947f150f0d0a9927ab55a8f031edb70e645585e9702ec;
    stim[38] = 258'h0266a54f94823281378fe35ba3beb08e0cb513031ac0e528ca933c7baf8679115;
    stim[39] = 258'h1054d1fe9bc2d84be719210834448060783b9f360436d305af09c9ee87dfc22df;
    stim[40] = 258'h141891efeea9fc5c8200824259b446bbffaea2832d523852f6e199c8ac3b4e03d;
    stim[41] = 258'h124b3d5e7785f4d06efe380a75756a69c774c63a91e32b4e69b09bbb634adef24;
    stim[42] = 258'h0e149ffdc7a027f54628c2fd7dd047ba2d7e8288f694a748a7ca7329557f2ef70;
    stim[43] = 258'h1f277457726e53e913bb298a9b71e50afb2dc52c3963c0ce0d0aac3d33933d259;
    stim[44] = 258'h0961f9812f7cdd20da25d51ee05cdf612865dcdc72b6931ec5167919cc306d95b;
    stim[45] = 258'h10f2fba84ec40e066397d43c95d8c37b692fe8c00baccc3a23ce97a72561a1e5d;
    stim[46] = 258'h036042b0b0e0e604843d646cea26b9e88a997a294f0a99bfae38f58fa63aff7c9;
    stim[47] = 258'h104936cd9f068fedd76db4bdd0925f6ec87ba20c9ff4d67460e047e84f093ddc8;
    stim[48] = 258'h0b6a2e526554d224817e4b1124f6df12cf87cbbc704cd92d26ce2074168dfba6e;
    stim[49] = 258'h1d29d6d829bede57a35ab5c9fac86b9bca29a1c33cd861e2393e82a693fed9a26;
    stim[50] = 258'h065f9df00906def80ae9e510354531b5e4bb149a007024d15ad0d6c1790942652;
    stim[51] = 258'h2941c32c93044f92b572edb40d8080a6d82c4086c6903a344811c491e62f1626a;
    stim[52] = 258'h17f19de5ca67a8ce3f64704b60044cb4fb272ad3d83f2e9abbda089b1f874f3bb;
    stim[53] = 258'h1d0d67f1778092cd801a028795bebed0c977c74f3dd8f3d1858f9024734d92534;
    stim[54] = 258'h15edea8588ec4f6e59fcae84cf14fed62c07a077b0a97d22d9d5d3c02f994370c;
    stim[55] = 258'h2b7fec4f9cd7057a773d90e1e9a55e68e1c5f8b7e01e0aa27aae1ba940c3ac6c8;
    stim[56] = 258'h0d7ca01a4c4c65b675f172f29c899ab054c3981cf355f32f0d22fdf75235e9665;
    stim[57] = 258'h1a23a1b7bdcd66bc1eee4953ae9fb20b62b7d431845a4df29f772a088ec610211;
    stim[58] = 258'h0880e77771c9a2e77eff4207c72b34a37587d6bf0e9cf828c1a24a41e96a0ac9d;
    stim[59] = 258'h156d7fb4dd6ac519df4045d3a8e1a0d6edbe289f210e1069ec39f178cc6d92545;
    stim[60] = 258'h1474a6ef7b455ce3f233ea4340ac81dbcc8c536fbc290e6661168ca424b0b2e9e;
    stim[61] = 258'h05de6c7c9cf536cf60ed0037f597144175da8c9380b985f531c943c0419e76a46;
    stim[62] = 258'h14f50871aac8111f7ce8e3b805da50ae094a95c49274db8fc0730cc845bc4e03d;
    stim[63] = 258'h045c44c70864f68de68c03bae77fb3c15ec0a41c2851003d839e74329dfcf2858;
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
      expv[0] = 253'h0d3c29886efa9d7a92e069e2c7123f6da77c6d613dae590c08aa867bab6f90cf;
      expv[1] = 253'h15947f74720adde226f536928da01b0eaaba3b2b3109b32c06b6c900c2107d16;
      expv[2] = 253'h100656afd3b7e7a95f6aa84a66f0598b4bd14b5f1cc5d86a8812a49b921c1653;
      expv[3] = 253'h0ceeefff21ff42443f0b05141c1220593fd87e3cbc005d0a6675c3bbe8877ca9;
      expv[4] = 253'h18dd7367bb76cc063f3367790ad288637cb2fadda7cea93d106478403fd37eb8;
      expv[5] = 253'h09879f14e550a2289ff8c7425f7cce4c0f65be097262bc73796f0c791de4bf0e;
      expv[6] = 253'h0776166dfb4d998132e8c19692eb05b4a7ff6dd0a4fbe1bdbe0a3ad5e78415ef;
      expv[7] = 253'h01fd4e9715e925a0a1c3d9b7474a93b68233aefb2a0984d10d58b601fa3a2247;
      expv[8] = 253'h01b1d843560d1bc49a207da5c4165d714a72feba3d1d50fef86e6ea4a4a1163b;
      expv[9] = 253'h0c10b6b249e98c76f4668fabcf3de01282dc6c97c9c7f341b77839f9844dc723;
      expv[10] = 253'h077d91370543a0e5de6c344a748711b1711a560a5a524010174ac7195f073c89;
      expv[11] = 253'h012492dc14892458a9fbf6c43f68d0234301db370d21d82de4cb45b48d0d4aa5;
      expv[12] = 253'h1016ac5732333ba9786f9a777918b44a3195a66c0e5540d7283fce2bd9ba7d81;
      expv[13] = 253'h12128a4ce61f345930e964f0d38b3f58d62cfd8353c6ccfddd3e90ceee34ec77;
      expv[14] = 253'h1f041e4d443acd71a440ebc8c2b5c5f3e956176598ba14de570ec0141bee0d16;
      expv[15] = 253'h1005767fb70fb3c9bf7ee33a9eb95011690acb3c9f618489465caae4a2df85b9;
      expv[16] = 253'h1480edd43897e4dd2789e42f90a3601a45e868dd574267043ffb0ada05c6ad4b;
      expv[17] = 253'h1364890e90dab8c736d927d709161d2b324157d98befeb6573376ce4fcdd606c;
      expv[18] = 253'h19af6526fc3536d91ff54407c8ea24212d88061384a38797e039b86a2075b531;
      expv[19] = 253'h00dff0280ac3ece510278bc95c8d5807ef48de302f6bbb651d972850d67ac338;
      expv[20] = 253'h1a3cdf47c061df4b7067c96a2501c57d6e12a17393fe17cdd253a96bcec38b3d;
      expv[21] = 253'h0a8a090e95035276d835e73bfe00df42d6bcbc7997f13a70332e73ecbcbd22e1;
      expv[22] = 253'h14d1fe251d61c18a96de8e88df8a413cf354de79cf715ddeb50a303b2f09d3c3;
      expv[23] = 253'h0cb4b1edd7a1da884f1696152b8aa41409adb5be328a503741438d98cb87c90a;
      expv[24] = 253'h04c81233e482f67e6e19fae31b56c861049bb7b3b7368ee2ee40b3fc6de69f1d;
      expv[25] = 253'h1c7f6d7b66b482608cd0da863184f1118303ab8fe3574635a5a743479618efef;
      expv[26] = 253'h1b70e4d1cac8666a73b782623ffed0b1a9e1e6d2d73b192622b1149b78d1bbc4;
      expv[27] = 253'h0025e376b70d52fc91fb241ea2027805f9fc3d0cf59db94edd3b1ce0c1734e89;
      expv[28] = 253'h0007dc12030a9cf9f1e1d474455c31fbc8c4bcd6c77264cb928cb01a097790da;
      expv[29] = 253'h10201ca79441bff1fd0034da508a43a80dc08287ff27c97705c5c4fe1fecf196;
      expv[30] = 253'h0ae540ee830d4027f1b30fb670a36d6f8141980055b378cb0c464aed84e4ac00;
      expv[31] = 253'h045850abb41c0f544525604fc7ede0cd941bd87394d33287756a3f545ab6a55d;
      expv[32] = 253'h0cefdd27216a596013692505bf548cd6c6e471733e57e69a1f6ae00baea2a244;
      expv[33] = 253'h00b7ac573a5a8dd6a4c2ab8ce95b3c6cb8fdff55c2265c18850a8a497b6e5871;
      expv[34] = 253'h1573a46844c25c81a7e69d7800f5845f39017cab48fb14c85022ed59510b4026;
      expv[35] = 253'h16089b0a4c38417331a32ca35052be34003ee565227165fe3cb00a7681eef12d;
      expv[36] = 253'h0180645433770041e399f8c317b258c5fc628ff6a826d5b80a2870bc20571e8f;
      expv[37] = 253'h093d5aad47818f6db87322ac2f4b817610f6cceea4d568faf27651fc43c342a6;
      expv[38] = 253'h05a89818d60729465499e3dd7c33c88a899a953e5208ca04de3f8d6e8fac2383;
      expv[39] = 253'h01dcf9b021b6982d784e4f743efe116fc15347fa6f0b612f9c648420d120181e;
      expv[40] = 253'h1d7514196a91c297b70cce4561da701ed06247bfbaa7f172080209096d11aeff;
      expv[41] = 253'h1ba631d48f195a734d84dddb1a56f792492cf579de17d341bbf8e029dd5a9a71;
      expv[42] = 253'h0bf41447b4a53a453e53994aabf977b838527ff71e809fd518a30bf5f411ee8b;
      expv[43] = 253'h196e2961cb1e0670685561e99c99e92cfc9dd15dc9b94fa44eeca62a7c7942be;
      expv[44] = 253'h032ee6e395b498f628b3c8ce61836cada587e604bdf374836897547b9737d84a;
      expv[45] = 253'h097f46005d6661d11e74bd392b0d0f2ec3cbeea13b1038198e5f50f25630deda;
      expv[46] = 253'h14cbd14a7854cdfd71c7ac7d31d7fbe48d810ac2c383981210f591b3a9ae7a22;
      expv[47] = 253'h03dd1064ffa6b3a307023f427849eee44124db367c1a3fb75db6d2f74497dbb2;
      expv[48] = 253'h1c3e5de38266c969367103a0b46fdd372da8b9499553489205f92c449db7c4b3;
      expv[49] = 253'h114d0e19e6c30f11c9f415349ff6cd1374a75b60a6fb795e8d6ad727f21ae6f2;
      expv[50] = 253'h05d8a4d00381268ad686b60bc84a1329197e77c0241b7be02ba79440d14c6d79;
      expv[51] = 253'h016204363481d1a2408e248f3178b13525070cb24c113e4ad5cbb6d0202029b6;
      expv[52] = 253'h1939569ec1f974d5ded044d8fc3a79dddfc67797299ea338fd91c12d81132d3e;
      expv[53] = 253'h0bbe3a79eec79e8c2c7c81239a6c929a74359fc5de024b3600680a1e4fafb432;
      expv[54] = 253'h003d03bd854be916ceae9e017cca1b8657b7aa1623b13db967f2ba13253fb58b;
      expv[55] = 253'h0e2fc5bf00f05513d570dd4a061d63642dffb13e735c15e9dcf64387a9579a38;
      expv[56] = 253'h061cc0e79aaf99786917efba91af4b32b5f28069313196d9d7c5cbca6266ac15;
      expv[57] = 253'h15bea18c22d26f94fbb9504476308108e88e86def7359af07bb9254ea7ec82d8;
      expv[58] = 253'h0c3eb5f874e7c1460d12520f4b50564ea2039dddc7268b9dfbfd081f0acd28dd;
      expv[59] = 253'h0df144f90870834f61cf8bc6636c92a2d5b5fed375ab14677d01174eb86835bb;
      expv[60] = 253'h04629b7de148733308b465212585974f51d29bbded15738fc8cfa90d0b2076f3;
      expv[61] = 253'h0ed4649c05cc2fa98e4a1e020cf3b5231779b1f273d4db3d83b400dfc5c5105d;
      expv[62] = 253'h0a54ae2493a6dc7e039866422de2701ed3d421c6ab20447df3a38ee016942b82;
      expv[63] = 253'h160520e1428801ec1cf3a194efe7942c1171131c2193da379a300eeb9fecf057;
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
