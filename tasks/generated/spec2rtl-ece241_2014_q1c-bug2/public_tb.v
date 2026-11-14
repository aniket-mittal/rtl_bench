// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .s(out_vec[8:1]),
    .overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h864d;
    stim[1] = 16'h0065;
    stim[2] = 16'hdf6d;
    stim[3] = 16'h6be7;
    stim[4] = 16'h21a5;
    stim[5] = 16'h6be6;
    stim[6] = 16'h78f0;
    stim[7] = 16'h6725;
    stim[8] = 16'h4d2f;
    stim[9] = 16'h3eb4;
    stim[10] = 16'hc8ff;
    stim[11] = 16'h25e4;
    stim[12] = 16'h1211;
    stim[13] = 16'h9f16;
    stim[14] = 16'h3d9d;
    stim[15] = 16'h0514;
    stim[16] = 16'h68f9;
    stim[17] = 16'hf57e;
    stim[18] = 16'h297a;
    stim[19] = 16'h8ae4;
    stim[20] = 16'hd0ba;
    stim[21] = 16'ha5bb;
    stim[22] = 16'h183c;
    stim[23] = 16'h1102;
    stim[24] = 16'h5982;
    stim[25] = 16'hd909;
    stim[26] = 16'h3452;
    stim[27] = 16'h1442;
    stim[28] = 16'hed2d;
    stim[29] = 16'hd3c9;
    stim[30] = 16'h8a34;
    stim[31] = 16'h9e0f;
    stim[32] = 16'hed55;
    stim[33] = 16'h697a;
    stim[34] = 16'h66e4;
    stim[35] = 16'h5417;
    stim[36] = 16'hf383;
    stim[37] = 16'hc13d;
    stim[38] = 16'h6913;
    stim[39] = 16'h31bc;
    stim[40] = 16'h303f;
    stim[41] = 16'h5fd3;
    stim[42] = 16'h2a4b;
    stim[43] = 16'hd345;
    stim[44] = 16'ha843;
    stim[45] = 16'h9415;
    stim[46] = 16'he975;
    stim[47] = 16'h3066;
    stim[48] = 16'hd172;
    stim[49] = 16'h04c6;
    stim[50] = 16'h2545;
    stim[51] = 16'he23a;
    stim[52] = 16'h85af;
    stim[53] = 16'h7105;
    stim[54] = 16'he920;
    stim[55] = 16'h1e38;
    stim[56] = 16'hf792;
    stim[57] = 16'h359f;
    stim[58] = 16'hcab0;
    stim[59] = 16'hcd5f;
    stim[60] = 16'h5b8a;
    stim[61] = 16'h12c2;
    stim[62] = 16'hb623;
    stim[63] = 16'h0cdd;
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
      expv[0] = 9'h0a6;
      expv[1] = 9'h0ca;
      expv[2] = 9'h198;
      expv[3] = 9'h1a4;
      expv[4] = 9'h08c;
      expv[5] = 9'h1a2;
      expv[6] = 9'h1d0;
      expv[7] = 9'h119;
      expv[8] = 9'h0f8;
      expv[9] = 9'h0e4;
      expv[10] = 9'h18e;
      expv[11] = 9'h112;
      expv[12] = 9'h046;
      expv[13] = 9'h06a;
      expv[14] = 9'h0b4;
      expv[15] = 9'h032;
      expv[16] = 9'h1c2;
      expv[17] = 9'h1e6;
      expv[18] = 9'h147;
      expv[19] = 9'h0dd;
      expv[20] = 9'h114;
      expv[21] = 9'h0c1;
      expv[22] = 9'h0a8;
      expv[23] = 9'h026;
      expv[24] = 9'h0b6;
      expv[25] = 9'h0c4;
      expv[26] = 9'h10d;
      expv[27] = 9'h0ac;
      expv[28] = 9'h134;
      expv[29] = 9'h138;
      expv[30] = 9'h07c;
      expv[31] = 9'h05a;
      expv[32] = 9'h184;
      expv[33] = 9'h1c7;
      expv[34] = 9'h194;
      expv[35] = 9'h0d6;
      expv[36] = 9'h0ed;
      expv[37] = 9'h0fc;
      expv[38] = 9'h0f8;
      expv[39] = 9'h0da;
      expv[40] = 9'h0de;
      expv[41] = 9'h164;
      expv[42] = 9'h0ea;
      expv[43] = 9'h130;
      expv[44] = 9'h0d6;
      expv[45] = 9'h052;
      expv[46] = 9'h1bc;
      expv[47] = 9'h12d;
      expv[48] = 9'h186;
      expv[49] = 9'h094;
      expv[50] = 9'h0d4;
      expv[51] = 9'h138;
      expv[52] = 9'h069;
      expv[53] = 9'h0ec;
      expv[54] = 9'h112;
      expv[55] = 9'h0ac;
      expv[56] = 9'h112;
      expv[57] = 9'h0a8;
      expv[58] = 9'h0f5;
      expv[59] = 9'h158;
      expv[60] = 9'h0ca;
      expv[61] = 9'h0a8;
      expv[62] = 9'h0b2;
      expv[63] = 9'h0d2;
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
