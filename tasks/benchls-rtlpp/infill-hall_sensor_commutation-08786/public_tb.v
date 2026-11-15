// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08786 dut (
    .clk_i(clk),
    .rst_i(in_vec[35:35]),
    .offset_i(in_vec[34:3]),
    .position_i(in_vec[2:0]),
    .position_o(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hb7154e41e;
    stim[1] = 36'hbe26f31ee;
    stim[2] = 36'h2a158c9ab;
    stim[3] = 36'h1e660b451;
    stim[4] = 36'h694130cbd;
    stim[5] = 36'h1cfc7a8fe;
    stim[6] = 36'h56dbfdde0;
    stim[7] = 36'h6e62ad05f;
    stim[8] = 36'h65ea8dd3d;
    stim[9] = 36'h595f88515;
    stim[10] = 36'h6ee5026fb;
    stim[11] = 36'h69673d2a0;
    stim[12] = 36'h30e86d6b9;
    stim[13] = 36'h5d06d936d;
    stim[14] = 36'h52667eb7b;
    stim[15] = 36'h033750400;
    stim[16] = 36'h1c3952d4c;
    stim[17] = 36'h128148830;
    stim[18] = 36'h1471b1ae5;
    stim[19] = 36'h4a88f6880;
    stim[20] = 36'h0a4a3d3e9;
    stim[21] = 36'h2d5cffe78;
    stim[22] = 36'h0fd101977;
    stim[23] = 36'h319db855b;
    stim[24] = 36'h1ff8ce7f9;
    stim[25] = 36'h32050a0df;
    stim[26] = 36'h5cf656193;
    stim[27] = 36'h583e971d7;
    stim[28] = 36'h4e34c618b;
    stim[29] = 36'h3b9d22f90;
    stim[30] = 36'h7336cb9c9;
    stim[31] = 36'h2aed91747;
    stim[32] = 36'h069067d0f;
    stim[33] = 36'h2196d538c;
    stim[34] = 36'h4604ef679;
    stim[35] = 36'h407b7f8e1;
    stim[36] = 36'h61d007b84;
    stim[37] = 36'h6a3569e7e;
    stim[38] = 36'hebbbe8910;
    stim[39] = 36'h251bda012;
    stim[40] = 36'h61369ebd9;
    stim[41] = 36'h27b22aa5c;
    stim[42] = 36'h5a0f7a38c;
    stim[43] = 36'h7943df5da;
    stim[44] = 36'h6c99532a0;
    stim[45] = 36'h6c871911e;
    stim[46] = 36'h201fb88eb;
    stim[47] = 36'h4cafc5db3;
    stim[48] = 36'h595a094ae;
    stim[49] = 36'h2026f38d6;
    stim[50] = 36'h2608c661b;
    stim[51] = 36'h353c37040;
    stim[52] = 36'h60d8b3170;
    stim[53] = 36'h35655b1ab;
    stim[54] = 36'h03e81bf56;
    stim[55] = 36'h333ecb385;
    stim[56] = 36'h309eabdde;
    stim[57] = 36'h3dd9a86a4;
    stim[58] = 36'hba13d639e;
    stim[59] = 36'h4f8164462;
    stim[60] = 36'h208fb0528;
    stim[61] = 36'h4a709f482;
    stim[62] = 36'h2a38e1b24;
    stim[63] = 36'h599807766;
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
      expv[0] = 3'hx;
      expv[1] = 3'h1;
      expv[2] = 3'h1;
      expv[3] = 3'h1;
      expv[4] = 3'h1;
      expv[5] = 3'h1;
      expv[6] = 3'h1;
      expv[7] = 3'h1;
      expv[8] = 3'h1;
      expv[9] = 3'h1;
      expv[10] = 3'h1;
      expv[11] = 3'h1;
      expv[12] = 3'h1;
      expv[13] = 3'h1;
      expv[14] = 3'h1;
      expv[15] = 3'h1;
      expv[16] = 3'h1;
      expv[17] = 3'h1;
      expv[18] = 3'h1;
      expv[19] = 3'h1;
      expv[20] = 3'h1;
      expv[21] = 3'h1;
      expv[22] = 3'h1;
      expv[23] = 3'h1;
      expv[24] = 3'h1;
      expv[25] = 3'h1;
      expv[26] = 3'h1;
      expv[27] = 3'h1;
      expv[28] = 3'h1;
      expv[29] = 3'h1;
      expv[30] = 3'h1;
      expv[31] = 3'h5;
      expv[32] = 3'h5;
      expv[33] = 3'h5;
      expv[34] = 3'h5;
      expv[35] = 3'h5;
      expv[36] = 3'h5;
      expv[37] = 3'h5;
      expv[38] = 3'h5;
      expv[39] = 3'h5;
      expv[40] = 3'h1;
      expv[41] = 3'h1;
      expv[42] = 3'h1;
      expv[43] = 3'h1;
      expv[44] = 3'h1;
      expv[45] = 3'h1;
      expv[46] = 3'h1;
      expv[47] = 3'h1;
      expv[48] = 3'h1;
      expv[49] = 3'h1;
      expv[50] = 3'h1;
      expv[51] = 3'h1;
      expv[52] = 3'h1;
      expv[53] = 3'h1;
      expv[54] = 3'h1;
      expv[55] = 3'h1;
      expv[56] = 3'h1;
      expv[57] = 3'h1;
      expv[58] = 3'h1;
      expv[59] = 3'h1;
      expv[60] = 3'h1;
      expv[61] = 3'h1;
      expv[62] = 3'h1;
      expv[63] = 3'h1;
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
