// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_019553 dut (
    .X8(in_vec[16:9]),
    .Y8(in_vec[8:1]),
    .Cin8(in_vec[0:0]),
    .S8(out_vec[9:2]),
    .G(out_vec[1:1]),
    .P(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h01725;
    stim[1] = 17'h148cb;
    stim[2] = 17'h1146b;
    stim[3] = 17'h13896;
    stim[4] = 17'h14856;
    stim[5] = 17'h129a7;
    stim[6] = 17'h18ded;
    stim[7] = 17'h1c8df;
    stim[8] = 17'h04eb0;
    stim[9] = 17'h0ac8e;
    stim[10] = 17'h1af2b;
    stim[11] = 17'h08fd7;
    stim[12] = 17'h030c3;
    stim[13] = 17'h12211;
    stim[14] = 17'h08a08;
    stim[15] = 17'h1948f;
    stim[16] = 17'h1b68f;
    stim[17] = 17'h1a3a0;
    stim[18] = 17'h022d3;
    stim[19] = 17'h08e7c;
    stim[20] = 17'h0a255;
    stim[21] = 17'h0f1c1;
    stim[22] = 17'h03b4c;
    stim[23] = 17'h00e48;
    stim[24] = 17'h1337b;
    stim[25] = 17'h1613b;
    stim[26] = 17'h02bd0;
    stim[27] = 17'h14b5a;
    stim[28] = 17'h00ed3;
    stim[29] = 17'h04aaf;
    stim[30] = 17'h1badb;
    stim[31] = 17'h0ef2f;
    stim[32] = 17'h1bd1e;
    stim[33] = 17'h03825;
    stim[34] = 17'h156ee;
    stim[35] = 17'h1ef63;
    stim[36] = 17'h194d6;
    stim[37] = 17'h12097;
    stim[38] = 17'h1d54b;
    stim[39] = 17'h11276;
    stim[40] = 17'h13a01;
    stim[41] = 17'h09f04;
    stim[42] = 17'h1efe6;
    stim[43] = 17'h121f9;
    stim[44] = 17'h12e94;
    stim[45] = 17'h1a818;
    stim[46] = 17'h19b22;
    stim[47] = 17'h08529;
    stim[48] = 17'h0d93e;
    stim[49] = 17'h02bef;
    stim[50] = 17'h0ea54;
    stim[51] = 17'h1acc5;
    stim[52] = 17'h1726e;
    stim[53] = 17'h0af40;
    stim[54] = 17'h1d3c8;
    stim[55] = 17'h09cfb;
    stim[56] = 17'h10d97;
    stim[57] = 17'h151ea;
    stim[58] = 17'h1f037;
    stim[59] = 17'h08198;
    stim[60] = 17'h019b0;
    stim[61] = 17'h07533;
    stim[62] = 17'h1fe19;
    stim[63] = 17'h01641;
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
      expv[0] = 10'h278;
      expv[1] = 10'h02a;
      expv[2] = 10'h300;
      expv[3] = 10'h39c;
      expv[4] = 10'h33c;
      expv[5] = 10'h1a2;
      expv[6] = 10'h2f6;
      expv[7] = 10'h152;
      expv[8] = 10'h1fc;
      expv[9] = 10'h274;
      expv[10] = 10'h1b6;
      expv[11] = 10'h0ce;
      expv[12] = 10'h1e8;
      expv[13] = 10'h268;
      expv[14] = 10'h124;
      expv[15] = 10'h04a;
      expv[16] = 10'h08e;
      expv[17] = 10'h286;
      expv[18] = 10'h1ec;
      expv[19] = 10'h214;
      expv[20] = 10'h1f0;
      expv[21] = 10'h166;
      expv[22] = 10'h30c;
      expv[23] = 10'h0ac;
      expv[24] = 10'h15e;
      expv[25] = 10'h13a;
      expv[26] = 10'h3f4;
      expv[27] = 10'h14a;
      expv[28] = 10'h1c4;
      expv[29] = 10'h1f4;
      expv[30] = 10'h12e;
      expv[31] = 10'h03e;
      expv[32] = 10'h1b6;
      expv[33] = 10'h0bc;
      expv[34] = 10'h08b;
      expv[35] = 10'h2a6;
      expv[36] = 10'h0d6;
      expv[37] = 10'h370;
      expv[38] = 10'h242;
      expv[39] = 10'h310;
      expv[40] = 10'h278;
      expv[41] = 10'h344;
      expv[42] = 10'h3aa;
      expv[43] = 10'h236;
      expv[44] = 10'h384;
      expv[45] = 10'h380;
      expv[46] = 10'h17a;
      expv[47] = 10'h35c;
      expv[48] = 10'h02f;
      expv[49] = 10'h036;
      expv[50] = 10'h27c;
      expv[51] = 10'h0e6;
      expv[52] = 10'h3c0;
      expv[53] = 10'h3dc;
      expv[54] = 10'h336;
      expv[55] = 10'h330;
      expv[56] = 10'h14a;
      expv[57] = 10'h276;
      expv[58] = 10'h052;
      expv[59] = 10'h032;
      expv[60] = 10'h390;
      expv[61] = 10'h350;
      expv[62] = 10'h033;
      expv[63] = 10'h0b0;
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
