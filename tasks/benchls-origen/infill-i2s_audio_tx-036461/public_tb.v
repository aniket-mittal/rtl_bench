// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_036461 dut (
    .CLK_I2S(clk),
    .nRESET(in_vec[10:10]),
    .ANA(in_vec[9:4]),
    .SH1(in_vec[3:3]),
    .SH2(in_vec[2:2]),
    .OP0(in_vec[1:1]),
    .PHI_M(in_vec[0:0]),
    .I2S_MCLK(out_vec[3:3]),
    .I2S_BICK(out_vec[2:2]),
    .I2S_SDTI(out_vec[1:1]),
    .I2S_LRCK(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h7fa;
    stim[1] = 11'h689;
    stim[2] = 11'h1a9;
    stim[3] = 11'h049;
    stim[4] = 11'h353;
    stim[5] = 11'h1a5;
    stim[6] = 11'h249;
    stim[7] = 11'h062;
    stim[8] = 11'h1a6;
    stim[9] = 11'h06b;
    stim[10] = 11'h0df;
    stim[11] = 11'h2e0;
    stim[12] = 11'h061;
    stim[13] = 11'h2ba;
    stim[14] = 11'h014;
    stim[15] = 11'h329;
    stim[16] = 11'h0d9;
    stim[17] = 11'h208;
    stim[18] = 11'h10c;
    stim[19] = 11'h1c8;
    stim[20] = 11'h20b;
    stim[21] = 11'h375;
    stim[22] = 11'h0d1;
    stim[23] = 11'h307;
    stim[24] = 11'h1d1;
    stim[25] = 11'h21e;
    stim[26] = 11'h21d;
    stim[27] = 11'h360;
    stim[28] = 11'h0ad;
    stim[29] = 11'h086;
    stim[30] = 11'h33b;
    stim[31] = 11'h19f;
    stim[32] = 11'h2ad;
    stim[33] = 11'h127;
    stim[34] = 11'h138;
    stim[35] = 11'h0c2;
    stim[36] = 11'h091;
    stim[37] = 11'h1fa;
    stim[38] = 11'h3cd;
    stim[39] = 11'h213;
    stim[40] = 11'h2f6;
    stim[41] = 11'h1ec;
    stim[42] = 11'h255;
    stim[43] = 11'h340;
    stim[44] = 11'h120;
    stim[45] = 11'h047;
    stim[46] = 11'h0cc;
    stim[47] = 11'h2da;
    stim[48] = 11'h3dd;
    stim[49] = 11'h0dd;
    stim[50] = 11'h1f4;
    stim[51] = 11'h236;
    stim[52] = 11'h148;
    stim[53] = 11'h194;
    stim[54] = 11'h23b;
    stim[55] = 11'h20b;
    stim[56] = 11'h28e;
    stim[57] = 11'h3b8;
    stim[58] = 11'h2d1;
    stim[59] = 11'h2df;
    stim[60] = 11'h25f;
    stim[61] = 11'h0e0;
    stim[62] = 11'h206;
    stim[63] = 11'h294;
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
      expv[0] = 4'h0;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h0;
      expv[4] = 4'h0;
      expv[5] = 4'h0;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'h0;
      expv[9] = 4'h0;
      expv[10] = 4'h0;
      expv[11] = 4'h0;
      expv[12] = 4'h0;
      expv[13] = 4'h0;
      expv[14] = 4'h0;
      expv[15] = 4'h0;
      expv[16] = 4'h0;
      expv[17] = 4'h0;
      expv[18] = 4'h0;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h0;
      expv[22] = 4'h0;
      expv[23] = 4'h0;
      expv[24] = 4'h0;
      expv[25] = 4'h0;
      expv[26] = 4'h0;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h0;
      expv[30] = 4'h0;
      expv[31] = 4'h0;
      expv[32] = 4'h0;
      expv[33] = 4'h0;
      expv[34] = 4'h0;
      expv[35] = 4'h0;
      expv[36] = 4'h0;
      expv[37] = 4'h0;
      expv[38] = 4'h0;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h0;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'h0;
      expv[45] = 4'h0;
      expv[46] = 4'h0;
      expv[47] = 4'h0;
      expv[48] = 4'h0;
      expv[49] = 4'h0;
      expv[50] = 4'h0;
      expv[51] = 4'h0;
      expv[52] = 4'h0;
      expv[53] = 4'h0;
      expv[54] = 4'h0;
      expv[55] = 4'h0;
      expv[56] = 4'h0;
      expv[57] = 4'h0;
      expv[58] = 4'h0;
      expv[59] = 4'h0;
      expv[60] = 4'h0;
      expv[61] = 4'h0;
      expv[62] = 4'h0;
      expv[63] = 4'h0;
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
