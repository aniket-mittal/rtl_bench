// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 126;
  localparam OW = 118;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_204939 dut (
    .clock(clk),
    .idle_Allign(in_vec[125:124]),
    .cout_Allign(in_vec[123:88]),
    .zout_Allign(in_vec[87:52]),
    .sout_Allign(in_vec[51:20]),
    .modeout_Allign(in_vec[19:18]),
    .operationout_Allign(in_vec[17:17]),
    .NatLogFlagout_Allign(in_vec[16:16]),
    .difference_Allign(in_vec[15:8]),
    .InsTag_Allign(in_vec[7:0]),
    .idle_Allign2(out_vec[117:116]),
    .cout_Allign2(out_vec[115:80]),
    .zout_Allign2(out_vec[79:44]),
    .sout_Allign2(out_vec[43:12]),
    .modeout_Allign2(out_vec[11:10]),
    .operationout_Allign2(out_vec[9:9]),
    .NatLogFlagout_Allign2(out_vec[8:8]),
    .InsTag_Allign2(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 126'h0f936f927d0d03684b3ece4945eaae8c;
    stim[1] = 126'h2b2bcb2b51d07b503eac7569ea5bc459;
    stim[2] = 126'h32152ddc5fae6cfb7c630051d8379bc8;
    stim[3] = 126'h0cddefa2233c0edcdf3b08e066c576dd;
    stim[4] = 126'h2d667a4720cd84365531939ea0d3b41c;
    stim[5] = 126'h326aac505a54154056ce63167ec6f302;
    stim[6] = 126'h2cb4be7f26a578ac11fcdf868ca5daec;
    stim[7] = 126'h0b611b307ab1f60e4c811cf0f035247d;
    stim[8] = 126'h0816396ff1ca2a28d00efc3d8d024ecc;
    stim[9] = 126'h0f7fdc46653fe043c805a945feff0d1b;
    stim[10] = 126'h3184e18b4fb9a8df53e0684c6e1a03a7;
    stim[11] = 126'h0b8c810f51be229b0b22892f025483ee;
    stim[12] = 126'h283da693da545faac129bcc8a7a7fc29;
    stim[13] = 126'h25fbfb24205230aa3d1728e2b5008b45;
    stim[14] = 126'h189c8b45020f61183fcfd6be8d767399;
    stim[15] = 126'h1c1a48430d251e066fe631282173ac21;
    stim[16] = 126'h22741633735e6ee9d02c9c44da511b2a;
    stim[17] = 126'h29f6d3f392d4b473d18a287e27f3e3dc;
    stim[18] = 126'h1a73b89fde5c0bd66661151aa0b4134e;
    stim[19] = 126'h0110ccef7a685f49e059c6f31187dd4f;
    stim[20] = 126'h39ccbac5523c67baf7f7768f8a665ab2;
    stim[21] = 126'h083138a16cd147a00ebfca67498d7bd1;
    stim[22] = 126'h070654dfefcb94e80c6e97ebe7ab9255;
    stim[23] = 126'h2f32f8e957d0e8638fc2f47f24f8cf7f;
    stim[24] = 126'h1abda27c55b871a55f5cff0acbee2f94;
    stim[25] = 126'h20cd0b25a2ba32ea6071973e153f5520;
    stim[26] = 126'h1afe4065e4ab08ada23c1696a78066e5;
    stim[27] = 126'h190402728eaea1ebb18f5bb989da9534;
    stim[28] = 126'h1a959fe39a2537664f269ed7827a9260;
    stim[29] = 126'h38dc367a69da47743daed60b23c5dd00;
    stim[30] = 126'h2e3b805afbe95b5546cb1fa71797de01;
    stim[31] = 126'h23053bb2f039da5491f7f6c224342655;
    stim[32] = 126'h2dd72a0d79f42e7eb279c90e9da16730;
    stim[33] = 126'h3f61c2d86a69e2651283b381e94b0c02;
    stim[34] = 126'h355c67c99fa318a522122bb434893a45;
    stim[35] = 126'h1d01c166f105218bcc3a46d51db93882;
    stim[36] = 126'h23131dd7afa9ed4651a732072dab79c7;
    stim[37] = 126'h0fb6077798f9bd5783f67b73072b3268;
    stim[38] = 126'h168ff527f85bad2f1e9bf0aabe3c8669;
    stim[39] = 126'h011e5a0eb3e9983abdee5494a83075e9;
    stim[40] = 126'h39a52ab3c3ebda2aed585df4f73dd8fe;
    stim[41] = 126'h1484d4356e61a795ab758c187bb97695;
    stim[42] = 126'h22755865782df6024305e4816e867a26;
    stim[43] = 126'h06ea7dd1b732ce6726f40ea329321d48;
    stim[44] = 126'h24009949eb7a3d9f83b95d951aae515f;
    stim[45] = 126'h041ce10b7d41cd0ee2430e3e696bc0ba;
    stim[46] = 126'h0451e7125134abd27e3742fd5edbf841;
    stim[47] = 126'h3849f7bc128c257479cd39cf6cafce00;
    stim[48] = 126'h38762ac1ef3982b6eecde6f59bad9cb9;
    stim[49] = 126'h15d67ac3101f1a2150b78db781875fce;
    stim[50] = 126'h22db7b47e27924d9617a78ed76435fe0;
    stim[51] = 126'h257ccff6171777dfb4b9800fe5ca9492;
    stim[52] = 126'h22e71c66c12d895660788d3edccafcbb;
    stim[53] = 126'h1d34e2f55f958b77d58b3c0cb8bd653d;
    stim[54] = 126'h2f1aa7a251e5df60f1481736ad24aa8b;
    stim[55] = 126'h08b41ccddaa3695e3299e5bc8ff4bdbc;
    stim[56] = 126'h139dcd36ebfa7b39cf7ca3611b9a0816;
    stim[57] = 126'h25cdbea647207583d0c6b309c0cc2427;
    stim[58] = 126'h22f0b21e0b1c04ad4ee289a28249702d;
    stim[59] = 126'h192ee7b290cc6dfcd737de2b677711f2;
    stim[60] = 126'h10fed568830b537e5c5adef292a2d33f;
    stim[61] = 126'h281e21af6de7676075f9630b18611088;
    stim[62] = 126'h0ccc54c0e78a049f2db4c459dd16e4fd;
    stim[63] = 126'h0c770c892ab5a11f0be5a25f4aee0833;
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
      expv[0] = 118'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 118'h0f936f927d000000000ece4945ea8c;
      expv[2] = 118'h2000000001d07b503eac7569ea5b59;
      expv[3] = 118'h3000000000ae6cfb7c630051d837c8;
      expv[4] = 118'h0cddefa223000000000b08e066c5dd;
      expv[5] = 118'h2d667a47200000000011939ea0d31c;
      expv[6] = 118'h300000000054154056ce63167ec602;
      expv[7] = 118'h2cb4be7f26000000001cdf868ca5ec;
      expv[8] = 118'h0b611b307a00000000111cf0f0357d;
      expv[9] = 118'h0000000001ca2a28d00efc3d8d02cc;
      expv[10] = 118'h0f7fdc46650003fe0425a945feff1b;
      expv[11] = 118'h30613862d2b9a8df53e0684c6e1aa7;
      expv[12] = 118'h0000000001be229b0b22892f0254ee;
      expv[13] = 118'h2000000001545faac129bcc8a7a729;
      expv[14] = 118'h25fbfb2420000000000728e2b50045;
      expv[15] = 118'h189c8b45020f61183fcfd6be8d7699;
      expv[16] = 118'h1c1a48430d251e066fe63128217321;
      expv[17] = 118'h200000009c5e6ee9d02c9c44da512a;
      expv[18] = 118'h2000000001d4b473d18a287e27f3dc;
      expv[19] = 118'h1a73b89fde5c0bd66661151aa0b44e;
      expv[20] = 118'h0000000000685f49e059c6f311874f;
      expv[21] = 118'h30000000013c67baf7f7768f8a66b2;
      expv[22] = 118'h0000000001d147a00ebfca67498dd1;
      expv[23] = 118'h070654dfef000000001e97ebe7ab55;
      expv[24] = 118'h2f32f8e9570000000012f47f24f87f;
      expv[25] = 118'h1abda27c55b871a55f5cff0acbee94;
      expv[26] = 118'h2000000000ba32ea6071973e153f20;
      expv[27] = 118'h1afe4065e4ab08ada23c1696a780e5;
      expv[28] = 118'h190402728eaea1ebb18f5bb989da34;
      expv[29] = 118'h1a959fe39a2537664f269ed7827a60;
      expv[30] = 118'h3000000001da47743daed60b23c500;
      expv[31] = 118'h2000000001e95b5546cb1fa7179701;
      expv[32] = 118'h200000000039da5491f7f6c2243455;
      expv[33] = 118'h2000000001f42e7eb279c90e9da130;
      expv[34] = 118'h3f61c2d86a000d3c4ca3b381e94b02;
      expv[35] = 118'h355c67c99f00000000122bb4348945;
      expv[36] = 118'h1d01c166f105218bcc3a46d51db982;
      expv[37] = 118'h23131dd7af000000001732072dabc7;
      expv[38] = 118'h0fb607779800000000167b73072b68;
      expv[39] = 118'h168ff527f85bad2f1e9bf0aabe3c69;
      expv[40] = 118'h0000000000e9983abdee5494a830e9;
      expv[41] = 118'h3000000001ebda2aed585df4f73dfe;
      expv[42] = 118'h1484d4356e61a795ab758c187bb995;
      expv[43] = 118'h20000000002df6024305e4816e8626;
      expv[44] = 118'h06ea7dd1b700000003240ea3293248;
      expv[45] = 118'h20000000007a3d9f83b95d951aae5f;
      expv[46] = 118'h000000000041cd0ee2430e3e696bba;
      expv[47] = 118'h0451e71251000000000742fd5edb41;
      expv[48] = 118'h30000000018c257479cd39cf6caf00;
      expv[49] = 118'h30000000013982b6eecde6f59badb9;
      expv[50] = 118'h15d67ac3101f1a2150b78db78187ce;
      expv[51] = 118'h20000000007924d9617a78ed7643e0;
      expv[52] = 118'h257ccff6170000000009800fe5ca92;
      expv[53] = 118'h22e71c66c100000000088d3edccabb;
      expv[54] = 118'h1d34e2f55f958b77d58b3c0cb8bd3d;
      expv[55] = 118'h2f1aa7a25100000000181736ad248b;
      expv[56] = 118'h0000000001a3695e3299e5bc8ff4bc;
      expv[57] = 118'h139dcd36ebfa7b39cf7ca3611b9a16;
      expv[58] = 118'h25cdbea6470000000006b309c0cc27;
      expv[59] = 118'h22f0b21e0b000000000289a282492d;
      expv[60] = 118'h192ee7b290cc6dfcd737de2b6777f2;
      expv[61] = 118'h10fed568830b537e5c5adef292a23f;
      expv[62] = 118'h2000003c43e7676075f9630b186188;
      expv[63] = 118'h0ccc54c0e70000000014c459dd16fd;
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
