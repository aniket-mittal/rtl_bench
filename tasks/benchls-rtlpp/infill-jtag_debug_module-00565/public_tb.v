// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 129;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00565 dut (
    .tck(clk),
    .MonDReg(in_vec[128:97]),
    .break_readreg(in_vec[96:65]),
    .dbrk_hit0_latch(in_vec[64:64]),
    .dbrk_hit1_latch(in_vec[63:63]),
    .dbrk_hit2_latch(in_vec[62:62]),
    .dbrk_hit3_latch(in_vec[61:61]),
    .debugack(in_vec[60:60]),
    .ir_in(in_vec[59:58]),
    .jtag_state_rti(in_vec[57:57]),
    .monitor_error(in_vec[56:56]),
    .monitor_ready(in_vec[55:55]),
    .reset_n(in_vec[54:54]),
    .resetlatch(in_vec[53:53]),
    .tdi(in_vec[52:52]),
    .tracemem_on(in_vec[51:51]),
    .tracemem_trcdata(in_vec[50:15]),
    .tracemem_tw(in_vec[14:14]),
    .trc_im_addr(in_vec[13:7]),
    .trc_on(in_vec[6:6]),
    .trc_wrap(in_vec[5:5]),
    .trigbrktype(in_vec[4:4]),
    .trigger_state_1(in_vec[3:3]),
    .vs_cdr(in_vec[2:2]),
    .vs_sdr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .ir_out(out_vec[42:41]),
    .jrst_n(out_vec[40:40]),
    .sr(out_vec[39:2]),
    .st_ready_test_idle(out_vec[1:1]),
    .tdo(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 129'h052d6f1653b4faa28a99f4a6ff894e937;
    stim[1] = 129'h04296e1fb5b10fa99a386944d6b651ffb;
    stim[2] = 129'h14db20c4707e541de3bcd1dfc01d5497a;
    stim[3] = 129'h1f9c728fc3367c177fadbacd80e482832;
    stim[4] = 129'h0eeeb841acf1989fd9958ae71d9a5720e;
    stim[5] = 129'h1243551697787278c6a6e17aa7ebdf687;
    stim[6] = 129'h0f0ca6a94eae604ac62d2f0797c47cc45;
    stim[7] = 129'h1baa0bd12c416590da149475459c476d5;
    stim[8] = 129'h0d5dbbcd7ac13492038fade058c6a271f;
    stim[9] = 129'h0fc77e9dd28df5f92164c0a5b1a6684ec;
    stim[10] = 129'h0044397a51038d6d21363f6580ebbfbae;
    stim[11] = 129'h15dd7eee3c417eba08ed2f8fd46169a65;
    stim[12] = 129'h0fa1d6ada60c1ce0e2eedaf2a972a6b15;
    stim[13] = 129'h1641960264e0ad21c85d73665818899fe;
    stim[14] = 129'h15221720913b4f07f47f4df99fcd5b8fa;
    stim[15] = 129'h1ab73dd0f4ae9de088542bcbf93b58310;
    stim[16] = 129'h1efd20f3c5e9e9a1137ee111af53c768f;
    stim[17] = 129'h074386fb01bd627914b6ed065e6e8c27c;
    stim[18] = 129'h1a87c0b29ddd94460e44205c141cec4df;
    stim[19] = 129'h1fccbef094ce7c3ece0754c02bea15755;
    stim[20] = 129'h0747903406b73fe567ac62b30e0ea2674;
    stim[21] = 129'h198e34edec64af1a3dddcd72616233b46;
    stim[22] = 129'h1ce3207a640fa41bb885264f42f8125ba;
    stim[23] = 129'h0bf11d59f4ce2470d1ce9bafb21fd88b5;
    stim[24] = 129'h05c7860ca8c0ee0165e5139e1352995cf;
    stim[25] = 129'h170e6fa7e984f9d55657297aa6b4cd125;
    stim[26] = 129'h0172038e79a3efb9b477b5d85e9bbbb73;
    stim[27] = 129'h0b83628ac8bdf8b82d55bf184c412a038;
    stim[28] = 129'h0726f15d7a468aaff2fe5e5870e8097e8;
    stim[29] = 129'h074c29054d694df6e955aac22d65b23a8;
    stim[30] = 129'h055947115b8eaf6f4464807dee66acbf1;
    stim[31] = 129'h185ae8c550df1e8f471defd8211da1430;
    stim[32] = 129'h1a0dfd4dc82be0fc988c7fa90955815fa;
    stim[33] = 129'h026bb9a90f5f1780b5146c53ed072d701;
    stim[34] = 129'h0da1207ec8c92ea69e4df84e6cbdc46da;
    stim[35] = 129'h140fb91c765549302b5d458c970d345e0;
    stim[36] = 129'h14d31eddbba3072cec1f3ac687f2860f2;
    stim[37] = 129'h055192d8905466ea58d51c0ec961c75ad;
    stim[38] = 129'h0e367f46a005eeea77cf59b2a127719c3;
    stim[39] = 129'h1411927886b2f970d99fbaaeff0816826;
    stim[40] = 129'h047cefeb3dbca1312374266180581e041;
    stim[41] = 129'h08ef0f3d6f6a928e2556d3a9f751290e0;
    stim[42] = 129'h1d664c157ec1cfa7950c0cefbae255750;
    stim[43] = 129'h12f7ecc6dbcf72c7e71f125fbc16ed6c4;
    stim[44] = 129'h1d4dc9f6f84e181ca2dda368a1f97b8f1;
    stim[45] = 129'h13401057e3cbab8cf1e6e288d3a295a20;
    stim[46] = 129'h123dc28e213d353df6c699d0f557d4740;
    stim[47] = 129'h0b158a5ea166a9a2af7c9f588d13e3f5d;
    stim[48] = 129'h1a6a6b13b7220499d6c5bed60f197b47e;
    stim[49] = 129'h0348ec453c4394b333cc71e998f9dc3d6;
    stim[50] = 129'h06874f861cca19b9c986d1d2e147e26f9;
    stim[51] = 129'h1ebe6399cfc0c8ce50d7da6d1e8b99573;
    stim[52] = 129'h06dc3f8c158f3cdd72ad726f139f1abad;
    stim[53] = 129'h102f545ac0b06d3fe03626180894eeb59;
    stim[54] = 129'h021045b07e4d7b587155ffdfb48f584b5;
    stim[55] = 129'h10dec1418da07621dedc6a871c594edca;
    stim[56] = 129'h1008a9659dd41d3c902cac50bb2d75641;
    stim[57] = 129'h0f8d55ed3dfe7ef923bf05d0164194c69;
    stim[58] = 129'h0ef9848f2e22955b23b77d56effa89e47;
    stim[59] = 129'h11ce0c0b771dbe5933663cabdfba55496;
    stim[60] = 129'h00b607465e92f307497f60c3345646dba;
    stim[61] = 129'h08d9c080dfdcda1f99750845aa44e9edc;
    stim[62] = 129'h03fc8544a7c18da1760eebbd8ecdc715f;
    stim[63] = 129'h0381d6c1f90509e5fd369577850a3afa3;
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
      expv[0] = 43'h0xxxxxxxxxx;
      expv[1] = 43'h0xxxxxxxxxx;
      expv[2] = 43'h1xxxxxxxxxx;
      expv[3] = 43'h1xxxxxxxxxx;
      expv[4] = 43'h1axxxxxxxxx;
      expv[5] = 43'h7fxxxxxxxxx;
      expv[6] = 43'h75xxxxxxxxx;
      expv[7] = 43'h563c329aa50;
      expv[8] = 43'h156ea82f448;
      expv[9] = 43'h3ab75417a27;
      expv[10] = 43'h16052d8d337;
      expv[11] = 43'h730296c699a;
      expv[12] = 43'h530296c034f;
      expv[13] = 43'h530296c0560;
      expv[14] = 43'h39814b602b2;
      expv[15] = 43'h3cc0a5b0158;
      expv[16] = 43'h3cc0a5b015a;
      expv[17] = 43'h366052d80af;
      expv[18] = 43'h1a86f589e45;
      expv[19] = 43'h75437ac4f20;
      expv[20] = 43'h14ff32fbc22;
      expv[21] = 43'h161adcff95d;
      expv[22] = 43'h1b0d6e7fcad;
      expv[23] = 43'h7f86b73fe55;
      expv[24] = 43'h7f86b70011a;
      expv[25] = 43'h1fc35ba008d;
      expv[26] = 43'h794bd535a67;
      expv[27] = 43'h5ca5ea9ad30;
      expv[28] = 43'h1ca5ea9ad32;
      expv[29] = 43'h1ca5ea9ad30;
      expv[30] = 43'h5ca5ea9ad32;
      expv[31] = 43'h3ca5ea9ad30;
      expv[32] = 43'h5ca5ea9ad30;
      expv[33] = 43'h1652f54d698;
      expv[34] = 43'h7652f54d698;
      expv[35] = 43'h3b297aa6b4d;
      expv[36] = 43'h5b297aa6b4d;
      expv[37] = 43'h3f94bd535a5;
      expv[38] = 43'h7f94bd406b8;
      expv[39] = 43'h3fca5ea035d;
      expv[40] = 43'h1fe52f701af;
      expv[41] = 43'h7fe52f701ad;
      expv[42] = 43'h7fe52f701ad;
      expv[43] = 43'h5fe52f701ad;
      expv[44] = 43'h5fcbdfb31b0;
      expv[45] = 43'h7fcbdfb31b2;
      expv[46] = 43'h7fcbdfb31b0;
      expv[47] = 43'h3fcbdfb31b2;
      expv[48] = 43'h54fac4689f0;
      expv[49] = 43'h1a7d62344f8;
      expv[50] = 43'h753eb11a27d;
      expv[51] = 43'h153eb11a27d;
      expv[52] = 43'h7a9f588d13f;
      expv[53] = 43'h5cd63cf375a;
      expv[54] = 43'h1cd63cf3758;
      expv[55] = 43'h37fefda47ad;
      expv[56] = 43'h13ff7ed23d7;
      expv[57] = 43'h53ff7ed23d7;
      expv[58] = 43'h33ff7ed23d7;
      expv[59] = 43'h39ffbf691ea;
      expv[60] = 43'h74ffdfb48f7;
      expv[61] = 43'h5a7fefda47a;
      expv[62] = 43'h50422d52275;
      expv[63] = 43'h702116a913a;
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
