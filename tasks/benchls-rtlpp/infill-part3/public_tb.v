// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  part3 dut (
    .SW(in_vec[20:3]),
    .KEY(in_vec[2:0]),
    .LEDR(out_vec[20:3]),
    .LEDG(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h1ea01d;
    stim[1] = 21'h03b2cb;
    stim[2] = 21'h109475;
    stim[3] = 21'h038509;
    stim[4] = 21'h1ccf31;
    stim[5] = 21'h01b641;
    stim[6] = 21'h011d06;
    stim[7] = 21'h078cf0;
    stim[8] = 21'h0dae8b;
    stim[9] = 21'h1a725d;
    stim[10] = 21'h04fadb;
    stim[11] = 21'h086d43;
    stim[12] = 21'h1a536b;
    stim[13] = 21'h127f7a;
    stim[14] = 21'h002c2d;
    stim[15] = 21'h15d88b;
    stim[16] = 21'h1f2c10;
    stim[17] = 21'h142e0d;
    stim[18] = 21'h06922a;
    stim[19] = 21'h0266c2;
    stim[20] = 21'h0292e3;
    stim[21] = 21'h1663a4;
    stim[22] = 21'h06f9d1;
    stim[23] = 21'h14a609;
    stim[24] = 21'h0b6077;
    stim[25] = 21'h1468a9;
    stim[26] = 21'h18ffeb;
    stim[27] = 21'h014760;
    stim[28] = 21'h193b2a;
    stim[29] = 21'h1b0145;
    stim[30] = 21'h112adf;
    stim[31] = 21'h0c4415;
    stim[32] = 21'h06af8f;
    stim[33] = 21'h0b8f12;
    stim[34] = 21'h129b3b;
    stim[35] = 21'h102834;
    stim[36] = 21'h01cbf0;
    stim[37] = 21'h0254af;
    stim[38] = 21'h1e920b;
    stim[39] = 21'h0a3af5;
    stim[40] = 21'h15f54c;
    stim[41] = 21'h032c2b;
    stim[42] = 21'h113cd4;
    stim[43] = 21'h0f7f53;
    stim[44] = 21'h18822e;
    stim[45] = 21'h08f195;
    stim[46] = 21'h178069;
    stim[47] = 21'h19ff54;
    stim[48] = 21'h10084b;
    stim[49] = 21'h092062;
    stim[50] = 21'h0c1fc0;
    stim[51] = 21'h056c64;
    stim[52] = 21'h1c8c7d;
    stim[53] = 21'h02af75;
    stim[54] = 21'h128e9c;
    stim[55] = 21'h1a3a90;
    stim[56] = 21'h157b31;
    stim[57] = 21'h096c31;
    stim[58] = 21'h132271;
    stim[59] = 21'h1126d8;
    stim[60] = 21'h0e74a5;
    stim[61] = 21'h150a5e;
    stim[62] = 21'h1ca396;
    stim[63] = 21'h18c8ab;
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
      expv[0] = 21'h1ea01b;
      expv[1] = 21'h03b2c9;
      expv[2] = 21'h109476;
      expv[3] = 21'h03850f;
      expv[4] = 21'h1ccf31;
      expv[5] = 21'h01b643;
      expv[6] = 21'h011d00;
      expv[7] = 21'h078cf1;
      expv[8] = 21'h0dae8f;
      expv[9] = 21'h1a725b;
      expv[10] = 21'h04fadd;
      expv[11] = 21'h086d46;
      expv[12] = 21'h1a5369;
      expv[13] = 21'h127f7f;
      expv[14] = 21'h002c2d;
      expv[15] = 21'h15d88c;
      expv[16] = 21'h1f2c17;
      expv[17] = 21'h142e09;
      expv[18] = 21'h069229;
      expv[19] = 21'h0266c6;
      expv[20] = 21'h0292e1;
      expv[21] = 21'h1663a6;
      expv[22] = 21'h06f9d5;
      expv[23] = 21'h14a609;
      expv[24] = 21'h0b6070;
      expv[25] = 21'h1468a8;
      expv[26] = 21'h18ffef;
      expv[27] = 21'h014760;
      expv[28] = 21'h193b2b;
      expv[29] = 21'h1b0140;
      expv[30] = 21'h112ad8;
      expv[31] = 21'h0c4412;
      expv[32] = 21'h06af88;
      expv[33] = 21'h0b8f10;
      expv[34] = 21'h129b3d;
      expv[35] = 21'h102830;
      expv[36] = 21'h01cbf0;
      expv[37] = 21'h0254a8;
      expv[38] = 21'h1e9209;
      expv[39] = 21'h0a3af6;
      expv[40] = 21'h15f54d;
      expv[41] = 21'h032c2e;
      expv[42] = 21'h113cd3;
      expv[43] = 21'h0f7f57;
      expv[44] = 21'h188228;
      expv[45] = 21'h08f192;
      expv[46] = 21'h17806f;
      expv[47] = 21'h19ff55;
      expv[48] = 21'h10084c;
      expv[49] = 21'h092062;
      expv[50] = 21'h0c1fc3;
      expv[51] = 21'h056c61;
      expv[52] = 21'h1c8c7f;
      expv[53] = 21'h02af76;
      expv[54] = 21'h128e9a;
      expv[55] = 21'h1a3a96;
      expv[56] = 21'h157b32;
      expv[57] = 21'h096c32;
      expv[58] = 21'h132276;
      expv[59] = 21'h1126dc;
      expv[60] = 21'h0e74a4;
      expv[61] = 21'h150a58;
      expv[62] = 21'h1ca390;
      expv[63] = 21'h18c8ac;
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
