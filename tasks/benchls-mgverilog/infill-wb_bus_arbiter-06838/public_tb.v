// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 176;
  localparam OW = 137;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06838 dut (
    .sys_clk(clk),
    .resetcpu(in_vec[175:175]),
    .h_cyc(in_vec[174:174]),
    .h_stb(in_vec[173:173]),
    .h_we(in_vec[172:172]),
    .h_sel(in_vec[171:168]),
    .h_adr(in_vec[167:136]),
    .h_dat_o(in_vec[135:104]),
    .l_cyc(in_vec[103:103]),
    .l_stb(in_vec[102:102]),
    .l_we(in_vec[101:101]),
    .l_sel(in_vec[100:97]),
    .l_adr(in_vec[96:65]),
    .l_dat_o(in_vec[64:33]),
    .m_ack(in_vec[32:32]),
    .m_dat_i(in_vec[31:0]),
    .h_ack(out_vec[136:136]),
    .h_dat_i(out_vec[135:104]),
    .l_ack(out_vec[103:103]),
    .l_dat_i(out_vec[102:71]),
    .m_cyc(out_vec[70:70]),
    .m_stb(out_vec[69:69]),
    .m_we(out_vec[68:68]),
    .m_sel(out_vec[67:64]),
    .m_adr(out_vec[63:32]),
    .m_dat_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 176'hec96e575aef4abd40648477aa8683fb9335994f0e3a8;
    stim[1] = 176'h8d27f789a5633ae46bdf7fd90d5e6b8a194a77eeeddf;
    stim[2] = 176'h614aad110bcf28a7b28a838ad7ffad90ec90c090fbcf;
    stim[3] = 176'h7ef324e4d11897ca8b17ddb26cba49f5546ace5aef94;
    stim[4] = 176'h27a4232fdc8296ba4a007e9ccdd06be876186445a949;
    stim[5] = 176'h17d32b33f2ecc7404fc6bc5dda56eaddbfaab8080246;
    stim[6] = 176'h133a92a87de3c2262c233922ee5f3a899906fbeed2b9;
    stim[7] = 176'h7fc9bfc6c472e5c7f354dfa3862eba93f1137dea513a;
    stim[8] = 176'h233b1fb8d09be8f4f99666b13d3e13ae78dfbca842b0;
    stim[9] = 176'h5a40af7fa7ff72ce04bedfc3f540a4a95e3c2ccd2974;
    stim[10] = 176'h6c107df3edc89ea2c81bfbe1a2933bfadcdf21721aff;
    stim[11] = 176'h7c104a194bce2b2644ca2bf182caf64f733319e67c03;
    stim[12] = 176'h201c30211156c3c24bc9b93ee91ee35d705d80fcbfa1;
    stim[13] = 176'h1831133bf9a025647395cf2c685d8394f43de890b6c2;
    stim[14] = 176'h3c19c9004dac2e4414f24c361d4ab3daff32013458ea;
    stim[15] = 176'h17d627796f06ea3f5aaeb5b4912035f17157d603979d;
    stim[16] = 176'h1cc4b13627f8267864288d428598fa7363a72b878be5;
    stim[17] = 176'h1c640a7871f54e367fe81bde11beafeeec6f7d37bac4;
    stim[18] = 176'h2c295a9ce6b6bf924cae16dec0d3b9834a3bcc722b94;
    stim[19] = 176'h788d09056c07f35bbb83267c9d31d61b013c8c2a4b31;
    stim[20] = 176'h1b4f30d4ea82c47e05278d970eb43b7e83784db721fe;
    stim[21] = 176'h11f77920074ff576a9f7f9d439a40eaf6e6da9334fb5;
    stim[22] = 176'h04bc45b4b0617cad54a122666a28275a003658306b39;
    stim[23] = 176'h08e82b555c00d78bedc6b1aecd336cf73ff134d5b727;
    stim[24] = 176'h6ccb9ad4fdf2cae9ec31758407103fc29027ee14282a;
    stim[25] = 176'h7b79d75e3cfaf6a9326b612b32ac8a0416b2b34d5848;
    stim[26] = 176'h77b9e6bcf7f87d592bf5d49003c844537e57503c38d5;
    stim[27] = 176'h25ec01a3c2d5ebb75d90fdfccfb5762dd3c0a1306a07;
    stim[28] = 176'h18b0804070a0894ff82edf6f9d0833a48b59b08acdcf;
    stim[29] = 176'h6e98e88c83e0b2fb0bbb01c819a1f183876a7805fdb4;
    stim[30] = 176'h0293aff179b5dfd9067a8d33e5e843c2558bfe3caacd;
    stim[31] = 176'h5b3bb226014b8fc938131bc480fdbcc744a229727d35;
    stim[32] = 176'h651d3d25f82c20053416c31709e6e65ef9a690834c22;
    stim[33] = 176'h353c157c33a8d1a1a6b3b3b98b10c8fa049c0c94ee96;
    stim[34] = 176'h7d530bedb0612fc81d1d0bef53375856410d8e3dbad4;
    stim[35] = 176'h04e99543d25df00bbcb65b81eaa8e04fe93606c8af61;
    stim[36] = 176'h0b233fb1873501f22e65f90743d9930e36da840ffdb2;
    stim[37] = 176'h07f8bf3a32e8fa7dc4fe2ad55c365cb5285362d190e2;
    stim[38] = 176'h7d294aeefdf2889c2a6e1b79585adf531a7929f3fc1f;
    stim[39] = 176'h633a344922d11b15d84a39fa2fa86e81bcbb3705f73e;
    stim[40] = 176'h556d5da3b0e4094fe3f025a1b83f3d2bdabbc9358e4d;
    stim[41] = 176'h33a0361b586a47206d1baa011f851b3115940b83e312;
    stim[42] = 176'h77c0ef7c1548edaae7a5f5340bdc84dd15e9f498a67a;
    stim[43] = 176'h6affe01d2889fa326569e49eeda8b7361e163bdafcf8;
    stim[44] = 176'h5f37ede35482781774830685b6d5559122dc25e3541b;
    stim[45] = 176'h47a79ec155fc75cb4575f08a4d6a4fd27a1c8a6ebeff;
    stim[46] = 176'h0a04ef60aa9a521aeeb33d6010792e01193d55f042a9;
    stim[47] = 176'h785827effba1792de4e61762488ae78cd02a045aac1f;
    stim[48] = 176'h13a3b59d5e1bdc1e3a634856691e700ba3b43cf055dc;
    stim[49] = 176'h7f4995a06455579a720c1d0ff3711969766b6b33bc0d;
    stim[50] = 176'h589e6b823507ac7dfb3041208d933bdcc0f172615470;
    stim[51] = 176'h0d2319b3505cc5758b1dcf06002cefde210c52b0f12e;
    stim[52] = 176'h70812f98e6ac09a9e1ab92de3dbcf0eed6961cf0fef3;
    stim[53] = 176'h6e6d6742d594d33888a8356e9f0c31d20e767af9ac69;
    stim[54] = 176'h79017e3b767613b286d5d35de83ca02c049f50068b8f;
    stim[55] = 176'h13ae2f58a807efcf97a1da38d3149c289af6050410c3;
    stim[56] = 176'h09e9f7e9106f2930efe6a93ad30f34284590a2705c79;
    stim[57] = 176'h7bd9f22901e2f25bed2249f6f19fddb07c565a53090a;
    stim[58] = 176'h4b2889baaf58b8b18ec890c895cc43a6837316368910;
    stim[59] = 176'h2418e279ec16763886f73af9f2fb4c213dfc1a71bdc7;
    stim[60] = 176'h631ba380c52524b505062e08a11038eeaf19b22f39a1;
    stim[61] = 176'h6b4581355d0c98b1b32291d0ae4e3d30beeea1b2e26e;
    stim[62] = 176'h22127908971ffc66fa6f41e85a2c63001898c3b0de44;
    stim[63] = 176'h7b2e962200ee836a39dc0b5d75b8c0b1238ccde3cd87;
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
      expv[0] = 137'h094f0e3a8ca7871d46c96e575aef4abd406;
      expv[1] = 137'h077eeeddf3bf776efefbfec86af35c50ca5;
      expv[2] = 137'h0c090fbcf60487de7e14aad110bcf28a7b2;
      expv[3] = 137'h0ce5aef94672d77ca7ef324e4d11897ca8b;
      expv[4] = 137'h06445a9493222d4a4a7a4232fdc8296ba4a;
      expv[5] = 137'h0b80802465c04012357d32b33f2ecc7404f;
      expv[6] = 137'h0fbeed2b97df7695c933a92a87de3c2262c;
      expv[7] = 137'h17dea513a3ef5289d7fc9bfc6c472e5c7f3;
      expv[8] = 137'h1bca842b05e5421584b33589e9f09d73c6f;
      expv[9] = 137'h02ccd2974166694ba5a40af7fa7ff72ce04;
      expv[10] = 137'h121721aff10b90d7fec107df3edc89ea2c8;
      expv[11] = 137'h119e67c030cf33e01fc104a194bce2b2644;
      expv[12] = 137'h180fcbfa1407e5fd0e4dc9f748f71aeb82e;
      expv[13] = 137'h0e890b6c2f4485b614ae796342ec1ca7a1e;
      expv[14] = 137'h0013458ea009a2c7579261b0ea559ed7f99;
      expv[15] = 137'h0d603979deb01cbced75ada48901af8b8ab;
      expv[16] = 137'h02b878be595c3c5f29446a142cc7d39b1d3;
      expv[17] = 137'h07d37bac4be9bdd62740def08df57f77637;
      expv[18] = 137'h0cc722b94e63915ca570b6f6069dcc1a51d;
      expv[19] = 137'h08c2a4b3146152598f88d09056c07f35bbb;
      expv[20] = 137'h04db721fe26db90ff1b4f30d4ea82c47e05;
      expv[21] = 137'h1a9334fb55499a7dad1f77920074ff576a9;
      expv[22] = 137'h058306b392c18359cd09133351413ad001b;
      expv[23] = 137'h034d5b7279a6adb93e358d76699b67b9ff8;
      expv[24] = 137'h0ee14282af70a14156ccb9ad4fdf2cae9ec;
      expv[25] = 137'h0b34d584859a6ac247b79d75e3cfaf6a932;
      expv[26] = 137'h1503c38d5281e1c6af7b9e6bcf7f87d592b;
      expv[27] = 137'h0a1306a0750983503c87efe67dabb16e9e0;
      expv[28] = 137'h0b08acdcfd84566e7976fb7ce8419d245ac;
      expv[29] = 137'h07805fdb43c02feda6e98e88c83e0b2fb0b;
      expv[30] = 137'h1fe3caacd7f1e55668293aff179b5dfd906;
      expv[31] = 137'h029727d3514b93e9adb3bb226014b8fc938;
      expv[32] = 137'h090834c224841a611651d3d25f82c200534;
      expv[33] = 137'h00c94ee96064a774b753c157c33a8d1a1a6;
      expv[34] = 137'h18e3dbad4471edd6a7d530bedb0612fc81d;
      expv[35] = 137'h006c8af61036457b0db2dc0f5547027f49b;
      expv[36] = 137'h0840ffdb24207fed932fc83a1ecc9871b6d;
      expv[37] = 137'h062d190e2b168c8717f156aae1b2e5a9429;
      expv[38] = 137'h029f3fc1f94f9fe0ffd294aeefdf2889c2a;
      expv[39] = 137'h13705f73e1b82fb9f633a344922d11b15d8;
      expv[40] = 137'h1c9358e4d649ac726d56d5da3b0e4094fe3;
      expv[41] = 137'h00b83e31205c1f1890dd5008fc28d988aca;
      expv[42] = 137'h0f498a67afa4c533d77c0ef7c1548edaae7;
      expv[43] = 137'h03bdafcf81ded7e7c6affe01d2889fa3265;
      expv[44] = 137'h025e3541b12f1aa0ddf37ede35482781774;
      expv[45] = 137'h08a6ebeff45375f7fc7a79ec155fc75cb45;
      expv[46] = 137'h155f042a92af82154ca04ef60aa9a521aee;
      expv[47] = 137'h0045aac1f022d560ff85827effba1792de4;
      expv[48] = 137'h03cf055dc1e782aee13a3b59d5e1bdc1e3a;
      expv[49] = 137'h16b33bc0d3599de06ff4995a06455579a72;
      expv[50] = 137'h1726154703930aa38589e6b823507ac7dfb;
      expv[51] = 137'h052b0f12e295878970ee783001677ef1086;
      expv[52] = 137'h01cf0fef30e787f79f0812f98e6ac09a9e1;
      expv[53] = 137'h07af9ac693d7cd634ee6d6742d594d33888;
      expv[54] = 137'h150068b8f280345c7f9017e3b767613b286;
      expv[55] = 137'h0050410c302820861d0ed1c698a4e144d7b;
      expv[56] = 137'h0a2705c7951382e3cf3549d69879a1422c8;
      expv[57] = 137'h05a53090a2d2984855124fb78cfeed83e2b;
      expv[58] = 137'h0163689108b1b44886448644ae621d341b9;
      expv[59] = 137'h01a71bdc70d38dee3fb9d7cf97da6109efe;
      expv[60] = 137'h0b22f39a1d9179cd0c3170450881c77578c;
      expv[61] = 137'h0a1b2e26e50d971376b4581355d0c98b1b3;
      expv[62] = 137'h0c3b0de4461d86f2222127908971ffc66fa;
      expv[63] = 137'h0cde3cd8766f1e6c3fb2e962200ee836a39;
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
