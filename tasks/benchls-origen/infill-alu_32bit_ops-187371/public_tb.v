// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_187371 dut (
    .operand_A(in_vec[69:38]),
    .operand_B(in_vec[37:6]),
    .ALU_Control(in_vec[5:0]),
    .ALU_result(out_vec[33:2]),
    .zero(out_vec[1:1]),
    .branch(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h0c08bf55069c9f56b6;
    stim[1] = 70'h2d002fa29023ce7720;
    stim[2] = 70'h3f8ecc073ba194afd4;
    stim[3] = 70'h2fbf48800f22c085c6;
    stim[4] = 70'h340e41378407e67f5e;
    stim[5] = 70'h2313bc018698948681;
    stim[6] = 70'h0ca190ede3749c5c5d;
    stim[7] = 70'h29bfc9623a6d53c87a;
    stim[8] = 70'h3200a0b714020d7da1;
    stim[9] = 70'h0a2737d829864f0658;
    stim[10] = 70'h32a0cb1887b85a39b6;
    stim[11] = 70'h38a967d04fe027149f;
    stim[12] = 70'h22ffacb20e852dfea3;
    stim[13] = 70'h2aa1fccc8efdd4cc73;
    stim[14] = 70'h2a437302a8867acf2c;
    stim[15] = 70'h3e6b45ef13cbee3c23;
    stim[16] = 70'h0e0d5c6cb457166b1b;
    stim[17] = 70'h15f1a1d30d15c8a805;
    stim[18] = 70'h3e578c202e35efe5a1;
    stim[19] = 70'h219c2d79f81b167ac8;
    stim[20] = 70'h2518a96620241281e0;
    stim[21] = 70'h3ffd8ec0c3432edfe4;
    stim[22] = 70'h24b2340d4e3e41dc87;
    stim[23] = 70'h047dfec3a6ea7a6195;
    stim[24] = 70'h37745a4b4f7df33143;
    stim[25] = 70'h1daea8ea8579767292;
    stim[26] = 70'h0af6141ba1fa1885f9;
    stim[27] = 70'h0e68b8b5f025289dc2;
    stim[28] = 70'h189d38f0db48c511a1;
    stim[29] = 70'h21089f478365b11752;
    stim[30] = 70'h02bf4c1e0b0b82f39b;
    stim[31] = 70'h2a6436abd5408c9670;
    stim[32] = 70'h3eb51d6f67ccafc715;
    stim[33] = 70'h0de725bc0e205df53c;
    stim[34] = 70'h08ddfa4002d4a5ec14;
    stim[35] = 70'h2e49eda1dd75197f08;
    stim[36] = 70'h2e73f669b55e9c8713;
    stim[37] = 70'h0c0e298a6ee45727b8;
    stim[38] = 70'h3ea01d380a9d2735e3;
    stim[39] = 70'h2cfcd390c05740d394;
    stim[40] = 70'h37786b8c5388c48db8;
    stim[41] = 70'h16ff17266014ec9e25;
    stim[42] = 70'h3583b0fd12dc8d6013;
    stim[43] = 70'h3133c647052f63bb19;
    stim[44] = 70'h0647df986e9daa4579;
    stim[45] = 70'h0e0adb57b8676b5f87;
    stim[46] = 70'h1acf029749bf0e824f;
    stim[47] = 70'h2d438dce79cfb44734;
    stim[48] = 70'h25d48754f8c28d5d82;
    stim[49] = 70'h1fdb5f7259d7bcaf8f;
    stim[50] = 70'h3aa7b39881852d081b;
    stim[51] = 70'h031eca7aea10f36503;
    stim[52] = 70'h26918668cd1d839aa2;
    stim[53] = 70'h0c870427ee797feabf;
    stim[54] = 70'h131b4a02c382310fe3;
    stim[55] = 70'h05cf3587737705d434;
    stim[56] = 70'h265ab80b849aa94001;
    stim[57] = 70'h21c936dcfd2e394af1;
    stim[58] = 70'h1754d7992587bad5ff;
    stim[59] = 70'h123339a20026570513;
    stim[60] = 70'h16e23e1851d126c397;
    stim[61] = 70'h15b06653ecc7e28f21;
    stim[62] = 70'h3ebf23aa8039eb22d8;
    stim[63] = 70'h041a1ca405f539b195;
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
      expv[0] = 34'h000000002;
      expv[1] = 34'h000000002;
      expv[2] = 34'h000000002;
      expv[3] = 34'h000000002;
      expv[4] = 34'h000000002;
      expv[5] = 34'h1c7b277b0;
      expv[6] = 34'h000000002;
      expv[7] = 34'h000000002;
      expv[8] = 34'h000000002;
      expv[9] = 34'h000000002;
      expv[10] = 34'h000000002;
      expv[11] = 34'h000000002;
      expv[12] = 34'h000000002;
      expv[13] = 34'h000000002;
      expv[14] = 34'h000000002;
      expv[15] = 34'h000000002;
      expv[16] = 34'h000000002;
      expv[17] = 34'h000000002;
      expv[18] = 34'h000000002;
      expv[19] = 34'h000433858;
      expv[20] = 34'h000000002;
      expv[21] = 34'h000000002;
      expv[22] = 34'h103500000;
      expv[23] = 34'h000000002;
      expv[24] = 34'h3f7dfb7b4;
      expv[25] = 34'h000000002;
      expv[26] = 34'h000000002;
      expv[27] = 34'h3e4d90280;
      expv[28] = 34'h000000002;
      expv[29] = 34'h000000002;
      expv[30] = 34'h000000002;
      expv[31] = 34'h000000002;
      expv[32] = 34'h000000002;
      expv[33] = 34'h000000002;
      expv[34] = 34'h000000002;
      expv[35] = 34'h00000002c;
      expv[36] = 34'h000000002;
      expv[37] = 34'h000000002;
      expv[38] = 34'h000000002;
      expv[39] = 34'h000000002;
      expv[40] = 34'h000000002;
      expv[41] = 34'h000000002;
      expv[42] = 34'h000000002;
      expv[43] = 34'h000000002;
      expv[44] = 34'h000000002;
      expv[45] = 34'h200000000;
      expv[46] = 34'h000000002;
      expv[47] = 34'h000000002;
      expv[48] = 34'h1d160a094;
      expv[49] = 34'h000000002;
      expv[50] = 34'h000000002;
      expv[51] = 34'h2b1efb7fc;
      expv[52] = 34'h000000002;
      expv[53] = 34'h000000002;
      expv[54] = 34'h000000002;
      expv[55] = 34'h000000002;
      expv[56] = 34'h21c00ecb8;
      expv[57] = 34'h000000002;
      expv[58] = 34'h000000002;
      expv[59] = 34'h000000002;
      expv[60] = 34'h000000002;
      expv[61] = 34'h000000002;
      expv[62] = 34'h000000002;
      expv[63] = 34'h000000002;
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
