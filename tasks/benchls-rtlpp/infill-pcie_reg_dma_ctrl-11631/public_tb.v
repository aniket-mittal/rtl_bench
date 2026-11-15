// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 260;
  localparam OW = 71;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_11631 dut (
    .clk_in(clk),
    .rstn(in_vec[259:259]),
    .sel_ep_reg(in_vec[258:258]),
    .reg_wr_ena(in_vec[257:257]),
    .reg_rd_ena(in_vec[256:256]),
    .reg_rd_addr(in_vec[255:248]),
    .reg_wr_addr(in_vec[247:240]),
    .reg_wr_data(in_vec[239:208]),
    .dma_rd_prg_rddata(in_vec[207:176]),
    .dma_wr_prg_rddata(in_vec[175:144]),
    .rx_ecrc_bad_cnt(in_vec[143:128]),
    .read_dma_status(in_vec[127:64]),
    .write_dma_status(in_vec[63:0]),
    .reg_rd_data(out_vec[70:39]),
    .reg_rd_data_valid(out_vec[38:38]),
    .dma_prg_wrdata(out_vec[37:6]),
    .dma_prg_addr(out_vec[5:2]),
    .dma_rd_prg_wrena(out_vec[1:1]),
    .dma_wr_prg_wrena(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 260'h25aeb83c8536156273a4b269dd607ba0ebfebb98acf19e09da2b4bce79d23a2d9;
    stim[1] = 260'h715802478bc3841b4adef3ba745d399ac2e613e9c0a1fc22e543b46a23c82707e;
    stim[2] = 260'hcb92122dad0a4de76370644573c5bd774a298199afff669b7924dfbdb22487b47;
    stim[3] = 260'hca288102a266a7ee1a31ab76e1cf9db2a5b7cdf20a48373bad10ba0304dc708a3;
    stim[4] = 260'hd63303575d6343b5cfe80cc478da7d44e3144645f85b62b8f120d47b37634442d;
    stim[5] = 260'hb31242c5a41d484674b4b374a6fc64883aab5f9b3ba3d6d19877874e602ffdfe9;
    stim[6] = 260'hcc37a454f68ea116468ed4027dae23c720f870232ba952746d813a3bd3b6ce336;
    stim[7] = 260'h8ea80ac001ad2d8048881f414fa3604a98f0f32f715981ebdaa6bfde2c036fb8b;
    stim[8] = 260'hfccb34c2ec0adfae8f7cac90121d26bfa5a52860463a47d44061eea1225ccf61f;
    stim[9] = 260'hcde89435369e4db1f655beb501c3cd23d9b9b35c5b5d595fe13779b82bc8f768c;
    stim[10] = 260'hc1198ed49ad19678449bc069bde2255ffdd9f51bd7c8eb795d8c34a310682fc78;
    stim[11] = 260'hc25d58b8b9030806e20f05a6421ab3638f97af0efc73cd196d94c96b60dfa6f49;
    stim[12] = 260'hbfd7788a9444c7a120c3240e61e0414f6c6c9de51154203d57dcf7e9f15c94c7f;
    stim[13] = 260'hbacb40cad3079a107c3846012b77c9ae2100317d479b4197b837ebca02c627298;
    stim[14] = 260'hcf89e370253a9b2e2913977fa1069a1027cfdc56a26d9326b2ce811bd9b945c92;
    stim[15] = 260'had3f6a5cdb348b9360e88ec7bf7c1ff760ef5c502dd6e04d44ed2c7ac3c4962c8;
    stim[16] = 260'hef11e0fcef44d70a2c258f0ca33b85f693d467a486a2f6a02adc54fe42a0c65f1;
    stim[17] = 260'h8daea8f1796158cbb9c55f4e4de4d951728f1d070d27f9f51868b05fb58142720;
    stim[18] = 260'h98bf961ee7f4c942e943af599927ef44d03e8637d3f4ec883f141d618a9b97d2f;
    stim[19] = 260'hb3ec5bf1f466b5499dac7169b9c8ae98ff580516ad3d1bd4ddeef37fd744275b3;
    stim[20] = 260'hed78a6cdc13c22c48a9ad9e4f5c043af71c8754793e97ee625a58123896c5ae2b;
    stim[21] = 260'hde89794330b3935030e24ad05cae4b95bf796f7730347ebbbbb383da59f19528e;
    stim[22] = 260'he33dea6be86ca446999d71e040b125168fefca7135a498c6e4a6f851c0a4bc73a;
    stim[23] = 260'hf88ecda187f4402e137e2c297c6f2a7fa4a5866c90dad90d79b60b48e6ff661d2;
    stim[24] = 260'hde7b5bfaa0c7b72e241f33130a8082bd7f12df4ef69eb77cf17cf57e39f4b2151;
    stim[25] = 260'ha7fc3c9727377df357c8f01ed5efac91f581c814d31bf6eca3523e57880dd2c2e;
    stim[26] = 260'hd3ee0cec6378666e8ceca5e4acb6757dd1a58a5f8ce33e16eb261d037348419df;
    stim[27] = 260'hbf2c4302902e5121a21ce1040e7bb8bf0af1af075c64c93ef9cea969ab7981b47;
    stim[28] = 260'hfd10369805b816482f33fc6d04c98b1135cf1bb7faee096548177075471e05fdf;
    stim[29] = 260'he5a9a894d6d1ef5b7b1975aaaed0ccc604c1e8d372d60e1aa8095b8c89535ef1e;
    stim[30] = 260'ha991da2ab22af28161d140d85d5e193c9826c3a879b4c4a9c809a570b64c99f10;
    stim[31] = 260'h8649682ea6228ff646f4588e8e8e79edd983b375fe70e381b26dfa6a59475c519;
    stim[32] = 260'h8658c9f5dd3e3adbc1cca1d0b9c5ded2edf19669f38861da4ef704ca6e6746dd5;
    stim[33] = 260'h99f6cccb1f75d4c33bcecbdba4db9c24dfc3e11b1fd3c7b23d148290836fcf3d1;
    stim[34] = 260'hb38c2456db772f5bc2d2947416aa736c6cc2ca1a7b56fe0312bfbbcb8ae525fa4;
    stim[35] = 260'h8538e0f5938c12f467adb1228f012de68d40553aa6db3c398776fecba4b59f750;
    stim[36] = 260'hda4e67884d564f7d14d69dde727e36a00c479ce9210a06da504563e578054e465;
    stim[37] = 260'hab2f9688b4e92e48ebbd4aa99fd1c5d8e09a8b0513ad315deb13182633a7d0078;
    stim[38] = 260'hfd4372b7873959c69a766c5d83bca25240f86bc192781e796bc296d2bb3c067ed;
    stim[39] = 260'h9dfea17a217c1770ab4f2a590087378adf78bb66bd68e910bec810b8aa2be372a;
    stim[40] = 260'ha156ea217267fe83d93e4f446d531bfbf99e015a656dc1bf3cc2bde199029314c;
    stim[41] = 260'h9accf277c8c92d35f00b1100718b266bfb9b7b1e4fe1072f5a88d2a29280d6cd6;
    stim[42] = 260'hc2aa4cb11c0f5fc66bd782f1b5f8c07702b6f94ff35fcfdccb899bf0462d90ac9;
    stim[43] = 260'hfa58726d9f910bfbfb28000aae7065940ad49614f4e716a565d54b0182d1b6f61;
    stim[44] = 260'hbf69e3e1aaaac3deb0b0e7eeec02834f8c67bd7306b0740f95bd0edb6319215f4;
    stim[45] = 260'hda929fd3a11654b4738b6baacef482ea9c77581fd89f073c9b3bd20a6f4b80688;
    stim[46] = 260'hb8cd39ade550d624cfff3b1cfd45098ce9e1d4ebe8bf0e2b43ef338a678285c5d;
    stim[47] = 260'hb6b7bbd2443b5f6b76fc30bc2aa660da537cb914cd42b4ac67ef11e06d1825be3;
    stim[48] = 260'hc2b77c0a1de01de573f632a47b2a8bbc6353f064a21c6da6964554224c0c4a747;
    stim[49] = 260'hb39fe3e5a9499096ba9b49bda8cbe35d5e4e0a9ac3440fb7fba36c2d39ec230ce;
    stim[50] = 260'hb39504653be2cda0c9aa0f023a9cc28e450d4a1e7323f770a9985743f04a91727;
    stim[51] = 260'h5bc332ef3de736a8b51288798c54f0ca697d4a9271797c7982720abead32e4f46;
    stim[52] = 260'ha45b16bb4c30eb37c3daae91a7817c3a705db7131489cfa956852305ba63e420a;
    stim[53] = 260'hfbfa8c35c6c871ba72e8964d6c548e1e05ca5efdd3e59acdc6327eada7971d143;
    stim[54] = 260'he1bc4d1ee6c3863f5324072a5ee51150d8ff12b23932ea074d70927f559bc001a;
    stim[55] = 260'h86747b30e09bb0a857382d05cb094bd646feef282d17a68c63c0eed0b3c76c823;
    stim[56] = 260'he08c93b58f40bc671923242fe94b92d80ada20e4a5a315aeb63f425dad0cd3c81;
    stim[57] = 260'he3e783287df433aacff02201578a4e7241c9fca2e71e5cd4ceadc7e0a75f51a52;
    stim[58] = 260'hd9e07529c5b83dac89b057b6b2f448977a275a79a5f33578267a405dd0d29a500;
    stim[59] = 260'ha64b88aca18db31ab2b03f84e0436b0bee305ceeee5367bc88228b009c6d4b98a;
    stim[60] = 260'h983aad10b2d3c905e8287acf5680e5d76955e52daa55eeb77ee103c29eaf5b7e2;
    stim[61] = 260'hfe613c2500875822a2995286f78cc068738191c7b3cc53fe3c8601b67cab46003;
    stim[62] = 260'hb23c3836fd68fe9f92a7a42c7f7c2c7d2623187ccfcc8131da886f9a360b8074f;
    stim[63] = 260'hf8b0727ed6b34f0436c93face02d96a36ccc998a1328b51fd2ef18a8aaaf4b1db;
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
      expv[0] = 71'h000000000000000000;
      expv[1] = 71'h000000000000000000;
      expv[2] = 71'h000000000000000000;
      expv[3] = 71'h000000000000000000;
      expv[4] = 71'h0000000008b6b42904;
      expv[5] = 71'h00000000040a899aa0;
      expv[6] = 71'h000000004d5d758d00;
      expv[7] = 71'h000000000b16907510;
      expv[8] = 71'h000000001153da3aa8;
      expv[9] = 71'h000000002b0006b480;
      expv[10] = 71'h00000000530bb02b4c;
      expv[11] = 71'h0000000010d4da7924;
      expv[12] = 71'h000000007b526b4660;
      expv[13] = 71'h0000000022e2e40c14;
      expv[14] = 71'h00000000222a51131c;
      expv[15] = 71'h00000000032b4c1e50;
      expv[16] = 71'h000000000dc094ea78;
      expv[17] = 71'h0000000029736cd218;
      expv[18] = 71'h0000000003f3bd137a;
      expv[19] = 71'h0000000023c5e58568;
      expv[20] = 71'h00000000187b9fd324;
      expv[21] = 71'h000000002fc7d19ad4;
      expv[22] = 71'h000000001b3704f0a8;
      expv[23] = 71'h00000000650cc2ce5c;
      expv[24] = 71'h0000000029afa1b2b8;
      expv[25] = 71'h0000000076861fd130;
      expv[26] = 71'h000000006fea831ed4;
      expv[27] = 71'h00000000325c9cddcc;
      expv[28] = 71'h0000000073b18de180;
      expv[29] = 71'h000000000c0a40b950;
      expv[30] = 71'h000000005a6016e04d;
      expv[31] = 71'h0000000022535b47a8;
      expv[32] = 71'h0000000028aac8abf4;
      expv[33] = 71'h0000000020ba988a18;
      expv[34] = 71'h0000000027d774f8f0;
      expv[35] = 71'h00000000332c7dd770;
      expv[36] = 71'h00000000115b6ddc88;
      expv[37] = 71'h0000000003d64e3078;
      expv[38] = 71'h000000005e21355918;
      expv[39] = 71'h000000001a22d3a4a4;
      expv[40] = 71'h000000004ade1ce55c;
      expv[41] = 71'h0000000005e885f068;
      expv[42] = 71'h000000006885c99ff8;
      expv[43] = 71'h0000000009df2324bc;
      expv[44] = 71'h0000000032c4703d50;
      expv[45] = 71'h0000000049b67e441c;
      expv[46] = 71'h000000000f86aaab38;
      expv[47] = 71'h000000007f4e845964;
      expv[48] = 71'h0000000026b795434c;
      expv[49] = 71'h000000002f4910ed6c;
      expv[50] = 71'h00000000302877805c;
      expv[51] = 71'h000000000000000000;
      expv[52] = 71'h000000000000000000;
      expv[53] = 71'h000000000000000000;
      expv[54] = 71'h000000001aed30c384;
      expv[55] = 71'h0000000070d71b21e0;
      expv[56] = 71'h00000000347b9b0e10;
      expv[57] = 71'h000000002cc3826edc;
      expv[58] = 71'h217f4a5c8ed63d02e4;
      expv[59] = 71'h000000000ca1f7d0e0;
      expv[60] = 71'h0000000054a716e0dc;
      expv[61] = 71'h0000000022b28636e0;
      expv[62] = 71'h000000003442cb4f28;
      expv[63] = 71'h000000007094021d4e;
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
