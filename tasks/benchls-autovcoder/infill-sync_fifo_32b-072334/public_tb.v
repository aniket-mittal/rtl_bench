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

  autovcoder_072334 dut (
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
    stim[0] = 38'h3dd5ee8f1c;
    stim[1] = 38'h30140e5b16;
    stim[2] = 38'h017c76828c;
    stim[3] = 38'h1fe0eae7cd;
    stim[4] = 38'h033714c271;
    stim[5] = 38'h1806266022;
    stim[6] = 38'h044f611b96;
    stim[7] = 38'h124645eebf;
    stim[8] = 38'h16a8d8693d;
    stim[9] = 38'h09d2975d4f;
    stim[10] = 38'h087e9d0cf1;
    stim[11] = 38'h0e0832efd0;
    stim[12] = 38'h14a99854b6;
    stim[13] = 38'h19d83a5548;
    stim[14] = 38'h1c8dda7304;
    stim[15] = 38'h045d6f3ec1;
    stim[16] = 38'h17729c4909;
    stim[17] = 38'h1fec61940e;
    stim[18] = 38'h1fa3cd739f;
    stim[19] = 38'h14cf60dff8;
    stim[20] = 38'h18bc89146b;
    stim[21] = 38'h08adc48c42;
    stim[22] = 38'h18e8719b52;
    stim[23] = 38'h106b476ea2;
    stim[24] = 38'h07ff2044ad;
    stim[25] = 38'h09fc732bb3;
    stim[26] = 38'h18e41b730f;
    stim[27] = 38'h08c0c64c98;
    stim[28] = 38'h0f01bc04a2;
    stim[29] = 38'h0948051adb;
    stim[30] = 38'h17f4b2429a;
    stim[31] = 38'h1f3830b176;
    stim[32] = 38'h1aafa0648e;
    stim[33] = 38'h1312ff9643;
    stim[34] = 38'h098b42f705;
    stim[35] = 38'h0f36d5a2b9;
    stim[36] = 38'h1817f38a1f;
    stim[37] = 38'h0ff37867d1;
    stim[38] = 38'h1f9f9c24a3;
    stim[39] = 38'h0e32101bed;
    stim[40] = 38'h1166bc84a1;
    stim[41] = 38'h02c4a705bd;
    stim[42] = 38'h04c3703494;
    stim[43] = 38'h071206f835;
    stim[44] = 38'h135beb24c2;
    stim[45] = 38'h0568ec8f77;
    stim[46] = 38'h0a021caa0d;
    stim[47] = 38'h1980fcfabd;
    stim[48] = 38'h1581c512e8;
    stim[49] = 38'h1f9e158902;
    stim[50] = 38'h1c2bc7a759;
    stim[51] = 38'h3893e9dc05;
    stim[52] = 38'h1ae81e5d4c;
    stim[53] = 38'h19c8bd36b4;
    stim[54] = 38'h169dc81039;
    stim[55] = 38'h0cd3ee6686;
    stim[56] = 38'h0e210f1ef3;
    stim[57] = 38'h1372d17ec5;
    stim[58] = 38'h1d9d0221af;
    stim[59] = 38'h29e289c5dc;
    stim[60] = 38'h0678e6b9a6;
    stim[61] = 38'h0e7a3ba89a;
    stim[62] = 38'h199332763a;
    stim[63] = 38'h1d8cd3d9b8;
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
      expv[6] = 34'h3f83ab9f3;
      expv[7] = 34'h3f83ab9f3;
      expv[8] = 34'h2f83ab9f3;
      expv[9] = 34'h2f83ab9f3;
      expv[10] = 34'h2f83ab9f3;
      expv[11] = 34'h2f83ab9f3;
      expv[12] = 34'h2f83ab9f3;
      expv[13] = 34'h2f83ab9f3;
      expv[14] = 34'h2f83ab9f3;
      expv[15] = 34'h2f83ab9f3;
      expv[16] = 34'h2f83ab9f3;
      expv[17] = 34'h2f83ab9f3;
      expv[18] = 34'h323769cc1;
      expv[19] = 34'h3fb186503;
      expv[20] = 34'h3fb186503;
      expv[21] = 34'h3e8f35ce7;
      expv[22] = 34'h3e8f35ce7;
      expv[23] = 34'h3e8f35ce7;
      expv[24] = 34'h3e8f35ce7;
      expv[25] = 34'h3e8f35ce7;
      expv[26] = 34'h3e8f35ce7;
      expv[27] = 34'h2e8f35ce7;
      expv[28] = 34'h2e8f35ce7;
      expv[29] = 34'h2e8f35ce7;
      expv[30] = 34'h2e8f35ce7;
      expv[31] = 34'h2e8f35ce7;
      expv[32] = 34'h2e8f35ce7;
      expv[33] = 34'h3ce0c2c5d;
      expv[34] = 34'h2ce0c2c5d;
      expv[35] = 34'h2ce0c2c5d;
      expv[36] = 34'h2ce0c2c5d;
      expv[37] = 34'h2ce0c2c5d;
      expv[38] = 34'h2ce0c2c5d;
      expv[39] = 34'h2ce0c2c5d;
      expv[40] = 34'h2ce0c2c5d;
      expv[41] = 34'h2ce0c2c5d;
      expv[42] = 34'h2ce0c2c5d;
      expv[43] = 34'h2ce0c2c5d;
      expv[44] = 34'h2ce0c2c5d;
      expv[45] = 34'h3e7e70928;
      expv[46] = 34'h3e7e70928;
      expv[47] = 34'h3e7e70928;
      expv[48] = 34'h3e7e70928;
      expv[49] = 34'h3e7e70928;
      expv[50] = 34'h3e7e70928;
      expv[51] = 34'h3e7e70928;
      expv[52] = 34'h200000000;
      expv[53] = 34'h200000000;
      expv[54] = 34'h200000000;
      expv[55] = 34'h200000000;
      expv[56] = 34'h200000000;
      expv[57] = 34'h200000000;
      expv[58] = 34'h200000000;
      expv[59] = 34'h200000000;
      expv[60] = 34'h200000000;
      expv[61] = 34'h200000000;
      expv[62] = 34'h200000000;
      expv[63] = 34'h200000000;
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
