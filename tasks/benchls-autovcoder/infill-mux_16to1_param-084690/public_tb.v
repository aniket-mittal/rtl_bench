// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 516;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_084690 dut (
    .Input0(in_vec[515:484]),
    .Input1(in_vec[483:452]),
    .Input2(in_vec[451:420]),
    .Input3(in_vec[419:388]),
    .Input4(in_vec[387:356]),
    .Input5(in_vec[355:324]),
    .Input6(in_vec[323:292]),
    .Input7(in_vec[291:260]),
    .Input8(in_vec[259:228]),
    .Input9(in_vec[227:196]),
    .Input10(in_vec[195:164]),
    .Input11(in_vec[163:132]),
    .Input12(in_vec[131:100]),
    .Input13(in_vec[99:68]),
    .Input14(in_vec[67:36]),
    .Input15(in_vec[35:4]),
    .SELECT(in_vec[3:0]),
    .DataOut(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 516'haca1a1eb05831e6e787cc92290ab1c79e21ecca176070161399711858a4ccb5e89a90492da20ef51c822ea15eeb9e8559b52847db27b0348f5a065e55d10d3573;
    stim[1] = 516'h3423ef639ab954300f15be79e4f0412b2ac54132a21911d058d4a7295fd684a93051e502e0519f6a87ba856276d2621d01b59162503322f676d0e051efc57ca7a;
    stim[2] = 516'h92b83fc4edb679c637d3d8b0f8ba0756c0c46da087ebcf308828c8505cc06f09684cbeed41bae321074a28422ac221949d011112fef3e1c114844b466a0ae621d;
    stim[3] = 516'h2ff130208c0bcc9f16760000614f9e8440ad87f37a6222d505ce1649e3d7e82259c60e07c3b9b790f32d3c12f90a60259c3fbc927f44dcb6182441edb9e452b55;
    stim[4] = 516'h6c1ce234bec61d234294c8bbd0a4e8acae0a13af3bff34379c53cb101bf19e5070c966290c88a1f814b14439bd0b973185f922f832b19204e85c7ef89ff1c07ea;
    stim[5] = 516'h9a1174525e2f3b52ab432f25f6a78af25cb66d7e025da8d46d343f354a20d0d7eda87bcfa5daae345c8f0de3d8064e8e714bcd5ece885355193e2bb548599db8b;
    stim[6] = 516'h02087788e34089b0b92c1cf278abdf6c7750bbcec9abd37f6f7291bb54975e5cca8e2809780ad6319c8be7fc38df3d0c0115ff7390f81ee6b8a416952c968c2ef;
    stim[7] = 516'h13e09a4042ed5ffda92723146f149ffc8c119a522801c71fa912c584c09f162403c4e5c63eed5e799362f9d549833fb30a807e03ad9919c7eda7bc94aaafb8bda;
    stim[8] = 516'h146449ba6bd999f76ccd5bb628def89904e39b2dc1439535b8556428c1fd8f620ba621f0afe9c9673ece7b90055e6f8596183d4eeea363cb10af60721be767f25;
    stim[9] = 516'h104785df5dceae2aef81058777e8cdc7ac2c38c2a37cb95dc8739e5a7b4ebfff5a8f3f1f13e572109cf25762f2358dad909537d9f62589a3b7cee71bb8dcedead;
    stim[10] = 516'ha1f6c2979161e429a87141e67da5b808c6aeccde8cd7e36e0d946708137e2a43724b74a3ff20c670f59b9305899382c2fd2c701a7dfa9ff691cc227293f52e957;
    stim[11] = 516'hd42b79fd9d175bf7d4e00a6ac693fdab4a60e3e69f3033d9d77306a26a4018161dbcc6ddc51ee4d815cfe91cde64fa35548a1629de2f167bc0adc53cb96af08fb;
    stim[12] = 516'h70df8003821f236d371cbfd2816b9459056e87e65542408bdb7e6090dc784143a8ddfab6e1407900c7f56c00f5221186be15bd36a416ade88cc57a7ae15812701;
    stim[13] = 516'h80decfa1682cdbba9315c14eb8ca96c18b457875931f09bcb0dda86a909aead0e785efa5eba6b94202e1d82804491a0f2f50a7b06c5cd22107b9766097481ef39;
    stim[14] = 516'h59f0ca184bfa9ef905589800b0cae10411be194d861820185490a2056724b2418c6d2af4797f529a7d13688f276a8914cdfb0a1d9c4402a1f03e8be45f6d07280;
    stim[15] = 516'h7c7a1125d7dd79d0e60a381a80514dc13a0ed607be047b2a690b398db4c04a514811ae5160876aef6994c417f5dcab3b3a667e878265199743b91a4d4903bb6d3;
    stim[16] = 516'h5ee6cd1ea94baa96ae93b8f13a7a1f9888484536336215e0e52f4c47f8e5f5a5ad938eb382f38e32000fff7b4062abd93d989781a3f66d66aecbee50ba50935a6;
    stim[17] = 516'h072e4861f17ff85953856253e645bff4b7bf3d00bb812e131a8d6cbb1630b1f857544b853444f60e11a8c93e8e523d0f6a50b4a83cdacf2c28f31ef413df81533;
    stim[18] = 516'hb9a3b285d3f37b5cff69873bf1fd87e8f1de452bbb72a119a30c78c2b1130d3132dbd1dd52e5871aa65ba553cf466b8f817250b07701331f3f890ff91db384957;
    stim[19] = 516'h1fe87dfeb57a99578ea2f10f7a1b710c9bbfe754c31fa9b50cb20f45923e78a3068f7c2debb26b4f31e0fcdf477a3ad8c0451d7beb0d6d12e2414737e97211c22;
    stim[20] = 516'hf4aeac31091d1b660ca52efb1f6cdee7bdfad03f33e1dfbb2ceb4ca14371e4e83cd4d93e3a6fe36244cfb185c8fd9e728a6c1a67021f2fda03ef1feb82d408531;
    stim[21] = 516'h53d1c2a9da797361d0cea53783c040ac3713e6ec9b6b6ec32d088eac1f2e043d8719699a94e7bd041cad352dda75e664bd5bab4226a4861085b13a68e59b1b1a6;
    stim[22] = 516'h51ebbc685d821592e38b24218feb150cd52f9ea42360c848fcc55b790d627bda978d8839e3789da0de321740ad8b619003dc107c16a5a292050c8e183cc511b7e;
    stim[23] = 516'hdafe3b05dbe0f393a94e18f500dadf96920163e6f12d69747f15d362d9bcba8c3c9bafc3efc7b9437886ff6eb7aa568e4c520cfee458f3d4ae64adad5cbe30f9e;
    stim[24] = 516'h718a55bfe54affd2fc05e7bbe77c3345d0b52f012484d0fcc24f80a951f9fa965873e131d9deab56eb070d778cdf0abc132e86cbd5024e159a4d714c179cfd9b7;
    stim[25] = 516'ha1b638392a1911ea5deb5dbc0594966208360b9a4131c6471c54169d14fdfea48497b5e97bb169759a5e174e39f83b064fe5b850bc2410ccdd9ca3da58f9b93bc;
    stim[26] = 516'hd76042e2e072b774711d2187feb2f5f4e4a56324f0e606de4d9c02c9647682efd3f81bb56cd157d3216cf31ea5fa62bffbfdd7eb92d91f8d0262022ad801f8ed0;
    stim[27] = 516'hb836ce994d6a1f697b8afab38cf5fcc4bafa4544eb048986581aff10ff35d234b128b4a5913e630b5d3aab24251a78c2204647acadf2e947ecf4780a239bc2bfc;
    stim[28] = 516'hec1e38f27ba0c20eb523b9f8bf90503c573d96b9a5abc0ad4a3b3b637ce47b42734e311e2273f054408d4748fb7d182bdda273fc86f8ee5749d4206f6e0fcbee7;
    stim[29] = 516'h368ab724b4bae1861e5557f35db5a31f09bd7fd2d5d5212087f4a812b32abe8bf0c2fe03405a9fc7a19f627c9141e734caa223142190d67f057948bdf4af3d27c;
    stim[30] = 516'hc44146da95954cc68b767496456dd214f8c7d1f5f03b0034b7a49af3e1235457a2059e84e1428b8b71c976c916dedaa5541234740986dfda972073e8e0283179c;
    stim[31] = 516'h68e63a4a8946a3e40ecfb5e1b2bd9d707ea3d9da861d67717bae4ba7bdd339d02534796c0cee9f7975feb301b7afc7c192224ccdc4f43fcbb323257fb1c8e8716;
    stim[32] = 516'h76de40f6df8dbc6d14072a481909d2650646371d20d63f4e6129b586317355d868f26c1857af3106ade5a2212d89342f6594e62cc47dd0598ecbc55dd00ad7ac5;
    stim[33] = 516'h406e743d90867c930a9e7a79b3bccff1933dcda0925591a7ce7fbaa28ab23c569364d941766c5e413b70f1c9c1a97e15707784d679919c4112acb36c1749cdd17;
    stim[34] = 516'h66784e23f690815c26339b96306ccb3201bd35532595fd7b05966fb52a5ffb322ee51515e2fd9772df0803c0a2163aff71d38094298784920b87694e59d91307c;
    stim[35] = 516'hd94304d80d9e15bd6858d2091319a35724c5250ee7ab7f8e066ed5ee5554d7c09734dc0bb319be993265cf09d11665d7476b0b911eeb434f8db06186727310f33;
    stim[36] = 516'h89bb15682a67932aef9fdda199f6735af98fa634335a6c0dcd0f83a8432f8cae417f6ac479b38f71ef67a09a00a855fd2180df8985afab56f31834ca8131d16dd;
    stim[37] = 516'hd7d3b9607a6f24d7c92782bed1fd5fae2808649a7d3f861bc934f7cd6717e867fa711e69e507a05b70f8dc6957ead09b3ee1f604ad64766f59db2dd93cce77136;
    stim[38] = 516'ha60fc8cf3eff44582655c3cb219f04cef14f6220f0427a18b982423aeb6b53029398499267b4ad88df16747818b85059ac7f13029b32b3bce2d3398defed26eaf;
    stim[39] = 516'h970da45f911c4afb8a5772af7637541e8c75299960432e105da4effa6b33929321142b76bef2463c6a2a8b8c79b6192d5999600ff77734e8d00518a80c0c2541f;
    stim[40] = 516'h6946c3c4ad54eaa3e0fd12bf8cdbbfbb79b344ade52b49747b39a39d1da9132ae226536379b31bba645e7e13a56c8a454a8dc67c719f4d5821f62ad90ca87138b;
    stim[41] = 516'he288be2493325b6e654797ee0173f3cf6159c28c18991177089be19072e2270a63eb62b4c820de918ee617065a59b6f34a156c0dff7f5157127e53769ce6d6186;
    stim[42] = 516'h09eb2ab25948d3603015eafedb46c2a39cf24a31e5508f8ad501f3099583c47325343356e755f6b91518f338e9815530b8e3722eb798aabbf6664e89da013b950;
    stim[43] = 516'h83944a3b1967ce195325ef07ee9a3a9c09b002c627ba3bb7002b109261408dd6081b65138d4116137c38c1e9014a8a7d78895f1bde27aa782f2c06dbb8b2c1955;
    stim[44] = 516'h23ddd005c11277bca509eba2753e930e71a5cf956c10b283da43f53bc1a220cdc49919ca60076555cf0e587d1a5d6ef0b87ada92e21b5a692b9a2a10e5b7982ca;
    stim[45] = 516'hd41d823a337c0b1d552cbb38435d38276167ce8bc521b740a5e0485df51e2238f64341fc783a1a6c34a0a0b60024861546ef41d2c7e0ce8f122b37f07999632f1;
    stim[46] = 516'hd85bcef81e05341756850d396d968bf761390306c542268e488657b0e7fcb3d8f26ccc78ed5839af30ae353aebf317728ee376fd547317d2f419be2721944845b;
    stim[47] = 516'h6bf58abd8ee05c74f1adf35f833287d76c763cef9248f55ca0e82c6f0ff5df41b9cd9f29a29c72baf6cdf85e7ae8845645f3ed75b16196d45d4fce381a2f5930e;
    stim[48] = 516'hc4fd32334482ad03fa826943cfd57755684205dfa12a2f38ae41ad14afaa04818df4a160d43be8b51979a9e74b6397a6c10ec80abf7844488b7121dbc9bc3b67d;
    stim[49] = 516'hf060776d2a5a1eb3e10a41fe6993f96faebed47e9c40146a45fde3e0e6edfb3e3820e162341144b026bd320d3165ab80de0dabf026f527dd9cdc1d15d2adf4ad4;
    stim[50] = 516'h44fbb387e202b59269546a4ab4032c19abd8c6d6959b4fde1358c770ee3e28d8990d99ba9fdcecbfdc096f425cf4f95b05a576639ad4ce3c41eb1b9471851623b;
    stim[51] = 516'h2b052939f061f0604239908ffbdfb27a61bf8b6affb765decdb7e31999e913456882d34b79d2532d65416684263eb113a8b81cee174ddd8ee487b7ffbe38d6a9c;
    stim[52] = 516'h1fd491a5541f66eafe05419b6eee472cbbc6951029aea671fc745647ef6d8860c07e38fd7805ea44127620d69be3746b439019152a58eb6a3677b2e46c50dd4f0;
    stim[53] = 516'hb7b0d12a2c7328f2177b8bc0273006ebc722617f37e20132165e5cf8f4c44f834b58a227893744ee37e8a1a587561dbe7ae89523c59067b44a3d8317b885ba40e;
    stim[54] = 516'hcbabf5b1c3b0a309162b6f9d6c2cf4a9c3dca4063827c1c30f87df79f634f3eb7e862b7a6d0d4302f34eb561665c0cb96857e33aca5ccd15f15ade139758a0e1b;
    stim[55] = 516'h6040657ccc9e751cb26f012f20db0b87c4481711c7326ea01cfb2e804e3081581012937b281b63c8c75cbfcfa3bfa2339604998c520b9502f6dbd0e8c8565164a;
    stim[56] = 516'he542687418f8a8779d347f57a74f3ad2e43790c29f0e795854fcb1d447d5261d9f7e2a020a43a6ac527644c8bf09119662b7ece5916453b666925f2f4c81fcca8;
    stim[57] = 516'hd85c8e7c299b690c022dd6bf818d87cfd10026229a74fd46994b0a97a1828d7656781cf68cb855d5cadbaa4d8cdd54def295d57866f3d5d278f3c6b7bfab3a637;
    stim[58] = 516'hcf1fb59ef68f601d4717174d88c936d326a0306aee5f1f6ee08a9d5cabbff3f80a60b5207215b84be7a5a9ed743a4b8fa942a3c5a7a67d7eb54bf7c5d9f16b60b;
    stim[59] = 516'h44c1e041252390a9b97073462a6de39779ae970d842819eae7421cf2c3b4696ffd7514a8cb18d9de56eae6d4f554959f4a164d61f8aa84de7f1c3dbd1a09fe488;
    stim[60] = 516'he8b52d7984e0ff851abfcd53c62e5f7397a1b1e6e12ea248dbb104905919e9228925762ea2073cb8dc7fbe9978a56b00c4c5762476b101cdf19a79b8d55a7e94b;
    stim[61] = 516'hb9b4b5550792e7d034f92564bd8d0591eace461a079f1be38eca61be1f8cf32ab74e51562fb3fb3bd0280342fc7c25472fd18c8f642b77cb12d879a158585fef1;
    stim[62] = 516'h2371e566b02e6d4f993563f4db9dca6c5ca087c58cc8d8337898c8c7b8f4a1f39bc118528043a09002806eb8263b98a00b66eff26a5136f1e75072db9148e1a01;
    stim[63] = 516'h5f4d0414bc77575ec7ccadbfb1cfa9e298af3f86a8792e80113a177dedaf926d289957e0288720478048bb5d3c9ae59d98a41a1fbdc0af066469155f0ad855ca7;
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
      expv[0] = 32'h90ab1c79;
      expv[1] = 32'h87ba8562;
      expv[2] = 32'hfef3e1c1;
      expv[3] = 32'h7a6222d5;
      expv[4] = 32'h14b14439;
      expv[5] = 32'hd8064e8e;
      expv[6] = 32'h2c968c2e;
      expv[7] = 32'h9362f9d5;
      expv[8] = 32'hc1439535;
      expv[9] = 32'hf62589a3;
      expv[10] = 32'h137e2a43;
      expv[11] = 32'hde64fa35;
      expv[12] = 32'h821f236d;
      expv[13] = 32'heba6b942;
      expv[14] = 32'h59f0ca18;
      expv[15] = 32'h80514dc1;
      expv[16] = 32'he52f4c47;
      expv[17] = 32'he645bff4;
      expv[18] = 32'hb1130d31;
      expv[19] = 32'h8ea2f10f;
      expv[20] = 32'h091d1b66;
      expv[21] = 32'h2d088eac;
      expv[22] = 32'h050c8e18;
      expv[23] = 32'hae64adad;
      expv[24] = 32'h51f9fa96;
      expv[25] = 32'h4fe5b850;
      expv[26] = 32'hd76042e2;
      expv[27] = 32'h204647ac;
      expv[28] = 32'h7ce47b42;
      expv[29] = 32'hcaa22314;
      expv[30] = 32'h54123474;
      expv[31] = 32'h7bae4ba7;
      expv[32] = 32'h20d63f4e;
      expv[33] = 32'h8ab23c56;
      expv[34] = 32'h71d38094;
      expv[35] = 32'h1319a357;
      expv[36] = 32'h85afab56;
      expv[37] = 32'hc934f7cd;
      expv[38] = 32'hefed26ea;
      expv[39] = 32'h0c0c2541;
      expv[40] = 32'ha56c8a45;
      expv[41] = 32'h089be190;
      expv[42] = 32'h09eb2ab2;
      expv[43] = 32'h27ba3bb7;
      expv[44] = 32'hcf0e587d;
      expv[45] = 32'h337c0b1d;
      expv[46] = 32'hebf31772;
      expv[47] = 32'h5d4fce38;
      expv[48] = 32'hbf784448;
      expv[49] = 32'haebed47e;
      expv[50] = 32'h5cf4f95b;
      expv[51] = 32'ha8b81cee;
      expv[52] = 32'h1fd491a5;
      expv[53] = 32'h4a3d8317;
      expv[54] = 32'h665c0cb9;
      expv[55] = 32'hc75cbfcf;
      expv[56] = 32'h9f7e2a02;
      expv[57] = 32'ha1828d76;
      expv[58] = 32'h743a4b8f;
      expv[59] = 32'hfd7514a8;
      expv[60] = 32'h78a56b00;
      expv[61] = 32'h0792e7d0;
      expv[62] = 32'hb02e6d4f;
      expv[63] = 32'hedaf926d;
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
