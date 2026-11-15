// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 107;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_148867 dut (
    .inputs(in_vec[106:7]),
    .select(in_vec[6:0]),
    .result(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 107'h4958066ca12840099cb2a2e97c7;
    stim[1] = 107'h6f8e407692ed328d5c907138061;
    stim[2] = 107'h5b98e173dd5aa80a8032cf1c305;
    stim[3] = 107'h22cf064bbd9b09b55dc8f88f88f;
    stim[4] = 107'h56a8209ade131a00c906e66890e;
    stim[5] = 107'h112557fcb3f3a167e2d629f28cd;
    stim[6] = 107'h575bb4743d93f0ce3a0bfa26c34;
    stim[7] = 107'h4801661d7dbfff7cb04f065cf72;
    stim[8] = 107'h685f197b3d05753137d17306646;
    stim[9] = 107'h5f6b8536b5d0cb7fa95527311e5;
    stim[10] = 107'h4c3e48e65a18392f673057c02d9;
    stim[11] = 107'h78c07b9114d534ede69d75e9fed;
    stim[12] = 107'h2676fdd906819c14b1746fad2e9;
    stim[13] = 107'h5bb235d4bd6bc788d849e104392;
    stim[14] = 107'h7bc6daa0dd0ae1dd54909820676;
    stim[15] = 107'h10ac3134a860a2b0fbca1945d1b;
    stim[16] = 107'h0ed8c953cdc6bf77eb659a3ae1a;
    stim[17] = 107'h27f28fec26ae4e4b94def3845df;
    stim[18] = 107'h2201bdf336481a1ec17689cbd83;
    stim[19] = 107'h1f24050883e241573282db7130b;
    stim[20] = 107'h1a73af56df5393ce1e2ac7e97c7;
    stim[21] = 107'h3c715b6079db18f7775a13218f2;
    stim[22] = 107'h32e50a322006d50693eb54a1b3a;
    stim[23] = 107'h3b713e7022cb9b358c8cd64d89f;
    stim[24] = 107'h556cded8f57e03449a418ccb2f2;
    stim[25] = 107'h0c0b34fece0e2d25b21e95ea8c6;
    stim[26] = 107'h313dfa1e89b375de26dfd9d895e;
    stim[27] = 107'h3929e7aaf35af43261c127320a2;
    stim[28] = 107'h47bb501e518c7cdf23f1f7f5475;
    stim[29] = 107'h104c3480ba24b622e5603b0feb2;
    stim[30] = 107'h5e7c5240bfe793ad5085ca41f17;
    stim[31] = 107'h753fc171d2cb142c1efbccc8a45;
    stim[32] = 107'h2523aa620f13103921712d891ed;
    stim[33] = 107'h6abe6401092d07fdf5f3294054b;
    stim[34] = 107'h3922b3c98406675228b55ea9f45;
    stim[35] = 107'h2390e2f67dc51b39865098b68c3;
    stim[36] = 107'h19b11b6eecc8feb5af03de520b6;
    stim[37] = 107'h0440d3d925a97ad640abc1ecb4d;
    stim[38] = 107'h30893c077bd53323ae58fd2f0a8;
    stim[39] = 107'h0b546d96c84aa9a0cbf50fa8de2;
    stim[40] = 107'h2b21f031ad7c0a2adbb84f84882;
    stim[41] = 107'h23f519a9611cea2e45c41e89cc3;
    stim[42] = 107'h2506ac21afff43112104c99fb2d;
    stim[43] = 107'h3faca2ed44b9b5d9df9ee8170eb;
    stim[44] = 107'h1ff3520fe136292af35551e9e16;
    stim[45] = 107'h6b2261fc79f2cffcbfe0dd01482;
    stim[46] = 107'h225a86893854adaa0cd32d2fc02;
    stim[47] = 107'h79f7ba82b3f609349e4f9bb84c7;
    stim[48] = 107'h538a5d906fa800092357b9cf105;
    stim[49] = 107'h237e6a74a1775d9d0dcb8bd0bbf;
    stim[50] = 107'h52dd032e4f8830d589e9c3e6feb;
    stim[51] = 107'h0fe3901186d9d6ba1487557f68c;
    stim[52] = 107'h00e310f6579c4d9ec60aebaf6aa;
    stim[53] = 107'h4f28f67c64044d9acd748436c6c;
    stim[54] = 107'h7e6fe68e162ebdb823d1395ee05;
    stim[55] = 107'h1ced24509c0fef07bd9b9fbc65c;
    stim[56] = 107'h236dd841ab9c5671725ea5b2c40;
    stim[57] = 107'h7d4a7c21df66ddd7844764e97f4;
    stim[58] = 107'h3de6b6731d1cd341b0fdcdc3a25;
    stim[59] = 107'h549fe556771c78cde280ee9e5e3;
    stim[60] = 107'h706c222431570937bef66fd6e66;
    stim[61] = 107'h5542e28f677f058969f3eb861f7;
    stim[62] = 107'h2797483fa347e82f919320fd4fc;
    stim[63] = 107'h5cbd0484759a75d27cf8c61cc70;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
