// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_115184 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h441be8c7c;
    stim[1] = 35'h686c2b26a;
    stim[2] = 35'h213ad927c;
    stim[3] = 35'h003d5fde9;
    stim[4] = 35'h0a0d230ad;
    stim[5] = 35'h01ebd367d;
    stim[6] = 35'h1e6fa5ceb;
    stim[7] = 35'h285784d15;
    stim[8] = 35'h012feeda0;
    stim[9] = 35'h14f6e12b2;
    stim[10] = 35'h095ae0f85;
    stim[11] = 35'h04304ac00;
    stim[12] = 35'h333b867b0;
    stim[13] = 35'h3414f8f0f;
    stim[14] = 35'h0963fdbdc;
    stim[15] = 35'h18012a5f2;
    stim[16] = 35'h020c85570;
    stim[17] = 35'h0f47644a6;
    stim[18] = 35'h06868a33e;
    stim[19] = 35'h2c99c5e91;
    stim[20] = 35'h349eaea84;
    stim[21] = 35'h16c9bab3e;
    stim[22] = 35'h139e16478;
    stim[23] = 35'h2cb6b628f;
    stim[24] = 35'h0af7b1aca;
    stim[25] = 35'h2840ab4f3;
    stim[26] = 35'h16cb6d7c6;
    stim[27] = 35'h3b5e0027b;
    stim[28] = 35'h2d321ab3a;
    stim[29] = 35'h788dea9f2;
    stim[30] = 35'h099693613;
    stim[31] = 35'h49bd97450;
    stim[32] = 35'h151e755ac;
    stim[33] = 35'h1d9342492;
    stim[34] = 35'h139d2bb5a;
    stim[35] = 35'h23bc385b6;
    stim[36] = 35'h1e4676b36;
    stim[37] = 35'h398b9e3a8;
    stim[38] = 35'h1f2786b84;
    stim[39] = 35'h0a4ffec6f;
    stim[40] = 35'h041838b79;
    stim[41] = 35'h12475e2f8;
    stim[42] = 35'h1148d7820;
    stim[43] = 35'h3e1a36e12;
    stim[44] = 35'h21a6b6091;
    stim[45] = 35'h31307af27;
    stim[46] = 35'h3cc3b4cb7;
    stim[47] = 35'h34d1cf5be;
    stim[48] = 35'h0a60cbead;
    stim[49] = 35'h31c9fd7be;
    stim[50] = 35'h07c7cf6e7;
    stim[51] = 35'h060e7fff1;
    stim[52] = 35'h30c841a78;
    stim[53] = 35'h1c1a95afa;
    stim[54] = 35'h3c2dbf642;
    stim[55] = 35'h20b2aed6d;
    stim[56] = 35'h0f20b80a4;
    stim[57] = 35'h26df59898;
    stim[58] = 35'h3b9c74760;
    stim[59] = 35'h30e64009c;
    stim[60] = 35'h261ba71a9;
    stim[61] = 35'h2da46b379;
    stim[62] = 35'h17182ed0e;
    stim[63] = 35'h33edb3dc8;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h286c2b268;
      expv[3] = 35'h613ad927c;
      expv[4] = 35'h403d5fde8;
      expv[5] = 35'h4a0d230ac;
      expv[6] = 35'h41ebd367c;
      expv[7] = 35'h5e6fa5cea;
      expv[8] = 35'h685784d14;
      expv[9] = 35'h412feeda0;
      expv[10] = 35'h54f6e12b2;
      expv[11] = 35'h495ae0f84;
      expv[12] = 35'h44304ac00;
      expv[13] = 35'h733b867b0;
      expv[14] = 35'h7414f8f0f;
      expv[15] = 35'h7414f8f0f;
      expv[16] = 35'h3414f8f0f;
      expv[17] = 35'h3414f8f0f;
      expv[18] = 35'h3414f8f0f;
      expv[19] = 35'h3414f8f0f;
      expv[20] = 35'h58012a5f3;
      expv[21] = 35'h58012a5f3;
      expv[22] = 35'h18012a5f3;
      expv[23] = 35'h18012a5f3;
      expv[24] = 35'h56c9bab3f;
      expv[25] = 35'h16c9bab3f;
      expv[26] = 35'h4af7b1acb;
      expv[27] = 35'h0af7b1acb;
      expv[28] = 35'h56cb6d7c7;
      expv[29] = 35'h16cb6d7c7;
      expv[30] = 35'h16cb6d7c4;
      expv[31] = 35'h499693610;
      expv[32] = 35'h09bd97450;
      expv[33] = 35'h551e755ac;
      expv[34] = 35'h5d9342493;
      expv[35] = 35'h1d9342493;
      expv[36] = 35'h1d9342493;
      expv[37] = 35'h1d9342493;
      expv[38] = 35'h1d9342493;
      expv[39] = 35'h1d9342493;
      expv[40] = 35'h539d2bb5a;
      expv[41] = 35'h441838b78;
      expv[42] = 35'h52475e2f8;
      expv[43] = 35'h5148d7820;
      expv[44] = 35'h7e1a36e12;
      expv[45] = 35'h61a6b6090;
      expv[46] = 35'h71307af26;
      expv[47] = 35'h7cc3b4cb7;
      expv[48] = 35'h3cc3b4cb7;
      expv[49] = 35'h74d1cf5bf;
      expv[50] = 35'h34d1cf5bf;
      expv[51] = 35'h71c9fd7be;
      expv[52] = 35'h460e7fff0;
      expv[53] = 35'h70c841a78;
      expv[54] = 35'h5c1a95afb;
      expv[55] = 35'h1c1a95afb;
      expv[56] = 35'h7c2dbf643;
      expv[57] = 35'h7c2dbf643;
      expv[58] = 35'h7c2dbf643;
      expv[59] = 35'h7c2dbf643;
      expv[60] = 35'h7c2dbf642;
      expv[61] = 35'h661ba71a8;
      expv[62] = 35'h6da46b378;
      expv[63] = 35'h57182ed0f;
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
