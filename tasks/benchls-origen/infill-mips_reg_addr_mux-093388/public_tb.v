// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_093388 dut (
    .Ins(in_vec[32:1]),
    .enable(in_vec[0:0]),
    .add_A(out_vec[14:10]),
    .add_B(out_vec[9:5]),
    .add_mem(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0834361e9;
    stim[1] = 33'h11c391128;
    stim[2] = 33'h142911c48;
    stim[3] = 33'h16ff6838b;
    stim[4] = 33'h1f767ae56;
    stim[5] = 33'h15c5f8c32;
    stim[6] = 33'h0670abb36;
    stim[7] = 33'h1606a4355;
    stim[8] = 33'h05e261ffc;
    stim[9] = 33'h146c26c1d;
    stim[10] = 33'h020d10306;
    stim[11] = 33'h1cacc9d04;
    stim[12] = 33'h1e09f635c;
    stim[13] = 33'h074be3398;
    stim[14] = 33'h04c069126;
    stim[15] = 33'h1a5eeeab6;
    stim[16] = 33'h17455fb42;
    stim[17] = 33'h0435f9b7c;
    stim[18] = 33'h1a46c4433;
    stim[19] = 33'h1ea1890b4;
    stim[20] = 33'h08feb1547;
    stim[21] = 33'h13b3c9ad7;
    stim[22] = 33'h1a4ac9f17;
    stim[23] = 33'h172ee0165;
    stim[24] = 33'h082fcdd01;
    stim[25] = 33'h1267ac065;
    stim[26] = 33'h1230a495f;
    stim[27] = 33'h012bb5f10;
    stim[28] = 33'h0816e9952;
    stim[29] = 33'h05bb7fda0;
    stim[30] = 33'h14e63aaeb;
    stim[31] = 33'h069c06231;
    stim[32] = 33'h1d7b3911e;
    stim[33] = 33'h0b35bc5e8;
    stim[34] = 33'h0c66defda;
    stim[35] = 33'h0daef942e;
    stim[36] = 33'h0692cc075;
    stim[37] = 33'h05d15695c;
    stim[38] = 33'h1756d51c8;
    stim[39] = 33'h1d0d6c261;
    stim[40] = 33'h033bb61b2;
    stim[41] = 33'h0aa544e5c;
    stim[42] = 33'h1c522fb2a;
    stim[43] = 33'h1b799ea16;
    stim[44] = 33'h150640e16;
    stim[45] = 33'h040c94136;
    stim[46] = 33'h07f92783d;
    stim[47] = 33'h115c89cd5;
    stim[48] = 33'h114c5a834;
    stim[49] = 33'h0ef967a5b;
    stim[50] = 33'h1ff9ad6e3;
    stim[51] = 33'h0d55a1e11;
    stim[52] = 33'h0436ab8fd;
    stim[53] = 33'h14c80c4b2;
    stim[54] = 33'h091490287;
    stim[55] = 33'h143f9e38f;
    stim[56] = 33'h018a83419;
    stim[57] = 33'h1196e93a9;
    stim[58] = 33'h1f2ba68bd;
    stim[59] = 33'h049db32f6;
    stim[60] = 33'h12335c7e8;
    stim[61] = 33'h084b98588;
    stim[62] = 33'h056c5c48e;
    stim[63] = 33'h1a7632a0f;
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
      expv[0] = 15'h0000;
      expv[1] = 15'h0000;
      expv[2] = 15'h0000;
      expv[3] = 15'h0000;
      expv[4] = 15'h0000;
      expv[5] = 15'h0000;
      expv[6] = 15'h0000;
      expv[7] = 15'h0000;
      expv[8] = 15'h0000;
      expv[9] = 15'h0000;
      expv[10] = 15'h0000;
      expv[11] = 15'h0000;
      expv[12] = 15'h0000;
      expv[13] = 15'h0000;
      expv[14] = 15'h0000;
      expv[15] = 15'h0000;
      expv[16] = 15'h0000;
      expv[17] = 15'h0000;
      expv[18] = 15'h0000;
      expv[19] = 15'h0000;
      expv[20] = 15'h0000;
      expv[21] = 15'h0000;
      expv[22] = 15'h0000;
      expv[23] = 15'h0000;
      expv[24] = 15'h0000;
      expv[25] = 15'h0000;
      expv[26] = 15'h0000;
      expv[27] = 15'h0000;
      expv[28] = 15'h0000;
      expv[29] = 15'h0000;
      expv[30] = 15'h0000;
      expv[31] = 15'h1c00;
      expv[32] = 15'h0000;
      expv[33] = 15'h0000;
      expv[34] = 15'h0000;
      expv[35] = 15'h0000;
      expv[36] = 15'h1000;
      expv[37] = 15'h0000;
      expv[38] = 15'h0000;
      expv[39] = 15'h0000;
      expv[40] = 15'h0000;
      expv[41] = 15'h0000;
      expv[42] = 15'h0000;
      expv[43] = 15'h0000;
      expv[44] = 15'h0000;
      expv[45] = 15'h0000;
      expv[46] = 15'h0000;
      expv[47] = 15'h0000;
      expv[48] = 15'h0000;
      expv[49] = 15'h0000;
      expv[50] = 15'h0000;
      expv[51] = 15'h0000;
      expv[52] = 15'h3400;
      expv[53] = 15'h0000;
      expv[54] = 15'h0000;
      expv[55] = 15'h0000;
      expv[56] = 15'h0000;
      expv[57] = 15'h1417;
      expv[58] = 15'h0000;
      expv[59] = 15'h0000;
      expv[60] = 15'h0000;
      expv[61] = 15'h0000;
      expv[62] = 15'h0000;
      expv[63] = 15'h0000;
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
