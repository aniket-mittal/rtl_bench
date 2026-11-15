// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 27;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01952 dut (
    .clk(clk),
    .dip(in_vec[26:19]),
    .reset_b(in_vec[18:18]),
    .adr15(in_vec[17:17]),
    .adr14(in_vec[16:16]),
    .adr13(in_vec[15:15]),
    .ioreq_b(in_vec[14:14]),
    .mreq_b(in_vec[13:13]),
    .romen_b(in_vec[12:12]),
    .wr_b(in_vec[11:11]),
    .rd_b(in_vec[10:10]),
    .data(in_vec[9:2]),
    .busrq_b(in_vec[1:1]),
    .busack_b(in_vec[0:0]),
    .romdis(out_vec[5:5]),
    .rom01cs_b(out_vec[4:4]),
    .rom23cs_b(out_vec[3:3]),
    .rom45cs_b(out_vec[2:2]),
    .romoe_b(out_vec[1:1]),
    .roma14(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 27'h411739c;
    stim[1] = 27'h752dc5e;
    stim[2] = 27'h50e5d90;
    stim[3] = 27'h1f77291;
    stim[4] = 27'h45c239a;
    stim[5] = 27'h38ffc26;
    stim[6] = 27'h7af2cf3;
    stim[7] = 27'h60c3142;
    stim[8] = 27'h48f26b5;
    stim[9] = 27'h46eee5e;
    stim[10] = 27'h0a5e06f;
    stim[11] = 27'h4750ae4;
    stim[12] = 27'h4b690f4;
    stim[13] = 27'h7b54996;
    stim[14] = 27'h20edddf;
    stim[15] = 27'h0ecc5c6;
    stim[16] = 27'h37eae88;
    stim[17] = 27'h4bf0b25;
    stim[18] = 27'h74d3199;
    stim[19] = 27'h7bf7f47;
    stim[20] = 27'h1de85c2;
    stim[21] = 27'h047089f;
    stim[22] = 27'h605f147;
    stim[23] = 27'h6bd6738;
    stim[24] = 27'h605842c;
    stim[25] = 27'h31febce;
    stim[26] = 27'h2be33a3;
    stim[27] = 27'h5f68c38;
    stim[28] = 27'h624e8a3;
    stim[29] = 27'h4e98bb5;
    stim[30] = 27'h1e558d3;
    stim[31] = 27'h1fc1d3d;
    stim[32] = 27'h0174f34;
    stim[33] = 27'h14c6f3d;
    stim[34] = 27'h1360bc6;
    stim[35] = 27'h05eb35f;
    stim[36] = 27'h2b4f583;
    stim[37] = 27'h5240a76;
    stim[38] = 27'h2045a2e;
    stim[39] = 27'h26c5a45;
    stim[40] = 27'h3bec93a;
    stim[41] = 27'h2eda736;
    stim[42] = 27'h0dd9f8b;
    stim[43] = 27'h0c7f4e3;
    stim[44] = 27'h4bf47dc;
    stim[45] = 27'h60c1334;
    stim[46] = 27'h004fe60;
    stim[47] = 27'h02eeadd;
    stim[48] = 27'h1b6e423;
    stim[49] = 27'h4a7b405;
    stim[50] = 27'h69c3538;
    stim[51] = 27'h2fe362d;
    stim[52] = 27'h0bfcdea;
    stim[53] = 27'h594efaa;
    stim[54] = 27'h42c868e;
    stim[55] = 27'h0fe4dbb;
    stim[56] = 27'h7df3440;
    stim[57] = 27'h0cd5eb6;
    stim[58] = 27'h52fdf60;
    stim[59] = 27'h7258916;
    stim[60] = 27'h30f56d5;
    stim[61] = 27'h20646b6;
    stim[62] = 27'h3d667c2;
    stim[63] = 27'h7e498ea;
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
      expv[0] = 6'h1e;
      expv[1] = 6'h1e;
      expv[2] = 6'h1e;
      expv[3] = 6'h2f;
      expv[4] = 6'h1c;
      expv[5] = 6'h1e;
      expv[6] = 6'h1c;
      expv[7] = 6'h1e;
      expv[8] = 6'h1c;
      expv[9] = 6'h1c;
      expv[10] = 6'h1c;
      expv[11] = 6'h1c;
      expv[12] = 6'h1e;
      expv[13] = 6'h1c;
      expv[14] = 6'h2e;
      expv[15] = 6'h2c;
      expv[16] = 6'h2c;
      expv[17] = 6'h1c;
      expv[18] = 6'h1e;
      expv[19] = 6'h1e;
      expv[20] = 6'h2c;
      expv[21] = 6'h1c;
      expv[22] = 6'h1e;
      expv[23] = 6'h1c;
      expv[24] = 6'h1c;
      expv[25] = 6'h1c;
      expv[26] = 6'h2e;
      expv[27] = 6'h1c;
      expv[28] = 6'h1c;
      expv[29] = 6'h1c;
      expv[30] = 6'h1e;
      expv[31] = 6'h2e;
      expv[32] = 6'h2d;
      expv[33] = 6'h2c;
      expv[34] = 6'h1c;
      expv[35] = 6'h2e;
      expv[36] = 6'h1e;
      expv[37] = 6'h1c;
      expv[38] = 6'h1e;
      expv[39] = 6'h2e;
      expv[40] = 6'h2c;
      expv[41] = 6'h1c;
      expv[42] = 6'h2f;
      expv[43] = 6'h1e;
      expv[44] = 6'h1c;
      expv[45] = 6'h1e;
      expv[46] = 6'h1e;
      expv[47] = 6'h2c;
      expv[48] = 6'h1c;
      expv[49] = 6'h1e;
      expv[50] = 6'h1e;
      expv[51] = 6'h2e;
      expv[52] = 6'h1c;
      expv[53] = 6'h1c;
      expv[54] = 6'h1c;
      expv[55] = 6'h2c;
      expv[56] = 6'h1e;
      expv[57] = 6'h1e;
      expv[58] = 6'h1e;
      expv[59] = 6'h1c;
      expv[60] = 6'h1e;
      expv[61] = 6'h1c;
      expv[62] = 6'h1c;
      expv[63] = 6'h1e;
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
