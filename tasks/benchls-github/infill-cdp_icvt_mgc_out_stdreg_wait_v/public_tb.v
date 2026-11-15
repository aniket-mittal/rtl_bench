// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  CDP_ICVT_mgc_out_stdreg_wait_v1 dut (
    .ld(in_vec[9:9]),
    .d(in_vec[8:1]),
    .vz(in_vec[0:0]),
    .vd(out_vec[9:9]),
    .lz(out_vec[8:8]),
    .z(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h234;
    stim[1] = 10'h1bf;
    stim[2] = 10'h24a;
    stim[3] = 10'h36a;
    stim[4] = 10'h3bb;
    stim[5] = 10'h09f;
    stim[6] = 10'h1a9;
    stim[7] = 10'h2e3;
    stim[8] = 10'h086;
    stim[9] = 10'h394;
    stim[10] = 10'h286;
    stim[11] = 10'h0ae;
    stim[12] = 10'h1ee;
    stim[13] = 10'h224;
    stim[14] = 10'h239;
    stim[15] = 10'h2ee;
    stim[16] = 10'h133;
    stim[17] = 10'h1a8;
    stim[18] = 10'h310;
    stim[19] = 10'h2e8;
    stim[20] = 10'h378;
    stim[21] = 10'h24f;
    stim[22] = 10'h2ef;
    stim[23] = 10'h18e;
    stim[24] = 10'h029;
    stim[25] = 10'h261;
    stim[26] = 10'h37d;
    stim[27] = 10'h2c2;
    stim[28] = 10'h2c0;
    stim[29] = 10'h2f4;
    stim[30] = 10'h369;
    stim[31] = 10'h3dd;
    stim[32] = 10'h2e3;
    stim[33] = 10'h1f6;
    stim[34] = 10'h06e;
    stim[35] = 10'h0e9;
    stim[36] = 10'h0ad;
    stim[37] = 10'h0a2;
    stim[38] = 10'h1ba;
    stim[39] = 10'h2b8;
    stim[40] = 10'h2cf;
    stim[41] = 10'h061;
    stim[42] = 10'h141;
    stim[43] = 10'h149;
    stim[44] = 10'h2a3;
    stim[45] = 10'h202;
    stim[46] = 10'h105;
    stim[47] = 10'h3d6;
    stim[48] = 10'h22c;
    stim[49] = 10'h3f5;
    stim[50] = 10'h174;
    stim[51] = 10'h29b;
    stim[52] = 10'h06f;
    stim[53] = 10'h12c;
    stim[54] = 10'h042;
    stim[55] = 10'h22e;
    stim[56] = 10'h0f5;
    stim[57] = 10'h06a;
    stim[58] = 10'h0a3;
    stim[59] = 10'h147;
    stim[60] = 10'h38c;
    stim[61] = 10'h0f0;
    stim[62] = 10'h2a6;
    stim[63] = 10'h218;
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
      expv[0] = 10'h11a;
      expv[1] = 10'h2df;
      expv[2] = 10'h125;
      expv[3] = 10'h1b5;
      expv[4] = 10'h3dd;
      expv[5] = 10'h24f;
      expv[6] = 10'h2d4;
      expv[7] = 10'h371;
      expv[8] = 10'h043;
      expv[9] = 10'h1ca;
      expv[10] = 10'h143;
      expv[11] = 10'h057;
      expv[12] = 10'h0f7;
      expv[13] = 10'h112;
      expv[14] = 10'h31c;
      expv[15] = 10'h177;
      expv[16] = 10'h299;
      expv[17] = 10'h0d4;
      expv[18] = 10'h188;
      expv[19] = 10'h174;
      expv[20] = 10'h1bc;
      expv[21] = 10'h327;
      expv[22] = 10'h377;
      expv[23] = 10'h0c7;
      expv[24] = 10'h214;
      expv[25] = 10'h330;
      expv[26] = 10'h3be;
      expv[27] = 10'h161;
      expv[28] = 10'h160;
      expv[29] = 10'h17a;
      expv[30] = 10'h3b4;
      expv[31] = 10'h3ee;
      expv[32] = 10'h371;
      expv[33] = 10'h0fb;
      expv[34] = 10'h037;
      expv[35] = 10'h274;
      expv[36] = 10'h256;
      expv[37] = 10'h051;
      expv[38] = 10'h0dd;
      expv[39] = 10'h15c;
      expv[40] = 10'h367;
      expv[41] = 10'h230;
      expv[42] = 10'h2a0;
      expv[43] = 10'h2a4;
      expv[44] = 10'h351;
      expv[45] = 10'h101;
      expv[46] = 10'h282;
      expv[47] = 10'h1eb;
      expv[48] = 10'h116;
      expv[49] = 10'h3fa;
      expv[50] = 10'h0ba;
      expv[51] = 10'h34d;
      expv[52] = 10'h237;
      expv[53] = 10'h096;
      expv[54] = 10'h021;
      expv[55] = 10'h117;
      expv[56] = 10'h27a;
      expv[57] = 10'h035;
      expv[58] = 10'h251;
      expv[59] = 10'h2a3;
      expv[60] = 10'h1c6;
      expv[61] = 10'h078;
      expv[62] = 10'h153;
      expv[63] = 10'h10c;
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
