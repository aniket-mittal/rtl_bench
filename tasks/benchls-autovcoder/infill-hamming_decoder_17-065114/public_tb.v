// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_065114 dut (
    .codeword(in_vec[16:0]),
    .esti_bits(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1334f;
    stim[1] = 17'h162c5;
    stim[2] = 17'h131d2;
    stim[3] = 17'h085b9;
    stim[4] = 17'h0dde6;
    stim[5] = 17'h0ca27;
    stim[6] = 17'h019c4;
    stim[7] = 17'h1f401;
    stim[8] = 17'h05e01;
    stim[9] = 17'h0dc19;
    stim[10] = 17'h0775a;
    stim[11] = 17'h1536f;
    stim[12] = 17'h0aef4;
    stim[13] = 17'h0c8cf;
    stim[14] = 17'h09b55;
    stim[15] = 17'h0a65c;
    stim[16] = 17'h0b446;
    stim[17] = 17'h1827e;
    stim[18] = 17'h03bc3;
    stim[19] = 17'h0face;
    stim[20] = 17'h17f9f;
    stim[21] = 17'h161f4;
    stim[22] = 17'h17a17;
    stim[23] = 17'h07eda;
    stim[24] = 17'h04611;
    stim[25] = 17'h00da6;
    stim[26] = 17'h05f56;
    stim[27] = 17'h0ea51;
    stim[28] = 17'h0601d;
    stim[29] = 17'h1e793;
    stim[30] = 17'h16818;
    stim[31] = 17'h02d2e;
    stim[32] = 17'h059d7;
    stim[33] = 17'h10bc4;
    stim[34] = 17'h0e5f9;
    stim[35] = 17'h0e04c;
    stim[36] = 17'h1671c;
    stim[37] = 17'h12c53;
    stim[38] = 17'h1d69e;
    stim[39] = 17'h00d68;
    stim[40] = 17'h1b643;
    stim[41] = 17'h14f0f;
    stim[42] = 17'h1b064;
    stim[43] = 17'h10c30;
    stim[44] = 17'h0c424;
    stim[45] = 17'h1f3aa;
    stim[46] = 17'h197b4;
    stim[47] = 17'h11429;
    stim[48] = 17'h0f715;
    stim[49] = 17'h06c79;
    stim[50] = 17'h169e5;
    stim[51] = 17'h157ac;
    stim[52] = 17'h1c7d9;
    stim[53] = 17'h0d72e;
    stim[54] = 17'h0e09b;
    stim[55] = 17'h0d8e3;
    stim[56] = 17'h0750a;
    stim[57] = 17'h0deb3;
    stim[58] = 17'h1e744;
    stim[59] = 17'h1adf5;
    stim[60] = 17'h09226;
    stim[61] = 17'h0b2e3;
    stim[62] = 17'h19402;
    stim[63] = 17'h1c6d8;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hb0a;
      expv[3] = 12'hb0a;
      expv[4] = 12'hb0a;
      expv[5] = 12'hb0a;
      expv[6] = 12'h089;
      expv[7] = 12'hd50;
      expv[8] = 12'h5f8;
      expv[9] = 12'h5da;
      expv[10] = 12'h77a;
      expv[11] = 12'hd3d;
      expv[12] = 12'hd3d;
      expv[13] = 12'hc99;
      expv[14] = 12'h9ab;
      expv[15] = 12'h9ab;
      expv[16] = 12'h9ab;
      expv[17] = 12'h83e;
      expv[18] = 12'h3b8;
      expv[19] = 12'h7a9;
      expv[20] = 12'h7a9;
      expv[21] = 12'h7a9;
      expv[22] = 12'h7a9;
      expv[23] = 12'h7fa;
      expv[24] = 12'h473;
      expv[25] = 12'h0c5;
      expv[26] = 12'h56b;
      expv[27] = 12'h63a;
      expv[28] = 12'h653;
      expv[29] = 12'ha62;
      expv[30] = 12'h692;
      expv[31] = 12'h2e5;
      expv[32] = 12'h58b;
      expv[33] = 12'h8a9;
      expv[34] = 12'h64e;
      expv[35] = 12'he19;
      expv[36] = 12'he19;
      expv[37] = 12'hada;
      expv[38] = 12'hd72;
      expv[39] = 12'h0cc;
      expv[40] = 12'h978;
      expv[41] = 12'hce1;
      expv[42] = 12'hb0d;
      expv[43] = 12'h8c6;
      expv[44] = 12'h8c6;
      expv[45] = 12'hb24;
      expv[46] = 12'h965;
      expv[47] = 12'h956;
      expv[48] = 12'h763;
      expv[49] = 12'h4de;
      expv[50] = 12'hc8d;
      expv[51] = 12'hc8d;
      expv[52] = 12'hc62;
      expv[53] = 12'h565;
      expv[54] = 12'he12;
      expv[55] = 12'hd9c;
      expv[56] = 12'h740;
      expv[57] = 12'hdf6;
      expv[58] = 12'he6b;
      expv[59] = 12'hacb;
      expv[60] = 12'h131;
      expv[61] = 12'hb3c;
      expv[62] = 12'h9d0;
      expv[63] = 12'hc7a;
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
