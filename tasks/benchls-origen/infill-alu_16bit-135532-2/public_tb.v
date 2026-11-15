// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_135532 dut (
    .A(in_vec[35:20]),
    .B(in_vec[19:4]),
    .CTRL(in_vec[3:0]),
    .Result(out_vec[16:1]),
    .Overflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'h73595bee7;
    stim[1] = 36'h9b7b055ea;
    stim[2] = 36'h3b5ff321d;
    stim[3] = 36'h04cecf7b3;
    stim[4] = 36'haa372bb30;
    stim[5] = 36'hf45165355;
    stim[6] = 36'h850c1ec1b;
    stim[7] = 36'hf67419341;
    stim[8] = 36'ha3ed8bf6b;
    stim[9] = 36'hfbec33a58;
    stim[10] = 36'h71c6aac1f;
    stim[11] = 36'h124f1b0ef;
    stim[12] = 36'hd8d2dd8b0;
    stim[13] = 36'h8cee36516;
    stim[14] = 36'h8181ccdab;
    stim[15] = 36'h661146e68;
    stim[16] = 36'hb882765d4;
    stim[17] = 36'h1de319e11;
    stim[18] = 36'h5346bf8f3;
    stim[19] = 36'h3f4efff26;
    stim[20] = 36'hf501eaaa4;
    stim[21] = 36'h25e744c6e;
    stim[22] = 36'hf9b48dbda;
    stim[23] = 36'hff068f802;
    stim[24] = 36'h3b878a7a9;
    stim[25] = 36'h1b32492c8;
    stim[26] = 36'h388760a76;
    stim[27] = 36'h6a17e8b5f;
    stim[28] = 36'h14dd032cd;
    stim[29] = 36'h3f036bcaf;
    stim[30] = 36'h916e9aafd;
    stim[31] = 36'hf1efbf85e;
    stim[32] = 36'h3259e7f72;
    stim[33] = 36'hf702885cc;
    stim[34] = 36'h6f3d4e8b7;
    stim[35] = 36'h31842f318;
    stim[36] = 36'h679157576;
    stim[37] = 36'hbe8488d24;
    stim[38] = 36'h6ef9f730d;
    stim[39] = 36'h13a3db1d0;
    stim[40] = 36'hbc2c4ae19;
    stim[41] = 36'h47a54d6f4;
    stim[42] = 36'h0e9882284;
    stim[43] = 36'h381a4611f;
    stim[44] = 36'h74fb10362;
    stim[45] = 36'h325b0a54f;
    stim[46] = 36'h833ef875c;
    stim[47] = 36'he22c5455f;
    stim[48] = 36'h4226a16e6;
    stim[49] = 36'h60a2a1cd8;
    stim[50] = 36'h8715fe154;
    stim[51] = 36'ha707c2736;
    stim[52] = 36'hd69519a63;
    stim[53] = 36'ha9bba4a6b;
    stim[54] = 36'h4c7436ad2;
    stim[55] = 36'hdcaa14e31;
    stim[56] = 36'h71f406dbb;
    stim[57] = 36'h21b6bd024;
    stim[58] = 36'h85e4ad4d0;
    stim[59] = 36'had5594776;
    stim[60] = 36'ha3b079520;
    stim[61] = 36'hbbda03307;
    stim[62] = 36'hed91d6df6;
    stim[63] = 36'h9acff315c;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h1abd4;
      expv[5] = 17'h11f44;
      expv[6] = 17'h00000;
      expv[7] = 17'h1ba81;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h00000;
      expv[12] = 17'h16cbb;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h1fffa;
      expv[17] = 17'h00805;
      expv[18] = 17'h00000;
      expv[19] = 17'h00000;
      expv[20] = 17'h1fffa;
      expv[21] = 17'h00000;
      expv[22] = 17'h00000;
      expv[23] = 17'h1fe0c;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h05900;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h1df42;
      expv[38] = 17'h00000;
      expv[39] = 17'h1dd80;
      expv[40] = 17'h00000;
      expv[41] = 17'h00000;
      expv[42] = 17'h0001c;
      expv[43] = 17'h00000;
      expv[44] = 17'h07d80;
      expv[45] = 17'h00000;
      expv[46] = 17'h00000;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h1f870;
      expv[51] = 17'h00000;
      expv[52] = 17'h006b4;
      expv[53] = 17'h00000;
      expv[54] = 17'h10000;
      expv[55] = 17'h18f8f;
      expv[56] = 17'h00000;
      expv[57] = 17'h010da;
      expv[58] = 17'h06663;
      expv[59] = 17'h00000;
      expv[60] = 17'h03a05;
      expv[61] = 17'h00000;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
