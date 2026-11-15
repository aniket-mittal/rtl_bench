// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 42;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06944 dut (
    .clk(clk),
    .ir_in(in_vec[41:40]),
    .sr(in_vec[39:2]),
    .vs_udr(in_vec[1:1]),
    .vs_uir(in_vec[0:0]),
    .jdo(out_vec[50:13]),
    .take_action_break_a(out_vec[12:12]),
    .take_action_break_b(out_vec[11:11]),
    .take_action_break_c(out_vec[10:10]),
    .take_action_ocimem_a(out_vec[9:9]),
    .take_action_ocimem_b(out_vec[8:8]),
    .take_action_tracectrl(out_vec[7:7]),
    .take_action_tracemem_a(out_vec[6:6]),
    .take_action_tracemem_b(out_vec[5:5]),
    .take_no_action_break_a(out_vec[4:4]),
    .take_no_action_break_b(out_vec[3:3]),
    .take_no_action_break_c(out_vec[2:2]),
    .take_no_action_ocimem_a(out_vec[1:1]),
    .take_no_action_tracemem_a(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 42'h0cfe48a0434;
    stim[1] = 42'h374421d7150;
    stim[2] = 42'h10f29a712e8;
    stim[3] = 42'h0cc001e0fe8;
    stim[4] = 42'h160064966c7;
    stim[5] = 42'h364e6c7c9c6;
    stim[6] = 42'h3779275985e;
    stim[7] = 42'h25d2657aad1;
    stim[8] = 42'h0700362723b;
    stim[9] = 42'h074a6148f8f;
    stim[10] = 42'h38dc01a7ee3;
    stim[11] = 42'h341608a3767;
    stim[12] = 42'h34874caf32e;
    stim[13] = 42'h182b93535ab;
    stim[14] = 42'h0a1532feb1b;
    stim[15] = 42'h2c4881db405;
    stim[16] = 42'h28bc1b197cd;
    stim[17] = 42'h0a0ee8d811e;
    stim[18] = 42'h0fff92a40db;
    stim[19] = 42'h3a93280fa14;
    stim[20] = 42'h2f226554565;
    stim[21] = 42'h16bbc30dd53;
    stim[22] = 42'h2c99e84d3dd;
    stim[23] = 42'h2398b772672;
    stim[24] = 42'h02793a13424;
    stim[25] = 42'h2c11f7905dd;
    stim[26] = 42'h1338a4314b5;
    stim[27] = 42'h36a8862f053;
    stim[28] = 42'h20be0af9c2b;
    stim[29] = 42'h301dd4eeece;
    stim[30] = 42'h1f1bb290787;
    stim[31] = 42'h2e4402f419a;
    stim[32] = 42'h0b395872399;
    stim[33] = 42'h13a5ae58bc3;
    stim[34] = 42'h0192ba2f638;
    stim[35] = 42'h3161fbd5aae;
    stim[36] = 42'h1bbf3b7fcd5;
    stim[37] = 42'h06c4435b760;
    stim[38] = 42'h3f8c89fe0ae;
    stim[39] = 42'h18a33a287fa;
    stim[40] = 42'h1d5e5853c47;
    stim[41] = 42'h02f40f71767;
    stim[42] = 42'h2634d05d09a;
    stim[43] = 42'h3860c691f13;
    stim[44] = 42'h1608c4cc0a4;
    stim[45] = 42'h3a0f89b4745;
    stim[46] = 42'h276c58ea75d;
    stim[47] = 42'h141589ad7c8;
    stim[48] = 42'h3fc61e00f1c;
    stim[49] = 42'h174accce025;
    stim[50] = 42'h31556cacf23;
    stim[51] = 42'h2e10a71a201;
    stim[52] = 42'h243cb141816;
    stim[53] = 42'h3a3c36fa7b6;
    stim[54] = 42'h381add56ce5;
    stim[55] = 42'h2920655d2fc;
    stim[56] = 42'h36987b613d7;
    stim[57] = 42'h0d56367ae05;
    stim[58] = 42'h0d3cc06807f;
    stim[59] = 42'h1c8f6056972;
    stim[60] = 42'h1fd089f18c8;
    stim[61] = 42'h322ecfa2899;
    stim[62] = 42'h33f7ba6db6f;
    stim[63] = 42'h18441fd9ea1;
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
      expv[0] = 51'hxxxxxxxxxxxxx;
      expv[1] = 51'hxxxxxxxxxxxxx;
      expv[2] = 51'hxxxxxxxxxxxxx;
      expv[3] = 51'hxxxxxxxxxxxxx;
      expv[4] = 51'hxxxxxxxxxx000;
      expv[5] = 51'hxxxxxxxxxx000;
      expv[6] = 51'hxxxxxxxxxx000;
      expv[7] = 51'hxxxxxxxxxx000;
      expv[8] = 51'h2e932bd568008;
      expv[9] = 51'h2e932bd568000;
      expv[10] = 51'h2e932bd568000;
      expv[11] = 51'h2e932bd568000;
      expv[12] = 51'h20b0451bb2080;
      expv[13] = 51'h20b0451bb2000;
      expv[14] = 51'h20b0451bb2000;
      expv[15] = 51'h20b0451bb2000;
      expv[16] = 51'h20b0451bb2000;
      expv[17] = 51'h20b0451bb2000;
      expv[18] = 51'h20b0451bb2000;
      expv[19] = 51'h20b0451bb2000;
      expv[20] = 51'h20b0451bb2000;
      expv[21] = 51'h79132aa2b2400;
      expv[22] = 51'h79132aa2b2000;
      expv[23] = 51'h79132aa2b2000;
      expv[24] = 51'h79132aa2b2000;
      expv[25] = 51'h13c9d09a12010;
      expv[26] = 51'h13c9d09a12000;
      expv[27] = 51'h19c5218a5a010;
      expv[28] = 51'h19c5218a5a000;
      expv[29] = 51'h19c5218a5a000;
      expv[30] = 51'h19c5218a5a000;
      expv[31] = 51'h78dd9483c2400;
      expv[32] = 51'h78dd9483c2000;
      expv[33] = 51'h78dd9483c2000;
      expv[34] = 51'h78dd9483c2000;
      expv[35] = 51'h78dd9483c2000;
      expv[36] = 51'h78dd9483c2000;
      expv[37] = 51'h5df9dbfe6a080;
      expv[38] = 51'h5df9dbfe6a000;
      expv[39] = 51'h7c644ff056080;
      expv[40] = 51'h7c644ff056000;
      expv[41] = 51'h7c644ff056000;
      expv[42] = 51'h17a07b8bb2001;
      expv[43] = 51'h17a07b8bb2000;
      expv[44] = 51'h17a07b8bb2000;
      expv[45] = 51'h17a07b8bb2000;
      expv[46] = 51'h17a07b8bb2000;
      expv[47] = 51'h17a07b8bb2000;
      expv[48] = 51'h17a07b8bb2000;
      expv[49] = 51'h17a07b8bb2000;
      expv[50] = 51'h17a07b8bb2000;
      expv[51] = 51'h17a07b8bb2000;
      expv[52] = 51'h17a07b8bb2000;
      expv[53] = 51'h17a07b8bb2000;
      expv[54] = 51'h51e1b7d3db000;
      expv[55] = 51'h51e1b7d3da000;
      expv[56] = 51'h49032ae97f000;
      expv[57] = 51'h49032ae97e000;
      expv[58] = 51'h49032ae97e000;
      expv[59] = 51'h49032ae97e000;
      expv[60] = 51'h647b02b4b8020;
      expv[61] = 51'h647b02b4b8000;
      expv[62] = 51'h11767d144c001;
      expv[63] = 51'h11767d144c000;
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
