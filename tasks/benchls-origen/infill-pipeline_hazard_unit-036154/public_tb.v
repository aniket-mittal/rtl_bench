// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_036154 dut (
    .clk(clk),
    .rsd(in_vec[50:46]),
    .rtd(in_vec[45:41]),
    .rdd(in_vec[40:36]),
    .rse(in_vec[35:31]),
    .rte(in_vec[30:26]),
    .rde(in_vec[25:21]),
    .writeRegE(in_vec[20:16]),
    .writeRegM(in_vec[15:11]),
    .writeRegW(in_vec[10:6]),
    .BranchD(in_vec[5:5]),
    .memToRegE(in_vec[4:4]),
    .memToRegM(in_vec[3:3]),
    .RegWriteE(in_vec[2:2]),
    .RegWriteM(in_vec[1:1]),
    .RegWriteW(in_vec[0:0]),
    .ForwardAE(out_vec[8:7]),
    .ForwardBE(out_vec[6:5]),
    .ForwardAD(out_vec[4:4]),
    .ForwardBD(out_vec[3:3]),
    .FlushE(out_vec[2:2]),
    .stallF(out_vec[1:1]),
    .stallD(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h078f7e6326aa9;
    stim[1] = 51'h450f53e3533dd;
    stim[2] = 51'h4f49e2f595187;
    stim[3] = 51'h3e014e92fbbc9;
    stim[4] = 51'h0cd23994498c0;
    stim[5] = 51'h1ab3814673af8;
    stim[6] = 51'h524c92762f52d;
    stim[7] = 51'h3482eeecfad71;
    stim[8] = 51'h555d74a45933e;
    stim[9] = 51'h339bc151d89e8;
    stim[10] = 51'h43dc7d64f149c;
    stim[11] = 51'h5afb25e518fe8;
    stim[12] = 51'h3564e8d4e1049;
    stim[13] = 51'h36d46575fd736;
    stim[14] = 51'h6978a51d711c0;
    stim[15] = 51'h1c34711957236;
    stim[16] = 51'h0fa585a41aa53;
    stim[17] = 51'h708c147e9e502;
    stim[18] = 51'h76753d66fe619;
    stim[19] = 51'h301a94ed6c3f4;
    stim[20] = 51'h7cba1dc24d594;
    stim[21] = 51'h0b5f7a3378f3c;
    stim[22] = 51'h1a9cd34c3935c;
    stim[23] = 51'h624d740b58f6b;
    stim[24] = 51'h2271b7cca4914;
    stim[25] = 51'h25dd6e753bcc9;
    stim[26] = 51'h0546d933484b6;
    stim[27] = 51'h2770023ac3ba1;
    stim[28] = 51'h4017a0a4e0c14;
    stim[29] = 51'h28abd843f24d2;
    stim[30] = 51'h4c5152690b7ba;
    stim[31] = 51'h13939e23d04a1;
    stim[32] = 51'h7d52b0023e66e;
    stim[33] = 51'h4a03e58805394;
    stim[34] = 51'h3ca31f4814c03;
    stim[35] = 51'h7062b7eb896c0;
    stim[36] = 51'h53c1cfb0ab2a4;
    stim[37] = 51'h0421a70972bb4;
    stim[38] = 51'h195a1ff3c4556;
    stim[39] = 51'h51e31ae772ae0;
    stim[40] = 51'h7d82a62393e7a;
    stim[41] = 51'h11caea5486fca;
    stim[42] = 51'h3139addaa1ad7;
    stim[43] = 51'h37b1029c9b700;
    stim[44] = 51'h58bd1d0dbfa67;
    stim[45] = 51'h7700fbd3fac1e;
    stim[46] = 51'h28ff5c144cf86;
    stim[47] = 51'h32103da84fb7b;
    stim[48] = 51'h39ea1f1e97384;
    stim[49] = 51'h6c609654901b1;
    stim[50] = 51'h482ca1d8083b2;
    stim[51] = 51'h6b6b3065c8271;
    stim[52] = 51'h7cf8a26ec63e3;
    stim[53] = 51'h02bff2d569ff5;
    stim[54] = 51'h0c609e36da7b1;
    stim[55] = 51'h01262eb5545ae;
    stim[56] = 51'h2efd536091800;
    stim[57] = 51'h4f6da10540475;
    stim[58] = 51'h43d9cd0755bbf;
    stim[59] = 51'h62c40ff8cf58b;
    stim[60] = 51'h513a12c0701f9;
    stim[61] = 51'h75fa31b3055c1;
    stim[62] = 51'h5dacddfecb0cf;
    stim[63] = 51'h34ce60c2ef56c;
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
      expv[0] = 9'h000;
      expv[1] = 9'h020;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h040;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h100;
      expv[16] = 9'h000;
      expv[17] = 9'h010;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
