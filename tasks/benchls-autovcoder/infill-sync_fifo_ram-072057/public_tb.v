// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 38;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072057 dut (
    .clk(clk),
    .reset(in_vec[37:37]),
    .sclk_en(in_vec[36:36]),
    .if_write_ce(in_vec[35:35]),
    .if_write(in_vec[34:34]),
    .if_din(in_vec[33:2]),
    .if_read_ce(in_vec[1:1]),
    .if_read(in_vec[0:0]),
    .if_full_n(out_vec[33:33]),
    .if_empty_n(out_vec[32:32]),
    .if_dout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 38'h2888c81b16;
    stim[1] = 38'h308b58909e;
    stim[2] = 38'h0d32170d55;
    stim[3] = 38'h0fa14c0144;
    stim[4] = 38'h1f61796edf;
    stim[5] = 38'h1cd6136fc4;
    stim[6] = 38'h0df5917a48;
    stim[7] = 38'h00502928e2;
    stim[8] = 38'h06e327f8b6;
    stim[9] = 38'h14cff91c8d;
    stim[10] = 38'h15978fc78c;
    stim[11] = 38'h012bb0971e;
    stim[12] = 38'h1a28e6c895;
    stim[13] = 38'h06ef01119e;
    stim[14] = 38'h016d46edc8;
    stim[15] = 38'h0a99b1c2f4;
    stim[16] = 38'h0b95a2279e;
    stim[17] = 38'h3c69a9f310;
    stim[18] = 38'h1c20d568b9;
    stim[19] = 38'h0286289712;
    stim[20] = 38'h10106d11ce;
    stim[21] = 38'h0cf12a91c3;
    stim[22] = 38'h05283fbe66;
    stim[23] = 38'h095ed473dd;
    stim[24] = 38'h148c79fc76;
    stim[25] = 38'h195774ee92;
    stim[26] = 38'h0703db91f8;
    stim[27] = 38'h1d0d7d15bd;
    stim[28] = 38'h1c9eae2bdb;
    stim[29] = 38'h1c4c06ebca;
    stim[30] = 38'h138fb512c2;
    stim[31] = 38'h0b89e3a965;
    stim[32] = 38'h0f2d32eb2c;
    stim[33] = 38'h0e9ed933ab;
    stim[34] = 38'h1692995f25;
    stim[35] = 38'h0468555a53;
    stim[36] = 38'h08f7ef4433;
    stim[37] = 38'h0ec82fe226;
    stim[38] = 38'h137723afec;
    stim[39] = 38'h03504fa20b;
    stim[40] = 38'h01b0e7aaa8;
    stim[41] = 38'h0d8384133a;
    stim[42] = 38'h1c5efe5ffd;
    stim[43] = 38'h0415500ac4;
    stim[44] = 38'h035557c973;
    stim[45] = 38'h07e3111023;
    stim[46] = 38'h10d4e275f2;
    stim[47] = 38'h1ca8cc1420;
    stim[48] = 38'h154ad09d28;
    stim[49] = 38'h1380f33683;
    stim[50] = 38'h1efb273456;
    stim[51] = 38'h00ac611518;
    stim[52] = 38'h146f02e481;
    stim[53] = 38'h0a4778b03c;
    stim[54] = 38'h19c324f755;
    stim[55] = 38'h1586e41a2d;
    stim[56] = 38'h01c19a3b2b;
    stim[57] = 38'h185a55d32a;
    stim[58] = 38'h1ba9333466;
    stim[59] = 38'h1519ce4dca;
    stim[60] = 38'h1b179efda5;
    stim[61] = 38'h0e7d17097c;
    stim[62] = 38'h19c4fe2b71;
    stim[63] = 38'h1ce49968ee;
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
      expv[0] = 34'h200000000;
      expv[1] = 34'h200000000;
      expv[2] = 34'h200000000;
      expv[3] = 34'h200000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h200000000;
      expv[6] = 34'h200000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h200000000;
      expv[9] = 34'h200000000;
      expv[10] = 34'h200000000;
      expv[11] = 34'h200000000;
      expv[12] = 34'h200000000;
      expv[13] = 34'h200000000;
      expv[14] = 34'h200000000;
      expv[15] = 34'h200000000;
      expv[16] = 34'h200000000;
      expv[17] = 34'h200000000;
      expv[18] = 34'h200000000;
      expv[19] = 34'h200000000;
      expv[20] = 34'h200000000;
      expv[21] = 34'h308355a2e;
      expv[22] = 34'h308355a2e;
      expv[23] = 34'h308355a2e;
      expv[24] = 34'h308355a2e;
      expv[25] = 34'h308355a2e;
      expv[26] = 34'h308355a2e;
      expv[27] = 34'h308355a2e;
      expv[28] = 34'h308355a2e;
      expv[29] = 34'h3435f456f;
      expv[30] = 34'h3435f456f;
      expv[31] = 34'h3435f456f;
      expv[32] = 34'h3435f456f;
      expv[33] = 34'h3435f456f;
      expv[34] = 34'h3435f456f;
      expv[35] = 34'h3435f456f;
      expv[36] = 34'h3435f456f;
      expv[37] = 34'h3435f456f;
      expv[38] = 34'h3435f456f;
      expv[39] = 34'h3435f456f;
      expv[40] = 34'h3435f456f;
      expv[41] = 34'h3435f456f;
      expv[42] = 34'h3435f456f;
      expv[43] = 34'h3435f456f;
      expv[44] = 34'h3435f456f;
      expv[45] = 34'h3435f456f;
      expv[46] = 34'h3435f456f;
      expv[47] = 34'h3435f456f;
      expv[48] = 34'h3435f456f;
      expv[49] = 34'h3435f456f;
      expv[50] = 34'h327ab8af6;
      expv[51] = 34'h327ab8af6;
      expv[52] = 34'h327ab8af6;
      expv[53] = 34'h327ab8af6;
      expv[54] = 34'h327ab8af6;
      expv[55] = 34'h327ab8af6;
      expv[56] = 34'h327ab8af6;
      expv[57] = 34'h327ab8af6;
      expv[58] = 34'h327ab8af6;
      expv[59] = 34'h327ab8af6;
      expv[60] = 34'h327ab8af6;
      expv[61] = 34'h327ab8af6;
      expv[62] = 34'h327ab8af6;
      expv[63] = 34'h327ab8af6;
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
