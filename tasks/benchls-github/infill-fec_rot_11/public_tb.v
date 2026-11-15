// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  fec_rot_11 dut (
    .c(in_vec[31:0]),
    .co(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'hae2c53ed;
    stim[1] = 32'h598d4ff3;
    stim[2] = 32'h260597a6;
    stim[3] = 32'hf8b51c16;
    stim[4] = 32'h7672bfec;
    stim[5] = 32'he283517b;
    stim[6] = 32'h5a453107;
    stim[7] = 32'hbd5ac02e;
    stim[8] = 32'ha4cf2008;
    stim[9] = 32'h9a6d2672;
    stim[10] = 32'he69db581;
    stim[11] = 32'h66c069f7;
    stim[12] = 32'h1be135db;
    stim[13] = 32'h18943412;
    stim[14] = 32'he3035f8b;
    stim[15] = 32'h59ac4212;
    stim[16] = 32'h53f7d60a;
    stim[17] = 32'h3bfdc334;
    stim[18] = 32'ha33d9eeb;
    stim[19] = 32'h52267dd8;
    stim[20] = 32'haae7d06a;
    stim[21] = 32'ha88c32c8;
    stim[22] = 32'hb2438ef3;
    stim[23] = 32'h794990a4;
    stim[24] = 32'hdd53c1dc;
    stim[25] = 32'haf61632f;
    stim[26] = 32'h10c1749a;
    stim[27] = 32'h6bbb2dc0;
    stim[28] = 32'h4ad8e6d6;
    stim[29] = 32'h5ceb5af8;
    stim[30] = 32'h7f100d33;
    stim[31] = 32'h2f9d0c67;
    stim[32] = 32'h094d51e4;
    stim[33] = 32'h6c0f1968;
    stim[34] = 32'h2bf5c306;
    stim[35] = 32'h22651fd9;
    stim[36] = 32'h95486ff7;
    stim[37] = 32'h54a9e3ad;
    stim[38] = 32'h7d87cc12;
    stim[39] = 32'he3256826;
    stim[40] = 32'h0b188ff5;
    stim[41] = 32'hf74b3903;
    stim[42] = 32'hb236a856;
    stim[43] = 32'hf274a8a0;
    stim[44] = 32'he4f58585;
    stim[45] = 32'h35789499;
    stim[46] = 32'h53eb6cac;
    stim[47] = 32'h18775ae8;
    stim[48] = 32'h090d1daa;
    stim[49] = 32'h2de63e97;
    stim[50] = 32'h04f56be4;
    stim[51] = 32'h7e483127;
    stim[52] = 32'h1936fbe8;
    stim[53] = 32'h9944332d;
    stim[54] = 32'h0159bca3;
    stim[55] = 32'hfdedf795;
    stim[56] = 32'h9b3f747a;
    stim[57] = 32'haef69fa5;
    stim[58] = 32'h9deda561;
    stim[59] = 32'h11da9c5e;
    stim[60] = 32'h6f97aab0;
    stim[61] = 32'h2233c49e;
    stim[62] = 32'h7f34eb3f;
    stim[63] = 32'h5c8aea79;
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
      expv[0] = 32'h7554e0bf;
      expv[1] = 32'h5549f9f9;
      expv[2] = 32'h92b4b5f0;
      expv[3] = 32'hb31e98de;
      expv[4] = 32'h3aa2fd7a;
      expv[5] = 32'h73d37b4b;
      expv[6] = 32'h1a7ea99f;
      expv[7] = 32'h9f2e2248;
      expv[8] = 32'h4fa971b4;
      expv[9] = 32'h9bb50f95;
      expv[10] = 32'h90f5abeb;
      expv[11] = 32'hfe360feb;
      expv[12] = 32'h7dc823a3;
      expv[13] = 32'hdb26b3d4;
      expv[14] = 32'h74249b77;
      expv[15] = 32'h5d86f9fc;
      expv[16] = 32'ha264a8e6;
      expv[17] = 32'h3a775ea3;
      expv[18] = 32'hc23f9177;
      expv[19] = 32'h29fa48d0;
      expv[20] = 32'h3e89e801;
      expv[21] = 32'h6a7c605e;
      expv[22] = 32'h665b0bd0;
      expv[23] = 32'hd07b74e7;
      expv[24] = 32'h3799b54d;
      expv[25] = 32'h1892a09d;
      expv[26] = 32'h5860e29e;
      expv[27] = 32'h1cf4ee2c;
      expv[28] = 32'ha644030b;
      expv[29] = 32'h7500f97e;
      expv[30] = 32'h03d65c1d;
      expv[31] = 32'h79e8dc8c;
      expv[32] = 32'h46cd7162;
      expv[33] = 32'ha47046e5;
      expv[34] = 32'h2a72cc23;
      expv[35] = 32'h8316555f;
      expv[36] = 32'h825aee08;
      expv[37] = 32'h49884034;
      expv[38] = 32'hb55ff459;
      expv[39] = 32'h4539fb72;
      expv[40] = 32'he37d6938;
      expv[41] = 32'h7255c95d;
      expv[42] = 32'hce8e3bdf;
      expv[43] = 32'h9f7999d0;
      expv[44] = 32'hda9513b4;
      expv[45] = 32'h24499707;
      expv[46] = 32'h47b198e6;
      expv[47] = 32'hc3315bcf;
      expv[48] = 32'h45ef1168;
      expv[49] = 32'hab9fc4d3;
      expv[50] = 32'hbc3e18bb;
      expv[51] = 32'hc676ac3f;
      expv[52] = 32'hca790bed;
      expv[53] = 32'hdcbf3fe8;
      expv[54] = 32'hc9a54822;
      expv[55] = 32'h6403d05c;
      expv[56] = 32'h0d651fb7;
      expv[57] = 32'ha0f690a1;
      expv[58] = 32'h862c7759;
      expv[59] = 32'h822682b6;
      expv[60] = 32'h6c6e6689;
      expv[61] = 32'h348c7d55;
      expv[62] = 32'h24463418;
      expv[63] = 32'h7964e971;
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
