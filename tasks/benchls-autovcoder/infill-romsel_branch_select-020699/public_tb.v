// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_020699 dut (
    .branch(in_vec[17:14]),
    .morethree(in_vec[13:13]),
    .fmulovf(in_vec[12:12]),
    .rsge64(in_vec[11:11]),
    .absign(in_vec[10:10]),
    .addsub(in_vec[9:9]),
    .manzero(in_vec[8:8]),
    .rs32(in_vec[7:7]),
    .eadd(in_vec[6:6]),
    .amsb(in_vec[5:5]),
    .rem_op(in_vec[4:4]),
    .qmsb(in_vec[3:3]),
    .a2func(in_vec[2:0]),
    .romselp_d(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h10361;
    stim[1] = 18'h1334f;
    stim[2] = 18'h2fe29;
    stim[3] = 18'h21052;
    stim[4] = 18'h3528b;
    stim[5] = 18'h099e7;
    stim[6] = 18'h370dd;
    stim[7] = 18'h0baa8;
    stim[8] = 18'h3c350;
    stim[9] = 18'h11b0e;
    stim[10] = 18'h2195c;
    stim[11] = 18'h17d54;
    stim[12] = 18'h3027a;
    stim[13] = 18'h16cb6;
    stim[14] = 18'h25b40;
    stim[15] = 18'h1f2b3;
    stim[16] = 18'h2bcde;
    stim[17] = 18'h02889;
    stim[18] = 18'h12e1d;
    stim[19] = 18'h04cc3;
    stim[20] = 18'h198d1;
    stim[21] = 18'h15f21;
    stim[22] = 18'h20d1c;
    stim[23] = 18'h06a29;
    stim[24] = 18'h3f204;
    stim[25] = 18'h2e212;
    stim[26] = 18'h26873;
    stim[27] = 18'h31fc8;
    stim[28] = 18'h322cc;
    stim[29] = 18'h01da9;
    stim[30] = 18'h244e1;
    stim[31] = 18'h151e0;
    stim[32] = 18'h20522;
    stim[33] = 18'h3cada;
    stim[34] = 18'h2c8de;
    stim[35] = 18'h29cf8;
    stim[36] = 18'h0be37;
    stim[37] = 18'h08ab6;
    stim[38] = 18'h0fa58;
    stim[39] = 18'h1974e;
    stim[40] = 18'h30e9a;
    stim[41] = 18'h22f85;
    stim[42] = 18'h2eb88;
    stim[43] = 18'h024ba;
    stim[44] = 18'h18ea2;
    stim[45] = 18'h01fc9;
    stim[46] = 18'h137ce;
    stim[47] = 18'h0acba;
    stim[48] = 18'h001ab;
    stim[49] = 18'h35f35;
    stim[50] = 18'h3253c;
    stim[51] = 18'h317e2;
    stim[52] = 18'h1bb4a;
    stim[53] = 18'h07146;
    stim[54] = 18'h0b232;
    stim[55] = 18'h33a94;
    stim[56] = 18'h1af7b;
    stim[57] = 18'h05a9d;
    stim[58] = 18'h28023;
    stim[59] = 18'h03796;
    stim[60] = 18'h093e4;
    stim[61] = 18'h265d5;
    stim[62] = 18'h33f00;
    stim[63] = 18'h3f9c2;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h1;
      expv[8] = 1'h0;
      expv[9] = 1'h1;
      expv[10] = 1'h0;
      expv[11] = 1'h1;
      expv[12] = 1'h0;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h1;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h1;
      expv[22] = 1'h0;
      expv[23] = 1'h1;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h1;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h1;
      expv[30] = 1'h1;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h1;
      expv[36] = 1'h1;
      expv[37] = 1'h1;
      expv[38] = 1'h1;
      expv[39] = 1'h1;
      expv[40] = 1'h0;
      expv[41] = 1'h1;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h0;
      expv[47] = 1'h1;
      expv[48] = 1'h1;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h1;
      expv[53] = 1'h1;
      expv[54] = 1'h1;
      expv[55] = 1'h0;
      expv[56] = 1'h1;
      expv[57] = 1'h0;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
