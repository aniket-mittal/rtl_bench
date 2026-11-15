// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 99;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_097320 dut (
    .clk(clk),
    .rst(in_vec[98:98]),
    .wdata(in_vec[97:66]),
    .wcare(in_vec[65:34]),
    .wused(in_vec[33:33]),
    .wena(in_vec[32:32]),
    .lookup_data(in_vec[31:0]),
    .match(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 99'h7e0a38a907507440f15e904b5;
    stim[1] = 99'h686ca3e54fd64a1b04497e554;
    stim[2] = 99'h32cb6ab40dc0f8a9bd6050033;
    stim[3] = 99'h2f61620ea523801d85a591d83;
    stim[4] = 99'h3c53861ced00b3119e92adf7e;
    stim[5] = 99'h1d0e56e760cea070cfd4487cb;
    stim[6] = 99'h33c510d40c960c21b648b5fe6;
    stim[7] = 99'h220c1617777c99aed2f7d06b2;
    stim[8] = 99'h11e07b187f76347fc5ce9f7ed;
    stim[9] = 99'h128cf0fd66ea8b9eccc88fd5d;
    stim[10] = 99'h21d202ee7e4270c5055695954;
    stim[11] = 99'h191cadacdbe8c442a2288fe7d;
    stim[12] = 99'h30d9b1c7a7f9bab4e25ab9763;
    stim[13] = 99'h2a61d8698b4cdd9132543432c;
    stim[14] = 99'h0c8711dc19817c4ced75315f0;
    stim[15] = 99'h268aee5038f850b1cf8d20442;
    stim[16] = 99'h16466daf225396159d2e93871;
    stim[17] = 99'h132b54e967745cab7eb8eba81;
    stim[18] = 99'h014f4943bb8d4033eaa64c79b;
    stim[19] = 99'h2a29041a66f196433f991c541;
    stim[20] = 99'h175176184d41ec611eaf3c3dd;
    stim[21] = 99'h14f7ab3d1091359d983f52e1e;
    stim[22] = 99'h3e4cfa68d75ab24bb26877b80;
    stim[23] = 99'h319d30a141e49134aae7ffad8;
    stim[24] = 99'h2ef58e4f529f984f7614cc53c;
    stim[25] = 99'h2fc641919bfae520888df853f;
    stim[26] = 99'h09f032610794d61afdd6e7c83;
    stim[27] = 99'h3d99ec83f993c6be114aac072;
    stim[28] = 99'h139e6743f3895942be1092206;
    stim[29] = 99'h3f9bfce236dd710939ec740ae;
    stim[30] = 99'h2c63495b054b0f1f7bca4603f;
    stim[31] = 99'h07e88eaf5cf35773bd12cb986;
    stim[32] = 99'h3997d80587a43cbe1733a01b3;
    stim[33] = 99'h094b12e78a232d04942442825;
    stim[34] = 99'h0957ba428afc2cf34967e8b7e;
    stim[35] = 99'h2e72e756232f2270d60b47429;
    stim[36] = 99'h2f24ce11977cee8b38194935d;
    stim[37] = 99'h373098b1c3c3055aeb82628a6;
    stim[38] = 99'h25a3218fca35264648f4d84f4;
    stim[39] = 99'h20f18d5946fceead4c211fd73;
    stim[40] = 99'h36c4189c2c17944215b7217e3;
    stim[41] = 99'h081442dc2b674524fafbb1f54;
    stim[42] = 99'h12ad95e5fb6ff872d0eb1af43;
    stim[43] = 99'h03a8ec87e676d3c91af170be3;
    stim[44] = 99'h2c3fb4f6e84bffa6ff5ffc214;
    stim[45] = 99'h3c68dbde6541a9d4b9aa498c9;
    stim[46] = 99'h2bf868ac656a4ed056661fecc;
    stim[47] = 99'h006cd798c677f236f3f9af783;
    stim[48] = 99'h25510c193666e358f9b221c9b;
    stim[49] = 99'h3266f94d1f1b31fa54323f47d;
    stim[50] = 99'h130007d7851f8cbf41485ef10;
    stim[51] = 99'h2924d7c6ea8e45c062ab735be;
    stim[52] = 99'h27bfa18bac94428aa0d6952de;
    stim[53] = 99'h2e725847397d2294df06c37cd;
    stim[54] = 99'h1def9a4318ba4a9fc8a96569f;
    stim[55] = 99'h37a846fbb536d78cb76447285;
    stim[56] = 99'h271900800e9f8a13a8162ecc2;
    stim[57] = 99'h1c4f5842b7d2e8d98945d9a61;
    stim[58] = 99'h33d8e64cdbc64a2f794e336b9;
    stim[59] = 99'h01c9b52c4642d628f84c00686;
    stim[60] = 99'h1c39a49f9534aea8bdb8868d0;
    stim[61] = 99'h0147a6834209473679cfecff1;
    stim[62] = 99'h06d2a1a84ee90eb70aef89c77;
    stim[63] = 99'h11e80590f5a4c82fbf2adc363;
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
      expv[0] = 1'hx;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
