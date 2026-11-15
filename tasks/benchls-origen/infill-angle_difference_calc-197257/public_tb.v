// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 66;
  localparam OW = 96;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_197257 dut (
    .clock(clk),
    .reset(in_vec[65:65]),
    .enable(in_vec[64:64]),
    .phase1(in_vec[63:48]),
    .phase2(in_vec[47:32]),
    .phase3(in_vec[31:16]),
    .phase4(in_vec[15:0]),
    .angle1(out_vec[95:80]),
    .angle2(out_vec[79:64]),
    .angle3(out_vec[63:48]),
    .angle4(out_vec[47:32]),
    .angle5(out_vec[31:16]),
    .angle6(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 66'h3c88eff55c6c52df8;
    stim[1] = 66'h250893055bad216c0;
    stim[2] = 66'h069faceebb503252a;
    stim[3] = 66'h03da1398196966b5c;
    stim[4] = 66'h18c2157aa46a4a679;
    stim[5] = 66'h041b51d6c79dd42d0;
    stim[6] = 66'h175208dea4d97b898;
    stim[7] = 66'h04dac558b7c9de99d;
    stim[8] = 66'h1f657c4290b73bf0e;
    stim[9] = 66'h147643124d129f218;
    stim[10] = 66'h1916f87cc63ae4aba;
    stim[11] = 66'h0dca724c276edf2dd;
    stim[12] = 66'h0483831ab2e619228;
    stim[13] = 66'h1ed6eb019377853e2;
    stim[14] = 66'h1e20cd79c9592a465;
    stim[15] = 66'h1fac4cfe1c95296fe;
    stim[16] = 66'h1993e0416e346e3b2;
    stim[17] = 66'h146cfb32142352ae6;
    stim[18] = 66'h1fde5727242707b5a;
    stim[19] = 66'h12ca4dcf64e9051b6;
    stim[20] = 66'h093930089d908d730;
    stim[21] = 66'h0bfb096d9c4ce9517;
    stim[22] = 66'h1a618b8fa8c40a72d;
    stim[23] = 66'h11735441e2f5b6d01;
    stim[24] = 66'h10870181ba7661c16;
    stim[25] = 66'h131bc3c74740650e6;
    stim[26] = 66'h093bed330a251bfde;
    stim[27] = 66'h0c2b779b1b0858102;
    stim[28] = 66'h1c82418bddf6d9dcc;
    stim[29] = 66'h18ea49410cf196f28;
    stim[30] = 66'h083196babae7a8a45;
    stim[31] = 66'h15a27b59e484183e9;
    stim[32] = 66'h01649dcb9bf179516;
    stim[33] = 66'h0c6e7b8ce6835cda3;
    stim[34] = 66'h1f7a88d85a049d417;
    stim[35] = 66'h13023bff8adf6deba;
    stim[36] = 66'h107370ec6d9139f31;
    stim[37] = 66'h08f480607d75331c3;
    stim[38] = 66'h09950056b6aee8b63;
    stim[39] = 66'h17d20fe25e7c94447;
    stim[40] = 66'h1e273bda4aec04a87;
    stim[41] = 66'h03e0dd8f046f43668;
    stim[42] = 66'h03c0761754ad2f377;
    stim[43] = 66'h18aaa00048508f67b;
    stim[44] = 66'h1c0691326efc6b479;
    stim[45] = 66'h03ffa6613ee1dbd94;
    stim[46] = 66'h05e9e6421fc6b3eb6;
    stim[47] = 66'h132f62edbb9abaabb;
    stim[48] = 66'h1df5cd26e76774495;
    stim[49] = 66'h0006027cad97538e0;
    stim[50] = 66'h094ed5358cda81f5b;
    stim[51] = 66'h0e026e18d77359e47;
    stim[52] = 66'h03047a2d2a42f1a16;
    stim[53] = 66'h1cf0775058cb9cfb2;
    stim[54] = 66'h0d370b00bae20043f;
    stim[55] = 66'h1907721a467111286;
    stim[56] = 66'h17c9206b40c84cadc;
    stim[57] = 66'h0c2b81ac417e9edfd;
    stim[58] = 66'h0b4fe7d29b279d498;
    stim[59] = 66'h1426e9615df0beac3;
    stim[60] = 66'h042dac65ff9d2b41b;
    stim[61] = 66'h182d689572462beb6;
    stim[62] = 66'h1a4c592357be73275;
    stim[63] = 66'h1342b8edb2577a93e;
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
      expv[0] = 96'h000000000000000000000000;
      expv[1] = 96'h000000000000000000000000;
      expv[2] = 96'h000000000000000000000000;
      expv[3] = 96'h000000000000000000000000;
      expv[4] = 96'h000000000000000000000000;
      expv[5] = 96'h000000000000000000000000;
      expv[6] = 96'h000000000000000000000000;
      expv[7] = 96'h347700000000000000000000;
      expv[8] = 96'h347700000000000000000000;
      expv[9] = 96'h347727890000000000000000;
      expv[10] = 96'h347727890000000000000000;
      expv[11] = 96'h347727890000000000000000;
      expv[12] = 96'h347727890000000000000000;
      expv[13] = 96'h347727890000000000000000;
      expv[14] = 96'h347727890000000000000000;
      expv[15] = 96'h347727890000000000000000;
      expv[16] = 96'h347727890000000000000000;
      expv[17] = 96'h347727890000000000000000;
      expv[18] = 96'h347727890000000000000000;
      expv[19] = 96'h347727890000000000000000;
      expv[20] = 96'h347727890000000000000000;
      expv[21] = 96'h347727890000000000000000;
      expv[22] = 96'h347727890000000000000000;
      expv[23] = 96'h347727890000000000000000;
      expv[24] = 96'h347727890000000000000000;
      expv[25] = 96'h347727890000000000000000;
      expv[26] = 96'h347727890000000000000000;
      expv[27] = 96'h347727890000000000000000;
      expv[28] = 96'h347727890000000000000000;
      expv[29] = 96'h347727890000000000000000;
      expv[30] = 96'h347727890000000000000000;
      expv[31] = 96'h347727890000000000000000;
      expv[32] = 96'h347727890000000000000000;
      expv[33] = 96'h347727890000000000000000;
      expv[34] = 96'h347727890000000000000000;
      expv[35] = 96'h347727890000000000000000;
      expv[36] = 96'h347727890000000000000000;
      expv[37] = 96'h347727890000000000000000;
      expv[38] = 96'h347727890000000000000000;
      expv[39] = 96'h347727890000000000000000;
      expv[40] = 96'h347727890000000000000000;
      expv[41] = 96'h347727890000000000000000;
      expv[42] = 96'h347727890000000000000000;
      expv[43] = 96'h347727890000000000000000;
      expv[44] = 96'h347727890000000000000000;
      expv[45] = 96'h347727890000000000000000;
      expv[46] = 96'h347727890000000000000000;
      expv[47] = 96'h347727890000000000000000;
      expv[48] = 96'h347727890000000000000000;
      expv[49] = 96'h347727890000000000000000;
      expv[50] = 96'h347727890000000000000000;
      expv[51] = 96'h347727890000000000000000;
      expv[52] = 96'h347727890000000000000000;
      expv[53] = 96'h347727890000000000000000;
      expv[54] = 96'h347727890000000000000000;
      expv[55] = 96'h347727890000000000000000;
      expv[56] = 96'h347727890000000000000000;
      expv[57] = 96'h347727890000000000000000;
      expv[58] = 96'h347727890000000000000000;
      expv[59] = 96'h347727890000000000000000;
      expv[60] = 96'h347727890000000000000000;
      expv[61] = 96'h347727890000000000000000;
      expv[62] = 96'h347727890000000000000000;
      expv[63] = 96'h347727890000000000000000;
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
