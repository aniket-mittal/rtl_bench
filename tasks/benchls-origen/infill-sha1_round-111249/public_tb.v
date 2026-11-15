// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 200;
  localparam OW = 160;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_111249 dut (
    .a(in_vec[199:168]),
    .b(in_vec[167:136]),
    .c(in_vec[135:104]),
    .d(in_vec[103:72]),
    .e(in_vec[71:40]),
    .w(in_vec[39:8]),
    .t(in_vec[7:0]),
    .hash(out_vec[159:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 200'h4b1a0faae298a66c94d1189a2f4906fb0e24c6525354df6c89;
    stim[1] = 200'h26d678bf203dcd74e460681f3a1d0d1043bbef4c79ced43423;
    stim[2] = 200'h611d2764e9cbed0142d9c422a8894169f6ff4cf1164251298d;
    stim[3] = 200'hc268800de2add2753cc710433bf41f6a3ad55322f364891d34;
    stim[4] = 200'h35e001e1972f9e11f9e8528c75885c8c36ec9eb5aa922bb274;
    stim[5] = 200'hd2f42f6f08ca038b3172b364d53c9b3fa14429139c697d5064;
    stim[6] = 200'h63ef7c7ba34c3e50a05ef5faa148a45d92cababd287e0c7533;
    stim[7] = 200'h0fb16a3229efc178c414ba5f626592a2faec95f41f8896bc4b;
    stim[8] = 200'h1cd7348ddcdecfb0c449889393c6f2be60c6a0247053a12a60;
    stim[9] = 200'h89e5480173d96a1a1777be68fb62dbd1b903d811562d584b86;
    stim[10] = 200'h852407d82267ddc135ecaba3254e61a3327112e9a898ac2833;
    stim[11] = 200'hba0901a53e728df649bd56e3a20ac4ba15f9118fa3a5854795;
    stim[12] = 200'h12cfe86e668c7b62e38b1b08f719ec42b3871983b7fd2bbd7d;
    stim[13] = 200'hff71319bf37f5c17d81a738b6dba7b3f754498502c5a33ac7b;
    stim[14] = 200'h35bae97e6d9cc920edf32fe662083bc343f27d4c8923980646;
    stim[15] = 200'h8e693bd7f84e1000e571d1d555cca8d29c5ccf2b6328a39843;
    stim[16] = 200'he97e8100db407735df9e214ec7f192d8205520ce96d4c4986f;
    stim[17] = 200'h6ff9fc44243ff936307001dc5594f7867a98ffd266cbef8ed6;
    stim[18] = 200'h87738c4fe4b9f82a0d51ac87d4734c18536d8a43af3f160570;
    stim[19] = 200'h5e3ec1ee8c0cc1121f04a4feaafd3e02391572f04b91e5262b;
    stim[20] = 200'h2917fba54b0e117251392cf4275869079f9c3ce44d53d2d95e;
    stim[21] = 200'heaadac131904cfd7d0176d0912cfc76a4ca9fd87e314b85803;
    stim[22] = 200'h04b3b759635d1293a97d893d2a2a88b0d998e79e5b6f2a4d73;
    stim[23] = 200'h1609ac80c443da6f362b95d24ebc738d2240500cfbda489b1b;
    stim[24] = 200'h519f8ef541b8828a4c7aa0fb9cf85a6da77f63c52b70117731;
    stim[25] = 200'hc88bec90e03c73c71a8c6a8826178fbbe558b4e04f7ecb466f;
    stim[26] = 200'hdb035b0e12e11dee8304600b50c994f7b11f86d5823cb257ec;
    stim[27] = 200'hdc7689c59da03666493fb94952c042ccd3ad77e56874dee313;
    stim[28] = 200'h5bc7518918d275ac2f95a406c086bedaed78268cd81446baf7;
    stim[29] = 200'hb49a2626794d2d472bd5ca4c56b9368cce9c58eb110405b51a;
    stim[30] = 200'h8aa3aee62205d3d9ef2f108f2d480c2fa5701e6d2713cbd6e9;
    stim[31] = 200'h550eea4254ee8d5e589db25d5a43371764371649b6184cf2b1;
    stim[32] = 200'hd4f487a2a44c5279bec1b3e3c0f51b6881cc692279c0c9e7f7;
    stim[33] = 200'h8148a25dc4e25831ef1806010031721a38dabdec5a2c29430c;
    stim[34] = 200'h84c3bb2f6c9ac789c2548852055d173df1c858d1fca9399290;
    stim[35] = 200'hc8229fdc82de1a9558ba2c754d3ddbc972f6c524feb8da2a27;
    stim[36] = 200'h4d26e5b05b5a9e7085b061d2790fe0ae652ef01ce8e1cae524;
    stim[37] = 200'h54918d33ce207b8dad6c144d79eae6a06402a9b23f578fe40d;
    stim[38] = 200'hda49803080aa2e85979cc1d05b3034c3e035769f763e14c473;
    stim[39] = 200'h9fcc1bba45230e9990cf99b183c3db726224ae29d1fe422046;
    stim[40] = 200'hacb6fac15d165a0949ddbb6dc540d66bd98358a5c8f48f4201;
    stim[41] = 200'h44462549e9803f1714675313fb6cec4474337ddcd29f6f26cb;
    stim[42] = 200'h05c513e6241aed6d0db21f307fde9991204c3db3a75bf9f07c;
    stim[43] = 200'h73246a62f1469842490dbbf10118f775e74cd90c3211a1e5f8;
    stim[44] = 200'ha74a56120f93818b41c01d2ca7e690e12e6a2be2143d577399;
    stim[45] = 200'h41daa25a71577bebd93b761b4fbf9523be340619fd25868bff;
    stim[46] = 200'h81b31f6a8e668e6f4f19dd96c4e0911e909338816ca79b4cee;
    stim[47] = 200'h3ce79465026b9c334816551aaf7ca9b95d2df8f0db9e8cac1f;
    stim[48] = 200'h10756c20c9d81187368be99856bcfab38fbf415cdd1997bbeb;
    stim[49] = 200'h95883191ee0fbe1b4a7caf076cfd1782d57525fdca5fa33da1;
    stim[50] = 200'hae0110c909e23db1abe7805b58c8351307f0bb75c14f053cd5;
    stim[51] = 200'h44cc1b469aa6e3000e9deba2730c710235218fb014206aa469;
    stim[52] = 200'h91ab90996633423b79d0f60823909ac5de8ca9da7f10ba267d;
    stim[53] = 200'h6186b671b60bd1a13245e1a3005090eb4956f7368ae80fdee1;
    stim[54] = 200'h6fd8f21026598908bf666c05a7dcc42a4d5b85c10b49002a12;
    stim[55] = 200'hbe1adebe3875f69812d08dfd5d129e8ae941c00e46347a6952;
    stim[56] = 200'hb7d99053c918edd6c7fc240a76c62a508045baa658a8d52f55;
    stim[57] = 200'hdf1bcb5c95f5bcb0eebd00dd31194ef42d046fc652f43e13da;
    stim[58] = 200'hd97b2add7a8682243aa30db7f03b496c87905b359e730f65b4;
    stim[59] = 200'h61b4367f9d3f3f4f3ae9909085a603d9c33822dfdb7dfa468d;
    stim[60] = 200'h3f4d685bb323e3b2be528ac2fae46d8cdb3532d5a45e02b247;
    stim[61] = 200'h775f2aa155a80e52936cd526ac131ce8d1fa6cd7f21eefe60b;
    stim[62] = 200'hf54a28efb77e611c74d8726fd84c5a84caa89b4597a80c978f;
    stim[63] = 200'hc9b3910c277f00618e7c53975489f26bc73ca0c318aad69484;
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
      expv[0] = 160'he81f14ea4b1a0faa38a6299b94d1189a2f4906fb;
      expv[1] = 160'h05746f8026d678bf080f735de460681f3a1d0d10;
      expv[2] = 160'hfee4b4c6611d27647a72fb4042d9c422a8894169;
      expv[3] = 160'h454aad36c268800d78ab749d3cc710433bf41f6a;
      expv[4] = 160'h8331587435e001e165cbe784f9e8528c75885c8c;
      expv[5] = 160'h531a8203d2f42f6fc23280e23172b364d53c9b3f;
      expv[6] = 160'h69a0c7d263ef7c7b28d30f94a05ef5faa148a45d;
      expv[7] = 160'h6aa41e4c0fb16a320a7bf05ec414ba5f626592a2;
      expv[8] = 160'hc1b54a641cd7348d3737b3ecc449889393c6f2be;
      expv[9] = 160'hb609020689e548019cf65a861777be68fb62dbd1;
      expv[10] = 160'h341560a0852407d84899f77035ecaba3254e61a3;
      expv[11] = 160'h9ae6ad12ba0901a58f9ca37d49bd56e3a20ac4ba;
      expv[12] = 160'h0202a10012cfe86e99a31ed8e38b1b08f719ec42;
      expv[13] = 160'ha10715f4ff71319bfcdfd705d81a738b6dba7b3f;
      expv[14] = 160'h313de3f335bae97e1b673248edf32fe662083bc3;
      expv[15] = 160'he00318918e693bd73e138400e571d1d555cca8d2;
      expv[16] = 160'h748c8bfce97e810076d01dcddf9e214ec7f192d8;
      expv[17] = 160'hece2492f6ff9fc44890ffe4d307001dc5594f786;
      expv[18] = 160'hf91c04c387738c4fb92e7e0a0d51ac87d4734c18;
      expv[19] = 160'h69a7f6cf5e3ec1eea30330441f04a4feaafd3e02;
      expv[20] = 160'h17c19ab92917fba592c3845c51392cf427586907;
      expv[21] = 160'hf2c5ff1eeaadac13c64133f5d0176d0912cfc76a;
      expv[22] = 160'h75ebd1ff04b3b759d8d744a4a97d893d2a2a88b0;
      expv[23] = 160'h0afe507a1609ac80f110f69b362b95d24ebc738d;
      expv[24] = 160'he2f593ad519f8ef5906e20a24c7aa0fb9cf85a6d;
      expv[25] = 160'hed5f6b09c88bec90f80f1cf11a8c6a8826178fbb;
      expv[26] = 160'h1f5745efdb035b0e84b8477b8304600b50c994f7;
      expv[27] = 160'h70d679e4dc7689c5a7680d99493fb94952c042cc;
      expv[28] = 160'h009acfb75bc7518906349d6b2f95a406c086beda;
      expv[29] = 160'he5e0e09eb49a2626de534b512bd5ca4c56b9368c;
      expv[30] = 160'hcbbf58638aa3aee6488174f6ef2f108f2d480c2f;
      expv[31] = 160'hdcbf756f550eea42953ba357589db25d5a433717;
      expv[32] = 160'h3ef9e42bd4f487a26913149ebec1b3e3c0f51b68;
      expv[33] = 160'hdaaece838148a25d7138960cef1806010031721a;
      expv[34] = 160'hfcdf130f84c3bb2f5b26b1e2c2548852055d173d;
      expv[35] = 160'h7c3773b1c8229fdc60b786a558ba2c754d3ddbc9;
      expv[36] = 160'h09ac7bb74d26e5b016d6a79c85b061d2790fe0ae;
      expv[37] = 160'h4df8edc654918d3373881ee3ad6c144d79eae6a0;
      expv[38] = 160'hb60d2eeada498030602a8ba1979cc1d05b3034c3;
      expv[39] = 160'h4e3875cc9fcc1bba5148c3a690cf99b183c3db72;
      expv[40] = 160'h5d2e5820acb6fac15745968249ddbb6dc540d66b;
      expv[41] = 160'ha085d84044462549fa600fc514675313fb6cec44;
      expv[42] = 160'ha123e20505c513e64906bb5b0db21f307fde9991;
      expv[43] = 160'h01a25ddb73246a62bc51a610490dbbf10118f775;
      expv[44] = 160'he00a13c5a74a5612c3e4e06241c01d2ca7e690e1;
      expv[45] = 160'ha8e4329541daa25adc55defad93b761b4fbf9523;
      expv[46] = 160'h03a145da81b31f6ae399a39b4f19dd96c4e0911e;
      expv[47] = 160'h299a5e743ce79465c09ae70c4816551aaf7ca9b9;
      expv[48] = 160'hefd8219b10756c20f2760461368be99856bcfab3;
      expv[49] = 160'he3cbc3e095883191fb83ef864a7caf076cfd1782;
      expv[50] = 160'h4e9224b5ae0110c942788f6cabe7805b58c83513;
      expv[51] = 160'h945f9e9244cc1b4626a9b8c00e9deba2730c7102;
      expv[52] = 160'h99e567fe91ab9099d98cd08e79d0f60823909ac5;
      expv[53] = 160'h539737ff6186b6716d82f4683245e1a3005090eb;
      expv[54] = 160'h56098db36fd8f21009966242bf666c05a7dcc42a;
      expv[55] = 160'h34ecba13be1adebe0e1d7da612d08dfd5d129e8a;
      expv[56] = 160'h16a63fadb7d99053b2463b75c7fc240a76c62a50;
      expv[57] = 160'h7826cde3df1bcb5c257d6f2ceebd00dd31194ef4;
      expv[58] = 160'hcfea4f2ad97b2add1ea1a0893aa30db7f03b496c;
      expv[59] = 160'hc2105aed61b4367fe74fcfd33ae9909085a603d9;
      expv[60] = 160'h2b3807c03f4d685bacc8f8ecbe528ac2fae46d8c;
      expv[61] = 160'hc3bc3f2e775f2aa1956a0394936cd526ac131ce8;
      expv[62] = 160'hf1e2d1a7f54a28ef2ddf984774d8726fd84c5a84;
      expv[63] = 160'hde46fc63c9b3910c49dfc0188e7c53975489f26b;
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
