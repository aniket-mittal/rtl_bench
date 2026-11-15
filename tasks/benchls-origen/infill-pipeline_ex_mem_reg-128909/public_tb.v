// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 177;
  localparam OW = 170;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_128909 dut (
    .clk(clk),
    .rst(in_vec[176:176]),
    .cpu_stall(in_vec[175:175]),
    .ex_c_rfw(in_vec[174:174]),
    .ex_c_wbsource(in_vec[173:172]),
    .ex_c_drw(in_vec[171:170]),
    .ex_alu_r(in_vec[169:138]),
    .ex_rfb(in_vec[137:106]),
    .ex_rf_waddr(in_vec[105:101]),
    .ex_jalra(in_vec[100:69]),
    .ex_rt(in_vec[68:64]),
    .wb_wdata(in_vec[63:32]),
    .dmem_in(in_vec[31:0]),
    .p_c_rfw(out_vec[169:169]),
    .p_c_wbsource(out_vec[168:167]),
    .p_alu_r(out_vec[166:135]),
    .dmem_data(out_vec[134:103]),
    .p_rf_waddr(out_vec[102:98]),
    .p_jalra(out_vec[97:66]),
    .dmem_addr(out_vec[65:34]),
    .dmem_drw(out_vec[33:32]),
    .p_dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 177'h1e0378522195b8c8462afb0d4f7a04a8d1a56be0a2e5b;
    stim[1] = 177'h1cc2081ad4c9f2640882e51383c56fef07cd1a7a801fb;
    stim[2] = 177'h0055ec6ec880b5f17daaaca49635f2ee3a3370632d95a;
    stim[3] = 177'h03c8251ab0d6a7d80d4173a3d6d1b7ff7bf3cc848debf;
    stim[4] = 177'h098d4adbbdfe813202634ef4e55ba0694ca75ebc984df;
    stim[5] = 177'h0342e02257a76004ee346906141fce80d45d5b9b67ab0;
    stim[6] = 177'h0adcdc32fb4fd3dfd07eae44fd35d48137ee611296f10;
    stim[7] = 177'h08381af26c9fe5ce709b308f21a05752da402759c4041;
    stim[8] = 177'h0837c90b1be6eb5384be344a5cb9e92b2a3f688155a52;
    stim[9] = 177'h016efb5e41566a065aefea968a3783dae572482a79884;
    stim[10] = 177'h04b8149af4d4d85c390f43d7020d60b9b3a5098a51ef7;
    stim[11] = 177'h04101f765083d4441b60955ead8f0058e856e9efe9a23;
    stim[12] = 177'h028099327c1a8dffdc74acece70b0ae3a97896c6e67d3;
    stim[13] = 177'h0be744505b81c44ee3e03ac0a7f6430cd804a69ab6ab6;
    stim[14] = 177'h086397dad3b1c6a526d806b494e93f1cbbb25ffd5eebc;
    stim[15] = 177'h06c7a50319c781b0901050b97e61eedeee31b38b62df6;
    stim[16] = 177'h077f534250548140657eac27d68ca0589d6d34252b446;
    stim[17] = 177'h0d3fba9e7f116c41e851b76da8ca56c9f6eddaca65afc;
    stim[18] = 177'h0839ea2a174d23870edcf104b4768d7b0c76042e2e31a;
    stim[19] = 177'h01a364f9444164697d905414e8cb96897d6c02a4a04e9;
    stim[20] = 177'h0b2bf94c48686785afe8984cfe1f9c6c62654b6d9719b;
    stim[21] = 177'h0681676a3b8463be1529e61aba1e932c156a59cd6ef3d;
    stim[22] = 177'h0b0be2136443ddb29a8d32f386e767020f01c91f4fa11;
    stim[23] = 177'h0848f85e0833d9c75681f7af4fef01e19088f31acff52;
    stim[24] = 177'h0cb54cabc4f816fa2e98d11e4a41e59920e048e095a17;
    stim[25] = 177'h0a9ba6dd4f33c960293ba429497867ce50cd58f2f77df;
    stim[26] = 177'h0ef4b3b16287385b6e874e7204a80794959feee496836;
    stim[27] = 177'h07e2a11bf8bbc0bf082be7a5a47a8432824ec80493fe5;
    stim[28] = 177'h0b18b65701f4107fdd20daab3deba5f7b84eeb1b77854;
    stim[29] = 177'h010cc4aa53b2f8df3a7b67dcfe182917f121705605ec0;
    stim[30] = 177'h0068a8a95f847b162ddcc965c7edc44512f59e121815a;
    stim[31] = 177'h0e11a12d7b0fc75f734eecc861a368281aead2a2a8cdb;
    stim[32] = 177'h0097393d68a954898e35bff1f047192df09a5089e6f76;
    stim[33] = 177'h09fd9960ef533dfad350e80a14d06c6f44be59db5dd22;
    stim[34] = 177'h0a785e6ddfe49a89357d55d94628b2568c1d70ff18086;
    stim[35] = 177'h0824ee546bf69f61df5d7d0831d497d8e0e7be73bb777;
    stim[36] = 177'h07113797dee29da6ce875f03e8abc5571227eee0eaecd;
    stim[37] = 177'h02682770754ac1abc3f2a0e66a6b245ff04b45078b7a7;
    stim[38] = 177'h0f8f5406852ff7ffa85dbdf635d06de47cdacb010329f;
    stim[39] = 177'h0df39ebaf235ac7bb2b0684bb2e44b0bed7c547fbd519;
    stim[40] = 177'h06dd3ec6252ad1388ecc31bd39ab979745c3c860550da;
    stim[41] = 177'h02aad79caa90bf2186fd2edbd115ed1aa9714c1077dfb;
    stim[42] = 177'h04bd19cd11b6fe0dd1d6601972b4275b26df0931fb2c8;
    stim[43] = 177'h050709d689994267afb77582efddaad9182c3cc0b4464;
    stim[44] = 177'h0b9da85749199c8a5e0378df786dd42528cf194708de3;
    stim[45] = 177'h0ecc086be75a826bb539f3741cdcd7757ba59828742c7;
    stim[46] = 177'h0c0ed2ee8aec70512c2a097d77eebcf8a1ab3483d144b;
    stim[47] = 177'h0b9865520698d46fc9bc66d58f8fac423011acf4fba70;
    stim[48] = 177'h096a272246e99e978409265783c911ec52c00877ac9e0;
    stim[49] = 177'h0f691dc3ecf414f45f2db26af5ca14bc863e36043e0d5;
    stim[50] = 177'h05a1dc4faa4f83a5f7c584d4a98fa1337b70d37d41be5;
    stim[51] = 177'h05d867df6c45bf7e7b89ff3b371e22e4f7b2f9e4870da;
    stim[52] = 177'h0e736c39e100f5bdfe145549a633278568d88a62da6f3;
    stim[53] = 177'h08aac4c60a0abdc760159b42c2533b248cc4432c88c98;
    stim[54] = 177'h0fd94730628b9aa5c9a70d5098eb8eb160b9048558f5f;
    stim[55] = 177'h09aabe3369c4d661a89f4972c3d3c7d2814563033402c;
    stim[56] = 177'h0df466ff8b10e02971d52e948621f5d0a6b0ef8945317;
    stim[57] = 177'h04cabc675ac1cd52ed13981f23b5864aedbce39a886dd;
    stim[58] = 177'h0d04768692b152ac5a8ec64ab4c6f644cb7b857a30641;
    stim[59] = 177'h09d90644bcbf50b607957058cf2e7199321bbf87fbdae;
    stim[60] = 177'h09a30cd512ac8953114da3f7f2ea19df22780741e0ed7;
    stim[61] = 177'h0d3e56a406db67f70070d1c6e47977a770ba9a2bba957;
    stim[62] = 177'h07c234ecde4c27ea5c000f9b3958108a1f23ad7b1a39b;
    stim[63] = 177'h055fe6fe490b64ae53a73cdba68d7f2783807c7eb2c72;
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
      expv[0] = 170'h0000000000000000000000000000000000000000000;
      expv[1] = 170'h0000000000000000000000000000000000000000000;
      expv[2] = 170'h0000000000000000000000000000000000000000000;
      expv[3] = 170'h02bd8dd91016be2fb5559492c695ec6ec890632d95a;
      expv[4] = 170'h1904a3561ad4fb01a82e747ada08251ab0fc848debf;
      expv[5] = 170'h1904a3561ad4fb01a82e747ada08251ab0fc848debf;
      expv[6] = 170'h185c044af4ec009dc68d20c283c2e022579b9b67ab0;
      expv[7] = 170'h185c044af4ec009dc68d20c283c2e022579b9b67ab0;
      expv[8] = 170'h185c044af4ec009dc68d20c283c2e022579b9b67ab0;
      expv[9] = 170'h185c044af4ec009dc68d20c283c2e022579b9b67ab0;
      expv[10] = 170'h0ddf6bc82acd40cb5dfd52d146eefb5e41582a79884;
      expv[11] = 170'h0702935e9a9b0b8721e87ae041b8149af4e98a51ef7;
      expv[12] = 170'h0203eeca107a88836c12abd5b1d01f765089efe9a23;
      expv[13] = 170'h1013264f8351bffb8e959d9ce14099327c26c6e67d3;
      expv[14] = 170'h1013264f8351bffb8e959d9ce14099327c26c6e67d3;
      expv[15] = 170'h1013264f8351bffb8e959d9ce14099327c26c6e67d3;
      expv[16] = 170'h10f4a06338f03612020a172fcc07a50319f38b62df6;
      expv[17] = 170'h1fea684a0a90280cafd584fad1bf53425054252b446;
      expv[18] = 170'h1fea684a0a90280cafd584fad1bf53425054252b446;
      expv[19] = 170'h1fea684a0a90280cafd584fad1bf53425054252b446;
      expv[20] = 170'h0c6c9f28882c8d2fb20a829d196364f94462a4a04e9;
      expv[21] = 170'h0c6c9f28882c8d2fb20a829d196364f94462a4a04e9;
      expv[22] = 170'h102ced47708c77c2a53cc35743c1676a3ba9cd6ef3d;
      expv[23] = 170'h102ced47708c77c2a53cc35743c1676a3ba9cd6ef3d;
      expv[24] = 170'h102ced47708c77c2a53cc35743c1676a3ba9cd6ef3d;
      expv[25] = 170'h102ced47708c77c2a53cc35743c1676a3ba9cd6ef3d;
      expv[26] = 170'h102ced47708c77c2a53cc35743c1676a3ba9cd6ef3d;
      expv[27] = 170'h102ced47708c77c2a53cc35743c1676a3ba9cd6ef3d;
      expv[28] = 170'h1c54237f177817e1057cf4b48f62a11bf8b80493fe5;
      expv[29] = 170'h1c54237f177817e1057cf4b48f62a11bf8b80493fe5;
      expv[30] = 170'h0998954a765f1be74f6cfb9fc30cc4aa53805605ec0;
      expv[31] = 170'h0515152bf08f62c5bb992cb8fda8a8a95f9e121815a;
      expv[32] = 170'h0515152bf08f62c5bb992cb8fda8a8a95f9e121815a;
      expv[33] = 170'h02e727ad152a9131c6b7fe3e08d7393d68a089e6f76;
      expv[34] = 170'h02e727ad152a9131c6b7fe3e08d7393d68a089e6f76;
      expv[35] = 170'h02e727ad152a9131c6b7fe3e08d7393d68a089e6f76;
      expv[36] = 170'h02e727ad152a9131c6b7fe3e08d7393d68a089e6f76;
      expv[37] = 170'h1a26f2fbdc53b4d9d0ebe07d15513797decee0eaecd;
      expv[38] = 170'h1504ee0ea95835787e541ccd4d6827707555078b7a7;
      expv[39] = 170'h1504ee0ea95835787e541ccd4d6827707555078b7a7;
      expv[40] = 170'h1504ee0ea95835787e541ccd4d6827707555078b7a7;
      expv[41] = 170'h33a7d8c4a55a2711d98637a7355d3ec6253860550da;
      expv[42] = 170'h155af395568d54b8a7a5db7a22aad79caaac1077dfb;
      expv[43] = 170'h07a339a236dfc1ba3acc032e56bd19cd11a931fb2c8;
      expv[44] = 170'h08e13ad133284cf5f6eeb05dfb8709d6898cc0b4464;
      expv[45] = 170'h08e13ad133284cf5f6eeb05dfb8709d6898cc0b4464;
      expv[46] = 170'h08e13ad133284cf5f6eeb05dfb8709d6898cc0b4464;
      expv[47] = 170'h08e13ad133284cf5f6eeb05dfb8709d6898cc0b4464;
      expv[48] = 170'h08e13ad133284cf5f6eeb05dfb8709d6898cc0b4464;
      expv[49] = 170'h08e13ad133284cf5f6eeb05dfb8709d6898cc0b4464;
      expv[50] = 170'h08e13ad133284cf5f6eeb05dfb8709d6898cc0b4464;
      expv[51] = 170'h0c3b89f549f074bef8b09a9531e1dc4faa637d41be5;
      expv[52] = 170'h2b0cfbed88b7efcf713fe766e3d867df6c79e4870da;
      expv[53] = 170'h2b0cfbed88b7efcf713fe766e3d867df6c79e4870da;
      expv[54] = 170'h2b0cfbed88b7efcf713fe766e3d867df6c79e4870da;
      expv[55] = 170'h2b0cfbed88b7efcf713fe766e3d867df6c79e4870da;
      expv[56] = 170'h2b0cfbed88b7efcf713fe766e3d867df6c79e4870da;
      expv[57] = 170'h2b0cfbed88b7efcf713fe766e3d867df6c79e4870da;
      expv[58] = 170'h01578ceb5b2576de727303e4768abc675af39a886dd;
      expv[59] = 170'h01578ceb5b2576de727303e4768abc675af39a886dd;
      expv[60] = 170'h01578ceb5b2576de727303e4768abc675af39a886dd;
      expv[61] = 170'h01578ceb5b2576de727303e4768abc675af39a886dd;
      expv[62] = 170'h01578ceb5b2576de727303e4768abc675af39a886dd;
      expv[63] = 170'h18469d9bc984fd4b8001f3672b0234ecde7d7b1a39b;
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
