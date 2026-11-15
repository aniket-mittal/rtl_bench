// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 43;
  localparam OW = 43;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_062102 dut (
    .clock(clk),
    .io_d(in_vec[42:0]),
    .io_q(out_vec[42:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 43'h3903b7b6f1d;
    stim[1] = 43'h1fda8f82e4b;
    stim[2] = 43'h42553df3039;
    stim[3] = 43'h6089858e237;
    stim[4] = 43'h01b5ef4287a;
    stim[5] = 43'h718fbbe2dff;
    stim[6] = 43'h69f1f013786;
    stim[7] = 43'h78678594336;
    stim[8] = 43'h50e40f6ce08;
    stim[9] = 43'h56edeb46a48;
    stim[10] = 43'h7c407b09730;
    stim[11] = 43'h0d62713ea81;
    stim[12] = 43'h44d72a474a3;
    stim[13] = 43'h3efa5f98acc;
    stim[14] = 43'h5bd36b3f422;
    stim[15] = 43'h30963418898;
    stim[16] = 43'h1d533d59900;
    stim[17] = 43'h01b04b7dba2;
    stim[18] = 43'h3bfc64e5b6e;
    stim[19] = 43'h32b525cd0ce;
    stim[20] = 43'h168df9d9dca;
    stim[21] = 43'h31d6a568db9;
    stim[22] = 43'h17271433624;
    stim[23] = 43'h0f4dbb56b87;
    stim[24] = 43'h1c9ca8d43d9;
    stim[25] = 43'h360630772f9;
    stim[26] = 43'h6be239dd97a;
    stim[27] = 43'h19d42b02f72;
    stim[28] = 43'h01f4eb98946;
    stim[29] = 43'h491b29084b6;
    stim[30] = 43'h3e7b8294850;
    stim[31] = 43'h7f11ec44bc7;
    stim[32] = 43'h501563bc3f2;
    stim[33] = 43'h76bc20da37f;
    stim[34] = 43'h2b752f3abb3;
    stim[35] = 43'h5bf8324524e;
    stim[36] = 43'h1d4da0ba742;
    stim[37] = 43'h6cc00ea8a07;
    stim[38] = 43'h38afa086d26;
    stim[39] = 43'h4772b173168;
    stim[40] = 43'h36b99c8ca6e;
    stim[41] = 43'h274c1e70b31;
    stim[42] = 43'h07eb3e09b74;
    stim[43] = 43'h4726b0315b8;
    stim[44] = 43'h6bef097c83e;
    stim[45] = 43'h53d9626627c;
    stim[46] = 43'h1fdca39f662;
    stim[47] = 43'h10e645af57c;
    stim[48] = 43'h159936ac671;
    stim[49] = 43'h7414a74161f;
    stim[50] = 43'h7ac887b77bd;
    stim[51] = 43'h5d7d427ee64;
    stim[52] = 43'h0845dfc1254;
    stim[53] = 43'h7e84527b818;
    stim[54] = 43'h1042256b855;
    stim[55] = 43'h4e3891037f7;
    stim[56] = 43'h32102a67afd;
    stim[57] = 43'h4c8c617a7bb;
    stim[58] = 43'h66cb233ecf8;
    stim[59] = 43'h349de595048;
    stim[60] = 43'h7f4aaa4155e;
    stim[61] = 43'h1c33400a155;
    stim[62] = 43'h7dc87dce7a9;
    stim[63] = 43'h6842c130239;
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
      expv[0] = 43'hxxxxxxxxxxx;
      expv[1] = 43'h3903b7b6f1d;
      expv[2] = 43'h1fda8f82e4b;
      expv[3] = 43'h42553df3039;
      expv[4] = 43'h6089858e237;
      expv[5] = 43'h01b5ef4287a;
      expv[6] = 43'h718fbbe2dff;
      expv[7] = 43'h69f1f013786;
      expv[8] = 43'h78678594336;
      expv[9] = 43'h50e40f6ce08;
      expv[10] = 43'h56edeb46a48;
      expv[11] = 43'h7c407b09730;
      expv[12] = 43'h0d62713ea81;
      expv[13] = 43'h44d72a474a3;
      expv[14] = 43'h3efa5f98acc;
      expv[15] = 43'h5bd36b3f422;
      expv[16] = 43'h30963418898;
      expv[17] = 43'h1d533d59900;
      expv[18] = 43'h01b04b7dba2;
      expv[19] = 43'h3bfc64e5b6e;
      expv[20] = 43'h32b525cd0ce;
      expv[21] = 43'h168df9d9dca;
      expv[22] = 43'h31d6a568db9;
      expv[23] = 43'h17271433624;
      expv[24] = 43'h0f4dbb56b87;
      expv[25] = 43'h1c9ca8d43d9;
      expv[26] = 43'h360630772f9;
      expv[27] = 43'h6be239dd97a;
      expv[28] = 43'h19d42b02f72;
      expv[29] = 43'h01f4eb98946;
      expv[30] = 43'h491b29084b6;
      expv[31] = 43'h3e7b8294850;
      expv[32] = 43'h7f11ec44bc7;
      expv[33] = 43'h501563bc3f2;
      expv[34] = 43'h76bc20da37f;
      expv[35] = 43'h2b752f3abb3;
      expv[36] = 43'h5bf8324524e;
      expv[37] = 43'h1d4da0ba742;
      expv[38] = 43'h6cc00ea8a07;
      expv[39] = 43'h38afa086d26;
      expv[40] = 43'h4772b173168;
      expv[41] = 43'h36b99c8ca6e;
      expv[42] = 43'h274c1e70b31;
      expv[43] = 43'h07eb3e09b74;
      expv[44] = 43'h4726b0315b8;
      expv[45] = 43'h6bef097c83e;
      expv[46] = 43'h53d9626627c;
      expv[47] = 43'h1fdca39f662;
      expv[48] = 43'h10e645af57c;
      expv[49] = 43'h159936ac671;
      expv[50] = 43'h7414a74161f;
      expv[51] = 43'h7ac887b77bd;
      expv[52] = 43'h5d7d427ee64;
      expv[53] = 43'h0845dfc1254;
      expv[54] = 43'h7e84527b818;
      expv[55] = 43'h1042256b855;
      expv[56] = 43'h4e3891037f7;
      expv[57] = 43'h32102a67afd;
      expv[58] = 43'h4c8c617a7bb;
      expv[59] = 43'h66cb233ecf8;
      expv[60] = 43'h349de595048;
      expv[61] = 43'h7f4aaa4155e;
      expv[62] = 43'h1c33400a155;
      expv[63] = 43'h7dc87dce7a9;
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
