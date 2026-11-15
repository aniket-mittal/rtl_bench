// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 105;
  localparam OW = 101;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_032508 dut (
    .clk(clk),
    .rst(in_vec[104:104]),
    .data_sram_en(in_vec[103:103]),
    .data_sram_addr(in_vec[102:71]),
    .data_sram_wen(in_vec[70:67]),
    .data_sram_wdata(in_vec[66:35]),
    .data_rdata(in_vec[34:3]),
    .data_addr_ok(in_vec[2:2]),
    .data_data_ok(in_vec[1:1]),
    .longest_stall(in_vec[0:0]),
    .data_sram_rdata(out_vec[100:69]),
    .d_stall(out_vec[68:68]),
    .data_req(out_vec[67:67]),
    .data_wr(out_vec[66:66]),
    .data_size(out_vec[65:64]),
    .data_addr(out_vec[63:32]),
    .data_wdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 105'h1ecb455dccc354c6aeff758a2df;
    stim[1] = 105'h16e8dade8bcfc363376940b1b9d;
    stim[2] = 105'h04d38ae68a412433ad42c4cd93c;
    stim[3] = 105'h05e3239a4181d722872973011cc;
    stim[4] = 105'h08c6243f05e3d77ff4023d883a2;
    stim[5] = 105'h006155db040e227fb0520294de7;
    stim[6] = 105'h07c3bc30477b35e747388432a48;
    stim[7] = 105'h05f93d577f6d6edd6467c1eb818;
    stim[8] = 105'h0a6e4f9f65894dc6a60b64f131a;
    stim[9] = 105'h0ac547fc401ff7cd8e4154da824;
    stim[10] = 105'h0803709e350289c07ebc1b0f927;
    stim[11] = 105'h012b5f127842e9fca8f815d4a24;
    stim[12] = 105'h0162f5f3e07d1e5e0eaeda1345c;
    stim[13] = 105'h0a0fd7019435f39776d8abe0f1d;
    stim[14] = 105'h0b4333771134b65805dfa739864;
    stim[15] = 105'h00a9516d95046e54005518625ca;
    stim[16] = 105'h0fc78bb57ac8e15a27b668ffb3f;
    stim[17] = 105'h015a1a287fecac56cad89c7e57d;
    stim[18] = 105'h008859b2c2cde2dfa47ef81c0c7;
    stim[19] = 105'h04bf5d821f411932ed4247c8da7;
    stim[20] = 105'h084a8143776fb5be235d907bcd5;
    stim[21] = 105'h0845b6628bb24c38e3d5dba7ea2;
    stim[22] = 105'h0ec31680efda174a822fccbe859;
    stim[23] = 105'h08be2f965afdaca9c90903b67f0;
    stim[24] = 105'h00a1959bb381ca99e738e351444;
    stim[25] = 105'h09d60ae19e186e0fe6fe41f2248;
    stim[26] = 105'h0e8b7cc5dffc2c2bde85bfe5891;
    stim[27] = 105'h0b844698207c80634de86e50109;
    stim[28] = 105'h0177c11e24ffa2a85c17844d2ae;
    stim[29] = 105'h008ef64c86f8675280460b7b2c1;
    stim[30] = 105'h04b35ab5e2dbbfb65583deccf57;
    stim[31] = 105'h06ec07087cf2f0611aafe8ee0ab;
    stim[32] = 105'h06453f264d8ecb2334bc771f2fb;
    stim[33] = 105'h037051adbc8ca26568b2ddd073e;
    stim[34] = 105'h0e5f4f02a100815c5f622e36eb0;
    stim[35] = 105'h0729bf4966ec226ca89c01234d1;
    stim[36] = 105'h090490993a3bd63f98eafa76918;
    stim[37] = 105'h07299f47ed0f48fe6b9f0e630d3;
    stim[38] = 105'h0f439e0593e877c61da9bf9915c;
    stim[39] = 105'h0ccc73d0a52bda20902add2e6ad;
    stim[40] = 105'h084d77e2e1c3c4c69589b295b9f;
    stim[41] = 105'h08e7829bdc5c8b4294dbb30b6ca;
    stim[42] = 105'h0e578a84ee515ea948813f7bbf4;
    stim[43] = 105'h0ce2a9a13474366e481c6c7244d;
    stim[44] = 105'h00ec94536fcc37867789aee32d3;
    stim[45] = 105'h093f10a0fdf7d875b000e2866bb;
    stim[46] = 105'h0028e4740ed1884ee8c6704ca7c;
    stim[47] = 105'h0647af5b3b99dd60c5889814175;
    stim[48] = 105'h0ef0bfcaf18fd663b1daa0ae483;
    stim[49] = 105'h044b7bd853f842d3311f32e59c8;
    stim[50] = 105'h05e60884086520839a66f662450;
    stim[51] = 105'h08a6c9e514b06956d030f6411ce;
    stim[52] = 105'h0e01bfe6da2eae0003a8ec124a7;
    stim[53] = 105'h05c453af3f4ac954ba546b45c75;
    stim[54] = 105'h0555cc573b837d9b06e2899991c;
    stim[55] = 105'h001594f6839a729e9d99150d7da;
    stim[56] = 105'h069b1bba8eb629f7ea71683bcba;
    stim[57] = 105'h021d7c0ede6d8511ab3b46508ec;
    stim[58] = 105'h0440454a9118f44e4dbfd152728;
    stim[59] = 105'h0fdc328effe061aa353b090b6cd;
    stim[60] = 105'h0be28706ea026e7073137ba1771;
    stim[61] = 105'h0b37e1c43af42acd187d6f458f8;
    stim[62] = 105'h02471ba610c7d14b8cbb9644d26;
    stim[63] = 105'h0592b639f160b5c79053004ae0f;
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
      expv[0] = 101'hxxxxxxxxxxd968abb986a98d5d;
      expv[1] = 101'h0000000002dd1b5bd19f86c66e;
      expv[2] = 101'h00000000009a715cd18248675a;
      expv[3] = 101'h0000000001bc64734803ae450e;
      expv[4] = 101'h000000001e18c487e0c7aeffe8;
      expv[5] = 101'h008f620e800c2abb601c44ff60;
      expv[6] = 101'h1480a53782f8778608f66bce8e;
      expv[7] = 101'h1480a53782bf27aaefdaddbac8;
      expv[8] = 101'h1480a5379e4dc9f3ec129b8d4c;
      expv[9] = 101'h02d93c4c6258a8ff883fef9b1c;
      expv[10] = 101'h02d93c4c7e006e13c6051380fd;
      expv[11] = 101'h0f06c3e482256be24f85d3f951;
      expv[12] = 101'h0f06c3e4822c5ebe7cfa3cbc1d;
      expv[13] = 101'h0f06c3e49c41fae0326be72eed;
      expv[14] = 101'h0f06c3e49468666ee2696cb00b;
      expv[15] = 101'h0f06c3e482152a2db208dca800;
      expv[16] = 101'h1546189726f8f176af91c2b44f;
      expv[17] = 101'h0d9a3fece22b43450fd958ad95;
      expv[18] = 101'h0d9a3fece2110b36589bc5bf48;
      expv[19] = 101'h1fbe07030297ebb043823265da;
      expv[20] = 101'h1091f236860950286edf6b7c46;
      expv[21] = 101'h1091f2368608b6cc51649871c7;
      expv[22] = 101'h1576e9fa86d862d01db42e9504;
      expv[23] = 101'h1576e9fa8617c5f2cbfb595392;
      expv[24] = 101'h1576e9fa821432b376039533ce;
      expv[25] = 101'h1576e9fa9d3ac15c3330dc1fcd;
      expv[26] = 101'h1576e9fa9ed16f98bbf85857bd;
      expv[27] = 101'h1576e9fa9a7088d304f900c69b;
      expv[28] = 101'h1576e9fa822ef823c4ff4550b8;
      expv[29] = 101'h05e1134aa211dec990f0cea500;
      expv[30] = 101'h05e1134aa2966b56bcb77f6cab;
      expv[31] = 101'h00f7b33d42dd80e10fe5e0c235;
      expv[32] = 101'h0bfa3b82a2c8a7e4c91d964669;
      expv[33] = 101'h0f1dc7cbe26e0a35b71944cad1;
      expv[34] = 101'h0cb7741ce4cbe9e0540102b8be;
      expv[35] = 101'h0cb7741ce2e537e92cd844d951;
      expv[36] = 101'h0cb7741cfc2092132777ac7f31;
      expv[37] = 101'h0cb7741ce2e533e8fd1e91fcd7;
      expv[38] = 101'h07c398c346e873c0b2d0ef8c3b;
      expv[39] = 101'h07c398c35e998e7a1457b44120;
      expv[40] = 101'h07c398c35509aefc5c87898d2b;
      expv[41] = 101'h026ca56e641cf0537bb9168529;
      expv[42] = 101'h16ecc2db25caf1509da2bd5291;
      expv[43] = 101'h16ecc2db3c9c553426e86cdc90;
      expv[44] = 101'h16ecc2db221d928a6d986f0cef;
      expv[45] = 101'h026bb8cb4627e2141fefb0eb60;
      expv[46] = 101'h0038a19ae2051c8e81a3109dd1;
      expv[47] = 101'h0038a19ae2c8f5eb6733bac18b;
      expv[48] = 101'h0038a19afdde17f95e1facc763;
      expv[49] = 101'h16a82b9202896f7b0af085a662;
      expv[50] = 101'h16a82b9202bcc11081ca410734;
      expv[51] = 101'h16a82b921e14d93ca260d2ada0;
      expv[52] = 101'h0c3d904724c037fcdb5d5c0007;
      expv[53] = 101'h0a3b049282b88a75e79592a974;
      expv[54] = 101'h0a3b049282aab98ae706fb360d;
      expv[55] = 101'h0a3b04928202b29ed034e53d3b;
      expv[56] = 101'h0645435f62d36377516c53efd4;
      expv[57] = 101'h1c5a0ef2e143af81dbdb0a2356;
      expv[58] = 101'h1c5a0ef2e08808a95231e89c9b;
      expv[59] = 101'h1c5a0ef2fefb8651dfc0c3546a;
      expv[60] = 101'h1c5a0ef2f47c50e0dd04dce0e6;
      expv[61] = 101'h1c5a0ef2f666fc3887e8559a30;
      expv[62] = 101'h1c5a0ef2e048e374c28fa29719;
      expv[63] = 101'h0ee5913480b256c73ec16b8f20;
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
