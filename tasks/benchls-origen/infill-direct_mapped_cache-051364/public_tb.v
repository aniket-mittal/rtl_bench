// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 545;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_051364 dut (
    .clk(clk),
    .address(in_vec[544:513]),
    .read(in_vec[512:512]),
    .dataIn(in_vec[511:0]),
    .hit(out_vec[32:32]),
    .dataOut(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 545'h130f6c5fc11bdcb4a8d019fecd6c009ff04d0f2e51f93887ffc7550bc92dfd4db289351a6a8b9c290910770359b102289ad636e6d18757d8c91860fcc1c38fc1241642a19;
    stim[1] = 545'h084f482573a3f5ec2ced6ef9c7a254e941ca2cc70b18683e0c2418cd1fdd35cc380566e9df784ca8b27fdb9ea7a2b4e908e453b388c21b6bd527c627387e69a7a6cf2ec94;
    stim[2] = 545'h0775c1498d787a3f0e7c005e9ddd31ba655676c54f0e0f1816fdb2608909618794b56088338d11860fd22beba9f65906fe4257adae31acb2428b2e8c8afe254bf85e57a31;
    stim[3] = 545'h0b460531ddecc5f731c71080645b023a763781dfd36279b260e4980e9bc58cac3413664dc58e87bf931a5e830d09ce193b7ef8545f7374af9e7254ef1adc78c6212f68db0;
    stim[4] = 545'h1147daba817870f239fecb682f32283fd68d93f2c412933e78cb7a710990e57bb84259e5fb9f334cfa9c23a353ac8ddadc9a6a0d38df56f1f042426bf31cc33d76f567960;
    stim[5] = 545'h19fe5a48ff15401ac183fd28b7777ab9a95a01c260ee2957c1707e1603d73e080b527b7884bb9c8a2b3d61b51a0c3105b1c0d7ca6a1dc1232cef04a2cf6ede1a99d6ab4dd;
    stim[6] = 545'h031dee0ff5b61195428a11b72f3bbeda79a5db2934687c929e43cc8adffcdf26e1a2a588b157c2eacaa06dccfbd1b9dbce8f7d3e2dbb21accdcab4b54f55c916610ffb2dd;
    stim[7] = 545'h179be4e203ac3d3200b7af80f10f76fa4216a587a26f5bb091cc200839cf4acecccca89461565821a6d966bee4dc9d0ecaa6650383e122c506a997fa2e5cf9d32b7d1f8f1;
    stim[8] = 545'h045e507a90fda3fbabc536676990d331738166345369068f275758c74dc453e00601a91088f6898acfc87b407c3731ff0c0ac31d0c05e0b9f904286629426066568ac51c7;
    stim[9] = 545'h1db14d3ddcffbfbfdf210efe0271a5287a1abb7a067f508d365e12483cdb12d9af5aa1e81b952bccfd6c6045002d11a94ba4097440ce756bc24dae97a9d642dd3c193f95d;
    stim[10] = 545'h0155e3532a07f2930d55f8bb650a0728e93d88bb4948ca5441562ea6b05e898c3e311cf1678877dde3f72ff30516789f50d063bb469971d24c14bb34d9fbe14b91adfe657;
    stim[11] = 545'h18a9ae9c0c97f3b6f438f98f8ad1b6ff0961c91020ae01db8c41b1297d7506e7eebd12df4228cf14d7b161baad69a9e9a28d6c8eddcc30a2e96273dc2cad0b78d088e0009;
    stim[12] = 545'h0dd8f9747441cfba1a7f79f852936605668de9c28d5abc587c3c6cab15be77fe25ba4df0f01e5dd66154a28e8ba47fd5b41e415199da294a7a8bbf4a79b724e6c5d152b22;
    stim[13] = 545'h03b5b12314b6580f512058e7333f8fa4241c15f9c0a12e27ab03c5e5821c770e75b1bf89ac29edf795ae029e8f9f8ffce89aa1bad56082b7fb994ad991e81454e4796054a;
    stim[14] = 545'h0909ca6e9ac6dd79096431149d6550e2c1e1197a0748985adf4cecef9f3010b9ff5109e06bdf6b6981729f0f13462ed14ec209d192877d3a3a0d4b5a7af8ced0e1f1636fc;
    stim[15] = 545'h060b43e201a480382f55f560ab56ea745efd41e5f3069a40a454875e0094818f79b9ec3192895a0c1b9554dbd9202dae7b1ad6551a924eb377cc95f4e7f844fd85e438f2f;
    stim[16] = 545'h12d30979f3bdb49f0181c75f461c0694f0c10b8e6e6266335a037d33222d96999f01653551572eaba9c1b39c74f9b90ef98a27236825c5d186ec87869c7a1ac0f7acadc98;
    stim[17] = 545'h1b1879482964d4486e4002ff9f0cfe5573e5ea099ad5dcb2c259bdb5e420e8060931ee6de4c50de596043f16ec7e27df6e61bee8656ea7996acb5bd8f09c91fccca6bced9;
    stim[18] = 545'h15732f5d07ab6e82697015db00dc0224fd871e6e14981a20dcca68cf95b53370e804982fed6041dff998d3783d0f3af4a4432b989c481fae7e90e71becdb45f760f941bc4;
    stim[19] = 545'h069efe3f061e5dbd280c16f1c882f8215066982de310a4dbe6d92a77f9376738284e3ec3d28c1dfaffd606c5e79946410c7feeaf00faff73b8adbb25c55686ba8c007badf;
    stim[20] = 545'h04f1ec22913bcef85311ab145db354c73d268326471a03a98f1ec72a610d32e0ad0a8de332bd978a2a078e5a8bec1b9213494529b702c34675b2c5a00636184b8857b9470;
    stim[21] = 545'h166849132ded622f8f6d579efee7abf8382f35ca00265e41476d1c3e6adab56e75f013899a3d8f6508211713c4259953c44436eb52d45e107ab8b6f23eee6c88ce23b8941;
    stim[22] = 545'h184eddbef19f58abd37ca4cb18eaed65955f505098f5cc19587bc0ecb8dfd34c7a0432cc8636c80e49e673284e8afcaef9ad189e3c804684850c1e4f91ee70e0abd2502f7;
    stim[23] = 545'h052566bb83c44613f428fc28baee94a740dc72213c6dc9d42c02173156bf67231689c20c819c55d27192e9cb766e80dc574daca5c5b710df8b63474ea1e2052a12d16991c;
    stim[24] = 545'h03677089146c0b15dfdc488620a2cd565329944bff101385678af4fce58ca21badbb31847d43219f74078ae383b14ac7b5c72105757e8b0717173d7107bc4a5395ded83cd;
    stim[25] = 545'h0595c5c88622a7cad8b1b788601742b8b984a3f3e9b6a0eff8fcabfc6a1d8cb35f3e1f8ee7a1815f9cf0a6bbfb6515cd926a11b91935f4f53be79a27250616d873d4f5eff;
    stim[26] = 545'h1d73c07336f6bcd9df5ee7e8d32a2b03e19bed0366abcf6399348580d91c4f3c7458bcff8ad6b44ead649ec1d0fdfb94fae233c21b74f3931c5b0291b0bda91ba268f7dde;
    stim[27] = 545'h0084ec51a90d4080bf777e2766a405540ce388335cb6eca79347ca926631a90c5a03f6397a847dcd80c33048944ce3b52bbf0a192f91819bea9644221985c5f7effcb54aa;
    stim[28] = 545'h117dcd67a07ff98e9048ae72eddea41f23a795dc380cf3582997cc460555246dc7fcbbcd672643222ff9a071c2e59f355699d28e338fed59f22568ff1f22dba64d2544e46;
    stim[29] = 545'h13dea51ef6ece79572e89a10493d78fb0dc4eb3ab27fa939db653ae6b13ad78de87ae26d3197e3580eb1576e75f3a8375c2af16a1373b7dc3debb7a5a0f6029ed3b2aeefd;
    stim[30] = 545'h193cfe8cca99cac675bf6033c4d935fa14fadfa8ff98509f2c8592bc03be36d6943ea5ba006392838100df4836ab614e3745650103598a932144938beeee6d61963e04e70;
    stim[31] = 545'h109cc54e5cbd5ffa231e5bd90b8712f4def86dce07ea971de94b6f4571222fc957568d41efbb60b76a95171404fbe2aed489be82e3713eb85cce31d0d0603c3a476524712;
    stim[32] = 545'h1740e73decafbc94d1fe8b59d3458d95c5d42c9a1507af18ef86030b2a265d989563f5ecc6c5ac17e8cd741a9c0025b2e278834cdabfe1dd3f444f4acd940333421f7eb63;
    stim[33] = 545'h18106bc9fd35e10b255a728118f56dd55e97cd1548666495ce2c4576f66cea37a6cf5151321a342b93a1c653c3208b820e35b3c3db51e58050dd9c82730c49348f5ce0480;
    stim[34] = 545'h1a0a1c70f6ced7bb6f8089dc39d365e5b5453f1608f9d03794e108f7ed2eb73a0dbf26f4a1f86ab2b460ea07e9e8261f7e1d11dfdbdf189b3cbf7d5382c76e337960b0744;
    stim[35] = 545'h1a5424486f2d26fca2f6c976509235959371945ee62ef9936b42d52ea42349fc865081b506d51ad418d0a2c1e9d1ecfd2c8cc863543b4c059f8b41dea17e8cc63f97f7fbf;
    stim[36] = 545'h0105375f0011cf225fa324f3fdd34613ab5610dba340d6411abbe80e6530d9dd6034522d01ed146813d69369347b7d46a1802683c4cac6b1f937d6541c782d902567f6dfc;
    stim[37] = 545'h137f6643608163caad759a8c8b7ff578f3976c08b3f18aee5fa52bc67946b8a3d56288f6628ad523d99ac8625c93e72d9796f30d19122439b2b91e30b22d73eb52ec86c2a;
    stim[38] = 545'h0030b477fa6bb8e937befb4a84040a375c7980131720e81ade2f981e1e2fadbe425f9bc707765849474cc3f4099ae5516d4b8df9c779a3caf717e0dffdac6ccafe516541b;
    stim[39] = 545'h063bd7501a15286e1c372ee0fcdadd692a554bab52b20bcdacca3b320e49db3f73c5a6cb002247783648c976f2e01de9db70119c0eb397c06c37076df9d69a6a2727cf2b6;
    stim[40] = 545'h07dc4a8ca6a318927603208f5264bf800ec2212f6ddf3ae5ee8873de1b89718884b587c54847ee0bf4202b5b3d8341ed8868ea363b067723031bbd3ca9ab1655d6f37c46b;
    stim[41] = 545'h03f2f9f258b2631d36010d9aa11eeba0d6e3fd3dac2e35b4d7a6b4cfb2ade7d6770e3b6a17d962544270832e71ce94a2ca406f0f47eb5388a9ba3d6eee35c94b35eb4702f;
    stim[42] = 545'h1992647a02a641ba1029a0c7f721bb9dac27c9589fa9534dbeaa8ca3ee63ce22438b6334878aadda4641a43cff0f44ddc7f9571dc6241013f37d16069f06c7b19eeb4bb13;
    stim[43] = 545'h0e3199977ce3b3525384ed69967a883b0f35c0e7fe635ebd78e30ad420d15d501fefab698ae05c2716e1888e9ddab6de75498459e86d398b699407040af93b0f070ea35b7;
    stim[44] = 545'h137a935cecd3bda1208321389e11c55b5715a55197910352ae5544079050143fe1555d98a74dc9c6cd27e682ec7816984c38d4ac90420124f6f855107fa55bee4984c8b4c;
    stim[45] = 545'h16f7a68bc6db44aea27b8a7a30d1874f22490b88175492d3423667790efce6eccea1d282377c568a6a8fe31ef63ccc1236dd2525e61a8d8d0809fd1abf96c2f3870ec2a6c;
    stim[46] = 545'h092fad655c0b49a5d84e18fd025a7d4e182f60586bcdaaa035c020c775850f847456ffda67596c0d0a5a18d7a3f73bfd5b41c0a427c6da54d039b2a339182348757ae5a4d;
    stim[47] = 545'h17ad3e0d103652cb502080741e2f4f2cde95ebe708e5561e26ab889d31609e89086a01df683c8914652637c43b0c9ae89e6d9f81e2941fb8a6e49598c9c6b63df848cd3ef;
    stim[48] = 545'h12fcd83691eb1cb9191c70853d9de88e95c5585c189fffb896de92a9401cfe1f27dd65954be304acb89da2f39974d664458b40f16c5e1973bb0a7efeee2a50ddc29d9be0c;
    stim[49] = 545'h1555096c5a87839c03dcd559f607f99873586ea74872e87cc5d79a42049889bcd8a782e798e28095c1d3880a5fe48de62649568f96111bb283547bf621dad244b2ca95fad;
    stim[50] = 545'h123b844254d34d6708bc77cbf0df9a2bafac286d4671cc845e50a053d1ec3ab1acba19f8636e68500b8a714d664ecadb83e027eab069a9d8c13e4afccc7b57137eef48fd9;
    stim[51] = 545'h0ce983c4774bc82af88df5be9beed5f20436da7356c3cee8eb0c4f2cbe48698e7671089b35695dacf9be5c0c3f0c2299682b2bddc89050b41dad70cb8d5f3369334804f57;
    stim[52] = 545'h01a47e3a4438b1269c1eb0f39d0144656632d49f7acefd0cd50fd3d093e77fdc7c7714aa36e56d27adf716797c190b5837fea65154fd276e0de52edf59feed458b2b8990b;
    stim[53] = 545'h11745340d988d26d804793d18d51635b6e619435221689f3705e2b860d37f138a99bace4046337404d9febab2a19821ef829d8dbabe4a03baf2caee728e65a56d10ac197d;
    stim[54] = 545'h1ec58e1ce06b02dca61cbd9a2ebaab49bd8f6a70fad77edbdb420ef29a33444cb371b628006632ea0191c6dbea9bda7d10f5ce095005428b90fa82a556da6e37be63479ea;
    stim[55] = 545'h0aa1efdc78b0284ea520e4d2a6635bd3d374d821df4369da760198470edade9d76857f35177e52f6150ee21b8603583e4a8eeda74cb69f060b29a6f9208cc6e1ad1cc8e9e;
    stim[56] = 545'h13bbfaf5ec30d3dcb7f2811e9ee624c1391c06c18bfa979ea81751a8a53159ee2dfc94abff3ef87954528ec5ebabaa708c189c477b8265b6e4deceff0b76c4711d63d4fe5;
    stim[57] = 545'h09990aefb86d88ee039130a6ca7c68d0e79e3988650448a636f86500e5cdff4cdf744f7a439174fa1f91880843a3207b007599e50b416dff2a3c38d924ac87801ae8a1e6f;
    stim[58] = 545'h193cbb8ade7fd6ddfc2464d8b57998b95b5e5c5337c0db77e6ab41dd56cae57d438c56121104f4b4a2905bc922f24a714d0284f564aec7c75b101a950b7afeeb19370a9a0;
    stim[59] = 545'h188765123cc0a82bf60dae86767f9315f4c24aec3a882193ab2a204ebb5784c525a4a209d0777907c346f17ad4fb4b69a8217223b0bece83e198593f64cc3b511b5f62f3c;
    stim[60] = 545'h199c0f0cbba05f42e55be01dd1920f474e476c187d084d26c4f52aa30f9714e679426c7ffe080578afea640fbd7f0f44de0ec92573cf2df5b2085e45283b22e709093edef;
    stim[61] = 545'h04756ded183064f2a103e1dd660e38237881e909a33d2b9df31d03cec7b8d7aa021e51ea790dd546e9d58e203f4b925df74ee9706f23a26cf3e68e84059dd9b9b69bc71b9;
    stim[62] = 545'h16c4468832d62177816f8490dc7f1553222e292d557a08825c08275d8d05fb258f9553614b3a4d110d0ee3302cfd6807d46cc362cd97bfb7c7bf7f3937bc1d3db3604193a;
    stim[63] = 545'h14d24e30d692d14beb586486ede25d67e71cbf28e4d67d9bc8c9413c6157cd58af824723f163329c47eaca52bccfb57b4f840fc4323d16854c7cad49cb67acd2b42ba838a;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'h18d019fec;
      expv[2] = 33'h0xxxxxxxx;
      expv[3] = 33'h155676c54;
      expv[4] = 33'h0xxxxxxxx;
      expv[5] = 33'h1c9a6a0d3;
      expv[6] = 33'h0xxxxxxxx;
      expv[7] = 33'h0xxxxxxxx;
      expv[8] = 33'h1b7d1f8f1;
      expv[9] = 33'h0xxxxxxxx;
      expv[10] = 33'h0xxxxxxxx;
      expv[11] = 33'h105e898c3;
      expv[12] = 33'h1088e0009;
      expv[13] = 33'h0xxxxxxxx;
      expv[14] = 33'h0xxxxxxxx;
      expv[15] = 33'h0xxxxxxxx;
      expv[16] = 33'h15e438f2f;
      expv[17] = 33'h0xxxxxxxx;
      expv[18] = 33'h109c91fcc;
      expv[19] = 33'h1804982fe;
      expv[20] = 33'h184e3ec3d;
      expv[21] = 33'h0xxxxxxxx;
      expv[22] = 33'h1adab56e7;
      expv[23] = 33'h0xxxxxxxx;
      expv[24] = 33'h10dc72213;
      expv[25] = 33'h0xxxxxxxx;
      expv[26] = 33'h126a11b91;
      expv[27] = 33'h0xxxxxxxx;
      expv[28] = 33'h16a405540;
      expv[29] = 33'h1ddea41f2;
      expv[30] = 33'h0xxxxxxxx;
      expv[31] = 33'h1100df483;
      expv[32] = 33'h0xxxxxxxx;
      expv[33] = 33'h1cafbc94d;
      expv[34] = 33'h0622a7cad;
      expv[35] = 33'h0xxxxxxxx;
      expv[36] = 33'h143b4c059;
      expv[37] = 33'h1034522d0;
      expv[38] = 33'h13f18aee5;
      expv[39] = 33'h0xxxxxxxx;
      expv[40] = 33'h0xxxxxxxx;
      expv[41] = 33'h1d8341ed8;
      expv[42] = 33'h0xxxxxxxx;
      expv[43] = 33'h1eeb4bb13;
      expv[44] = 33'h0xxxxxxxx;
      expv[45] = 33'h174dc9c6c;
      expv[46] = 33'h127b8a7a3;
      expv[47] = 33'h0xxxxxxxx;
      expv[48] = 33'h0xxxxxxxx;
      expv[49] = 33'h0xxxxxxxx;
      expv[50] = 33'h0xxxxxxxx;
      expv[51] = 33'h02b91e30b;
      expv[52] = 33'h0xxxxxxxx;
      expv[53] = 33'h1de52edf5;
      expv[54] = 33'h0xxxxxxxx;
      expv[55] = 33'h106632ea0;
      expv[56] = 33'h0xxxxxxxx;
      expv[57] = 33'h1c30d3dcb;
      expv[58] = 33'h0xxxxxxxx;
      expv[59] = 33'h0xxxxxxxx;
      expv[60] = 33'h0eee6c88c;
      expv[61] = 33'h0xxxxxxxx;
      expv[62] = 33'h0xxxxxxxx;
      expv[63] = 33'h0xxxxxxxx;
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
