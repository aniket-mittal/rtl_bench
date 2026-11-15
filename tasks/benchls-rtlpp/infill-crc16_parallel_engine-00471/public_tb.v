// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00471 dut (
    .clk(clk),
    .d(in_vec[19:4]),
    .calc(in_vec[3:3]),
    .init(in_vec[2:2]),
    .d_valid(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .crc_reg(out_vec[47:16]),
    .crc(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h1ee65;
    stim[1] = 20'h31ac9;
    stim[2] = 20'h090f0;
    stim[3] = 20'h2d1dc;
    stim[4] = 20'hbb23c;
    stim[5] = 20'hed65a;
    stim[6] = 20'hb22a8;
    stim[7] = 20'hbfeaa;
    stim[8] = 20'hb3b80;
    stim[9] = 20'h3d548;
    stim[10] = 20'h334d0;
    stim[11] = 20'h90c04;
    stim[12] = 20'h3970c;
    stim[13] = 20'hb9f7a;
    stim[14] = 20'h9f6e0;
    stim[15] = 20'h41e4a;
    stim[16] = 20'h796b8;
    stim[17] = 20'h790c2;
    stim[18] = 20'h7989c;
    stim[19] = 20'h68d1e;
    stim[20] = 20'h7cbd6;
    stim[21] = 20'hdc3ba;
    stim[22] = 20'ha5764;
    stim[23] = 20'hf66d0;
    stim[24] = 20'h2918e;
    stim[25] = 20'h3d440;
    stim[26] = 20'h41678;
    stim[27] = 20'h3d0e0;
    stim[28] = 20'h188e6;
    stim[29] = 20'h7f5dc;
    stim[30] = 20'h9903c;
    stim[31] = 20'hd2f6e;
    stim[32] = 20'hca5aa;
    stim[33] = 20'h93f04;
    stim[34] = 20'ha0dca;
    stim[35] = 20'hdfd32;
    stim[36] = 20'h8ba28;
    stim[37] = 20'h67bfa;
    stim[38] = 20'hfb4c2;
    stim[39] = 20'h80474;
    stim[40] = 20'h717a8;
    stim[41] = 20'hcf90c;
    stim[42] = 20'h4cc96;
    stim[43] = 20'h12f64;
    stim[44] = 20'h1b5fa;
    stim[45] = 20'h68a6a;
    stim[46] = 20'h5e0d0;
    stim[47] = 20'hf6482;
    stim[48] = 20'h8a4a2;
    stim[49] = 20'hd423c;
    stim[50] = 20'h08974;
    stim[51] = 20'hdf528;
    stim[52] = 20'h86912;
    stim[53] = 20'h577d8;
    stim[54] = 20'hc8922;
    stim[55] = 20'hfd078;
    stim[56] = 20'h1900e;
    stim[57] = 20'h3ecb0;
    stim[58] = 20'hdf02c;
    stim[59] = 20'haf3ee;
    stim[60] = 20'haee02;
    stim[61] = 20'hb2e30;
    stim[62] = 20'h5e2f8;
    stim[63] = 20'h677de;
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
      expv[0] = 48'hffffffffffff;
      expv[1] = 48'hffffffffffff;
      expv[2] = 48'hffffffffffff;
      expv[3] = 48'hffffffffffff;
      expv[4] = 48'hffffffffffff;
      expv[5] = 48'hffffffffffff;
      expv[6] = 48'he437e81e13d8;
      expv[7] = 48'he437e81e13d8;
      expv[8] = 48'h5a8b6c312ea5;
      expv[9] = 48'h5a8b6c312ea5;
      expv[10] = 48'h5a8b6c312ea5;
      expv[11] = 48'h5a8b6c312ea5;
      expv[12] = 48'hffffffffffff;
      expv[13] = 48'hffffffffffff;
      expv[14] = 48'h4a8966ea6ead;
      expv[15] = 48'h4a8966ea6ead;
      expv[16] = 48'h3131322c7373;
      expv[17] = 48'h3131322c7373;
      expv[18] = 48'h322cffffcbb3;
      expv[19] = 48'hffffffffffff;
      expv[20] = 48'hffffffffffff;
      expv[21] = 48'hffffffffffff;
      expv[22] = 48'he3398fb06338;
      expv[23] = 48'hffffffffffff;
      expv[24] = 48'hffffffffffff;
      expv[25] = 48'hffffffffffff;
      expv[26] = 48'hffffffffffff;
      expv[27] = 48'hffffffffffff;
      expv[28] = 48'hffffffffffff;
      expv[29] = 48'hffffffffffff;
      expv[30] = 48'hffffffffffff;
      expv[31] = 48'hffffffffffff;
      expv[32] = 48'hffffffffffff;
      expv[33] = 48'h0ecec3a18c8f;
      expv[34] = 48'hffffffffffff;
      expv[35] = 48'hdf23bea23b04;
      expv[36] = 48'hbea2ffffba82;
      expv[37] = 48'hbea2ffffba82;
      expv[38] = 48'hebd03534f428;
      expv[39] = 48'h3534ffffd353;
      expv[40] = 48'hffffffffffff;
      expv[41] = 48'hffffffffffff;
      expv[42] = 48'hffffffffffff;
      expv[43] = 48'hffffffffffff;
      expv[44] = 48'hffffffffffff;
      expv[45] = 48'heea606909a88;
      expv[46] = 48'hc18149677e7c;
      expv[47] = 48'hc18149677e7c;
      expv[48] = 48'h4967ffff196d;
      expv[49] = 48'hffffffff0000;
      expv[50] = 48'hffffffffffff;
      expv[51] = 48'hffffffffffff;
      expv[52] = 48'hffffffffffff;
      expv[53] = 48'hffffffff0000;
      expv[54] = 48'hffffffff0000;
      expv[55] = 48'hffffffff0000;
      expv[56] = 48'hffffffff0000;
      expv[57] = 48'hffffffffffff;
      expv[58] = 48'hffffffffffff;
      expv[59] = 48'hffffffffffff;
      expv[60] = 48'hffffffffffff;
      expv[61] = 48'hffffffff0000;
      expv[62] = 48'hffffffff0000;
      expv[63] = 48'hffffffff0000;
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
