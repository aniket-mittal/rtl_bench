// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 74;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_149448 dut (
    .clk(clk),
    .rst(in_vec[73:73]),
    .d0_i(in_vec[72:65]),
    .d1_i(in_vec[64:57]),
    .d2_i(in_vec[56:49]),
    .d3_i(in_vec[48:41]),
    .d4_i(in_vec[40:33]),
    .d5_i(in_vec[32:25]),
    .d6_i(in_vec[24:17]),
    .d7_i(in_vec[16:9]),
    .d8_i(in_vec[8:1]),
    .done_i(in_vec[0:0]),
    .grayscale_o(out_vec[8:1]),
    .done_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 74'h2e7f6a3b0baa323174d;
    stim[1] = 74'h3676c19a73e65e81106;
    stim[2] = 74'h1f66dd2307093eefa83;
    stim[3] = 74'h01a9b95bece96d255d9;
    stim[4] = 74'h089d7de859763467111;
    stim[5] = 74'h119b78edcf69dc8f5a4;
    stim[6] = 74'h1bc10d163ba55bbbeaa;
    stim[7] = 74'h1a94b2f423ee3212935;
    stim[8] = 74'h0d6795cf39c01ee35e3;
    stim[9] = 74'h10df372041c683fa46f;
    stim[10] = 74'h0a9cab650ca60c908fc;
    stim[11] = 74'h02ed422310625ee966a;
    stim[12] = 74'h022d77038d75c89df9f;
    stim[13] = 74'h0734da7ef517571a8cc;
    stim[14] = 74'h109d0ac34b22a4824c3;
    stim[15] = 74'h0534f81f2fa25a97532;
    stim[16] = 74'h11362079cd20575e4c2;
    stim[17] = 74'h0d1028cf5a4bba6a595;
    stim[18] = 74'h125e57a65a734757f73;
    stim[19] = 74'h03c9da51df783d07f59;
    stim[20] = 74'h1b8871185e48a46f219;
    stim[21] = 74'h1a5ff5c8ac15be34a10;
    stim[22] = 74'h20d3f2f5df8c17dac10;
    stim[23] = 74'h0a89ff622677e092fee;
    stim[24] = 74'h1dea3081de2abf820be;
    stim[25] = 74'h194ee4120108330dee4;
    stim[26] = 74'h09ac03c97288cf044a9;
    stim[27] = 74'h0af06b7e573fb0a890e;
    stim[28] = 74'h079a49cbd20eb77fabf;
    stim[29] = 74'h0829dc7b7871ec9a1d7;
    stim[30] = 74'h0c54e62d2d8bc3edf13;
    stim[31] = 74'h037c0669e3883cf5eef;
    stim[32] = 74'h03a0092e07811e2b738;
    stim[33] = 74'h013fdc74d0eca323088;
    stim[34] = 74'h1a99ae6fe024ee41d6c;
    stim[35] = 74'h1df3bcd005471309ddf;
    stim[36] = 74'h0eb6032d0d48f7c2f81;
    stim[37] = 74'h0b17070b7762a83e9d5;
    stim[38] = 74'h18a6b10f833fc98b1cc;
    stim[39] = 74'h149a0ea3a09bc2ac62a;
    stim[40] = 74'h139cb5610eb32dba81e;
    stim[41] = 74'h1b46941bd3a3c4d8fbe;
    stim[42] = 74'h16f711d9cf3fb232e51;
    stim[43] = 74'h1d34055936d673fa401;
    stim[44] = 74'h095f50d27a45e55b701;
    stim[45] = 74'h0e8320b8940641f2d13;
    stim[46] = 74'h055804d62bc48a16d1e;
    stim[47] = 74'h1fc67f14b203dc9652f;
    stim[48] = 74'h15fd5776a31533373a0;
    stim[49] = 74'h094a8d980abaf7bc0a5;
    stim[50] = 74'h1d0ee78514844f07366;
    stim[51] = 74'h0c92eb6055d0e087d83;
    stim[52] = 74'h10816e4157ef5eb1962;
    stim[53] = 74'h0d180887070b4269f1f;
    stim[54] = 74'h03b81f70989bed8d5a4;
    stim[55] = 74'h0bf2917088dedeb66eb;
    stim[56] = 74'h0fdd5e570b5f80e7739;
    stim[57] = 74'h13b0178f99239d8a17a;
    stim[58] = 74'h07e06a5cc5560451b40;
    stim[59] = 74'h0be3c7479e89cff0691;
    stim[60] = 74'h1c51815ebc90fc49f91;
    stim[61] = 74'h1aa8469a1148a43c844;
    stim[62] = 74'h17f6dacafc057741ce5;
    stim[63] = 74'h1d00b9f4ab52d42b831;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h1f8;
      expv[4] = 9'h1fe;
      expv[5] = 9'h1fe;
      expv[6] = 9'h001;
      expv[7] = 9'h1ff;
      expv[8] = 9'h16b;
      expv[9] = 9'h1d2;
      expv[10] = 9'h1fe;
      expv[11] = 9'h0af;
      expv[12] = 9'h1ff;
      expv[13] = 9'h1ff;
      expv[14] = 9'h096;
      expv[15] = 9'h1fe;
      expv[16] = 9'h1ff;
      expv[17] = 9'h1fe;
      expv[18] = 9'h1ff;
      expv[19] = 9'h1fe;
      expv[20] = 9'h1fe;
      expv[21] = 9'h1ff;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h1fe;
      expv[25] = 9'h1fe;
      expv[26] = 9'h1fe;
      expv[27] = 9'h0f6;
      expv[28] = 9'h000;
      expv[29] = 9'h1dc;
      expv[30] = 9'h1ff;
      expv[31] = 9'h0a2;
      expv[32] = 9'h1ff;
      expv[33] = 9'h1ff;
      expv[34] = 9'h1ff;
      expv[35] = 9'h1ff;
      expv[36] = 9'h146;
      expv[37] = 9'h1a4;
      expv[38] = 9'h1fe;
      expv[39] = 9'h1cf;
      expv[40] = 9'h1ff;
      expv[41] = 9'h1ff;
      expv[42] = 9'h0be;
      expv[43] = 9'h1fe;
      expv[44] = 9'h1fe;
      expv[45] = 9'h0e6;
      expv[46] = 9'h1ff;
      expv[47] = 9'h1af;
      expv[48] = 9'h1bd;
      expv[49] = 9'h0d3;
      expv[50] = 9'h1fe;
      expv[51] = 9'h15d;
      expv[52] = 9'h1fe;
      expv[53] = 9'h1ff;
      expv[54] = 9'h1ea;
      expv[55] = 9'h1ff;
      expv[56] = 9'h17a;
      expv[57] = 9'h1ff;
      expv[58] = 9'h120;
      expv[59] = 9'h1ff;
      expv[60] = 9'h1bb;
      expv[61] = 9'h1fe;
      expv[62] = 9'h1fe;
      expv[63] = 9'h1ff;
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
