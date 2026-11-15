// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_063413 dut (
    .dataa(in_vec[18:11]),
    .datab(in_vec[10:3]),
    .signa(in_vec[2:2]),
    .signb(in_vec[1:1]),
    .addsub(in_vec[0:0]),
    .sum(out_vec[9:1]),
    .sumsign(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h0af07;
    stim[1] = 19'h0a158;
    stim[2] = 19'h52608;
    stim[3] = 19'h40d7c;
    stim[4] = 19'h3d8b3;
    stim[5] = 19'h7beb1;
    stim[6] = 19'h7fced;
    stim[7] = 19'h4c06f;
    stim[8] = 19'h456b5;
    stim[9] = 19'h66bb0;
    stim[10] = 19'h66fde;
    stim[11] = 19'h08159;
    stim[12] = 19'h45b73;
    stim[13] = 19'h7d5b4;
    stim[14] = 19'h2101a;
    stim[15] = 19'h68b4a;
    stim[16] = 19'h71a08;
    stim[17] = 19'h2dde7;
    stim[18] = 19'h1b859;
    stim[19] = 19'h57736;
    stim[20] = 19'h089a7;
    stim[21] = 19'h54bdb;
    stim[22] = 19'h3135f;
    stim[23] = 19'h12f48;
    stim[24] = 19'h1f0de;
    stim[25] = 19'h0b00c;
    stim[26] = 19'h68634;
    stim[27] = 19'h4a0f5;
    stim[28] = 19'h256ac;
    stim[29] = 19'h2db1f;
    stim[30] = 19'h49c9e;
    stim[31] = 19'h26aa2;
    stim[32] = 19'h47661;
    stim[33] = 19'h01a21;
    stim[34] = 19'h551b3;
    stim[35] = 19'h525db;
    stim[36] = 19'h4d99c;
    stim[37] = 19'h35753;
    stim[38] = 19'h33e3b;
    stim[39] = 19'h79cd5;
    stim[40] = 19'h3db83;
    stim[41] = 19'h4ff79;
    stim[42] = 19'h02a96;
    stim[43] = 19'h1de48;
    stim[44] = 19'h5600d;
    stim[45] = 19'h11662;
    stim[46] = 19'h72404;
    stim[47] = 19'h5fb45;
    stim[48] = 19'h07d28;
    stim[49] = 19'h60e81;
    stim[50] = 19'h08937;
    stim[51] = 19'h4d82f;
    stim[52] = 19'h49b1d;
    stim[53] = 19'h3940b;
    stim[54] = 19'h632ee;
    stim[55] = 19'h125b7;
    stim[56] = 19'h7d46b;
    stim[57] = 19'h7519d;
    stim[58] = 19'h32745;
    stim[59] = 19'h70dc8;
    stim[60] = 19'h60d98;
    stim[61] = 19'h172b5;
    stim[62] = 19'h4af64;
    stim[63] = 19'h519a4;
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
      expv[0] = 10'h1ea;
      expv[1] = 10'h3d3;
      expv[2] = 10'h3c7;
      expv[3] = 10'h3a5;
      expv[4] = 10'h122;
      expv[5] = 10'h39a;
      expv[6] = 10'h338;
      expv[7] = 10'h14a;
      expv[8] = 10'h2c0;
      expv[9] = 10'h0ae;
      expv[10] = 10'h3a5;
      expv[11] = 10'h076;
      expv[12] = 10'h1f2;
      expv[13] = 10'h088;
      expv[14] = 10'h07e;
      expv[15] = 10'h0d0;
      expv[16] = 10'h144;
      expv[17] = 10'h22e;
      expv[18] = 10'h084;
      expv[19] = 10'h391;
      expv[20] = 10'h08a;
      expv[21] = 10'h248;
      expv[22] = 10'h19a;
      expv[23] = 10'h279;
      expv[24] = 10'h046;
      expv[25] = 10'h02a;
      expv[26] = 10'h014;
      expv[27] = 10'h164;
      expv[28] = 10'h2eb;
      expv[29] = 10'h17c;
      expv[30] = 10'h000;
      expv[31] = 10'h3f3;
      expv[32] = 10'h2b4;
      expv[33] = 10'h08e;
      expv[34] = 10'h1c0;
      expv[35] = 10'h2be;
      expv[36] = 10'h0d0;
      expv[37] = 10'h2a8;
      expv[38] = 10'h25c;
      expv[39] = 10'h31a;
      expv[40] = 10'h1d6;
      expv[41] = 10'h31c;
      expv[42] = 10'h367;
      expv[43] = 10'h2e5;
      expv[44] = 10'h15a;
      expv[45] = 10'h2ad;
      expv[46] = 10'h0c8;
      expv[47] = 10'h24e;
      expv[48] = 10'h2d5;
      expv[49] = 10'h322;
      expv[50] = 10'h06e;
      expv[51] = 10'h140;
      expv[52] = 10'h1ec;
      expv[53] = 10'h1e6;
      expv[54] = 10'h0d2;
      expv[55] = 10'h1b4;
      expv[56] = 10'h30e;
      expv[57] = 10'h23a;
      expv[58] = 10'h298;
      expv[59] = 10'h050;
      expv[60] = 10'h01c;
      expv[61] = 10'h108;
      expv[62] = 10'h353;
      expv[63] = 10'h0de;
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
