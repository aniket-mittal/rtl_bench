// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09561 dut (
    .clk(clk),
    .reset(in_vec[69:69]),
    .enable(in_vec[68:68]),
    .address(in_vec[67:36]),
    .start(in_vec[35:35]),
    .waitrequest(in_vec[34:34]),
    .stall(in_vec[33:33]),
    .fifo_data(in_vec[32:1]),
    .fifo_empty(in_vec[0:0]),
    .write_data(out_vec[32:1]),
    .fifo_readack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h34770445806c2f4b7e;
    stim[1] = 70'h2bbc3e54d9e5a6c631;
    stim[2] = 70'h287ad8f467fb7c41ab;
    stim[3] = 70'h1b98ce508813d284ab;
    stim[4] = 70'h030fe9e2936d2637ed;
    stim[5] = 70'h0424b3a0f106fb221f;
    stim[6] = 70'h143f6db4dc3ca2629d;
    stim[7] = 70'h043902a9913ffa3ae0;
    stim[8] = 70'h0c5d100179c608bcbe;
    stim[9] = 70'h086c58c2750be23cf4;
    stim[10] = 70'h178c8977bb649aa4ce;
    stim[11] = 70'h03459e32c81c436c2d;
    stim[12] = 70'h12adbef89c5e106a8d;
    stim[13] = 70'h1a5d5a3f81e0c53d35;
    stim[14] = 70'h0ef1cff26ca63631b7;
    stim[15] = 70'h1ff129f5cc2039e37c;
    stim[16] = 70'h006a5ee89dfae95ddf;
    stim[17] = 70'h102cc6a45e10bedecd;
    stim[18] = 70'h058659bb56ecf7d3b6;
    stim[19] = 70'h07767fa04dddd5d73b;
    stim[20] = 70'h1e9f0886de48a25362;
    stim[21] = 70'h09e5ce49bd5bae1b6a;
    stim[22] = 70'h011f94f4d918e8ea11;
    stim[23] = 70'h0e84989ae8f70975ac;
    stim[24] = 70'h181a9bb35cee288960;
    stim[25] = 70'h03968885367c6d201c;
    stim[26] = 70'h0b6aa4555806261059;
    stim[27] = 70'h0c4b2ef16e4534eedd;
    stim[28] = 70'h056a3b588aa63f0077;
    stim[29] = 70'h0d29076275dfae48fb;
    stim[30] = 70'h06cfe23119cface1c9;
    stim[31] = 70'h03014577f696c51452;
    stim[32] = 70'h0ab7918e5a97738c7c;
    stim[33] = 70'h129b3f91973064bfb5;
    stim[34] = 70'h0cf01294e3ab503812;
    stim[35] = 70'h0029de206abfe6aec1;
    stim[36] = 70'h0d4134932ef4617a8c;
    stim[37] = 70'h19193c7d46b8056345;
    stim[38] = 70'h1880dc36911f7eab86;
    stim[39] = 70'h075f556c41ad003d0c;
    stim[40] = 70'h0bc6d6beb461a0a452;
    stim[41] = 70'h0851cd059686a87564;
    stim[42] = 70'h1215b517cfed130819;
    stim[43] = 70'h0a12addb0c37bcce1e;
    stim[44] = 70'h0fa5e3ebeccd6540d2;
    stim[45] = 70'h12f924a73807bd9a13;
    stim[46] = 70'h0af14c0131c8880fc0;
    stim[47] = 70'h0d5cd442e186ce0961;
    stim[48] = 70'h131c7d48af50443a0e;
    stim[49] = 70'h0430d25b91b31cbff7;
    stim[50] = 70'h14dd26d535f12c1b94;
    stim[51] = 70'h1e5b03a234e2ac4ae6;
    stim[52] = 70'h137d357baa37bbbf7f;
    stim[53] = 70'h1287516be4c9cbfc71;
    stim[54] = 70'h1ac176754e88090346;
    stim[55] = 70'h129ea25ed033554ae1;
    stim[56] = 70'h022cc4ffae3308ce74;
    stim[57] = 70'h07c93261d28b5da7a1;
    stim[58] = 70'h1e69cfeb4be9c25489;
    stim[59] = 70'h0a97a0822a3960d34c;
    stim[60] = 70'h1bba3783179b571a52;
    stim[61] = 70'h1facccedd3ea8ae475;
    stim[62] = 70'h10d32c7432b81327d7;
    stim[63] = 70'h1878b34b9d0b066652;
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
      expv[0] = 33'h06c2f4b7f;
      expv[1] = 33'h1e5a6c630;
      expv[2] = 33'h1fb7c41aa;
      expv[3] = 33'h013d284aa;
      expv[4] = 33'h16d2637ec;
      expv[5] = 33'h106fb221e;
      expv[6] = 33'h03ca2629c;
      expv[7] = 33'h13ffa3ae0;
      expv[8] = 33'h1c608bcbe;
      expv[9] = 33'h10be23cf4;
      expv[10] = 33'h1649aa4ce;
      expv[11] = 33'h01c436c2c;
      expv[12] = 33'h05e106a8c;
      expv[13] = 33'h1e0c53d34;
      expv[14] = 33'h0a63631b6;
      expv[15] = 33'h02039e37c;
      expv[16] = 33'h1fae95dde;
      expv[17] = 33'h010bedecc;
      expv[18] = 33'h0ecf7d3b6;
      expv[19] = 33'h1ddd5d73a;
      expv[20] = 33'h048a25362;
      expv[21] = 33'h15bae1b6a;
      expv[22] = 33'h118e8ea10;
      expv[23] = 33'h0f70975ac;
      expv[24] = 33'h0ee288960;
      expv[25] = 33'h07c6d201c;
      expv[26] = 33'h006261058;
      expv[27] = 33'h04534eedc;
      expv[28] = 33'h0a63f0076;
      expv[29] = 33'h1dfae48fa;
      expv[30] = 33'h1cface1c8;
      expv[31] = 33'h096c51452;
      expv[32] = 33'h097738c7c;
      expv[33] = 33'h13064bfb4;
      expv[34] = 33'h1ab503812;
      expv[35] = 33'h0bfe6aec0;
      expv[36] = 33'h0f4617a8c;
      expv[37] = 33'h0b8056344;
      expv[38] = 33'h11f7eab87;
      expv[39] = 33'h1ad003d0c;
      expv[40] = 33'h061a0a452;
      expv[41] = 33'h086a87564;
      expv[42] = 33'h1ed130818;
      expv[43] = 33'h037bcce1e;
      expv[44] = 33'h0cd6540d2;
      expv[45] = 33'h007bd9a12;
      expv[46] = 33'h1c8880fc0;
      expv[47] = 33'h186ce0960;
      expv[48] = 33'h150443a0e;
      expv[49] = 33'h1b31cbff6;
      expv[50] = 33'h1f12c1b94;
      expv[51] = 33'h0e2ac4ae6;
      expv[52] = 33'h037bbbf7e;
      expv[53] = 33'h0c9cbfc70;
      expv[54] = 33'h088090346;
      expv[55] = 33'h033554ae0;
      expv[56] = 33'h03308ce74;
      expv[57] = 33'h08b5da7a0;
      expv[58] = 33'h1e9c25488;
      expv[59] = 33'h03960d34c;
      expv[60] = 33'h19b571a52;
      expv[61] = 33'h1ea8ae474;
      expv[62] = 33'h0b81327d6;
      expv[63] = 33'h10b066652;
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
