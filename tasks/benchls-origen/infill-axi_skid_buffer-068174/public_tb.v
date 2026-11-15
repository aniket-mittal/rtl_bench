// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_068174 dut (
    .clk(clk),
    .resetn(in_vec[34:34]),
    .s_axi_valid(in_vec[33:33]),
    .s_axi_data(in_vec[32:1]),
    .m_axi_ready(in_vec[0:0]),
    .s_axi_ready(out_vec[33:33]),
    .m_axi_valid(out_vec[32:32]),
    .m_axi_data(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h01f947348;
    stim[1] = 35'h39b2f0e66;
    stim[2] = 35'h5a1c33fb2;
    stim[3] = 35'h57343d782;
    stim[4] = 35'h62040fb89;
    stim[5] = 35'h57997a833;
    stim[6] = 35'h7c113f17d;
    stim[7] = 35'h719e5c533;
    stim[8] = 35'h409e3bbb1;
    stim[9] = 35'h41fc1acfa;
    stim[10] = 35'h6d9155186;
    stim[11] = 35'h534ef0936;
    stim[12] = 35'h7d7b5c378;
    stim[13] = 35'h7bb60eb59;
    stim[14] = 35'h7ea7605c8;
    stim[15] = 35'h76e4c5494;
    stim[16] = 35'h56e66e43a;
    stim[17] = 35'h6c552c7da;
    stim[18] = 35'h70a26ac03;
    stim[19] = 35'h400e46e2b;
    stim[20] = 35'h58313eb2e;
    stim[21] = 35'h76a3e5322;
    stim[22] = 35'h60e3b363b;
    stim[23] = 35'h6faeccd9c;
    stim[24] = 35'h4c556975f;
    stim[25] = 35'h78e9c901f;
    stim[26] = 35'h5d0d0d3be;
    stim[27] = 35'h49ac024a7;
    stim[28] = 35'h7a9615d52;
    stim[29] = 35'h3ddc7d8b2;
    stim[30] = 35'h52b8db164;
    stim[31] = 35'h47528a01e;
    stim[32] = 35'h74c779988;
    stim[33] = 35'h5218246e9;
    stim[34] = 35'h5122844c1;
    stim[35] = 35'h46a2ab134;
    stim[36] = 35'h40384f834;
    stim[37] = 35'h4ebb7f26b;
    stim[38] = 35'h7cd6da248;
    stim[39] = 35'h55c9de63c;
    stim[40] = 35'h561bfe555;
    stim[41] = 35'h449db9d41;
    stim[42] = 35'h565ec8fd4;
    stim[43] = 35'h428ff87a1;
    stim[44] = 35'h554c4705e;
    stim[45] = 35'h45a1f9224;
    stim[46] = 35'h46654c04c;
    stim[47] = 35'h47f88ba84;
    stim[48] = 35'h64a322eef;
    stim[49] = 35'h71eb76897;
    stim[50] = 35'h4d7efe07d;
    stim[51] = 35'h54db431fc;
    stim[52] = 35'h591d4c289;
    stim[53] = 35'h4cbf7be19;
    stim[54] = 35'h7107c6048;
    stim[55] = 35'h685c6dcad;
    stim[56] = 35'h720ce3f80;
    stim[57] = 35'h78bcbe731;
    stim[58] = 35'h4869ccf88;
    stim[59] = 35'h5dfa02c67;
    stim[60] = 35'h7b7afd2e2;
    stim[61] = 35'h6efd892f8;
    stim[62] = 35'h79addcb70;
    stim[63] = 35'h5c5df220a;
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
      expv[0] = 34'h200000000;
      expv[1] = 34'h200000000;
      expv[2] = 34'h200000000;
      expv[3] = 34'h200000000;
      expv[4] = 34'h200000000;
      expv[5] = 34'h100000000;
      expv[6] = 34'h210207dc4;
      expv[7] = 34'h110207dc4;
      expv[8] = 34'h3e089f8be;
      expv[9] = 34'h18cf2e299;
      expv[10] = 34'h28cf2e299;
      expv[11] = 34'h18cf2e299;
      expv[12] = 34'h18cf2e299;
      expv[13] = 34'h18cf2e299;
      expv[14] = 34'h18cf2e299;
      expv[15] = 34'h16c8aa8c3;
      expv[16] = 34'h16c8aa8c3;
      expv[17] = 34'h16c8aa8c3;
      expv[18] = 34'h16c8aa8c3;
      expv[19] = 34'h16c8aa8c3;
      expv[20] = 34'h2f53b02e4;
      expv[21] = 34'h2f53b02e4;
      expv[22] = 34'h1f53b02e4;
      expv[23] = 34'h1f53b02e4;
      expv[24] = 34'h1b51f2991;
      expv[25] = 34'h1b51f2991;
      expv[26] = 34'h37d7666ce;
      expv[27] = 34'h1c74e480f;
      expv[28] = 34'h1c74e480f;
      expv[29] = 34'h200000000;
      expv[30] = 34'h200000000;
      expv[31] = 34'h200000000;
      expv[32] = 34'h200000000;
      expv[33] = 34'h100000000;
      expv[34] = 34'h100000000;
      expv[35] = 34'h2a63bccc4;
      expv[36] = 34'h2a63bccc4;
      expv[37] = 34'h2a63bccc4;
      expv[38] = 34'h2a63bccc4;
      expv[39] = 34'h1a63bccc4;
      expv[40] = 34'h1a63bccc4;
      expv[41] = 34'h1a63bccc4;
      expv[42] = 34'h2e6b6d124;
      expv[43] = 34'h2e6b6d124;
      expv[44] = 34'h2e6b6d124;
      expv[45] = 34'h2e6b6d124;
      expv[46] = 34'h2e6b6d124;
      expv[47] = 34'h2e6b6d124;
      expv[48] = 34'h2e6b6d124;
      expv[49] = 34'h1e6b6d124;
      expv[50] = 34'h325191777;
      expv[51] = 34'h18f5bb44b;
      expv[52] = 34'h28f5bb44b;
      expv[53] = 34'h28f5bb44b;
      expv[54] = 34'h28f5bb44b;
      expv[55] = 34'h18f5bb44b;
      expv[56] = 34'h18f5bb44b;
      expv[57] = 34'h1883e3024;
      expv[58] = 34'h3883e3024;
      expv[59] = 34'h190671fc0;
      expv[60] = 34'h190671fc0;
      expv[61] = 34'h190671fc0;
      expv[62] = 34'h190671fc0;
      expv[63] = 34'h190671fc0;
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
