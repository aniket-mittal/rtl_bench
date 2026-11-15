// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 75;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_057959 dut (
    .clk(clk),
    .rst(in_vec[9:9]),
    .fs(in_vec[8:8]),
    .fifoc_rxd(in_vec[7:0]),
    .fd(out_vec[74:74]),
    .fifoc_rxen(out_vec[73:73]),
    .kind_dev(out_vec[72:65]),
    .info_sr(out_vec[64:57]),
    .cmd_filt(out_vec[56:49]),
    .cmd_mix0(out_vec[48:41]),
    .cmd_mix1(out_vec[40:33]),
    .cmd_reg4(out_vec[32:25]),
    .cmd_reg5(out_vec[24:17]),
    .cmd_reg6(out_vec[16:9]),
    .cmd_reg7(out_vec[8:1]),
    .err(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h36f;
    stim[1] = 10'h3f5;
    stim[2] = 10'h0d9;
    stim[3] = 10'h19b;
    stim[4] = 10'h053;
    stim[5] = 10'h075;
    stim[6] = 10'h10c;
    stim[7] = 10'h173;
    stim[8] = 10'h0a4;
    stim[9] = 10'h094;
    stim[10] = 10'h0b2;
    stim[11] = 10'h075;
    stim[12] = 10'h0a0;
    stim[13] = 10'h1f8;
    stim[14] = 10'h09f;
    stim[15] = 10'h3ab;
    stim[16] = 10'h0d5;
    stim[17] = 10'h010;
    stim[18] = 10'h1e5;
    stim[19] = 10'h13e;
    stim[20] = 10'h0ca;
    stim[21] = 10'h06d;
    stim[22] = 10'h1e9;
    stim[23] = 10'h1ff;
    stim[24] = 10'h132;
    stim[25] = 10'h0df;
    stim[26] = 10'h051;
    stim[27] = 10'h1ed;
    stim[28] = 10'h0b4;
    stim[29] = 10'h059;
    stim[30] = 10'h1ed;
    stim[31] = 10'h17b;
    stim[32] = 10'h04a;
    stim[33] = 10'h1b0;
    stim[34] = 10'h042;
    stim[35] = 10'h0a5;
    stim[36] = 10'h1bb;
    stim[37] = 10'h1df;
    stim[38] = 10'h146;
    stim[39] = 10'h194;
    stim[40] = 10'h0d3;
    stim[41] = 10'h0af;
    stim[42] = 10'h0f9;
    stim[43] = 10'h14b;
    stim[44] = 10'h107;
    stim[45] = 10'h0e7;
    stim[46] = 10'h1e2;
    stim[47] = 10'h1c3;
    stim[48] = 10'h108;
    stim[49] = 10'h140;
    stim[50] = 10'h031;
    stim[51] = 10'h117;
    stim[52] = 10'h04e;
    stim[53] = 10'h0bf;
    stim[54] = 10'h12f;
    stim[55] = 10'h1d5;
    stim[56] = 10'h031;
    stim[57] = 10'h08c;
    stim[58] = 10'h056;
    stim[59] = 10'h0dd;
    stim[60] = 10'h188;
    stim[61] = 10'h0a6;
    stim[62] = 10'h1fa;
    stim[63] = 10'h1ae;
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
      expv[0] = 75'h0000000000000000000;
      expv[1] = 75'h0000000000000000000;
      expv[2] = 75'h0000000000000000000;
      expv[3] = 75'h0000000000000000000;
      expv[4] = 75'h2000000000000000000;
      expv[5] = 75'h2000000000000000000;
      expv[6] = 75'h2000000000000000000;
      expv[7] = 75'h2180000000000000000;
      expv[8] = 75'h218e600000000000000;
      expv[9] = 75'h218e748000000000000;
      expv[10] = 75'h218e749280000000000;
      expv[11] = 75'h218e749296400000000;
      expv[12] = 75'h218e7492964ea000000;
      expv[13] = 75'h218e7492964eb400000;
      expv[14] = 75'h218e7492964eb41f000;
      expv[15] = 75'h0000000000000000000;
      expv[16] = 75'h0000000000000000000;
      expv[17] = 75'h0000000000000000000;
      expv[18] = 75'h0000000000000000000;
      expv[19] = 75'h2000000000000000000;
      expv[20] = 75'h2000000000000000000;
      expv[21] = 75'h2000000000000000000;
      expv[22] = 75'h2da0000000000000000;
      expv[23] = 75'h2dbd200000000000000;
      expv[24] = 75'h2dbd3fe000000000000;
      expv[25] = 75'h2dbd3fe640000000000;
      expv[26] = 75'h2dbd3fe65be00000000;
      expv[27] = 75'h2dbd3fe65bea2000000;
      expv[28] = 75'h2dbd3fe65bea3da0000;
      expv[29] = 75'h2dbd3fe65bea3db6800;
      expv[30] = 75'h2dbd3fe65bea3db68b2;
      expv[31] = 75'h0dbd3fe65bea3db68b2;
      expv[32] = 75'h4dbd3fe65bea3db68b2;
      expv[33] = 75'h0dbd3fe65bea3db68b2;
      expv[34] = 75'h2dbd3fe65bea3db68b2;
      expv[35] = 75'h2dbd3fe65bea3db68b2;
      expv[36] = 75'h2dbd3fe65bea3db68b2;
      expv[37] = 75'h377d3fe65bea3db68b2;
      expv[38] = 75'h377bffe65bea3db68b2;
      expv[39] = 75'h377be8c65bea3db68b2;
      expv[40] = 75'h377be8d29bea3db68b2;
      expv[41] = 75'h377be8d29a6a3db68b2;
      expv[42] = 75'h377be8d29a75fdb68b2;
      expv[43] = 75'h377be8d29a75ff368b2;
      expv[44] = 75'h377be8d29a75ff296b2;
      expv[45] = 75'h377be8d29a75ff2960e;
      expv[46] = 75'h177be8d29a75ff2960e;
      expv[47] = 75'h577be8d29a75ff2960e;
      expv[48] = 75'h377be8d29a75ff2960e;
      expv[49] = 75'h377be8d29a75ff2960e;
      expv[50] = 75'h377be8d29a75ff2960e;
      expv[51] = 75'h263be8d29a75ff2960e;
      expv[52] = 75'h2622e8d29a75ff2960e;
      expv[53] = 75'h2622e9d29a75ff2960e;
      expv[54] = 75'h2622e9d7fa75ff2960e;
      expv[55] = 75'h2622e9d7e5f5ff2960e;
      expv[56] = 75'h2622e9d7e5fabf2960e;
      expv[57] = 75'h2622e9d7e5faa62960e;
      expv[58] = 75'h2622e9d7e5faa63180e;
      expv[59] = 75'h2622e9d7e5faa6318ac;
      expv[60] = 75'h0622e9d7e5faa6318ac;
      expv[61] = 75'h4622e9d7e5faa6318ac;
      expv[62] = 75'h0622e9d7e5faa6318ac;
      expv[63] = 75'h2622e9d7e5faa6318ac;
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
