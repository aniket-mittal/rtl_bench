// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_134616 dut (
    .A0(in_vec[17:14]),
    .A1(in_vec[13:10]),
    .A2(in_vec[9:6]),
    .A3(in_vec[5:2]),
    .S0(in_vec[1:1]),
    .S1(in_vec[0:0]),
    .X(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h189f0;
    stim[1] = 18'h2264d;
    stim[2] = 18'h29b50;
    stim[3] = 18'h2e934;
    stim[4] = 18'h35fde;
    stim[5] = 18'h37dd7;
    stim[6] = 18'h19534;
    stim[7] = 18'h24fb5;
    stim[8] = 18'h0d9de;
    stim[9] = 18'h16e62;
    stim[10] = 18'h25221;
    stim[11] = 18'h1b878;
    stim[12] = 18'h114af;
    stim[13] = 18'h25123;
    stim[14] = 18'h1ee4a;
    stim[15] = 18'h0c71b;
    stim[16] = 18'h20a7a;
    stim[17] = 18'h14589;
    stim[18] = 18'h3f307;
    stim[19] = 18'h14e00;
    stim[20] = 18'h05038;
    stim[21] = 18'h01959;
    stim[22] = 18'h1f2d8;
    stim[23] = 18'h3fd2a;
    stim[24] = 18'h21aee;
    stim[25] = 18'h29e14;
    stim[26] = 18'h2a1bd;
    stim[27] = 18'h3c4d9;
    stim[28] = 18'h0bdf5;
    stim[29] = 18'h07798;
    stim[30] = 18'h38b51;
    stim[31] = 18'h3879f;
    stim[32] = 18'h3df4d;
    stim[33] = 18'h2ef46;
    stim[34] = 18'h0056b;
    stim[35] = 18'h169e9;
    stim[36] = 18'h1b00f;
    stim[37] = 18'h0920a;
    stim[38] = 18'h086a1;
    stim[39] = 18'h3b5e5;
    stim[40] = 18'h10cc0;
    stim[41] = 18'h3c82e;
    stim[42] = 18'h256ae;
    stim[43] = 18'h13391;
    stim[44] = 18'h01f74;
    stim[45] = 18'h1b35c;
    stim[46] = 18'h3cb1b;
    stim[47] = 18'h23f7b;
    stim[48] = 18'h1982b;
    stim[49] = 18'h2fc44;
    stim[50] = 18'h00f43;
    stim[51] = 18'h36774;
    stim[52] = 18'h37d49;
    stim[53] = 18'h35942;
    stim[54] = 18'h03a09;
    stim[55] = 18'h2a889;
    stim[56] = 18'h12093;
    stim[57] = 18'h17adf;
    stim[58] = 18'h3c64a;
    stim[59] = 18'h34f72;
    stim[60] = 18'h1530a;
    stim[61] = 18'h309e5;
    stim[62] = 18'h26243;
    stim[63] = 18'h3afcc;
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
      expv[1] = 1'h1;
      expv[2] = 1'h0;
      expv[3] = 1'h1;
      expv[4] = 1'h1;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h1;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h1;
      expv[13] = 1'h0;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h1;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h1;
      expv[32] = 1'h1;
      expv[33] = 1'h1;
      expv[34] = 1'h0;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h1;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h1;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h1;
      expv[50] = 1'h0;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h1;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h0;
      expv[61] = 1'h1;
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
