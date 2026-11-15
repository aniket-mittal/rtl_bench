// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 403;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_035170 dut (
    .clkA(clk),
    .clkB(in_vec[402:402]),
    .weA(in_vec[401:401]),
    .addrA(in_vec[400:394]),
    .addrB(in_vec[393:384]),
    .dinA(in_vec[383:0]),
    .doutB(out_vec[47:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 403'h1345f317a0510c2127e14faee198718708512dff99a4ec92344f718e1e260152fe52ffe28aeb0592e1fb34a03e6d390260121;
    stim[1] = 403'h15cc1c08d0889c5cd1ea624e6960b538b17eee7e9935d795b12c4e66bf4783cb950a94f23785321a4f2d69194a311cd92de08;
    stim[2] = 403'h4c1da734b9636c4cb5ca5176a711c31a68a872bf31823922fb0b7040a822c35025c9ef50052b0dca16a4cf3ea6729630daf01;
    stim[3] = 403'h0974aaa1d574e8434fe0446ea31bcbfbf698e22e0c1c3a22b67d2d7081aee2108664a711a50a80721beef5dfc4e5d5a5b92f6;
    stim[4] = 403'h24b1e12331a5fca74a061b90a5e92a4b129d448ab59fd0880275745ee1f23b0d228ed7f1f2bb4b571883c254311a3bb400ffe;
    stim[5] = 403'h6a1f065c2e592f00a2599c860262986abfce529d3ee694a83406b694e1f26af196b091a1e2de52ddcf16d4dc9425e6f94dc60;
    stim[6] = 403'h4106fbab98377ee16fbb606746aec782ed27056c7a682a9a53df37ca0c1bdd310718e1ec1793682882db0fa140f44b2a86040;
    stim[7] = 403'h4daac5fc70bdc19fbc11f8ab0ed9051c9b077802f7f8a56d4b6fbd4927e33e0ef676e6b1a33ef05468fb32b6b7f091846d263;
    stim[8] = 403'h5b40b88b984e15c374152a3846d578c68fe75de1bb75bbf4d60e30fedde7d0b4e33f75f281e72dab1736456af664f3f46e10d;
    stim[9] = 403'h7678a75cc432040891720e586a151d0575ab6fe2ee825c598b91d6657705f7800c266a873506b020028900882a7d3b1d33088;
    stim[10] = 403'h5fd0b433a469e902d363b4a5e1323c52808479cbd16c88e4f808513eaac81699e493e4d4afbe46241e891a069bb4d4c148f3e;
    stim[11] = 403'h0e403eb2b8d316cb44ec262df26e1ce105126b03234e13c6f0055ab6e4a2d20fa92db41fbb76654a04b72bdd8515d4c3bdc3d;
    stim[12] = 403'h1d22ad0244bceec87a72c3d84a6f200be467fa1b09cc96f5c5021ee9d65aa66f94194dba89cd5175c3834a764aea0bef90230;
    stim[13] = 403'h37434cd5d21daf270ad1ccf9fbf2f95a3520e557ebc5bb84f9337f3d84038c2976673e040d945637fb2be2a5822324301c64a;
    stim[14] = 403'h410426209d3c5bf80004964f1407eaac95ccacfb6b5a22040d5403afa57bf062c7f06159a46c21ddb1f88fc3db8b6fde08492;
    stim[15] = 403'h7cad598296b55b7bbbca5b86ec78c5d5b3972440e5262bd3fb56dbdf858da2c46bd53b9d736de9ccda92705bba84e443a06c2;
    stim[16] = 403'h33b1630a85b0e548642bfeae9ef2e609443bd0d6be88c736a8cf94ea6dbb289073a7403b8dfcfa73ee2f5de75e87ebeffdfa0;
    stim[17] = 403'h0f2c622e1152b6a7a104b60ff6bb5bffaf20fe09d96ae49d7b4da2327903981809aba70cd9d22046973f0e63fdbc4228ec531;
    stim[18] = 403'h45e7250e77d0853a0ef2fee5c965bbf729bc7958401469f5717e36c7c5bed9c7bc7e871f03fa0a6f8c2f1ecc89368f1d11a04;
    stim[19] = 403'h6a958cdc15816040a912c178a52eeac08e0e4a0ea9e16d233792cfac8a91100b30c5c58b0407314d3d806b99ee2ff2dd89bc5;
    stim[20] = 403'h3484fe6252172ca61366328f1ee9a513429e54eeb5d3d0eaedf2f5d20fae2ba1a91e6b20e23229b6c1f78d0ab069706119d31;
    stim[21] = 403'h6145983fc1c70998403024f5057734c700c4253224000a7cfa52e6b1e8a7dcc98dc5addaac3360817a5f3f016aeda79393c45;
    stim[22] = 403'h33c9087f39662fe4d1cdfbb88639cced42b233ba71ce2da1185de3d9d44574fbfab1c1ffff50659619f458f419931bc4e675a;
    stim[23] = 403'h394159a7c835f5e9f7e786c932fe9947ce4352653dd1b9aa2d47b1c2e941d9f4ac807bdf13a2fd80531b3aa21a40da980979e;
    stim[24] = 403'h53c0369808b0ab26814c949680f5503d6fc75a3ffa5edf435f15b96483c900a937a8403af0bce072f7856a27dfebb16c98ffe;
    stim[25] = 403'h24b4043ff93658e00e5b484c32ca222c7cc12b8f1a81cfbfed09786f0980eb29d954abda5212d4667c5dd919989be88b492da;
    stim[26] = 403'h7322fff204d72fff0afba75d9545ba2c71732590d5cc3277f284dc1903ad65b46e0b3dc354ec2626a4696b75ea2ee5f309209;
    stim[27] = 403'h48bbd4dde20d7208c88612bffaa212408a74ed8fec2813072cef6a69a27e71426008fb32e78115f14d7c09ffea325d14828fd;
    stim[28] = 403'h6912b6d4583286f69aff3d620c34bf42eadfc54e0f7d85a48ff6c60a1d8f6af22a86207da25a02c883fca74e184a4d1ad5480;
    stim[29] = 403'h75b219396f8d11f66462d3cfedced3a44e22e33155b6baa8cec7979a7e3e059d11bfb89e2bdc17f5006a31e500f6d292020c4;
    stim[30] = 403'h42600ef694138327f3c1c2f65169bbae8735573fbf342f9d2942760dec80735eb45291e0bbf0a1eba7a94cd60584d90ec9631;
    stim[31] = 403'h3df7b3cbdea9a0dff3b21f74c5022ac2ac3b9b77c6c776ec27f0feebbff6d645182e8cb8d702102a699d780a84a45217e2c80;
    stim[32] = 403'h51b96ef4a608677c0ee1ceefaab8d7305aff3094bf7e29d1dae20e762df059996231b114b14225f173fc3ddf2cb756cedd6f3;
    stim[33] = 403'h6c21c923613f745d19dcbdd967ebfd98537a4ae5d4c8b3a11df14d5aafea40a29dc1cf85ba4ee171777f6975488d73dc7d13f;
    stim[34] = 403'h0bb7bb55551deecac61dfd4daa945c506a3d1dac4fc8a44cb7af55e5a796410c7ff780a193924b206b8243bb9f9520dad9fa4;
    stim[35] = 403'h5cb4be77a2b12142eac9f3876d1b4c95ce9a8a3a6d4ab0fc7f78d7ab5d1b828cc982eddb57682bd612b79eb96dbf68a543263;
    stim[36] = 403'h165f69ca49156ff8965db39909ea0e5b52d5deb84ab90c9bc8c6d2cb59c824f82eba939ea6a2ee9b758ae198289b9ff9b6a94;
    stim[37] = 403'h031594a8caac1966ed465c5d08d14eb4b3ece5516d0f534b27353f184e7d3c804bfb631ad050db9efa42e1d5bf26550c3a158;
    stim[38] = 403'h30abec092464fc9c8f2e24baeee1a634fa2ae7d176452979ca6df2fff731f73a5e78edca4d212d804aff6126b8ab0276402fe;
    stim[39] = 403'h588c097c12d4dda8fe5a45d59fa767b9d2c82b55b41f507d86023e903589ba44ab7af93927d214e5f9ec0b7bfe129e0fef158;
    stim[40] = 403'h33e203f137c746239e6db61befb57a10d21e8d10202a4e28a9dfea1a601e5c73ef5ceda80882f7c00985bfcd012d1b53d4ddd;
    stim[41] = 403'h67009dcc88b59d657e810afe01a19b9ce2bd128bba01695ad385756ae12b0f81ab2cb5cbb83a730c4a745ec50e23b679f9211;
    stim[42] = 403'h303dc4a8fd32cde43ee9deb70dce663821cf497e2e86b445bf8743b9c1cea0df9113de1acbacdfa81356ce2b0fed8c055244e;
    stim[43] = 403'h630fa9b1665755d7d0e11c1a382cc1d1123ece82a5eb07edfa56ce1da9b332129139f8072c9f58c9982f9fe78c4e960c3fd41;
    stim[44] = 403'h7a02780e76678aa475695c9ae057cd6f2c3d44e5dc4a385474e97300bc89d425a0479cc1130a9574659f94bb2cf1a369ef6ab;
    stim[45] = 403'h46d96c80371b024b91f63f6b2c083f71865b407a0c0e99b1ad15d1897a55f4178c57275ae4b91b47c001f70ef49651f9f7295;
    stim[46] = 403'h6508250afefca8daca4c4b9483cc5e89a232cef43cdec8f790967ba83d3c880749c5f4c82d14bb8aa3ce13feb3c130aa38711;
    stim[47] = 403'h288c447fe462bf9489be9765087a29b927738dce92b920ed34c622aaf9300de76c095397e54ca1aaf2ed6db075a5df40f01e6;
    stim[48] = 403'h13c2cb90e7d7794f321a7c2c7987710a0ff8b66165d5ded58d7ea9ebccbf7c3e7d66992491aa7779889f56db696995c06c25d;
    stim[49] = 403'h74ce767e9006e58afd54146dd60d3bc278dc6e243d74b648299fcb9346b2e4e024f27ba88b6f1551ea7161aec3903b077e9e7;
    stim[50] = 403'h424f9868e57df6bdd0cbbd79ff8d24f150ec15c7d23cec7cf95d80c43b7f4dfd0b5d6e46d385b9e493ccabe9b7cdd0658aad8;
    stim[51] = 403'h7bcd01cc34b26a5e057a2854ab06b2f97151795c79fee7d7c452b4ab915c9bf1e54b2a1e5398431ffcaaf74a60fa85319d18b;
    stim[52] = 403'h45274731179f4250f2f1b08bca9d7d3a2ba6cc9a52b3dc8b8c2977e8011c5057b55dab5556dd03dbb4a5e5a62ba4c037bf690;
    stim[53] = 403'h6294502422a0fbf3cd70f98a5cd21f029a2f04aa5fe614627efe2b3419b2f71df493894440739e0ecd95c3dccd021e6cd84c7;
    stim[54] = 403'h7c53be8d0341da159cddd2a38c2fec54e29d430105617ff980dd05ee2803bdc0548364e61ede2512bd23c856cc30cbaff6001;
    stim[55] = 403'h315957509e81b42f6d817a19cae5dd1dfbca6a976ef5cd15ef5fc5b89dd4798e5bfdb218322cc3493720da7a939c6d95f9b89;
    stim[56] = 403'h3f348e0a9c9bea7f42e67b8c1d778b30be78aef921b1fb47fadf4ae342f9fedb50d6190cb5984ba6ac7dfd55b81c3329ae1d6;
    stim[57] = 403'h0075f5538baee96484cb98ecb6003cf706236e76c5cc33b7e09aca660c895d722d2467c3b3784e550ca8196ea09e18067a6d7;
    stim[58] = 403'h418cb3782ed948bee19fc80a30e794e57bd8cfd1537d9f952baa69df5a585ae01202e85d69508c243b910f9e077dd9df363af;
    stim[59] = 403'h4de457b4f1ed4154381a50dd9bf1916ae7d02d0d097cc0128f033f7a05faab03567061bafa16032930b40d0ab32521b5512fb;
    stim[60] = 403'h3e5fdb163643563def14cda74a31cf5cd3ec19e0bc1ef542c184de6c2f855a42fab76e04f425d9dde72be27f9bf05d9b1d897;
    stim[61] = 403'h0e9ad9898595eb6cd8f54f963646173a32b3507fc0a75dce2112196cb80e20d48531f7d813675d0f2b3866088eefa713d91aa;
    stim[62] = 403'h48ce196071c07083064349d7fff853b5c69a9533e0f036c261bf23a15f73f004481ee223cff79adabc746bda05b7d4e71d7a8;
    stim[63] = 403'h0c240d36d9d20bbe3d116147778615344ebbc2bf4dd531f991dbc8be4b64aa4825a99523bb02dd8b24c07b1e330fe9902ed2b;
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
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'hxxxxxxxxxxxx;
      expv[2] = 48'hxxxxxxxxxxxx;
      expv[3] = 48'hxxxxxxxxxxxx;
      expv[4] = 48'hxxxxxxxxxxxx;
      expv[5] = 48'hxxxxxxxxxxxx;
      expv[6] = 48'hxxxxxxxxxxxx;
      expv[7] = 48'hxxxxxxxxxxxx;
      expv[8] = 48'hxxxxxxxxxxxx;
      expv[9] = 48'hxxxxxxxxxxxx;
      expv[10] = 48'hxxxxxxxxxxxx;
      expv[11] = 48'hxxxxxxxxxxxx;
      expv[12] = 48'hxxxxxxxxxxxx;
      expv[13] = 48'hxxxxxxxxxxxx;
      expv[14] = 48'hxxxxxxxxxxxx;
      expv[15] = 48'hxxxxxxxxxxxx;
      expv[16] = 48'hxxxxxxxxxxxx;
      expv[17] = 48'hxxxxxxxxxxxx;
      expv[18] = 48'hxxxxxxxxxxxx;
      expv[19] = 48'hxxxxxxxxxxxx;
      expv[20] = 48'hxxxxxxxxxxxx;
      expv[21] = 48'h3a7403b8dfcf;
      expv[22] = 48'h3a7403b8dfcf;
      expv[23] = 48'h3a7403b8dfcf;
      expv[24] = 48'hxxxxxxxxxxxx;
      expv[25] = 48'hxxxxxxxxxxxx;
      expv[26] = 48'hxxxxxxxxxxxx;
      expv[27] = 48'hxxxxxxxxxxxx;
      expv[28] = 48'hxxxxxxxxxxxx;
      expv[29] = 48'hxxxxxxxxxxxx;
      expv[30] = 48'hxxxxxxxxxxxx;
      expv[31] = 48'hxxxxxxxxxxxx;
      expv[32] = 48'hxxxxxxxxxxxx;
      expv[33] = 48'hxxxxxxxxxxxx;
      expv[34] = 48'hxxxxxxxxxxxx;
      expv[35] = 48'hbca5b86ec78c;
      expv[36] = 48'hbca5b86ec78c;
      expv[37] = 48'hbca5b86ec78c;
      expv[38] = 48'hbca5b86ec78c;
      expv[39] = 48'hxxxxxxxxxxxx;
      expv[40] = 48'hxxxxxxxxxxxx;
      expv[41] = 48'hxxxxxxxxxxxx;
      expv[42] = 48'hxxxxxxxxxxxx;
      expv[43] = 48'hxxxxxxxxxxxx;
      expv[44] = 48'hxxxxxxxxxxxx;
      expv[45] = 48'hxxxxxxxxxxxx;
      expv[46] = 48'hxxxxxxxxxxxx;
      expv[47] = 48'hxxxxxxxxxxxx;
      expv[48] = 48'hxxxxxxxxxxxx;
      expv[49] = 48'hxxxxxxxxxxxx;
      expv[50] = 48'hxxxxxxxxxxxx;
      expv[51] = 48'hxxxxxxxxxxxx;
      expv[52] = 48'hxxxxxxxxxxxx;
      expv[53] = 48'hxxxxxxxxxxxx;
      expv[54] = 48'hxxxxxxxxxxxx;
      expv[55] = 48'hxxxxxxxxxxxx;
      expv[56] = 48'hxxxxxxxxxxxx;
      expv[57] = 48'hxxxxxxxxxxxx;
      expv[58] = 48'hdcc88b59d657;
      expv[59] = 48'hdcc88b59d657;
      expv[60] = 48'hdcc88b59d657;
      expv[61] = 48'hdcc88b59d657;
      expv[62] = 48'hxxxxxxxxxxxx;
      expv[63] = 48'hxxxxxxxxxxxx;
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
