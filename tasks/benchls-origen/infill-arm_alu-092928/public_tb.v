// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 69;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_092928 dut (
    .in1(in_vec[68:37]),
    .in2(in_vec[36:5]),
    .EXE_CMD(in_vec[4:1]),
    .c(in_vec[0:0]),
    .N(out_vec[35:35]),
    .Z(out_vec[34:34]),
    .C(out_vec[33:33]),
    .V(out_vec[32:32]),
    .out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 69'h0bc7b805833d9455dc;
    stim[1] = 69'h100be4365bbf0a1fe8;
    stim[2] = 69'h12a626006850a7a33d;
    stim[3] = 69'h14c7d2485af3872224;
    stim[4] = 69'h1874f856d8037532ea;
    stim[5] = 69'h024d649d20fe0fdf5c;
    stim[6] = 69'h0e184db8130f2974ab;
    stim[7] = 69'h172cb22e170365a4ec;
    stim[8] = 69'h112033021baf46bed2;
    stim[9] = 69'h190a6ef0b4cca47788;
    stim[10] = 69'h13711770191477c3bc;
    stim[11] = 69'h1098ec78c1ca9bc2df;
    stim[12] = 69'h16681bf7fab3adfbeb;
    stim[13] = 69'h01ffe25710d65f66a1;
    stim[14] = 69'h16c7b6c383fec1c03e;
    stim[15] = 69'h03a71f2da4f457e2c4;
    stim[16] = 69'h04edc283582560e5f2;
    stim[17] = 69'h04b9f81807e68ae049;
    stim[18] = 69'h1f1a018af5655ca865;
    stim[19] = 69'h1e4c435bf775f3ffe7;
    stim[20] = 69'h00f4dffb6ea976cb88;
    stim[21] = 69'h1ef1b2670a97ae7912;
    stim[22] = 69'h02bc744b4c26d5bb9e;
    stim[23] = 69'h1b4b59d8cb63c06f68;
    stim[24] = 69'h073a9411873eb7b2b7;
    stim[25] = 69'h114f7926d991ec30d4;
    stim[26] = 69'h095c98faf12b343608;
    stim[27] = 69'h1a7c6ec9eef3197a08;
    stim[28] = 69'h1a965208afa4db7f21;
    stim[29] = 69'h07700c7adcf8fa5689;
    stim[30] = 69'h1841f6518ad470b490;
    stim[31] = 69'h0d75463405139277ce;
    stim[32] = 69'h133b59791ccf8090a0;
    stim[33] = 69'h08bdab0874d6f915eb;
    stim[34] = 69'h05c9ab59a94969028a;
    stim[35] = 69'h11976acd5939a6046c;
    stim[36] = 69'h16c0b54d5eab1fd9c0;
    stim[37] = 69'h125bccbe2afdb5b550;
    stim[38] = 69'h054ed1a20f42d95a8b;
    stim[39] = 69'h1b3a49d4e47b5270e2;
    stim[40] = 69'h0793319fc00640927b;
    stim[41] = 69'h0d8a5a8fd62225d582;
    stim[42] = 69'h0fc2190388effd3527;
    stim[43] = 69'h1d6c7223d11d18155c;
    stim[44] = 69'h18f0b59c430f462141;
    stim[45] = 69'h11d1e18e8e24f392ee;
    stim[46] = 69'h198824ed31e2e8ebcc;
    stim[47] = 69'h1ad8454f1fd83cc742;
    stim[48] = 69'h1f8ac2a02569127ac3;
    stim[49] = 69'h1b33c2ee803b40b321;
    stim[50] = 69'h0e26f738878e6d0256;
    stim[51] = 69'h1f614ea74225c84637;
    stim[52] = 69'h189104529b7265157e;
    stim[53] = 69'h1c6681fecd6101a006;
    stim[54] = 69'h1065e9c68632161805;
    stim[55] = 69'h0a54125938497a9eb7;
    stim[56] = 69'h00a8bd4a4e035b12bb;
    stim[57] = 69'h18c15e74064e7bc840;
    stim[58] = 69'h092e7f2e1ac1109dce;
    stim[59] = 69'h1eab89ba6411df47bc;
    stim[60] = 69'h0c8e7a2d599008e95f;
    stim[61] = 69'h024ad0bd92747495b7;
    stim[62] = 69'h0c9eac87888c188fd2;
    stim[63] = 69'h027baf052fad5e3a8b;
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
      expv[0] = 36'h400000000;
      expv[1] = 36'haa266d0b3;
      expv[2] = 36'h400000000;
      expv[3] = 36'h37ddacb53;
      expv[4] = 36'h0038c191e;
      expv[5] = 36'h400000000;
      expv[6] = 36'hbd849221b;
      expv[7] = 36'h8b8010120;
      expv[8] = 36'h22285ca09;
      expv[9] = 36'h021ee53c9;
      expv[10] = 36'h400000000;
      expv[11] = 36'h400000000;
      expv[12] = 36'hadda36fe0;
      expv[13] = 36'h400000000;
      expv[14] = 36'h400000000;
      expv[15] = 36'h044dbb883;
      expv[16] = 36'h23ed4f8d0;
      expv[17] = 36'hae69b69be;
      expv[18] = 36'haa3faf19a;
      expv[19] = 36'haae11badf;
      expv[20] = 36'ha925b497f;
      expv[21] = 36'haab428c37;
      expv[22] = 36'h400000000;
      expv[23] = 36'h17f3ccb4b;
      expv[24] = 36'h400000000;
      expv[25] = 36'h400000000;
      expv[26] = 36'hbc18b2627;
      expv[27] = 36'h15c4aaa7f;
      expv[28] = 36'h400000000;
      expv[29] = 36'h253b89122;
      expv[30] = 36'h894ac3728;
      expv[31] = 36'h06bbeb3be;
      expv[32] = 36'h400000000;
      expv[33] = 36'hb9f358f94;
      expv[34] = 36'hae40212b8;
      expv[35] = 36'h888891022;
      expv[36] = 36'h400000000;
      expv[37] = 36'h8c533c85b;
      expv[38] = 36'hab05fc23c;
      expv[39] = 36'h023da9387;
      expv[40] = 36'h400000000;
      expv[41] = 36'h8b1112eac;
      expv[42] = 36'h9c590b1c6;
      expv[43] = 36'h400000000;
      expv[44] = 36'h400000000;
      expv[45] = 36'h8ffaf9cf7;
      expv[46] = 36'h88c010748;
      expv[47] = 36'h8fec1e63a;
      expv[48] = 36'h02b4893d6;
      expv[49] = 36'h400000000;
      expv[50] = 36'h400000000;
      expv[51] = 36'h400000000;
      expv[52] = 36'h400000000;
      expv[53] = 36'h24e3c1cf6;
      expv[54] = 36'h8b4bffef4;
      expv[55] = 36'h400000000;
      expv[56] = 36'h400000000;
      expv[57] = 36'h400000000;
      expv[58] = 36'h8df7bfdfe;
      expv[59] = 36'h400000000;
      expv[60] = 36'h400000000;
      expv[61] = 36'h400000000;
      expv[62] = 36'habb9f3b81;
      expv[63] = 36'ha96728655;
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
