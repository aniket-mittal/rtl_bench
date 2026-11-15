// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_080381 dut (
    .clk(clk),
    .word_in(in_vec[16:1]),
    .rst(in_vec[0:0]),
    .mixed_word(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h04609;
    stim[1] = 17'h0d833;
    stim[2] = 17'h031be;
    stim[3] = 17'h1c2b2;
    stim[4] = 17'h098b6;
    stim[5] = 17'h11abe;
    stim[6] = 17'h0101e;
    stim[7] = 17'h12e04;
    stim[8] = 17'h1befa;
    stim[9] = 17'h155fa;
    stim[10] = 17'h008bc;
    stim[11] = 17'h1375a;
    stim[12] = 17'h002ce;
    stim[13] = 17'h0f750;
    stim[14] = 17'h1dac8;
    stim[15] = 17'h166c8;
    stim[16] = 17'h1c27e;
    stim[17] = 17'h02464;
    stim[18] = 17'h00558;
    stim[19] = 17'h1b198;
    stim[20] = 17'h1741a;
    stim[21] = 17'h1c55e;
    stim[22] = 17'h1d220;
    stim[23] = 17'h02120;
    stim[24] = 17'h11660;
    stim[25] = 17'h0de1a;
    stim[26] = 17'h124fc;
    stim[27] = 17'h0f0e0;
    stim[28] = 17'h0d62a;
    stim[29] = 17'h0c11c;
    stim[30] = 17'h158ee;
    stim[31] = 17'h10a80;
    stim[32] = 17'h0ff34;
    stim[33] = 17'h0192a;
    stim[34] = 17'h07fc2;
    stim[35] = 17'h0b4a2;
    stim[36] = 17'h1f38c;
    stim[37] = 17'h0142a;
    stim[38] = 17'h1c610;
    stim[39] = 17'h018b4;
    stim[40] = 17'h0ab40;
    stim[41] = 17'h057d8;
    stim[42] = 17'h1d09a;
    stim[43] = 17'h1ddca;
    stim[44] = 17'h0f028;
    stim[45] = 17'h124fa;
    stim[46] = 17'h18254;
    stim[47] = 17'h07a1a;
    stim[48] = 17'h1856c;
    stim[49] = 17'h1e3ce;
    stim[50] = 17'h086f0;
    stim[51] = 17'h185f8;
    stim[52] = 17'h16328;
    stim[53] = 17'h00aba;
    stim[54] = 17'h11f96;
    stim[55] = 17'h0f11c;
    stim[56] = 17'h19272;
    stim[57] = 17'h0de3c;
    stim[58] = 17'h0b056;
    stim[59] = 17'h12732;
    stim[60] = 17'h0eef8;
    stim[61] = 17'h03ece;
    stim[62] = 17'h176ec;
    stim[63] = 17'h09e42;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'hc245;
      expv[4] = 16'hbc20;
      expv[5] = 16'hc672;
      expv[6] = 16'h4d60;
      expv[7] = 16'h143b;
      expv[8] = 16'hf0ce;
      expv[9] = 16'h47f7;
      expv[10] = 16'hb232;
      expv[11] = 16'hd6d2;
      expv[12] = 16'hd393;
      expv[13] = 16'h5715;
      expv[14] = 16'h5871;
      expv[15] = 16'h6565;
      expv[16] = 16'h08f2;
      expv[17] = 16'h4259;
      expv[18] = 16'hd361;
      expv[19] = 16'he56e;
      expv[20] = 16'h58aa;
      expv[21] = 16'h3517;
      expv[22] = 16'h0157;
      expv[23] = 16'h6194;
      expv[24] = 16'hd86c;
      expv[25] = 16'h8404;
      expv[26] = 16'h6870;
      expv[27] = 16'h6302;
      expv[28] = 16'h7bec;
      expv[29] = 16'hfd57;
      expv[30] = 16'hdaeb;
      expv[31] = 16'he6f3;
      expv[32] = 16'h164d;
      expv[33] = 16'h5176;
      expv[34] = 16'h098c;
      expv[35] = 16'h65fa;
      expv[36] = 16'h171a;
      expv[37] = 16'h384e;
      expv[38] = 16'h1ed3;
      expv[39] = 16'h861b;
      expv[40] = 16'haca8;
      expv[41] = 16'h2c84;
      expv[42] = 16'hd39b;
      expv[43] = 16'h06f9;
      expv[44] = 16'h10d3;
      expv[45] = 16'hea4a;
      expv[46] = 16'h6743;
      expv[47] = 16'hfbf9;
      expv[48] = 16'h606e;
      expv[49] = 16'h18d7;
      expv[50] = 16'hda35;
      expv[51] = 16'hf8c8;
      expv[52] = 16'hc5e3;
      expv[53] = 16'h8ce1;
      expv[54] = 16'h158e;
      expv[55] = 16'h0b6a;
      expv[56] = 16'hbf5e;
      expv[57] = 16'h09c3;
      expv[58] = 16'h18e2;
      expv[59] = 16'hd805;
      expv[60] = 16'hcbc0;
      expv[61] = 16'h929a;
      expv[62] = 16'heddb;
      expv[63] = 16'h3166;
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
