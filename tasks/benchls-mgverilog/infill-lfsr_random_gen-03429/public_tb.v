// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03429 dut (
    .clk(clk),
    .seed(in_vec[17:2]),
    .generate_next(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .randnum(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h3cf13;
    stim[1] = 18'h070e3;
    stim[2] = 18'h3e892;
    stim[3] = 18'h1b8a4;
    stim[4] = 18'h18d00;
    stim[5] = 18'h07c0c;
    stim[6] = 18'h08456;
    stim[7] = 18'h32ea6;
    stim[8] = 18'h25108;
    stim[9] = 18'h16eb2;
    stim[10] = 18'h3859e;
    stim[11] = 18'h3e5b2;
    stim[12] = 18'h26f54;
    stim[13] = 18'h2882e;
    stim[14] = 18'h18a0e;
    stim[15] = 18'h23988;
    stim[16] = 18'h0ffae;
    stim[17] = 18'h318a6;
    stim[18] = 18'h1a838;
    stim[19] = 18'h1681c;
    stim[20] = 18'h0868c;
    stim[21] = 18'h3f620;
    stim[22] = 18'h1cc8c;
    stim[23] = 18'h34460;
    stim[24] = 18'h0cd7a;
    stim[25] = 18'h330ba;
    stim[26] = 18'h07362;
    stim[27] = 18'h389be;
    stim[28] = 18'h14814;
    stim[29] = 18'h2cd3e;
    stim[30] = 18'h22f2c;
    stim[31] = 18'h2723a;
    stim[32] = 18'h307ec;
    stim[33] = 18'h18bb6;
    stim[34] = 18'h38f64;
    stim[35] = 18'h0b330;
    stim[36] = 18'h0130a;
    stim[37] = 18'h151a8;
    stim[38] = 18'h13724;
    stim[39] = 18'h16cd8;
    stim[40] = 18'h04b10;
    stim[41] = 18'h2d1f4;
    stim[42] = 18'h0d416;
    stim[43] = 18'h301d2;
    stim[44] = 18'h29ec6;
    stim[45] = 18'h17dde;
    stim[46] = 18'h2fdbe;
    stim[47] = 18'h1d5a2;
    stim[48] = 18'h308f8;
    stim[49] = 18'h37d1d;
    stim[50] = 18'h0abdc;
    stim[51] = 18'h0b918;
    stim[52] = 18'h0bafc;
    stim[53] = 18'h13bb2;
    stim[54] = 18'h0b426;
    stim[55] = 18'h12284;
    stim[56] = 18'h38e02;
    stim[57] = 18'h00c2c;
    stim[58] = 18'h2e038;
    stim[59] = 18'h23c12;
    stim[60] = 18'h044cc;
    stim[61] = 18'h28856;
    stim[62] = 18'h2332c;
    stim[63] = 18'h0e8ee;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hf3c4;
      expv[2] = 16'h1c38;
      expv[3] = 16'h8e1c;
      expv[4] = 16'h8e1c;
      expv[5] = 16'h8e1c;
      expv[6] = 16'h8e1c;
      expv[7] = 16'h470e;
      expv[8] = 16'ha387;
      expv[9] = 16'ha387;
      expv[10] = 16'hd1c3;
      expv[11] = 16'h68e1;
      expv[12] = 16'h3470;
      expv[13] = 16'h3470;
      expv[14] = 16'h1a38;
      expv[15] = 16'h8d1c;
      expv[16] = 16'h8d1c;
      expv[17] = 16'h468e;
      expv[18] = 16'ha347;
      expv[19] = 16'ha347;
      expv[20] = 16'ha347;
      expv[21] = 16'ha347;
      expv[22] = 16'ha347;
      expv[23] = 16'ha347;
      expv[24] = 16'ha347;
      expv[25] = 16'hd1a3;
      expv[26] = 16'h68d1;
      expv[27] = 16'h3468;
      expv[28] = 16'h9a34;
      expv[29] = 16'h9a34;
      expv[30] = 16'h4d1a;
      expv[31] = 16'h4d1a;
      expv[32] = 16'ha68d;
      expv[33] = 16'ha68d;
      expv[34] = 16'hd346;
      expv[35] = 16'hd346;
      expv[36] = 16'hd346;
      expv[37] = 16'he9a3;
      expv[38] = 16'he9a3;
      expv[39] = 16'he9a3;
      expv[40] = 16'he9a3;
      expv[41] = 16'he9a3;
      expv[42] = 16'he9a3;
      expv[43] = 16'hf4d1;
      expv[44] = 16'hfa68;
      expv[45] = 16'hfd34;
      expv[46] = 16'h7e9a;
      expv[47] = 16'h3f4d;
      expv[48] = 16'h1fa6;
      expv[49] = 16'h1fa6;
      expv[50] = 16'hdf47;
      expv[51] = 16'hdf47;
      expv[52] = 16'hdf47;
      expv[53] = 16'hdf47;
      expv[54] = 16'h6fa3;
      expv[55] = 16'hb7d1;
      expv[56] = 16'hb7d1;
      expv[57] = 16'hdbe8;
      expv[58] = 16'hdbe8;
      expv[59] = 16'hdbe8;
      expv[60] = 16'hedf4;
      expv[61] = 16'hedf4;
      expv[62] = 16'hf6fa;
      expv[63] = 16'hf6fa;
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
