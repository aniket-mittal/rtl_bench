// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03551 dut (
    .x(in_vec[37:22]),
    .y(in_vec[21:6]),
    .zx(in_vec[5:5]),
    .nx(in_vec[4:4]),
    .zy(in_vec[3:3]),
    .ny(in_vec[2:2]),
    .f(in_vec[1:1]),
    .no(in_vec[0:0]),
    .out(out_vec[17:2]),
    .zr(out_vec[1:1]),
    .ng(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h2b9e8e31cf;
    stim[1] = 38'h1d2f36be49;
    stim[2] = 38'h04457ab5a8;
    stim[3] = 38'h2c026a8564;
    stim[4] = 38'h080cca90d2;
    stim[5] = 38'h26c29ae719;
    stim[6] = 38'h3cc71d8743;
    stim[7] = 38'h351ffaa962;
    stim[8] = 38'h0bf6514cd8;
    stim[9] = 38'h1ae9dd421a;
    stim[10] = 38'h09cf958ca0;
    stim[11] = 38'h020295e358;
    stim[12] = 38'h2fbb494f4a;
    stim[13] = 38'h3fa85b9597;
    stim[14] = 38'h36cd457202;
    stim[15] = 38'h12fbd5fa47;
    stim[16] = 38'h18fcf41db3;
    stim[17] = 38'h2b6b4234b6;
    stim[18] = 38'h181032739c;
    stim[19] = 38'h1671baca85;
    stim[20] = 38'h3aed5820a6;
    stim[21] = 38'h260dc3f0b6;
    stim[22] = 38'h2728affd3e;
    stim[23] = 38'h0ca3f34325;
    stim[24] = 38'h3dc79d8306;
    stim[25] = 38'h31bb6434da;
    stim[26] = 38'h22d420405c;
    stim[27] = 38'h1542b6a602;
    stim[28] = 38'h0b6f883a73;
    stim[29] = 38'h24b64668e3;
    stim[30] = 38'h12c30216f6;
    stim[31] = 38'h1b466a7be2;
    stim[32] = 38'h17864d4bad;
    stim[33] = 38'h12d43d7807;
    stim[34] = 38'h06cfd83b08;
    stim[35] = 38'h221e82eadf;
    stim[36] = 38'h13ed7ed504;
    stim[37] = 38'h2a149517eb;
    stim[38] = 38'h20720b37c5;
    stim[39] = 38'h2a2a2904bd;
    stim[40] = 38'h0937e756fe;
    stim[41] = 38'h3e4e05d5f3;
    stim[42] = 38'h118cc1fac8;
    stim[43] = 38'h274a2871d3;
    stim[44] = 38'h114a8ec814;
    stim[45] = 38'h3b27bc6f5e;
    stim[46] = 38'h09e11654a0;
    stim[47] = 38'h3611df9117;
    stim[48] = 38'h1cf7839d2d;
    stim[49] = 38'h163aeda154;
    stim[50] = 38'h330d054bbb;
    stim[51] = 38'h15f8519e38;
    stim[52] = 38'h178ca6f3de;
    stim[53] = 38'h31b78818ff;
    stim[54] = 38'h289c3d4493;
    stim[55] = 38'h2d6cd637ad;
    stim[56] = 38'h3e9a50f7d3;
    stim[57] = 38'h2ae0bb521b;
    stim[58] = 38'h1d031024ee;
    stim[59] = 38'h15be159441;
    stim[60] = 38'h1a875fbed2;
    stim[61] = 38'h0e36fee5ac;
    stim[62] = 38'h29d88aad0a;
    stim[63] = 38'h1d754f4b8d;
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
      expv[0] = 18'h14618;
      expv[1] = 18'h3fffd;
      expv[2] = 18'h00002;
      expv[3] = 18'h00002;
      expv[4] = 18'h0283c;
      expv[5] = 18'h3fffd;
      expv[6] = 18'h25b19;
      expv[7] = 18'h3aa95;
      expv[8] = 18'h00002;
      expv[9] = 18'h25161;
      expv[10] = 18'h00002;
      expv[11] = 18'h00002;
      expv[12] = 18'h2fbb5;
      expv[13] = 18'h1b3e0;
      expv[14] = 18'h3c3f5;
      expv[15] = 18'h02fe8;
      expv[16] = 18'h0be28;
      expv[17] = 18'h3dcb1;
      expv[18] = 18'h27efd;
      expv[19] = 18'h3bced;
      expv[20] = 18'h27df5;
      expv[21] = 18'h3c0f1;
      expv[22] = 18'h3fff9;
      expv[23] = 18'h3fffd;
      expv[24] = 18'h20445;
      expv[25] = 18'h0e448;
      expv[26] = 18'h1d2bc;
      expv[27] = 18'h0be88;
      expv[28] = 18'h37c5d;
      expv[29] = 18'h39971;
      expv[30] = 18'h3de8d;
      expv[31] = 18'h2a7bd;
      expv[32] = 18'h3fffd;
      expv[33] = 18'h2aa41;
      expv[34] = 18'h00002;
      expv[35] = 18'h221ed;
      expv[36] = 18'h01284;
      expv[37] = 18'h3fffd;
      expv[38] = 18'h1fbfc;
      expv[39] = 18'h00002;
      expv[40] = 18'h3fff9;
      expv[41] = 18'h3a2a5;
      expv[42] = 18'h00002;
      expv[43] = 18'h3ed85;
      expv[44] = 18'h20355;
      expv[45] = 18'h04d80;
      expv[46] = 18'h00002;
      expv[47] = 18'h15a30;
      expv[48] = 18'h3fffd;
      expv[49] = 18'h00440;
      expv[50] = 18'h00002;
      expv[51] = 18'h00002;
      expv[52] = 18'h28731;
      expv[53] = 18'h00004;
      expv[54] = 18'h2b579;
      expv[55] = 18'h3fffd;
      expv[56] = 18'h2da29;
      expv[57] = 18'h2ae09;
      expv[58] = 18'h3fffd;
      expv[59] = 18'h2a6bd;
      expv[60] = 18'h05374;
      expv[61] = 18'h00002;
      expv[62] = 18'h29d89;
      expv[63] = 18'h228a9;
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
