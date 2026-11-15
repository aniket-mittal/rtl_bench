// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 257;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_050265 dut (
    .clk(clk),
    .chars(in_vec[256:0]),
    .lcd_rs(out_vec[6:6]),
    .lcd_rw(out_vec[5:5]),
    .lcd_e(out_vec[4:4]),
    .lcd_4(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 257'h03202a760623daa18a1d4abb7b8c8023f72c869e8f768880b7c01d8d26cce02fb;
    stim[1] = 257'h133752bd324944c41b375c44a1e51abb9a010cc31d3e2ab1f6553b16b2e00c9b8;
    stim[2] = 257'h09d41222a81e60ae645ef45ce83e9e7d6e343f9e368114c80f2097331ec1efab2;
    stim[3] = 257'h00e60cc801ca6a67e532ad593596a72883a6c8724b645cf76f97af0ee45122cd7;
    stim[4] = 257'h0674bbc00bd7ca39fd17f699333eff0297c13faa11953a8a9c8b325c54e845c2c;
    stim[5] = 257'h1d04aeeea41df6496fe87b6eade96bcb1138eb34c4a62cbe46ca07fe45a7706a9;
    stim[6] = 257'h19597ade3b61e28451f56e1b0d3c0f050a54163af25521563d3e0663d99ecc501;
    stim[7] = 257'h0bc72b135a48bc291e339c96e196e8780e7d73f96c0f3cba7a76cf1d8028ddadf;
    stim[8] = 257'h0d58b9ff5c56b7e15af57fb0ed8e47cab0e6155a2524b7581f4c3990462fd6564;
    stim[9] = 257'h0058c34547d66245560145def4865d951a86f6729d5eb6058181e762fd0078a1e;
    stim[10] = 257'h12251e17bd1bcb97b6555d3ec757fefab75fa7abab5ccdf0ec66c407c4d9cccfc;
    stim[11] = 257'h0c04f7dd9d2e330b1f84bf931ea203894f2c033fefe0a5fe9bf8e8dd631d7c854;
    stim[12] = 257'h1eec46d62e56c7f6cb01b98670acfdbc1ba0c01bd206bc64463425726dcd14ff0;
    stim[13] = 257'h0f005d6792dba9fe052bdaa9ab72c8b0c3ea3455af9bac620d37bbf9916f66f8c;
    stim[14] = 257'h045a30fb92c04a75673febad750c348ccb210fd04e48d4a812924f621e24b6585;
    stim[15] = 257'h04e83fd1bf39fd54352a43996aa172752c2e4713419b49f720dcfb902ae9b7d58;
    stim[16] = 257'h0a08525b836ef840384df373f1b1e6d712c868bec6b3cdc4a485aa8e02615b766;
    stim[17] = 257'h0c3e81884c2cb6c79f28a91ec0eae33c5699a51d0b7bdda74e182eaf5d1dbf810;
    stim[18] = 257'h0d68633c87a517749d43a1f1009e52efea60883ab13ed32aa8e9f82f5c71f2b38;
    stim[19] = 257'h1a8a447ea9ef3b9f54d09491b40b7d15fa9d333506f531b3fe123e73daeb91eb9;
    stim[20] = 257'h0589ceae6ca9ba6f61a8d6cfde109bb2e48f4dcde7afd16e83f5826123a39e99b;
    stim[21] = 257'h1a88bfe244967e0f45e5bcbba024d806627b7b58cf3913ab6810b1a39ce866a92;
    stim[22] = 257'h10a1c07bc05a970ce4e64f16d74f74266de405099d9918c39ea9cfd4a96dd422c;
    stim[23] = 257'h0220f9818826d825ac3a8cfb6719bd0b9f09ce348871c014c523d3c15a30c9e9f;
    stim[24] = 257'h0d651831797aa2cf1a47d1c23265435232dc3ce57450dd695fc5be3581dc90848;
    stim[25] = 257'h046811ad50c74ea17f4af61837e47cfc5892aedce22667d6cff488042b2bda807;
    stim[26] = 257'h14248b9cd53b9ad638ea980d37bfe24dc2fe36ee1dee01fcf47613b36214991b1;
    stim[27] = 257'h19551875be8f54eab91405ef7df1aa8226602ca03283b9c22cfe9f951236809fc;
    stim[28] = 257'h08bbaef3395184637a6682fdf7ecd9af920ae2710a3c4b34b36e30c3fbb5edf35;
    stim[29] = 257'h0dd346beacffaf8bde021a696b856142251a861d5d5d662d62bb4d1620124f6e7;
    stim[30] = 257'h1120d97f76e8b1f5d198844fe31c50f6310184a770998120b6804282ef642f81a;
    stim[31] = 257'h093d49c929837288de0a1496c3401154b30006b8091df6d70bb56aa3baf106d86;
    stim[32] = 257'h1031e35af26a56b6230f620c6ff499b6da3e37270b2d38843ff03923c4ff6bf0e;
    stim[33] = 257'h19fd0b8df1c07e4af2b683297aea5328b2a4421d2a51cdfd4b50796c533c4be17;
    stim[34] = 257'h1533abdd71ae3dee6eee01b5c9d443fd7b9a5649a2811fe0e5fbcf3f1dd5d50c3;
    stim[35] = 257'h0dafd5bea166cc10c99c59f7ff02508dd49e20daa02931575468156a719974560;
    stim[36] = 257'h049c976909dbdca32ab1a66a23aaf5beaf511b12059b4f05ef52bc493ae398e91;
    stim[37] = 257'h06a5263d39bbaf5855151f346cff1972cb7a9efaee08413ec3cfe205509acd9c8;
    stim[38] = 257'h08ce67b49d0c99d9b76a8809c7386ee5d634316c082de0402ac4d2d6bc5128a7d;
    stim[39] = 257'h0555a96a595be2c1850faa8c6006cf311bc65826a245e345d69e0184af2077838;
    stim[40] = 257'h19b31c1542baf29935d90f9d6eee4ccdf0d80f1e87a77fdb91bb52ff0432b9c30;
    stim[41] = 257'h1aaa5d2e36921b4b8b0b2fd05ff24831be0fca56323cf714651c4cbe19d919667;
    stim[42] = 257'h15353a9617abd82d603f14c287152469f65a8caf94312065c9b431f07989b8c74;
    stim[43] = 257'h10b1193a69a27b693f1230cb28147bade8f9693d002672c787e3fdf7dd8614d82;
    stim[44] = 257'h047d277de0d3603b9604ef2ef0adc4d972d0b4d2c496cdbd8962ec8676634e9c3;
    stim[45] = 257'h1faf1f34a078ba349d156fcf1cce6d5029e4662b8fcd2e47de8b40f2ddd4a6258;
    stim[46] = 257'h09f720a75aae99f44cf447f13333e58b44d61faffbec2c2d94f2e545ad2205609;
    stim[47] = 257'h1a897464e1be91000a396d9f45c546b3c87ad0ff7f7b44f772230bf8e89511151;
    stim[48] = 257'h15ece4f7497e8b38db64528bf53530539d33e6a07407550e4a7bb8498894ebcdd;
    stim[49] = 257'h1d7f3c97268bd70edeaf8482c74a0ccb757cbdbdf7e800bb1043e79cd222fd326;
    stim[50] = 257'h11ec138fa339deaaf16a23629c2cd78f6db281a347ee5c418a5f3c67dfd76bec3;
    stim[51] = 257'h0a1f1f5e816b13f4d222d045c48dc24c03b503e4be1ec51265fac9fd64e0f1972;
    stim[52] = 257'h08aab6a65a0d26071b7818c0dbe9402348073d24accd0dcd98cfcd3850456992c;
    stim[53] = 257'h0defccce292d6041e470db57204ad3837ffe7dea5073d0f682d983f79ef79bb96;
    stim[54] = 257'h17ab505ad71aad1498987a36481e252ed49b589ff88aa9290910570315945dd72;
    stim[55] = 257'h0f896c2d0247b181fc00e50557be0191a09d9096f5eabbb18898d22f317986b04;
    stim[56] = 257'h113861dafabc54b72e64c23e298db17a29c0c012b612dbdd06c0259e5bee6e1f7;
    stim[57] = 257'h126011e7fd9ea50c1ceb02b092e3f285d992a3eb6b2f4a84bc4d23ecf883231fa;
    stim[58] = 257'h077f57787879f5f68e7263ac5a8a7cad45c7c86651912f574993c5bfa1d050e40;
    stim[59] = 257'h1f9d12be654f76235729242f2e1fe76723abc63cb85ef26f46ebc7a4429f2d817;
    stim[60] = 257'h0c90d6391ea94298189aff3ae7b0a6e237f2a1ee4d7932699d8a8a91191808b2d;
    stim[61] = 257'h030a10741e71df9bc242acc6474526b75eb52372fe8c853f66a804bd21c9cba65;
    stim[62] = 257'h03d8a53a9e2238d0859b90dc12efd130cd76cb4ce9fba079d34c398108c266a67;
    stim[63] = 257'h10538b37674d8f64ae8813ada2b1352cbea58f2d4f3488789d63567213de3400b;
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
      expv[0] = 7'hxx;
      expv[1] = 7'hxx;
      expv[2] = 7'h03;
      expv[3] = 7'h03;
      expv[4] = 7'h03;
      expv[5] = 7'h03;
      expv[6] = 7'h03;
      expv[7] = 7'h13;
      expv[8] = 7'h13;
      expv[9] = 7'h13;
      expv[10] = 7'h13;
      expv[11] = 7'h13;
      expv[12] = 7'h13;
      expv[13] = 7'h03;
      expv[14] = 7'h03;
      expv[15] = 7'h03;
      expv[16] = 7'h03;
      expv[17] = 7'h03;
      expv[18] = 7'h03;
      expv[19] = 7'h03;
      expv[20] = 7'h03;
      expv[21] = 7'h03;
      expv[22] = 7'h03;
      expv[23] = 7'h03;
      expv[24] = 7'h03;
      expv[25] = 7'h13;
      expv[26] = 7'h13;
      expv[27] = 7'h13;
      expv[28] = 7'h13;
      expv[29] = 7'h13;
      expv[30] = 7'h13;
      expv[31] = 7'h03;
      expv[32] = 7'h03;
      expv[33] = 7'h03;
      expv[34] = 7'h03;
      expv[35] = 7'h03;
      expv[36] = 7'h03;
      expv[37] = 7'h03;
      expv[38] = 7'h03;
      expv[39] = 7'h03;
      expv[40] = 7'h03;
      expv[41] = 7'h03;
      expv[42] = 7'h03;
      expv[43] = 7'h13;
      expv[44] = 7'h13;
      expv[45] = 7'h13;
      expv[46] = 7'h13;
      expv[47] = 7'h13;
      expv[48] = 7'h13;
      expv[49] = 7'h03;
      expv[50] = 7'h03;
      expv[51] = 7'h03;
      expv[52] = 7'h03;
      expv[53] = 7'h03;
      expv[54] = 7'h03;
      expv[55] = 7'h03;
      expv[56] = 7'h02;
      expv[57] = 7'h02;
      expv[58] = 7'h02;
      expv[59] = 7'h02;
      expv[60] = 7'h02;
      expv[61] = 7'h12;
      expv[62] = 7'h12;
      expv[63] = 7'h12;
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
