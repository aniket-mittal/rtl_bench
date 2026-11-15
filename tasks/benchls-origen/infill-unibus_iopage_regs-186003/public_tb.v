// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_186003 dut (
    .clk(clk),
    .reset(in_vec[49:49]),
    .iopage_addr(in_vec[48:36]),
    .data_in(in_vec[35:20]),
    .decode(in_vec[19:19]),
    .iopage_rd(in_vec[18:18]),
    .iopage_wr(in_vec[17:17]),
    .iopage_byte_op(in_vec[16:16]),
    .switches(in_vec[15:0]),
    .data_out(out_vec[33:18]),
    .cpu_err(out_vec[17:2]),
    .unibus_to_r(out_vec[1:1]),
    .memory_to_r(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h264936db45662;
    stim[1] = 50'h2b4208bda4ff0;
    stim[2] = 50'h1d31f21363402;
    stim[3] = 50'h04132a9b8c797;
    stim[4] = 50'h0e7b5109f66e2;
    stim[5] = 50'h0f271300ba48f;
    stim[6] = 50'h073d59035ab34;
    stim[7] = 50'h192eeb691bc72;
    stim[8] = 50'h196963e3b2551;
    stim[9] = 50'h06429525a70b1;
    stim[10] = 50'h07b3a343193e5;
    stim[11] = 50'h1c7f97e61e449;
    stim[12] = 50'h1dc432a8580df;
    stim[13] = 50'h1320672b13964;
    stim[14] = 50'h156250c7e06be;
    stim[15] = 50'h15924dd05f0fc;
    stim[16] = 50'h1101cde19e2cd;
    stim[17] = 50'h0f35a6ccf9482;
    stim[18] = 50'h10b9d46f22d49;
    stim[19] = 50'h1b9310fc404c5;
    stim[20] = 50'h04fd536e17cae;
    stim[21] = 50'h05636e6285539;
    stim[22] = 50'h079f5ec1002e8;
    stim[23] = 50'h1993f8475cd3b;
    stim[24] = 50'h11aef164b36f3;
    stim[25] = 50'h0293f8a9abb93;
    stim[26] = 50'h1eab8c29dc103;
    stim[27] = 50'h08bdcfca1a84e;
    stim[28] = 50'h0eb76bfd3d6ab;
    stim[29] = 50'h06e0f8d275a76;
    stim[30] = 50'h0d996d1eb56d4;
    stim[31] = 50'h018dc7f5f93ed;
    stim[32] = 50'h0fd0bc5b128d6;
    stim[33] = 50'h06e69109f5a8b;
    stim[34] = 50'h0d4980fcf2c87;
    stim[35] = 50'h12f111e3a2b85;
    stim[36] = 50'h09014d42d5bba;
    stim[37] = 50'h160a9c5d057dd;
    stim[38] = 50'h186e80e84eb8c;
    stim[39] = 50'h0b524da9971a5;
    stim[40] = 50'h15a662f566c81;
    stim[41] = 50'h0d47f562473c8;
    stim[42] = 50'h0ec56e67b381e;
    stim[43] = 50'h011026b6627c9;
    stim[44] = 50'h15ea29d1b72ed;
    stim[45] = 50'h00488cb012a50;
    stim[46] = 50'h0dbdd31e64086;
    stim[47] = 50'h1e36c42f367bd;
    stim[48] = 50'h1e082d5ab5323;
    stim[49] = 50'h0c43eea09ff48;
    stim[50] = 50'h05cbf7f9e6de6;
    stim[51] = 50'h0a764e00a20da;
    stim[52] = 50'h10c411e24533b;
    stim[53] = 50'h116f266656561;
    stim[54] = 50'h002260faa5e92;
    stim[55] = 50'h0dcf6d0f7fb0d;
    stim[56] = 50'h0ddcf86253b00;
    stim[57] = 50'h07e7443cbeb7a;
    stim[58] = 50'h0c37631e78e38;
    stim[59] = 50'h1049940ad7a1c;
    stim[60] = 50'h1563c71f1c978;
    stim[61] = 50'h16e1c0222003a;
    stim[62] = 50'h011cad9deb4f8;
    stim[63] = 50'h0afed0d561337;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h0d0080000;
      expv[4] = 34'h31e5c0000;
      expv[5] = 34'h19b880000;
      expv[6] = 34'h000000000;
      expv[7] = 34'h000000000;
      expv[8] = 34'h2f1c80000;
      expv[9] = 34'h095440000;
      expv[10] = 34'h000000000;
      expv[11] = 34'h000000000;
      expv[12] = 34'h000000000;
      expv[13] = 34'h000000000;
      expv[14] = 34'h0e5900000;
      expv[15] = 34'h000000000;
      expv[16] = 34'h3c3f00000;
      expv[17] = 34'h38b340000;
      expv[18] = 34'h000000000;
      expv[19] = 34'h000000000;
      expv[20] = 34'h000000000;
      expv[21] = 34'h1f2b80000;
      expv[22] = 34'h000000000;
      expv[23] = 34'h000000000;
      expv[24] = 34'h334ec0000;
      expv[25] = 34'h0dbcc0000;
      expv[26] = 34'h2ee4c0000;
      expv[27] = 34'h000000000;
      expv[28] = 34'h000000000;
      expv[29] = 34'h000000000;
      expv[30] = 34'h169d80000;
      expv[31] = 34'h15b500000;
      expv[32] = 34'h000000000;
      expv[33] = 34'h0a3580000;
      expv[34] = 34'h16a2c0000;
      expv[35] = 34'h0b21c0000;
      expv[36] = 34'h0ae140000;
      expv[37] = 34'h000000000;
      expv[38] = 34'h000000000;
      expv[39] = 34'h3ae300000;
      expv[40] = 34'h000000000;
      expv[41] = 34'h000000000;
      expv[42] = 34'h1cf200000;
      expv[43] = 34'h000000000;
      expv[44] = 34'h09f240000;
      expv[45] = 34'h000000000;
      expv[46] = 34'h000000000;
      expv[47] = 34'h000000000;
      expv[48] = 34'h19ef40000;
      expv[49] = 34'h14c8c0000;
      expv[50] = 34'h3fd200000;
      expv[51] = 34'h1b7980000;
      expv[52] = 34'h000000000;
      expv[53] = 34'h000000000;
      expv[54] = 34'h195840000;
      expv[55] = 34'h000000000;
      expv[56] = 34'h000000000;
      expv[57] = 34'h0ec000000;
      expv[58] = 34'h000000000;
      expv[59] = 34'h238e00000;
      expv[60] = 34'h000000000;
      expv[61] = 34'h000000000;
      expv[62] = 34'h000e80000;
      expv[63] = 34'h000000000;
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
