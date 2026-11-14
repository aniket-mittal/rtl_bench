// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 100;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[99:0]),
    .out_and(out_vec[2:2]),
    .out_or(out_vec[1:1]),
    .out_xor(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 100'hf9985143b3bb3e33fce033828;
    stim[1] = 100'hcaf4d83fc974d8908b475df9f;
    stim[2] = 100'haaf77ee3f2ce2d6fa85ae2b97;
    stim[3] = 100'hf2d0d1ace60def5ff9aad235e;
    stim[4] = 100'h26f470bb66fc98184f9bac624;
    stim[5] = 100'h3da6eeea7a3b5eae0c62422c2;
    stim[6] = 100'hb7a87e86985f09b7dd7259786;
    stim[7] = 100'h31203fe0092478c680c202a2d;
    stim[8] = 100'h693d216df08fd0111496d64a9;
    stim[9] = 100'h9862bd2302a10ef8702019fb4;
    stim[10] = 100'h2a0d05f0abed628939ab5a2af;
    stim[11] = 100'h3e05811892da126d0f7b9c8b1;
    stim[12] = 100'h8304efc97d5725d63040a5c0b;
    stim[13] = 100'hcd374545e28c50cfa6f0a7b84;
    stim[14] = 100'h423ff76e80f25871b3e46b3b0;
    stim[15] = 100'h65be45a320d9899cb2d7f2e2c;
    stim[16] = 100'h8d0fc99459cb3a7be97e6ed57;
    stim[17] = 100'ha3cef0c4c2b62417bed7b6e94;
    stim[18] = 100'hf65fb3de9abe586b8abbeb669;
    stim[19] = 100'h2d26323fddd1dec303d81343b;
    stim[20] = 100'h6fd784cb24d3bde6b422b2197;
    stim[21] = 100'hf07a095ea223218d12c6ca917;
    stim[22] = 100'h272e56308f9517e6232de2be8;
    stim[23] = 100'h389e9faaa61cc56c75ae4cf25;
    stim[24] = 100'h53a8477081b6c2722e6d2bfe3;
    stim[25] = 100'h0618405afe744d82d5dddc725;
    stim[26] = 100'hb47d63f322a6ee2e9e170d23f;
    stim[27] = 100'hc52b4a752d6aea8abe08bd4fd;
    stim[28] = 100'h310fba3067359ea5c1eafa99c;
    stim[29] = 100'h8eca73510bea0f50e85fec996;
    stim[30] = 100'hec34d79f8556a03487599f0e5;
    stim[31] = 100'hbdffef506574aba8f17ccea48;
    stim[32] = 100'h6dff2d3b63c65587d8a7f2f60;
    stim[33] = 100'h9f6278b0255087f05edc8b4a4;
    stim[34] = 100'hdc2bb287b9b279da63038894a;
    stim[35] = 100'h06ef76f585d37298a9ada8eb3;
    stim[36] = 100'h687bc958717b8b03d78bdde44;
    stim[37] = 100'h90f14e2abdfbdf1b67fb364f4;
    stim[38] = 100'h8629c4d0b108b74d7e4b60b6a;
    stim[39] = 100'h58d61dea3f40be26d99e24829;
    stim[40] = 100'hbe616b64bc0eca6bb57efee1d;
    stim[41] = 100'hf18c00dccc9abdb1c4490d325;
    stim[42] = 100'h63113f5d1a4df91de94664db1;
    stim[43] = 100'h1fa59fa659466ae49afa77a46;
    stim[44] = 100'hd14958f5e360c71bdfdd9735a;
    stim[45] = 100'h7d787b4d6ff630f42479df9e3;
    stim[46] = 100'h1ec46058c79357ff8358d6efc;
    stim[47] = 100'hd0fe87b0e2181918729491dbf;
    stim[48] = 100'hae3f65885c562a082edc23c54;
    stim[49] = 100'h4bd7dcbff7ff7bff2850f24c7;
    stim[50] = 100'h1b5fdf0085ef3e2c9f5594ddd;
    stim[51] = 100'h3fa3f73ddbe7bd3cd5d0ed7c4;
    stim[52] = 100'h3687809d3e040fa6906121156;
    stim[53] = 100'ha9d31d324bddf9c1aed509b12;
    stim[54] = 100'he47cc87e6fef93670b9798ba9;
    stim[55] = 100'hc54633ee865378d126e72b4ea;
    stim[56] = 100'hbe64c8e95a47b0dffb3602ffd;
    stim[57] = 100'h5d79b4cc3b4e4de93186188af;
    stim[58] = 100'hc3c1ab3c410c3a4c2f8c62d18;
    stim[59] = 100'hfe5754fdab60a8c4f49e28ebc;
    stim[60] = 100'h62446b212b0045bea44b249c5;
    stim[61] = 100'h7c2ddd1d0f6357b599953e645;
    stim[62] = 100'h84981973c10f2ac055271f2a0;
    stim[63] = 100'h8c4fe2938ce74589208c8ac2d;
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
      expv[0] = 3'h1;
      expv[1] = 3'h0;
      expv[2] = 3'h1;
      expv[3] = 3'h0;
      expv[4] = 3'h0;
      expv[5] = 3'h1;
      expv[6] = 3'h1;
      expv[7] = 3'h0;
      expv[8] = 3'h0;
      expv[9] = 3'h0;
      expv[10] = 3'h1;
      expv[11] = 3'h1;
      expv[12] = 3'h0;
      expv[13] = 3'h1;
      expv[14] = 3'h0;
      expv[15] = 3'h1;
      expv[16] = 3'h0;
      expv[17] = 3'h1;
      expv[18] = 3'h0;
      expv[19] = 3'h1;
      expv[20] = 3'h1;
      expv[21] = 3'h0;
      expv[22] = 3'h0;
      expv[23] = 3'h1;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h1;
      expv[27] = 3'h1;
      expv[28] = 3'h0;
      expv[29] = 3'h1;
      expv[30] = 3'h1;
      expv[31] = 3'h0;
      expv[32] = 3'h0;
      expv[33] = 3'h1;
      expv[34] = 3'h1;
      expv[35] = 3'h1;
      expv[36] = 3'h1;
      expv[37] = 3'h0;
      expv[38] = 3'h0;
      expv[39] = 3'h1;
      expv[40] = 3'h1;
      expv[41] = 3'h1;
      expv[42] = 3'h0;
      expv[43] = 3'h1;
      expv[44] = 3'h0;
      expv[45] = 3'h0;
      expv[46] = 3'h0;
      expv[47] = 3'h0;
      expv[48] = 3'h0;
      expv[49] = 3'h0;
      expv[50] = 3'h1;
      expv[51] = 3'h0;
      expv[52] = 3'h0;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h1;
      expv[56] = 3'h0;
      expv[57] = 3'h1;
      expv[58] = 3'h1;
      expv[59] = 3'h1;
      expv[60] = 3'h0;
      expv[61] = 3'h1;
      expv[62] = 3'h1;
      expv[63] = 3'h0;
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
