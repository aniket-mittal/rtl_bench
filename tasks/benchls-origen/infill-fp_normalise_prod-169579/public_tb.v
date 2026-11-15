// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 135;
  localparam OW = 135;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_169579 dut (
    .clock(clk),
    .cout_Multiply(in_vec[134:103]),
    .zout_Multiply(in_vec[102:71]),
    .sout_Multiply(in_vec[70:39]),
    .productout_Multiply(in_vec[38:7]),
    .modeout_Multiply(in_vec[6:5]),
    .operationout_Multiply(in_vec[4:3]),
    .NatLogFlagout_Multiply(in_vec[2:2]),
    .InsTag_Multiply(in_vec[1:1]),
    .idle_Multiply(in_vec[0:0]),
    .idle_NormaliseProd(out_vec[134:134]),
    .cout_NormaliseProd(out_vec[133:102]),
    .zout_NormaliseProd(out_vec[101:70]),
    .sout_NormaliseProd(out_vec[69:38]),
    .productout_NormaliseProd(out_vec[37:6]),
    .modeout_NormaliseProd(out_vec[5:4]),
    .operationout_NormaliseProd(out_vec[3:2]),
    .NatLogFlagout_NormaliseProd(out_vec[1:1]),
    .InsTag_NormaliseProd(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 135'h535b8ba62b3b8e29d8f11e24862fde521a;
    stim[1] = 135'h3c28c51a9d17e3a451633b467673d86c35;
    stim[2] = 135'h7872477c343d0eb7c80133d22cf4cd1097;
    stim[3] = 135'h371739620005007078d62c846f948295d9;
    stim[4] = 135'h4b2825e75ff9416b01ba7a75ee48e59765;
    stim[5] = 135'h0dc766d6ca825601d516dddd837f20e728;
    stim[6] = 135'h414253a6b707feb41de9d6d749686fbcf4;
    stim[7] = 135'h45122c61b1efa6b0fa3ce22e4aa3f81d02;
    stim[8] = 135'h3316a85c658757cc962c6466871fa24eac;
    stim[9] = 135'h7d733beac84d31b841e45725b609c45c41;
    stim[10] = 135'h115daff4a7538a9147f01c543b4d2a885b;
    stim[11] = 135'h63c8ab5d77dda48188cee67d0bb204f435;
    stim[12] = 135'h0dea4bb106597813c9c49b7e0adf2705ed;
    stim[13] = 135'h55b0b9e6e4cc298d1122a21cfddb91b62c;
    stim[14] = 135'h55cbf027cfdb01c039bbfa49e1a6c0a0b4;
    stim[15] = 135'h711ab5a0f3a364f439dd849a986117424a;
    stim[16] = 135'h470b761cd1cbbea793d621532a978fdef5;
    stim[17] = 135'h67cf5db9fd345b632ace4febca6766b480;
    stim[18] = 135'h762944fb1731d1edbfaf0c0346c8b03e6b;
    stim[19] = 135'h2e1c7f5538252651881e3ca497ebaf4c0d;
    stim[20] = 135'h3200b6af0c72815d3984dab98776aec5a2;
    stim[21] = 135'h0f4dd8ec2e01d81547871e4a076e731b24;
    stim[22] = 135'h57dd1d30e491dba6a459aeb574a569c7eb;
    stim[23] = 135'h38babd257fb184707eb4fd43515422ed67;
    stim[24] = 135'h524d7f944f9b32d794ae1ec634eca96cb0;
    stim[25] = 135'h56b81441abfde2c34f895a1d09ab7193ed;
    stim[26] = 135'h62f459a266c013067a80aa664c66101e7f;
    stim[27] = 135'h5d3ab4be78b878144bc5bfe244decf7801;
    stim[28] = 135'h52a7c5f544c96144de3567691acf713cdf;
    stim[29] = 135'h65bfaefe5847e7dd5c24d44fcd932bbf10;
    stim[30] = 135'h097fe5dad3b7cc249d2824b4dd904900bf;
    stim[31] = 135'h440bc51506332410847b046bf9f20c629f;
    stim[32] = 135'h4c5d3c75251c40b1d56a843c476adfecf6;
    stim[33] = 135'h1ed70128a38e33f7f5d20e3541250bca38;
    stim[34] = 135'h55132af70c1bb52a1144a1cc40f32e2623;
    stim[35] = 135'h22d05aa2f0bb041c2c11686590d9bc41e9;
    stim[36] = 135'h690ba39d4a700ab3c33569716ec09bb730;
    stim[37] = 135'h02619c71d2e0b44f3bb71dcfd5f4f8f29c;
    stim[38] = 135'h1688777fd08bf03ca890fee8e9a0304b2f;
    stim[39] = 135'h7f2d626be70f586b57756d238831f6d37b;
    stim[40] = 135'h6730d026099ee614410ee57625374fca96;
    stim[41] = 135'h5b6fb31470d46e730378800af25e20afe5;
    stim[42] = 135'h3d093d06bf9bf4840807a03a888ffd729b;
    stim[43] = 135'h2305c250d255c9cfc2fb11de4a7976d903;
    stim[44] = 135'h43dc160bebe6dc3219885e72c8e0b92159;
    stim[45] = 135'h6af187fab0d1bac24fba2da70578886785;
    stim[46] = 135'h18d23d48168de532118b75fd59a46599f1;
    stim[47] = 135'h31c50f5cd0a0349b8f6750b2a3ffd0995c;
    stim[48] = 135'h2c6c608041953ea2f1b0292bcf999a0b21;
    stim[49] = 135'h52244a5b4262e5c215c382c0fb46dbbea0;
    stim[50] = 135'h7bfd50261358447240fc8d05cec671211b;
    stim[51] = 135'h2407d43648b357a60b7e078b2e76ca6319;
    stim[52] = 135'h7fd06cf85c29e10dc0bc5e7222dd612b3e;
    stim[53] = 135'h1ec42f2d32c3d2d56d5ec524511ef3afd4;
    stim[54] = 135'h327c63e78b6a856b389a5d3766acb96764;
    stim[55] = 135'h3cf00eae62ac35a061f6190d6e5b70820d;
    stim[56] = 135'h439fc763bda746660ecf7f056db16d6612;
    stim[57] = 135'h5b79c5d9e6ad6881393ecf6754dcfe7acb;
    stim[58] = 135'h291199796b821119fef103da7a84fd9b12;
    stim[59] = 135'h303292b87269e059d8fb088a86c13ea2ed;
    stim[60] = 135'h10c23dad81408bd46b643b23c4a5b73cbd;
    stim[61] = 135'h5e3f7b415087b9665a5893c5d66459eb49;
    stim[62] = 135'h18c1e8a66d924cbfa102b7d2e948d590a4;
    stim[63] = 135'h58239713076efad59ba202741f1e90d98a;
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
      expv[0] = 135'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 135'h29adc5d30adee38a6c788f12418bf7948d;
      expv[2] = 135'h5e14628d4e8bf1d228b19da33b39ec361a;
      expv[3] = 135'h7c3923be1a1e875be40099e9167a66884b;
      expv[4] = 135'h5b8b9cb1000280383c6b164237ca414aec;
      expv[5] = 135'h659412f3affca0b580dd3d3af72472cbb2;
      expv[6] = 135'h06e3b36b42b095806a8b6eeec0dfc839d4;
      expv[7] = 135'h20a129d34dd1ffad0ef4eb6b925a1bef3a;
      expv[8] = 135'h22891630cc8be9ac3d1e711712a8fe0741;
      expv[9] = 135'h198b542e0971d5f30b16323341c7e89396;
      expv[10] = 135'h7eb99df5642698dc20f22b92db04e22e20;
      expv[11] = 135'h48aed7fa53a9c548a3f80e2a1da695442d;
      expv[12] = 135'h71e455aebbeed240c467733e85d9027a1a;
      expv[13] = 135'h46f525d8832cbc09e4e24dbf056f9382f6;
      expv[14] = 135'h2ad85cf349430a634891510e5f76e46d96;
      expv[15] = 135'h2ae5f813c406c0701cddfd24d869b0281a;
      expv[16] = 135'h388d5ad04cf8d93d1ceec24d461845d0a5;
      expv[17] = 135'h6385bb0e68e5df53c9eb10a9954bc7ef7a;
      expv[18] = 135'h33e7aedccf5d16d8d56727f5d299d9ad00;
      expv[19] = 135'h7b14a27d8b98e8f6dfd78601a364581f35;
      expv[20] = 135'h570e3faa9c129328c40f1e524bf5d7a606;
      expv[21] = 135'h19005b57832ca0575cc26d5cc1ddabb151;
      expv[22] = 135'h07a6ec760b90760563c38f2501db9cc6d2;
      expv[23] = 135'h6bee8e987248edd3522cd75aba52b4e3f5;
      expv[24] = 135'h5c5d5e92bfd8c2383f5a7ea1a8aa1176b3;
      expv[25] = 135'h2926bfca03f6ccb5ca570f630d3b2a5b18;
      expv[26] = 135'h6b5c0a20d5fef161a7c4ad0e84d5b8c9f6;
      expv[27] = 135'h717a2cd1336009833d4055332633080f3f;
      expv[28] = 135'h6e9d5a5f3c5c3c0a25e2dff1226f67bc00;
      expv[29] = 135'h6953e2faa264b0a26f1ab3b48d67b89e6f;
      expv[30] = 135'h32dfd77f0621f9f76e126a27d364caefc8;
      expv[31] = 135'h44bff2ed69dbe6124e94125a6ec824805f;
      expv[32] = 135'h6205e28a83199208423d8235fcf906314f;
      expv[33] = 135'h262e9e3a8957102c6ab5421e11dab7fb3b;
      expv[34] = 135'h0f6b809448f38cfdfae9071a904942f29c;
      expv[35] = 135'h6a89957b860dda9508a250e62079971311;
      expv[36] = 135'h51682d51785d820e1608b432c86cde20f4;
      expv[37] = 135'h3485d1ce82ac02ace19ab4b89bb026edd8;
      expv[38] = 135'h0130ce38c4c82d13dddb8ee7d57d3e3c8e;
      expv[39] = 135'h4b443bbfe845f81e54487f7474d0182597;
      expv[40] = 135'h7f96b135f387ac35abbab691c418fb69bd;
      expv[41] = 135'h339868130277b985208772bb094dd3f28b;
      expv[42] = 135'h6db7d98a386a373981bc4005792f1057f2;
      expv[43] = 135'h5e849e835fcdfa420403d01d4447feb94d;
      expv[44] = 135'h5182e128692ae4e7e17d88ef253cbb6c81;
      expv[45] = 135'h61ee0b05f5f36e190cc42f3964705c90ac;
      expv[46] = 135'h7578c3fd5868dd6127dd16d382bc4433c2;
      expv[47] = 135'h4c691ea40b46f29908c5bafeacd232ccf8;
      expv[48] = 135'h18e287ae44380d26c7b3a85948fff4266e;
      expv[49] = 135'h5636304020ca9f5178d81495e7cccd0590;
      expv[50] = 135'h2912252d80a8b9708ae1c1605ed1b6ef90;
      expv[51] = 135'h7dfea81309ac2239207e4682e76338908d;
      expv[52] = 135'h5203ea1b2459abd305bf03c5973b65318c;
      expv[53] = 135'h3fe8367c071a7843605e2f3908b7584adf;
      expv[54] = 135'h0f6217968cc0f4b576af62921447bcebea;
      expv[55] = 135'h193e31f3c2eaa15adc4d2e9b99ab2e59f2;
      expv[56] = 135'h5e78075731561ad030fb0c86b72db84106;
      expv[57] = 135'h21cfe3b1cf79d1998767bf829b6c5b5989;
      expv[58] = 135'h6dbce2ecf356b4409c9f67b3aa6e7f3d65;
      expv[59] = 135'h1488ccbc8af084467f7881ed1ea13f66c9;
      expv[60] = 135'h5819495c3934f02cec7d844543609f5176;
      expv[61] = 135'h48611ed6c0a045ea35b21d91e252db9e5e;
      expv[62] = 135'h6f1fbda0a843dcb32d2c49e2eb322cf5a4;
      expv[63] = 135'h0c60f4530b74932fd0815be95a52356412;
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
