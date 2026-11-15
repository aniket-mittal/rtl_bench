// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 24;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_085793 dut (
    .c(in_vec[23:0]),
    .m(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 24'hc1b6ad;
    stim[1] = 24'h50bd9e;
    stim[2] = 24'h7f915c;
    stim[3] = 24'h39fb0d;
    stim[4] = 24'h259776;
    stim[5] = 24'h2812ab;
    stim[6] = 24'hb84ec2;
    stim[7] = 24'h0e64f5;
    stim[8] = 24'ha48787;
    stim[9] = 24'h59e615;
    stim[10] = 24'h88785c;
    stim[11] = 24'h9b6ba3;
    stim[12] = 24'h2486a3;
    stim[13] = 24'h5f91e6;
    stim[14] = 24'h725d38;
    stim[15] = 24'h5087f2;
    stim[16] = 24'h296103;
    stim[17] = 24'hdd7333;
    stim[18] = 24'hf145f9;
    stim[19] = 24'h58450a;
    stim[20] = 24'h2408a8;
    stim[21] = 24'hbdfde9;
    stim[22] = 24'h4eda8a;
    stim[23] = 24'hde3e4e;
    stim[24] = 24'hc98892;
    stim[25] = 24'h6b2d85;
    stim[26] = 24'h63ddc8;
    stim[27] = 24'h65a382;
    stim[28] = 24'h4544ac;
    stim[29] = 24'hf692d0;
    stim[30] = 24'h4f3c32;
    stim[31] = 24'h0a7d9f;
    stim[32] = 24'hd67047;
    stim[33] = 24'hdc7144;
    stim[34] = 24'h9a4fea;
    stim[35] = 24'hd8c442;
    stim[36] = 24'h9196d0;
    stim[37] = 24'h58935e;
    stim[38] = 24'he4f429;
    stim[39] = 24'hbb09fd;
    stim[40] = 24'he2ab09;
    stim[41] = 24'h22bfde;
    stim[42] = 24'h519b5a;
    stim[43] = 24'h8a9119;
    stim[44] = 24'he29fa4;
    stim[45] = 24'hb141fd;
    stim[46] = 24'hafb638;
    stim[47] = 24'he3472d;
    stim[48] = 24'h56c578;
    stim[49] = 24'he36b30;
    stim[50] = 24'h1f5362;
    stim[51] = 24'h6ebc33;
    stim[52] = 24'h3d1e01;
    stim[53] = 24'ha9425e;
    stim[54] = 24'h20236c;
    stim[55] = 24'hbe9350;
    stim[56] = 24'h2e654d;
    stim[57] = 24'h08cf21;
    stim[58] = 24'hceff1e;
    stim[59] = 24'h0aa803;
    stim[60] = 24'h4edd1e;
    stim[61] = 24'hdf6678;
    stim[62] = 24'h13512c;
    stim[63] = 24'h0dff12;
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
      expv[0] = 16'hc1b6;
      expv[1] = 16'h50bd;
      expv[2] = 16'h7f90;
      expv[3] = 16'h39fb;
      expv[4] = 16'h2597;
      expv[5] = 16'h2812;
      expv[6] = 16'hb84e;
      expv[7] = 16'h0e64;
      expv[8] = 16'ha487;
      expv[9] = 16'h59e6;
      expv[10] = 16'h8878;
      expv[11] = 16'h9b6b;
      expv[12] = 16'h2486;
      expv[13] = 16'h5f91;
      expv[14] = 16'h725d;
      expv[15] = 16'h5e87;
      expv[16] = 16'h2967;
      expv[17] = 16'hdd79;
      expv[18] = 16'hf105;
      expv[19] = 16'h5845;
      expv[20] = 16'h2408;
      expv[21] = 16'hbdfd;
      expv[22] = 16'h4dda;
      expv[23] = 16'hde3e;
      expv[24] = 16'hc988;
      expv[25] = 16'h6b2d;
      expv[26] = 16'h63dd;
      expv[27] = 16'h65a3;
      expv[28] = 16'h4544;
      expv[29] = 16'hf692;
      expv[30] = 16'h4f3c;
      expv[31] = 16'h0e7d;
      expv[32] = 16'hd670;
      expv[33] = 16'hdc71;
      expv[34] = 16'h904f;
      expv[35] = 16'hd8c4;
      expv[36] = 16'h9196;
      expv[37] = 16'h5893;
      expv[38] = 16'heef4;
      expv[39] = 16'hbb09;
      expv[40] = 16'he2ab;
      expv[41] = 16'h22bf;
      expv[42] = 16'h519b;
      expv[43] = 16'h8a9d;
      expv[44] = 16'he29f;
      expv[45] = 16'hb141;
      expv[46] = 16'hafb6;
      expv[47] = 16'he347;
      expv[48] = 16'h56c5;
      expv[49] = 16'he36b;
      expv[50] = 16'h1f53;
      expv[51] = 16'h6ebc;
      expv[52] = 16'h3d1e;
      expv[53] = 16'ha942;
      expv[54] = 16'h2021;
      expv[55] = 16'hbe93;
      expv[56] = 16'h2e65;
      expv[57] = 16'h08cf;
      expv[58] = 16'hceff;
      expv[59] = 16'h0ab8;
      expv[60] = 16'h4f5d;
      expv[61] = 16'hdf66;
      expv[62] = 16'h1451;
      expv[63] = 16'h0dff;
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
