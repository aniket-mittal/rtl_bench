// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 300;
  localparam OW = 73;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_004434 dut (
    .HADDRx0(in_vec[299:268]),
    .HWRITEx0(in_vec[267:267]),
    .HTRANSx0(in_vec[266:265]),
    .HSIZEx0(in_vec[264:262]),
    .HBURSTx0(in_vec[261:259]),
    .HWDATAx0(in_vec[258:227]),
    .HADDRx1(in_vec[226:195]),
    .HWRITEx1(in_vec[194:194]),
    .HTRANSx1(in_vec[193:192]),
    .HSIZEx1(in_vec[191:189]),
    .HBURSTx1(in_vec[188:186]),
    .HWDATAx1(in_vec[185:154]),
    .HADDRx2(in_vec[153:122]),
    .HWRITEx2(in_vec[121:121]),
    .HTRANSx2(in_vec[120:119]),
    .HSIZEx2(in_vec[118:116]),
    .HBURSTx2(in_vec[115:113]),
    .HWDATAx2(in_vec[112:81]),
    .HADDRx3(in_vec[80:49]),
    .HWRITEx3(in_vec[48:48]),
    .HTRANSx3(in_vec[47:46]),
    .HSIZEx3(in_vec[45:43]),
    .HBURSTx3(in_vec[42:40]),
    .HWDATAx3(in_vec[39:8]),
    .HMASTER(in_vec[7:4]),
    .HMASTERD(in_vec[3:0]),
    .HADDR(out_vec[72:41]),
    .HWRITE(out_vec[40:40]),
    .HTRANS(out_vec[39:38]),
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
    stim[0] = 300'h63aa79e41342e7a41e726a4769d5844647dad1638744bd93be63211957ae5f2957a9a7c4697;
    stim[1] = 300'hcbac47fabd1fd3f9621244074d99a08341c5f01d3f26b9d99987449bd6b01c44c228ef77ba6;
    stim[2] = 300'hee40f20620c2010757229889fa0f50d6f2a1ed74309e6e561eea07fcebfab40853e05b8791b;
    stim[3] = 300'he29629eebcd553cc9ecdb51fad777e6301bfde9e16186d5e0f5ecaa78e82586088457d0db3c;
    stim[4] = 300'h47a7c0d56f2ff391174fd6a7a0948ee63859c6b45165f71ed6a5c480e07138e6d589228183b;
    stim[5] = 300'hf0e7edd38620f2fbf43400877c1819b399ec74ed7d6e05ae31e2a8d0d963e73cf34fed8379b;
    stim[6] = 300'hb479bf82bbe2df94cd6785ed861b50896b8668113e96c29d29dac2c52415deb07fa8d1b8d1b;
    stim[7] = 300'h443ef1f529b229d80551bf969c81c12f07ef20cdc8468f53986cb9d7d7cf261414b9fa3a999;
    stim[8] = 300'h9f4a6b3996f186aaa02311a78420c1aab29fca3f48b4c2d50b518c1b19690c0ee4f33b0a098;
    stim[9] = 300'h16181b77ea9974c1451a01b6bf0ac5064164e2a55ea267c38ed88ae8eda3b46738769217cc7;
    stim[10] = 300'h3b564eea81eb37e368071e1f46e0d6f9c4993c47fde20f40f38ce8042e96d31eb23cdfd314e;
    stim[11] = 300'hef965c9b0bf9d9d372474b14fb8af74ecd5a70a7ea2f0419b5cc38f225876407e5bb18e29cc;
    stim[12] = 300'h5b13dfeb8c7d43558633b4a92f08e56964a36b762be85087097f7d8c0f450a8a2e52a30e128;
    stim[13] = 300'h3dd7522069b1712a69fc9e22a29d93971446b36dbcb578ee463573b651a101cfb13f2791c26;
    stim[14] = 300'h564d1d78a2a30c070f0fa10b50e2e2ab9c671c76a8ca33fa50a86b4197dc0e37729c2f894b9;
    stim[15] = 300'h284d7f9fa4a2d7a3d838dc567677f2a3d2772fc470d200f0fca484aeba37fd164f21215edfc;
    stim[16] = 300'h32b3e4a854d81d9d32853d92f4b83288b7aa44174f94b77a154b3548915f42e054b526851a2;
    stim[17] = 300'h000d8336ba19a841ae7f5d177375582dc587b7ed165d3f27d6a4ce69108c8a4d7fbee329f85;
    stim[18] = 300'he6cbd9f44fe51be3cac324bf6b091a3eb5775bb7b1176299316ad1a66adfef6584e67e31a5f;
    stim[19] = 300'h969c477ed7f234fb4fcecb040ad3ce397803987eed7867ae1ec5183cf78793acafd81cb4bee;
    stim[20] = 300'h36792d6a20cbe0458e34462766b07c967ec0ad35e484de124159d97215fb209f98dcbe6a56b;
    stim[21] = 300'he05ac54f8920f441906d9897d3f43d477abef64dbb36a107d73fed1b3ab1d746957ba0a561a;
    stim[22] = 300'he1e38e406a5e8fd5d1106bb3ede5b228cf801a61f4b705d1e50271132147086bb5765203e96;
    stim[23] = 300'h73046d8d12754190d1fbf4ac3779cca16d5f03ce1da0e959af626fae79eff85c24d3cd6dd3f;
    stim[24] = 300'h295bcccfc474117a7bc2c19a4556d66023a10e52ef46d131fddcbba5ac85b53b92598012dca;
    stim[25] = 300'he47a9f2dbbd89aacca245ece7c971d38e463bd5022bab8722c35143d687ad905b6c59a4b344;
    stim[26] = 300'h561206191229438116eee3532f71e134253237e97a0671a8120a4916f1071e247fad739cd86;
    stim[27] = 300'h87118f5dd1fe272cb86f2ba5914acae004ae1e27b7f0e11ab49226df557decc6e65ff142d14;
    stim[28] = 300'h662f90cfce53a78c4cb0cf48135d432533c1baa4eb860c6ca238f69b0dc38083201d9dd4dae;
    stim[29] = 300'h03b3490f2b70ba72270cc1d614084f31ecaf595b6e440dd5bcd3be547be7c5e4e8220d5dd20;
    stim[30] = 300'haae412d875be3c0037148f1e38ec8f4406d9ea75d3d23302063a2b595607960b40cd9718663;
    stim[31] = 300'hf5201d4b632ae4935e29a721b681c8dd30fdd893a99d9a59bf787c7ce26000aaa2065d4a282;
    stim[32] = 300'hf76349152757c5e8f7b0360781bd86054742e48cb1b9b82af5d344df61d3b5d95c6440a9e92;
    stim[33] = 300'h92dcdebad5394f8128ac909b4efaa1e89dd1cff4d833df374cb33a0e9121eae3e24d8ee0d19;
    stim[34] = 300'h593d28593892419ae973345246b811a2273510b0f4e69ba273d84170acfa0df9f23fe27e529;
    stim[35] = 300'h9bd10fce85365f801fb06281146fb44e72642736e868252dd3cd380081d926b62e7db6ec7c4;
    stim[36] = 300'hddc1fb1d29c14b786528ba988f4216a55162d401b2c939c1431fb06ea0e9853a8820926c1e2;
    stim[37] = 300'hd5618cc92928e0144010af870aef682bb6e87e52e23368ed7e49d91ce7cedea12a6a30690bf;
    stim[38] = 300'h822e43019d88286853ed432d357bca7745a012d8ca0613cb882da29dec3fffe0751f6bb4ae0;
    stim[39] = 300'h35423655bd39e66a2367cd6827f9964ef3c50274cbc488f3548019fd6905a62c27935aea502;
    stim[40] = 300'he5a48fb06608d72a7acd3faafb98f16e5c613862ee2e9f73f5e15386a99d9df66494ef1a413;
    stim[41] = 300'h18b2c25d3a4277cdfaf845e36f6c585f575dea0f2bc3c1fb3a3bb96cfe3c1a174f501201ab5;
    stim[42] = 300'hb91bda994448f65af1278e6e3edf40acf4394201df27f3df254fc63206f410f007002f5e6d2;
    stim[43] = 300'h046eeaf0a14b08bc2fc2247e94cfc657591b9359b2528ac732b083295d68bab1bb3c0a55107;
    stim[44] = 300'h608f19b79aae31ab98627692021179a199e124b47363a4ef7441d7c54660dc4006f35d5045f;
    stim[45] = 300'hb815131d33cae20710c9fb5acc6f79f735574308faff41608981331ecfa611c74f4d3bac61b;
    stim[46] = 300'hd195ed51e4d22a425a571327220fcb3d5e1402e0b9af25761038af97431c2a1dee4a704e01d;
    stim[47] = 300'h5a06afaa8dc45d67922576baa84f29d8dcd439374a65e6b629ad76a2865193bec4a38323263;
    stim[48] = 300'hb2ea3e7f94443a942381237fc2cc41956fe4941bd22ab29bc2ce6dd90bdb8dfcbe3ccabd65f;
    stim[49] = 300'h034e59c14ceec122a9e18dc603fbb82c3bb375666118a1d5ae4aae8328a024f56a47c357b72;
    stim[50] = 300'h150e5c7322d917446e05cdd6fc83498958d76b345b87f14eaefcaea44b1911b28d4f34e5fda;
    stim[51] = 300'h8a2cc977099eede139c881dbcc918ed991ba1a6653c959f7bb79540b9d6388c9a7225eb008a;
    stim[52] = 300'hfe79927cf67b8dc9daf4343e67bbf5a8143437369596ed10917fa6b83894a023c3bf2324561;
    stim[53] = 300'h41fea40b93d016e8ae28415404c243bd7bcdb1ef7ce399d0a298afce71224c014d0b6fdfb9a;
    stim[54] = 300'he39b546821e8b4e51a50e6243202d386f05258e0260df088568509c3f47a8ce3b29a7168c22;
    stim[55] = 300'he0498f8e8a8b6053d98a5e2ce720a26f2ae2eced389fbe3d928739627afb3a27f2cd6fc5c6d;
    stim[56] = 300'h13bf6539c4ce3856bcedd6f31125d2b4fca42bb8a179d4a11542d4435ce1201c0178edb413b;
    stim[57] = 300'hacebb0fe1dd56d7996dbfbb2ec472079b0056fd46c22e483150b8f8190e9ee78e0eb159b561;
    stim[58] = 300'hd1f6519f17d5a6b2eaeaea023699b850d0dea72dd62fa21c0e00bd97b2046b48dd1a900669f;
    stim[59] = 300'h38c660aff13b9d12702d4617c286fa3a073aafc8b2c41fce91c082b10e96dca8ec2701dadc0;
    stim[60] = 300'hfd09e583d47a39c51f58f0dfd6f1e012cb6f10ffda13618897c2bfd4dfc2ce918effd3a752e;
    stim[61] = 300'he9317ef09716951667aeaeed4739a30cef6e977401e048aa8fc1bdc519666865464b3be8768;
    stim[62] = 300'hd96d33f10ccac98a74fbd15dcf8b2bc7575b01b28563912435e5ce73a60857e892e05214577;
    stim[63] = 300'h5bb25b352cb4ead19b546a39233eea224da7a87ad804b5b1b65ce3093c3360a36724123daef;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 73'h1c9a91da75611191f6b;
      expv[1] = 73'h049101d3666820d0717;
      expv[2] = 73'h08a6227e83d435bca87;
      expv[3] = 73'h078e8258608f98c06ff;
      expv[4] = 73'h00e07138e6d3b98e167;
      expv[5] = 73'h0d0021df06066ce67b1;
      expv[6] = 73'h19e17b6186d4225ae19;
      expv[7] = 73'h146fe5a720704bc1fbc;
      expv[8] = 73'h08c469e108306aaca7f;
      expv[9] = 73'h06806dafc2b14190593;
      expv[10] = 73'h01c787d1b835be71264;
      expv[11] = 73'h11d2c53ee2bdd3b3569;
      expv[12] = 73'h15bb15f428495a5928d;
      expv[13] = 73'h19b6de5abc74e5c511a;
      expv[14] = 73'h03e842d438b8aae719c;
      expv[15] = 73'h0e37159d9dfca8f49dc;
      expv[16] = 73'h014f64bd2e0d0aa59aa;
      expv[17] = 73'h1fd745dcdd560b7161e;
      expv[18] = 73'h10c92fdac2468fad5dd;
      expv[19] = 73'h13b2c102b4f38e5e00e;
      expv[20] = 73'h0d1189d9ac1f259fb02;
      expv[21] = 73'h1b6625f4fd0f51deafb;
      expv[22] = 73'h041aecfb796c8a33e00;
      expv[23] = 73'h0e79eff85c23285b57c;
      expv[24] = 73'h10b0669155b59808e84;
      expv[25] = 73'h0917b39f25c74e3918e;
      expv[26] = 73'h1bb8d4cbdc784d094c8;
      expv[27] = 73'h1bcae96452b2b8012b8;
      expv[28] = 73'h0c33d204d750c94cf06;
      expv[29] = 73'h0cadb72206ee174e44e;
      expv[30] = 73'h0523c78e3b20cd97186;
      expv[31] = 73'h0a69c86da07cdfbc3e3;
      expv[32] = 73'h0c0d81e06f657ae9a26;
      expv[33] = 73'h0b2426d3bea87a27747;
      expv[34] = 73'h08587a734dd46889cd4;
      expv[35] = 73'h0c18a0451bed139c990;
      expv[36] = 73'h0a2ea623d080a18fd83;
      expv[37] = 73'h042be1c2bbda0aedba1;
      expv[38] = 73'h1b50cb4d5ef1050d0a7;
      expv[39] = 73'h06a846cab7a9aa400cf;
      expv[40] = 73'h134feabee63494ef1a4;
      expv[41] = 73'h1e1178dbdb1617d5d77;
      expv[42] = 73'h09e39b8fb7df92a7e31;
      expv[43] = 73'h008ddd5e142195d646e;
      expv[44] = 73'h189da480845e6866784;
      expv[45] = 73'h127ed6b31bde7dcd55d;
      expv[46] = 73'h15c4c9c883f2cf57850;
      expv[47] = 73'h095daeaa13c4a383232;
      expv[48] = 73'h0048dff0b310655bf92;
      expv[49] = 73'h18637180feead725574;
      expv[50] = 73'h017375bf20d2625635d;
      expv[51] = 73'h122076f32463b6646e8;
      expv[52] = 73'h1d0d0f99eefd6a050d0;
      expv[53] = 73'h0a1055013090ef5ef36;
      expv[54] = 73'h0c701306f8442b4284e;
      expv[55] = 73'h02978b39c8289bcab8b;
      expv[56] = 73'h035ce1201c04ad3f290;
      expv[57] = 73'h16feecbb11c81e6c015;
      expv[58] = 73'h1aba808da66e143437a;
      expv[59] = 73'h0b5185f0a1b773a24e0;
      expv[60] = 73'h087fed09b0c804b2dbc;
      expv[61] = 73'h0babbb51ce68c33bdba;
      expv[62] = 73'h1ef45773e2caf1d5d6c;
      expv[63] = 73'h151a8e48cfba889369e;
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
