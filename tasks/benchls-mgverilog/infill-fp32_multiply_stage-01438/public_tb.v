// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 84;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01438 dut (
    .clock(clk),
    .aout_Special(in_vec[99:67]),
    .bout_Special(in_vec[66:34]),
    .zout_Special(in_vec[33:1]),
    .idle_Special(in_vec[0:0]),
    .idle_Multiply(out_vec[83:83]),
    .zout_Multiply(out_vec[82:50]),
    .productout_Multiply(out_vec[49:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'h824667e7f1742af13b38c99d3;
    stim[1] = 100'hdd5d955542d5a097670eca339;
    stim[2] = 100'h254877f5f9568feaf548a4f77;
    stim[3] = 100'hcd5f12f3533c2f735033170b5;
    stim[4] = 100'hfcfca45c5c09c5b6a2570b93e;
    stim[5] = 100'h8c32f96008016a856940eef1a;
    stim[6] = 100'hf52c3c91b1ddd8980f43310a3;
    stim[7] = 100'ha5a2dc33d5b126feb44c2e04b;
    stim[8] = 100'h3bca46dfd529c7d64e4436f29;
    stim[9] = 100'h3ee3e02b137e8e9eb7929614f;
    stim[10] = 100'h6ec05eae4e47b662839e96c88;
    stim[11] = 100'h480e634abde488a326dbd8f32;
    stim[12] = 100'hcd44756ceb5090692b2b593d5;
    stim[13] = 100'h2d6b62fc435d03ed39fdb67b1;
    stim[14] = 100'hee1e82e79f70f15896e46c5d3;
    stim[15] = 100'h07c5036a6207d93e010421829;
    stim[16] = 100'h4fe0f3f13bacf884286ac7e13;
    stim[17] = 100'h125bd45b208763349018ee3b4;
    stim[18] = 100'h69b200d52474f9ac42a584340;
    stim[19] = 100'h0da7b29dc49c80d61bbc33b15;
    stim[20] = 100'h26374edea6f2419f8c7b7486f;
    stim[21] = 100'hb4045c36e21afc8a4272f79cc;
    stim[22] = 100'h7c2d62ff1b417ff25aa58525f;
    stim[23] = 100'h4b01734711e3be914b8451474;
    stim[24] = 100'ha395fafc1700b5723971dc2ac;
    stim[25] = 100'h8fd8f39d3a9fb3e6c60df5178;
    stim[26] = 100'hcd765b4129f81b83d783a617b;
    stim[27] = 100'hcccd6c4fd47a03390feab1b37;
    stim[28] = 100'h03e64bf4fff512cb01b5c3c9f;
    stim[29] = 100'h9d5c924750ba0eb6a48c38962;
    stim[30] = 100'h5ef958bea43cc5ca943a6cf22;
    stim[31] = 100'h3bda7e2c6d3f444f46efff601;
    stim[32] = 100'he8131f716202db7479350221e;
    stim[33] = 100'hf05e0b000c9c3ad10f1e4ef17;
    stim[34] = 100'hf7eee765b71e67170459016de;
    stim[35] = 100'h6d0169d5ef5f78bf0eb23cadf;
    stim[36] = 100'he908084edd3f1fc1be782c87c;
    stim[37] = 100'hed5f6209aca89cd0a337961ee;
    stim[38] = 100'hc4f6274775ef2d89abb12d54a;
    stim[39] = 100'h326d63e88bec4e86c94ca4de7;
    stim[40] = 100'hc05a257af4b3d1758c53b8fd5;
    stim[41] = 100'h75eb7e78279eaaf3d2b1947f6;
    stim[42] = 100'hf43800039a8134fdb8e33ba4c;
    stim[43] = 100'h41c74d9590c07dc79ade4a61a;
    stim[44] = 100'h542193b93a66086a88f65773f;
    stim[45] = 100'h88b6c66a66221b25291d34b62;
    stim[46] = 100'h01f6690c2394dbaecb2c7a95e;
    stim[47] = 100'hb37ad237780a48874a747a7de;
    stim[48] = 100'h6a0493c2f94b9ed59fa42c9fe;
    stim[49] = 100'h8bc2056ef968ea0ea7a231a42;
    stim[50] = 100'hef5600eee8bee2ac1f05c6a76;
    stim[51] = 100'h21c3ad987b2566639824e9ce8;
    stim[52] = 100'h12804ae3d758403be7640dfea;
    stim[53] = 100'hbd6903a51b29dd322e12451b6;
    stim[54] = 100'h5e0d670171bc370c7e1442fac;
    stim[55] = 100'hb33b5f55c71d10870a91af83e;
    stim[56] = 100'h1eda6f4d26ad2e5105b1bb5fc;
    stim[57] = 100'h1766a576831cd314c349dbd95;
    stim[58] = 100'hc956de4b2792a9728bf019061;
    stim[59] = 100'h01caddc6ce870c4e00c68333b;
    stim[60] = 100'hdbf8ea11db91ee265a3451464;
    stim[61] = 100'hd002dbceffe87ca5a7e955475;
    stim[62] = 100'h45ebae2998588000e8119f8fa;
    stim[63] = 100'h69b4bdc858146109afe632f1a;
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
      expv[0] = 84'hxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 84'hf671933axxxxxxxxxxxxx;
      expv[2] = 84'hce1d9467xxxxxxxxxxxxx;
      expv[3] = 84'hea9149eexxxxxxxxxxxxx;
      expv[4] = 84'ha0662e16xxxxxxxxxxxxx;
      expv[5] = 84'h1b00000009841523ef2c0;
      expv[6] = 84'h4ec0000000905e541a700;
      expv[7] = 84'h9e86621440905e541a700;
      expv[8] = 84'he8985c0940905e541a700;
      expv[9] = 84'h9c886de500905e541a700;
      expv[10] = 84'hef252c29c0905e541a700;
      expv[11] = 84'h4640000003e0e5ac43e60;
      expv[12] = 84'h22800000041b48c598df0;
      expv[13] = 84'hd656b27a841b48c598df0;
      expv[14] = 84'hf3fb6cf6041b48c598df0;
      expv[15] = 84'hadc8d8ba441b48c598df0;
      expv[16] = 84'h82084305041b48c598df0;
      expv[17] = 84'hd0d58fc2441b48c598df0;
      expv[18] = 84'h2a400000054cc8e27b530;
      expv[19] = 84'h19c0000014b1df7078a28;
      expv[20] = 84'hb778676294b1df7078a28;
      expv[21] = 84'h98f6e90dd4b1df7078a28;
      expv[22] = 84'h3cc0000000eb5552e4dd4;
      expv[23] = 84'hb54b0a4bc0eb5552e4dd4;
      expv[24] = 84'h380000000067ae2cb4118;
      expv[25] = 84'h69800000001f287be0700;
      expv[26] = 84'h430000001608050eb9878;
      expv[27] = 84'haf074c2f5608050eb9878;
      expv[28] = 84'h9fd56366d608050eb9878;
      expv[29] = 84'h836b8793d608050eb9878;
      expv[30] = 84'h1fc0000029fcec28533b0;
      expv[31] = 84'h14000000399d1bda96608;
      expv[32] = 84'h8ddffec0399d1bda96608;
      expv[33] = 84'h16c00000006d46ed64208;
      expv[34] = 84'h9e3c9de2c06d46ed64208;
      expv[35] = 84'h738000001a578deb413d0;
      expv[36] = 84'h9d64795bda578deb413d0;
      expv[37] = 84'h1240000003f614ca91ab8;
      expv[38] = 84'h63c000001e437dd245798;
      expv[39] = 84'h18c000002b8c74cd27450;
      expv[40] = 84'h929949bceb8c74cd27450;
      expv[41] = 84'h98a771faab8c74cd27450;
      expv[42] = 84'h2300000019c134cab5840;
      expv[43] = 84'h5540000000872ef072ee8;
      expv[44] = 84'h32400000004610e5eb028;
      expv[45] = 84'h91ecaee7c04610e5eb028;
      expv[46] = 84'h2b0000000e9851d7b6a40;
      expv[47] = 84'h25000000134ba342f1e20;
      expv[48] = 84'h1240000009de04520f1d8;
      expv[49] = 84'h6f000000006a60bd8b6b8;
      expv[50] = 84'h3fc00000151a6bf09f848;
      expv[51] = 84'h20c000002a40c0bc5a7c0;
      expv[52] = 84'h4c80000013c650e111280;
      expv[53] = 84'h61400000000e303cb5324;
      expv[54] = 84'h7a4000002258a42a4e740;
      expv[55] = 84'h61400000064e0c02c9988;
      expv[56] = 84'h214000000d7b43e83c2d0;
      expv[57] = 84'h368000001febda4c1aba0;
      expv[58] = 84'h8693b7b29febda4c1aba0;
      expv[59] = 84'h97e0320c1febda4c1aba0;
      expv[60] = 84'h818d06675febda4c1aba0;
      expv[61] = 84'h0a00000010f00dad7c3ac;
      expv[62] = 84'hcfd2aa8e90f00dad7c3ac;
      expv[63] = 84'h3bc00000149c5693053e4;
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
