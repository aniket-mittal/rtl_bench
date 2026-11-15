// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_130270 dut (
    .clk(clk),
    .rst(in_vec[66:66]),
    .start(in_vec[65:65]),
    .rw(in_vec[64:64]),
    .addr(in_vec[63:32]),
    .data_in(in_vec[31:0]),
    .data_out(out_vec[33:2]),
    .ready(out_vec[1:1]),
    .error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h42c7dcd340d61a46d;
    stim[1] = 67'h446504259d424a80e;
    stim[2] = 67'h0d856581557d2fb16;
    stim[3] = 67'h2f0a48a4ab67cb729;
    stim[4] = 67'h1a3e383bafda73ca6;
    stim[5] = 67'h1cfcbde35d00826da;
    stim[6] = 67'h2d037162a22813c41;
    stim[7] = 67'h1b1cba157b7f39a2a;
    stim[8] = 67'h2a0464b2bd886cfc1;
    stim[9] = 67'h3f8f9a6725c4ea0cb;
    stim[10] = 67'h0d7ddbfa8880d05a2;
    stim[11] = 67'h09c13bd601905b696;
    stim[12] = 67'h3287fb78574c8b228;
    stim[13] = 67'h0f4066eff9c52223e;
    stim[14] = 67'h37ffa828eb413e572;
    stim[15] = 67'h3ed9b46c1d28c5976;
    stim[16] = 67'h2b99d4a36a0866d94;
    stim[17] = 67'h28f0baf42bbe0ba1a;
    stim[18] = 67'h1921585501acb2bbc;
    stim[19] = 67'h23a672749db0f56bd;
    stim[20] = 67'h3da044b3ee714870f;
    stim[21] = 67'h24865ebca8f66c0ca;
    stim[22] = 67'h2709a61e5db7767d4;
    stim[23] = 67'h31991fc83b38feafa;
    stim[24] = 67'h16847b5015e698cc5;
    stim[25] = 67'h06d456ff36a6a8371;
    stim[26] = 67'h14b759f38d38c5bce;
    stim[27] = 67'h1efc233160038981c;
    stim[28] = 67'h1b8ee822aad46b0d7;
    stim[29] = 67'h18c9bea64ff9c001a;
    stim[30] = 67'h27e73fbd41ece2074;
    stim[31] = 67'h07a09efa07d3e6ee5;
    stim[32] = 67'h20a9e9951a8f630d3;
    stim[33] = 67'h164df76c44879fc7f;
    stim[34] = 67'h2bc8e9df5a88e5bf0;
    stim[35] = 67'h024f3be073f552ac8;
    stim[36] = 67'h1db4ee15a69ba5afa;
    stim[37] = 67'h065349d7c256c05f3;
    stim[38] = 67'h2366085f08cbcc103;
    stim[39] = 67'h13aa1cb8ffaa14564;
    stim[40] = 67'h3907c44a9c4f4d0b9;
    stim[41] = 67'h1bff9e086e18961a4;
    stim[42] = 67'h0f07a8f396dfddfc1;
    stim[43] = 67'h3619bf8210628208b;
    stim[44] = 67'h012fb2266b1a3e9bb;
    stim[45] = 67'h28b08e84c4db7b889;
    stim[46] = 67'h29f60b6375ef9a498;
    stim[47] = 67'h24688efa364cbdb1b;
    stim[48] = 67'h1c5a5989e49ee7d73;
    stim[49] = 67'h3e76d2cd2705aab4b;
    stim[50] = 67'h38f32b314722fbbef;
    stim[51] = 67'h0c6b077b1ccd3994c;
    stim[52] = 67'h062e8fc5fb03c6716;
    stim[53] = 67'h3971068ba3bcb3d3e;
    stim[54] = 67'h08287dfada6affbbe;
    stim[55] = 67'h08a4ccaf9313afcd6;
    stim[56] = 67'h1a59c340f2c760374;
    stim[57] = 67'h3e6e8df30a188598f;
    stim[58] = 67'h014e57d46d6d24b4b;
    stim[59] = 67'h2eb47b7e824b338ec;
    stim[60] = 67'h1de21f1f295054f9d;
    stim[61] = 67'h3bc680bf5a59dd851;
    stim[62] = 67'h2eb4ddaada0a0ded9;
    stim[63] = 67'h1753d42b603d4d731;
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
      expv[0] = 34'hxxxxxxxxx;
      expv[1] = 34'hxxxxxxxxx;
      expv[2] = 34'hxxxxxxxxx;
      expv[3] = 34'hxxxxxxxxx;
      expv[4] = 34'hxxxxxxxxx;
      expv[5] = 34'h3f69cf298;
      expv[6] = 34'h3f69cf29a;
      expv[7] = 34'h3f69cf298;
      expv[8] = 34'h2dfce68a8;
      expv[9] = 34'h2dfce68aa;
      expv[10] = 34'h2dfce68a8;
      expv[11] = 34'h2dfce68a8;
      expv[12] = 34'h2dfce68aa;
      expv[13] = 34'h2dfce68a8;
      expv[14] = 34'h2dfce68a8;
      expv[15] = 34'h2dfce68aa;
      expv[16] = 34'h2dfce68a8;
      expv[17] = 34'h2dfce68a8;
      expv[18] = 34'h2dfce68aa;
      expv[19] = 34'h2dfce68aa;
      expv[20] = 34'h2dfce68a8;
      expv[21] = 34'h39c521c3c;
      expv[22] = 34'h39c521c3e;
      expv[23] = 34'h39c521c3c;
      expv[24] = 34'h2ce3fabe8;
      expv[25] = 34'h2ce3fabea;
      expv[26] = 34'h2ce3fabea;
      expv[27] = 34'h2ce3fabea;
      expv[28] = 34'h2ce3fabea;
      expv[29] = 34'h2ce3fabea;
      expv[30] = 34'h2ce3fabea;
      expv[31] = 34'h2ce3fabe8;
      expv[32] = 34'h1f4f9bb94;
      expv[33] = 34'h1f4f9bb96;
      expv[34] = 34'h1f4f9bb96;
      expv[35] = 34'h1f4f9bb94;
      expv[36] = 34'h0fd54ab20;
      expv[37] = 34'h0fd54ab22;
      expv[38] = 34'h0fd54ab22;
      expv[39] = 34'h0fd54ab20;
      expv[40] = 34'h3ea851590;
      expv[41] = 34'h3ea851592;
      expv[42] = 34'h3ea851592;
      expv[43] = 34'h3ea851592;
      expv[44] = 34'h3ea851590;
      expv[45] = 34'h3ea851590;
      expv[46] = 34'h3ea851592;
      expv[47] = 34'h3ea851590;
      expv[48] = 34'h1932f6c6c;
      expv[49] = 34'h1932f6c6e;
      expv[50] = 34'h1932f6c6c;
      expv[51] = 34'h1932f6c6c;
      expv[52] = 34'h1932f6c6e;
      expv[53] = 34'h1932f6c6e;
      expv[54] = 34'h1932f6c6c;
      expv[55] = 34'h1932f6c6c;
      expv[56] = 34'h1932f6c6e;
      expv[57] = 34'h1932f6c6e;
      expv[58] = 34'h1932f6c6c;
      expv[59] = 34'h1932f6c6c;
      expv[60] = 34'h1932f6c6e;
      expv[61] = 34'h1932f6c6e;
      expv[62] = 34'h1932f6c6c;
      expv[63] = 34'h1932f6c6c;
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
