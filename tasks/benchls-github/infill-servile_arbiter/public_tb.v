// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 136;
  localparam OW = 136;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  servile_arbiter dut (
    .i_wb_cpu_dbus_adr(in_vec[135:104]),
    .i_wb_cpu_dbus_dat(in_vec[103:72]),
    .i_wb_cpu_dbus_sel(in_vec[71:68]),
    .i_wb_cpu_dbus_we(in_vec[67:67]),
    .i_wb_cpu_dbus_stb(in_vec[66:66]),
    .i_wb_cpu_ibus_adr(in_vec[65:34]),
    .i_wb_cpu_ibus_stb(in_vec[33:33]),
    .i_wb_mem_rdt(in_vec[32:1]),
    .i_wb_mem_ack(in_vec[0:0]),
    .o_wb_cpu_dbus_rdt(out_vec[135:104]),
    .o_wb_cpu_dbus_ack(out_vec[103:103]),
    .o_wb_cpu_ibus_rdt(out_vec[102:71]),
    .o_wb_cpu_ibus_ack(out_vec[70:70]),
    .o_wb_mem_adr(out_vec[69:38]),
    .o_wb_mem_dat(out_vec[37:6]),
    .o_wb_mem_sel(out_vec[5:2]),
    .o_wb_mem_we(out_vec[1:1]),
    .o_wb_mem_stb(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 136'h0270696ca6c9c6154b3d57afb30d891587;
    stim[1] = 136'hc7713f01b5a85a39327e1c877b087fcde4;
    stim[2] = 136'hba14d9626335b9676424b621ea8f6fae2d;
    stim[3] = 136'hf6897573b434f2bf0d55019f3e265a2c37;
    stim[4] = 136'h36f5e2e5fe264f7c709e2a11d5bc80d5ca;
    stim[5] = 136'hcc04ea9ccfcd927b18525395259f49d018;
    stim[6] = 136'hc4bf3e7c2ee8c43aaf0dbbf1a25227c503;
    stim[7] = 136'h08bbfbdb0c99e8fb96e29a4baa0354f3bb;
    stim[8] = 136'hc043185d58400e50cfada9edec7e03bd33;
    stim[9] = 136'he5cd157b203311615afe1690548c0d04fd;
    stim[10] = 136'hee5e5fc0facda693a52d719ad7feaf18d5;
    stim[11] = 136'h8f50e9fec0a469245286c176d79cbc81c6;
    stim[12] = 136'h3a4973576e7dc7e1e1ee1aa754e5b63f64;
    stim[13] = 136'h8709876c1d06bda5794be97edcbdd78fea;
    stim[14] = 136'hfe5a146a8c38162d2b9523a4cd43461bbd;
    stim[15] = 136'h73fb8bc749b4decf12608e6b851cbf3b45;
    stim[16] = 136'hb0d1e3394f10f0a7fc9aea29677fa6e4d0;
    stim[17] = 136'h4845143db3ed83ceeb5782cbeb6bdae0ee;
    stim[18] = 136'hdb5359d7f00693f1d83d8ec8d185fc8e59;
    stim[19] = 136'hbe2c16a0a1538ddd8ba291bee2e9269984;
    stim[20] = 136'hf198b2d00604d5d439703bff042c07cf61;
    stim[21] = 136'h649c7c2c86e4293e1c3541b89db0f691bf;
    stim[22] = 136'h1feb6f4ad6b75851c6fb98dbec311d4568;
    stim[23] = 136'hff2ef49f0782e8a3c48a48f5274764db0c;
    stim[24] = 136'h147d010fa6e5867db8466c3d5b1ffe59c8;
    stim[25] = 136'h13a236f6246c6b50b8d59e1ac0d59711e8;
    stim[26] = 136'hafa11f6a36a6b6ff4be09bc07f892eb697;
    stim[27] = 136'h80cd12ce78e8b69eb09783b44b0c514ba6;
    stim[28] = 136'h88b3d53f0e53fdd9a5e3502d2dfb99d153;
    stim[29] = 136'h2b3d6e71aed782a70572094515e51053f8;
    stim[30] = 136'ha63483f80eab0b401f76e85a61afb754d1;
    stim[31] = 136'h155a833843a1bf4ba370e138d283f005b1;
    stim[32] = 136'h80d4211c5a5f56fe585c7d692ca5f0898b;
    stim[33] = 136'he3890d820e1447c9e9efc803076065f131;
    stim[34] = 136'h1e236bee0f613741ec2d5f3da6450deffc;
    stim[35] = 136'hac1afb3689dc6fa5fc4ef8908cf37ec552;
    stim[36] = 136'hafc45f03f79adfab910414b80e00920f2c;
    stim[37] = 136'hd1ffc7a925f213b4f049e884570a7e28a8;
    stim[38] = 136'h22d9f1ac54144aed0f394afe05943a97e7;
    stim[39] = 136'h63442b22a261420e109e4f28f77b1a76c5;
    stim[40] = 136'h761a68292fc55f30e353b2f875f7c1d6fc;
    stim[41] = 136'hc979d68257ea0cfdc66a851e65f7f0a5fe;
    stim[42] = 136'hee1761430dbbf77cf56fcdcd64fd343d14;
    stim[43] = 136'hc909d0c870dbfe135f7cad5281762b1f6e;
    stim[44] = 136'h8159846534df7d66513e94caff816e8b6f;
    stim[45] = 136'h3126592a2724863fe705af86c1084b1787;
    stim[46] = 136'h5b2cd09795f0bcb12779d15bc0dee6b719;
    stim[47] = 136'he0020657fe20c01745269eddbb2038aed3;
    stim[48] = 136'h9d4e9d04595386be407498d5d4b79d8f5a;
    stim[49] = 136'h36e90a829faeb3c26dc2564c3babad6a6b;
    stim[50] = 136'h51e15fbd52e46e672d9032487721c667f9;
    stim[51] = 136'hae1b48c9ef05bcd344a4edc1ba6984a439;
    stim[52] = 136'h33d4f5386040657ed69de73a8cefe705cd;
    stim[53] = 136'hcb80ed930b37f658389ba797d2df921cef;
    stim[54] = 136'h70af7ea4ed1f42b4288f564d912cb49f2f;
    stim[55] = 136'h7a8605624d9bdf098323afd9ee8ee4a75b;
    stim[56] = 136'h6ed36b8f7dd09f675515cbffa01c8ca30b;
    stim[57] = 136'hd1c86efec5e151fa20f5c15db781825bdd;
    stim[58] = 136'h73f1d302870732debf7aa3b0cc6b1e0b0a;
    stim[59] = 136'h559778a1c65bf8f38986a3e169168893a0;
    stim[60] = 136'hc1de4ab8f8676ef3051803d3371e64cda3;
    stim[61] = 136'heef2d02bcb3664c4d47c3126480d7b38de;
    stim[62] = 136'heeff5fe9521e0ded41f04b47e584ea2579;
    stim[63] = 136'hc09cefa10646b4589149427deb619c5ea3;
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
      expv[0] = 136'h86c48ac343624561f3d57afb29b2718551;
      expv[1] = 136'h843fe6f2421ff37927e1c877ad6a168e4d;
      expv[2] = 136'h47b7d71623dbeb8b424b621e98cd6e59d9;
      expv[3] = 136'h132d161b09968b0dd55019f3ed0d3cafc1;
      expv[4] = 136'hde406ae56f2035728dbd78b97f8993df1c;
      expv[5] = 136'hcfa4e80c67d2740633013aa733f3649ec6;
      expv[6] = 136'h2913e2811489f140f0dbbf1a0bba310ea9;
      expv[7] = 136'h01aa79dd00d53ceeee29a4ba83267a3ee5;
      expv[8] = 136'h3f01de999f80ef4cb010c6175610039433;
      expv[9] = 136'h4606827ea303413f3973455ec80cc45856;
      expv[10] = 136'hff578c6a7fabc63552d719ad7eb369a4e9;
      expv[11] = 136'hce5e40e3672f2071a86c176d70291a4915;
      expv[12] = 136'h72db1fb2396d8fd90e925cd5db9f71f878;
      expv[13] = 136'h5eebc7f52f75e3faa1c261db0741af695e;
      expv[14] = 136'ha1a30dded0d186ef3f96851aa30e058b4a;
      expv[15] = 136'h8e5f9da2c72fced11cfee2f1d26d37b3c4;
      expv[16] = 136'hbfd372685fe9b93409aea29653c43c29fd;
      expv[17] = 136'hb5ed70775af6b83bb5782cbeacfb60f3b9;
      expv[18] = 136'hc2fe472ce17f239636d4d675fc01a4fc76;
      expv[19] = 136'h74934cc23a49a6613a291bee2854e37761;
      expv[20] = 136'h1603e7b08b01f3d83c662cb4018135750e;
      expv[21] = 136'hd87b48dfec3da46f99271f0b21b90a4f87;
      expv[22] = 136'h188ea2b40c47515a07fadbd2b5add61471;
      expv[23] = 136'ha3b26d8651d936c308a48f5241e0ba28f1;
      expv[24] = 136'h8fff2ce447ff96720466c3d5a9b9619f6d;
      expv[25] = 136'h6acb88f43565c47a04e88dbd891b1ad42e;
      expv[26] = 136'hc4975b4b624bada5fe09bc07cda9adbfd1;
      expv[27] = 136'h8628a5d3431452e989783b449e3a2da7ad;
      expv[28] = 136'hfdcce8a9fee67454a22cf54fc394ff7669;
      expv[29] = 136'hf28829fc794414fe0acf5b9c6bb5e0a9c1;
      expv[30] = 136'hd7dbaa68ebedd534298d20fe03aac2d007;
      expv[31] = 136'h41f802d820fc016c770e138d10e86fd2e9;
      expv[32] = 136'h52f844c5a97c2262a03508471697d5bf96;
      expv[33] = 136'hb032f89858197c4c5efc8030438511f279;
      expv[34] = 136'h2286f7fe11437bff02d5f3da43d84dd079;
      expv[35] = 136'h79bf62a93cdfb154ab06becda2771be97f;
      expv[36] = 136'h00490796002483cb10414b80fde6b7eae5;
      expv[37] = 136'h853f1454429f8a2a049e8845497c84ed3d;
      expv[38] = 136'hca1d4bf3e50ea5f988b67c6b150512bb43;
      expv[39] = 136'hbd8d3b625ec69db149e4f28f6898508385;
      expv[40] = 136'hfbe0eb7e7df075bf1d869a0a4bf157cc38;
      expv[41] = 136'hfbf852ff7dfc297fb25e75a095fa833f71;
      expv[42] = 136'h7e9a1e8a3f4d0f453b85d850c36efddf3d;
      expv[43] = 136'hbb158fb75d8ac7dbb24274321c36ff84d7;
      expv[44] = 136'hc0b745b7605ba2dbd3e94cafcd37df5995;
      expv[45] = 136'h84258bc3c212c5e18c49964a89c9218ff9;
      expv[46] = 136'h6f735b8cb7b9adc616cb3425e57c2f2c49;
      expv[47] = 136'h901c5769480e2bb4d269eddbbf883005d1;
      expv[48] = 136'h5bcec7ad2de763d6a753a7411654e1af90;
      expv[49] = 136'hd5d6b5356aeb5a9adc2564c3a7ebacf099;
      expv[50] = 136'h90e333fc487199fe5903248754b91b99c9;
      expv[51] = 136'h34c2521c1a61290e4a4edc1bbbc16f34d1;
      expv[52] = 136'h77f382e6bbf9c1730cf53d4e1810195fb5;
      expv[53] = 136'h6fc90e7737e4873bc9ba797d02cdfd960d;
      expv[54] = 136'h965a4f97cb2d27cb9c2bdfa93b47d0ad0a;
      expv[55] = 136'h477253ad23b929d6f23afd9ed366f7c261;
      expv[56] = 136'h0e465185872328c29bb4dae3df7427d9d5;
      expv[57] = 136'hc0c12dee606096f74f5c15db7178547e89;
      expv[58] = 136'h358f05851ac782c29cfc74c0a1c1ccb7af;
      expv[59] = 136'h8b4449d045a224e81565de287196fe3ce2;
      expv[60] = 136'h8f3266d147993368d1803d337e19dbbcc1;
      expv[61] = 136'h06bd9c6f035ece37bbbcb40af2cd993135;
      expv[62] = 136'hc27512bce13a895e3bbfd7fa5487837b50;
      expv[63] = 136'hb0ce2f51586717a8d49427de8191ad1625;
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
