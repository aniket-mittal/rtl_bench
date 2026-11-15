// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 41;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_103489 dut (
    .i_clk(clk),
    .i_waddr(in_vec[68:61]),
    .i_wdata(in_vec[60:53]),
    .i_wen(in_vec[52:52]),
    .i_raddr(in_vec[51:44]),
    .i_wb_adr(in_vec[43:38]),
    .i_wb_dat(in_vec[37:6]),
    .i_wb_sel(in_vec[5:2]),
    .i_wb_we(in_vec[1:1]),
    .i_wb_stb(in_vec[0:0]),
    .o_rdata(out_vec[40:33]),
    .o_wb_rdt(out_vec[32:1]),
    .o_wb_ack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h18b8172de3c6dacb09;
    stim[1] = 69'h1c464d3d760a1c61a6;
    stim[2] = 69'h07e89202ea735a4c06;
    stim[3] = 69'h127aa0be778c877357;
    stim[4] = 69'h09a9423df6a99ac234;
    stim[5] = 69'h1bce5b08b4185557f6;
    stim[6] = 69'h12196f506a476099ff;
    stim[7] = 69'h1622831fed719f49e1;
    stim[8] = 69'h0a8e3dd5db5b1c7d36;
    stim[9] = 69'h1e51f5a4b629babc15;
    stim[10] = 69'h0a307b26c1cdafa01a;
    stim[11] = 69'h1e1b9e694ff1ea0370;
    stim[12] = 69'h1aadff7bdab681890b;
    stim[13] = 69'h1b3d0752b555dfe2f4;
    stim[14] = 69'h1a07a2cfbe61feab6d;
    stim[15] = 69'h0d02d1efcaab380d60;
    stim[16] = 69'h11f23ee1464b5baeee;
    stim[17] = 69'h1cde0eabd9cd38259f;
    stim[18] = 69'h0baf3e6994ed099f0b;
    stim[19] = 69'h11a2a0c928fb94a373;
    stim[20] = 69'h17182cf787f5447410;
    stim[21] = 69'h026837e1b7fd78c048;
    stim[22] = 69'h1ab424386da4f5d7b0;
    stim[23] = 69'h0eefb3761a1a54a6c5;
    stim[24] = 69'h0039d85a693f5e4b1c;
    stim[25] = 69'h1c08a703858b1dd006;
    stim[26] = 69'h0fc4d1eee4124b5245;
    stim[27] = 69'h1c7b98c154e20e2a42;
    stim[28] = 69'h0dd831355698e0b1de;
    stim[29] = 69'h18b7f7e0d8aaa1d752;
    stim[30] = 69'h15ee0b4ddc6c0fceb7;
    stim[31] = 69'h044d794b6f0b8cf8e2;
    stim[32] = 69'h1d79a240a4e178e85c;
    stim[33] = 69'h0bbdcf9824ff6741b2;
    stim[34] = 69'h0b2ce083f688177966;
    stim[35] = 69'h190f58c5a999b9e869;
    stim[36] = 69'h0f82b1fba1e97e76a8;
    stim[37] = 69'h1cd178a7039149f847;
    stim[38] = 69'h00c8df4943913ab5ca;
    stim[39] = 69'h12bae434c9925e865d;
    stim[40] = 69'h1cacfe2285a3e40097;
    stim[41] = 69'h1b058a07506dd535e2;
    stim[42] = 69'h0cea630e6ebc098656;
    stim[43] = 69'h1f25f966480a636f32;
    stim[44] = 69'h07ba3771ca878ffe06;
    stim[45] = 69'h136bc714476bab850d;
    stim[46] = 69'h1d0de1c396fdd9b7ac;
    stim[47] = 69'h0afad99c2af8256fc9;
    stim[48] = 69'h148f7d6938025f768b;
    stim[49] = 69'h0545e86ede3df2b315;
    stim[50] = 69'h13f55d38e66b82e335;
    stim[51] = 69'h0518eaf528b8535941;
    stim[52] = 69'h03d79cd3fcb51e3dec;
    stim[53] = 69'h106f145961c3d2f37e;
    stim[54] = 69'h0df3a513b947ea412c;
    stim[55] = 69'h1fb942d8a413f6a7cc;
    stim[56] = 69'h0272f8640c66f2f47b;
    stim[57] = 69'h1e5e16c24b83cf7582;
    stim[58] = 69'h01032888a34365af3e;
    stim[59] = 69'h1943ea57ce2321d603;
    stim[60] = 69'h16942902776fdce81d;
    stim[61] = 69'h0f0659724f6f8b0c55;
    stim[62] = 69'h115bab581923b26415;
    stim[63] = 69'h1b3aebbe6c065caffa;
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
      expv[0] = 41'hxxxxxxxxxxx;
      expv[1] = 41'hxxxxxxxxxxx;
      expv[2] = 41'hxxxxxxxxxxx;
      expv[3] = 41'hxxxxxxxxxxx;
      expv[4] = 41'hxxxxxxxxxxx;
      expv[5] = 41'hxxxxxxxxxxx;
      expv[6] = 41'hxxxxxxxxxxx;
      expv[7] = 41'hxxxxxxxxxxx;
      expv[8] = 41'hxxxxxxxxxxx;
      expv[9] = 41'hxxxxxxxxxxx;
      expv[10] = 41'hxxxxxxxxxxx;
      expv[11] = 41'hxxxxxxxxxxx;
      expv[12] = 41'hxxxxxxxxxxx;
      expv[13] = 41'hxxxxxxxxxxx;
      expv[14] = 41'hxxxxxxxxxxx;
      expv[15] = 41'hxxxxxxxxxxx;
      expv[16] = 41'hxxxxxxxxxxx;
      expv[17] = 41'hxxxxxxxxxxx;
      expv[18] = 41'hxxxxxxxxxxx;
      expv[19] = 41'hxxxxxxxxxxx;
      expv[20] = 41'hxxxxxxxxxxx;
      expv[21] = 41'hxxxxxxxxxxx;
      expv[22] = 41'hxxxxxxxxxxx;
      expv[23] = 41'hxxxxxxxxxxx;
      expv[24] = 41'hxxxxxxxxxxx;
      expv[25] = 41'hxxxxxxxxxxx;
      expv[26] = 41'hxxxxxxxxxxx;
      expv[27] = 41'hxxxxxxxxxxx;
      expv[28] = 41'hxxxxxxxxxxx;
      expv[29] = 41'h0828xxxxxxx;
      expv[30] = 41'h04c4xxxxxxx;
      expv[31] = 41'hxxxxxxxxxxx;
      expv[32] = 41'hxxxxxxxxxxx;
      expv[33] = 41'hxxxxxxxxxxx;
      expv[34] = 41'hxxxxxxxxxxx;
      expv[35] = 41'hxxxxxxxxxxx;
      expv[36] = 41'hxxxxxxxxxxx;
      expv[37] = 41'hxxxxxxxxxxx;
      expv[38] = 41'hxxxxxxxxxxx;
      expv[39] = 41'hxxxxxxxxxxx;
      expv[40] = 41'hxxxxxxxxxxx;
      expv[41] = 41'hxxxxxxxxxxx;
      expv[42] = 41'hxxxxxxxxxxx;
      expv[43] = 41'hxxxxxxxxxxx;
      expv[44] = 41'hxxxxxxxxxxx;
      expv[45] = 41'h0fafxxxxxxx;
      expv[46] = 41'hxxxxxxxxxxx;
      expv[47] = 41'hxxxxxxxxxxx;
      expv[48] = 41'hxxxxxxxxxxx;
      expv[49] = 41'hxxxxxxxxxxx;
      expv[50] = 41'hxxxxxxxxxxx;
      expv[51] = 41'hxxxxxxxxxxx;
      expv[52] = 41'hxxxxxxxxxxx;
      expv[53] = 41'hxxxxxxxxxxx;
      expv[54] = 41'hxxxxxxxxxxx;
      expv[55] = 41'h1070xxxxxxx;
      expv[56] = 41'hxxxxxxxxxxx;
      expv[57] = 41'hxxxxxxxxxxx;
      expv[58] = 41'hxxxxxxxxxxx;
      expv[59] = 41'hxxxxxxxxxxx;
      expv[60] = 41'hxxxxxxxxxxx;
      expv[61] = 41'hxxxxxxxxxxx;
      expv[62] = 41'hxxxxxxxxxxx;
      expv[63] = 41'hxxxxxxxxxxx;
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
