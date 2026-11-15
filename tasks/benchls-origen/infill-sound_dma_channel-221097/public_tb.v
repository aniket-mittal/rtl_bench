// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 74;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_221097 dut (
    .I_CLK(clk),
    .I_RSTn(in_vec[73:73]),
    .I_H_CNT(in_vec[72:69]),
    .I_DIV(in_vec[68:57]),
    .I_VOL(in_vec[56:53]),
    .I_DMA_TRIG(in_vec[52:52]),
    .I_DMA_STOP(in_vec[51:51]),
    .I_DMA_CHAN(in_vec[50:48]),
    .I_DMA_ADDR(in_vec[47:32]),
    .I_DMA_LEN(in_vec[31:16]),
    .I_DMA_DATA(in_vec[15:0]),
    .O_DMA_ADDR(out_vec[31:16]),
    .O_SND(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 74'h01c673e757a2508ffad;
    stim[1] = 74'h0a3def7375adbb0dc03;
    stim[2] = 74'h3d02f097d544e904699;
    stim[3] = 74'h396a7530232cbfc3b21;
    stim[4] = 74'h39cd7851910ebbdea0d;
    stim[5] = 74'h3781d2bf7a3fd520256;
    stim[6] = 74'h3fed4f26983ef0c712a;
    stim[7] = 74'h36077c7d6f5ec99d771;
    stim[8] = 74'h2facd9a6282dd773692;
    stim[9] = 74'h2023c5695fd9680723b;
    stim[10] = 74'h299293cf70955e99913;
    stim[11] = 74'h20750398b720d3c5481;
    stim[12] = 74'h32a0f86c33297c8759b;
    stim[13] = 74'h39b5b993e61c65b9e22;
    stim[14] = 74'h28f366716719507060d;
    stim[15] = 74'h2952ede1ab000f115ba;
    stim[16] = 74'h3eaac2911bb41974a11;
    stim[17] = 74'h33dce98c40faafafa8a;
    stim[18] = 74'h2fba465562d6f012917;
    stim[19] = 74'h2594bac276b698ceb8b;
    stim[20] = 74'h3fab3ff0af7414e961e;
    stim[21] = 74'h3b10bf1a7851747f874;
    stim[22] = 74'h3ea3c921486e6ab1b14;
    stim[23] = 74'h2d34e93440b178c4e5b;
    stim[24] = 74'h389b26ca9e0d524a413;
    stim[25] = 74'h216205eee04d244e04f;
    stim[26] = 74'h25bc27347a9b4d2b04d;
    stim[27] = 74'h36b2a1a6859cb83988c;
    stim[28] = 74'h3b679afad91d201ca2b;
    stim[29] = 74'h35ff1b29257ad9568b8;
    stim[30] = 74'h3e6a6cbc1f0f90ba535;
    stim[31] = 74'h3a5329c528dbba3cdad;
    stim[32] = 74'h36dabf57e6f3586909e;
    stim[33] = 74'h2704c0e8c074f4bff63;
    stim[34] = 74'h3418a6aacc2ff5826d6;
    stim[35] = 74'h303e67e4a9c69a92554;
    stim[36] = 74'h22917e067107e7a5e41;
    stim[37] = 74'h27232743db81aa9ef89;
    stim[38] = 74'h2e4b5cb6ed00ffb0b60;
    stim[39] = 74'h2557b3f7b5e895f0ce4;
    stim[40] = 74'h261fd2c57264969ee8a;
    stim[41] = 74'h043108a5dd7505396a4;
    stim[42] = 74'h3625ba4bb1f45719828;
    stim[43] = 74'h3ced2b7ce83b3c2bbd3;
    stim[44] = 74'h32c7ee780e9ba41c568;
    stim[45] = 74'h3d6a57f2047563fdb13;
    stim[46] = 74'h26d502a7f1421e6e778;
    stim[47] = 74'h305d13772b5d4c8216a;
    stim[48] = 74'h3a5c47e19171eea3c95;
    stim[49] = 74'h3c0fc58d278e47d6c22;
    stim[50] = 74'h3b44629a9f62a91d608;
    stim[51] = 74'h3dc69beca015b15db30;
    stim[52] = 74'h28950f3be6df258c0d9;
    stim[53] = 74'h228665eca7866c5b481;
    stim[54] = 74'h3c50664a7bd3dd5fbf5;
    stim[55] = 74'h3241a2e8225dfcc0d00;
    stim[56] = 74'h3471d5f12779094500c;
    stim[57] = 74'h2ce5fc0d0197412d14a;
    stim[58] = 74'h2aad2ae1a10a55c63a5;
    stim[59] = 74'h24fddd1150e448d84a4;
    stim[60] = 74'h22755152f9117e7f5cd;
    stim[61] = 74'h279cd800beaf66e25be;
    stim[62] = 74'h3ec616ad393a80e3d95;
    stim[63] = 74'h3fe83dbef712245a767;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'h02320000;
      expv[5] = 32'h02320000;
      expv[6] = 32'h02320000;
      expv[7] = 32'h69830000;
      expv[8] = 32'h69830000;
      expv[9] = 32'h62820000;
      expv[10] = 32'h95fd0000;
      expv[11] = 32'hf7090000;
      expv[12] = 32'h8b720000;
      expv[13] = 32'h8b720000;
      expv[14] = 32'h3e610000;
      expv[15] = 32'h3e610000;
      expv[16] = 32'h1ab00000;
      expv[17] = 32'h1ab00000;
      expv[18] = 32'hc40f0000;
      expv[19] = 32'hc40f0000;
      expv[20] = 32'hc40f0000;
      expv[21] = 32'h0af70000;
      expv[22] = 32'ha7850000;
      expv[23] = 32'h14860000;
      expv[24] = 32'h440b0000;
      expv[25] = 32'h440b0000;
      expv[26] = 32'hee040000;
      expv[27] = 32'h47a90000;
      expv[28] = 32'h68590000;
      expv[29] = 32'h68590000;
      expv[30] = 32'h92570000;
      expv[31] = 32'h92570000;
      expv[32] = 32'h528d0000;
      expv[33] = 32'h7e6f0000;
      expv[34] = 32'h7e6f0000;
      expv[35] = 32'h7e6f0000;
      expv[36] = 32'h4a9c0000;
      expv[37] = 32'h4a9c0000;
      expv[38] = 32'h3db80000;
      expv[39] = 32'h3db80000;
      expv[40] = 32'h7b5e0000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h00000000;
      expv[43] = 32'h00000000;
      expv[44] = 32'hce830000;
      expv[45] = 32'hce830000;
      expv[46] = 32'h20470000;
      expv[47] = 32'h20470000;
      expv[48] = 32'h72b50000;
      expv[49] = 32'h19170000;
      expv[50] = 32'hd2780000;
      expv[51] = 32'hd2780000;
      expv[52] = 32'hca010000;
      expv[53] = 32'hbe6d0000;
      expv[54] = 32'hca780000;
      expv[55] = 32'hca780000;
      expv[56] = 32'hca780000;
      expv[57] = 32'h12770000;
      expv[58] = 32'h12770000;
      expv[59] = 32'h12770000;
      expv[60] = 32'h150e0000;
      expv[61] = 32'h2f910000;
      expv[62] = 32'h2f910000;
      expv[63] = 32'h2f910000;
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
