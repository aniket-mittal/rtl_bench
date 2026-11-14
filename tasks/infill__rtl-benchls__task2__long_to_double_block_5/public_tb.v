// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  long_to_double dut (
    .clk(clk),
    .input_a(in_vec[66:3]),
    .input_a_stb(in_vec[2:2]),
    .output_z_ack(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .output_z(out_vec[65:2]),
    .output_z_stb(out_vec[1:1]),
    .input_a_ack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h0d5ea5c4afe2e99b9;
    stim[1] = 67'h5a25157c20f93ef25;
    stim[2] = 67'h1154d6d75695a17c6;
    stim[3] = 67'h7c61ae3a04c97b1f6;
    stim[4] = 67'h670c52ef2b773c814;
    stim[5] = 67'h6c4390f5cd04a1fce;
    stim[6] = 67'h64c369fc0679a39c6;
    stim[7] = 67'h4fcd36c82410a537a;
    stim[8] = 67'h2e6b553cad9a14278;
    stim[9] = 67'h1ac294fa1980c47c0;
    stim[10] = 67'h3750a9d5e179b57b2;
    stim[11] = 67'h0651a4c54789546aa;
    stim[12] = 67'h3ad1c9b287bff3a02;
    stim[13] = 67'h104b5b7587a7d1e6c;
    stim[14] = 67'h52a083760badc144c;
    stim[15] = 67'h51995b75e2c2fa6f0;
    stim[16] = 67'h4fde56cc6feba46ac;
    stim[17] = 67'h25a8d72ac1d36b348;
    stim[18] = 67'h4dc7e6836acb12664;
    stim[19] = 67'h0fcc28bf75433d462;
    stim[20] = 67'h0cb03008471a23eac;
    stim[21] = 67'h686cb2dc5b56d8d78;
    stim[22] = 67'h6a083f5c075da228c;
    stim[23] = 67'h6c2a304cf886d29d0;
    stim[24] = 67'h6b7f8175d402a1be8;
    stim[25] = 67'h1641cf61c4ea0d092;
    stim[26] = 67'h0fbd73347dcf2e51a;
    stim[27] = 67'h3f785ceec4d0ee2b2;
    stim[28] = 67'h0dd548233651876fa;
    stim[29] = 67'h05f67a590ea51fbe4;
    stim[30] = 67'h7471694014d32355a;
    stim[31] = 67'h20cd6c6bfe30b020a;
    stim[32] = 67'h26f2a69a69d78aff4;
    stim[33] = 67'h2ad4917d9b74a3e2a;
    stim[34] = 67'h7a21b2b0469c0b4c8;
    stim[35] = 67'h05a34115afaec5a0e;
    stim[36] = 67'h24b74d5db028090e2;
    stim[37] = 67'h0a2bd0074dfdff75a;
    stim[38] = 67'h4fb4afbe1c54a64a6;
    stim[39] = 67'h236368427b2a6b71a;
    stim[40] = 67'h7df7c4833f81b59f2;
    stim[41] = 67'h12acdaaada7dec63e;
    stim[42] = 67'h6b077ed7ff63026b8;
    stim[43] = 67'h3e75b0c1befa07d8e;
    stim[44] = 67'h3f8a466088ca23c2e;
    stim[45] = 67'h0af6f78c42d10a93e;
    stim[46] = 67'h6c8f264849d87a70c;
    stim[47] = 67'h0a70400593bce7d08;
    stim[48] = 67'h33d7ebd918f77c8cc;
    stim[49] = 67'h6a358f79746c19ca4;
    stim[50] = 67'h2f8f1691f97525d2c;
    stim[51] = 67'h208b451a19005265c;
    stim[52] = 67'h3bc558c0e16279028;
    stim[53] = 67'h2357470b2d34b181d;
    stim[54] = 67'h25fc6691d6616f0bc;
    stim[55] = 67'h64f64df22e9084a86;
    stim[56] = 67'h29e61e5d21e12e5b0;
    stim[57] = 67'h75dca16f194107e86;
    stim[58] = 67'h0f3b71d44c2745516;
    stim[59] = 67'h42dc7963915aaa320;
    stim[60] = 67'h5f9fc2ca0354bbdaf;
    stim[61] = 67'h717eeda8040a20a85;
    stim[62] = 67'h3341d9e372745d4e6;
    stim[63] = 67'h1d7f6cd3bc1917780;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'hxxxxxxxxxxxxxxxxx;
      expv[2] = 66'hxxxxxxxxxxxxxxxxx;
      expv[3] = 66'hxxxxxxxxxxxxxxxxx;
      expv[4] = 66'hxxxxxxxxxxxxxxxxx;
      expv[5] = 66'hxxxxxxxxxxxxxxxxx;
      expv[6] = 66'hxxxxxxxxxxxxxxxxx;
      expv[7] = 66'hxxxxxxxxxxxxxxxxx;
      expv[8] = 66'hxxxxxxxxxxxxxxxxx;
      expv[9] = 66'hxxxxxxxxxxxxxxxxx;
      expv[10] = 66'hxxxxxxxxxxxxxxxxx;
      expv[11] = 66'hxxxxxxxxxxxxxxxxx;
      expv[12] = 66'hxxxxxxxxxxxxxxxxx;
      expv[13] = 66'hxxxxxxxxxxxxxxxxx;
      expv[14] = 66'hxxxxxxxxxxxxxxxxx;
      expv[15] = 66'h30e73ca38bf66d09e;
      expv[16] = 66'h30e73ca38bf66d09e;
      expv[17] = 66'h30e73ca38bf66d09e;
      expv[18] = 66'h30e73ca38bf66d09e;
      expv[19] = 66'h30e73ca38bf66d09e;
      expv[20] = 66'h30e73ca38bf66d09c;
      expv[21] = 66'h30e73ca38bf66d09d;
      expv[22] = 66'h30e73ca38bf66d09d;
      expv[23] = 66'h30e73ca38bf66d09c;
      expv[24] = 66'h30e73ca38bf66d09c;
      expv[25] = 66'h30e73ca38bf66d09c;
      expv[26] = 66'h30e73ca38bf66d09c;
      expv[27] = 66'h30e73ca38bf66d09c;
      expv[28] = 66'h30e73ca38bf66d09c;
      expv[29] = 66'h30e73ca38bf66d09c;
      expv[30] = 66'h30e73ca38bf66d09c;
      expv[31] = 66'h30f17df028fe2897a;
      expv[32] = 66'h30f17df028fe28978;
      expv[33] = 66'h30f17df028fe28979;
      expv[34] = 66'h30f17df028fe28979;
      expv[35] = 66'h30f17df028fe28979;
      expv[36] = 66'h30f17df028fe28978;
      expv[37] = 66'h30f17df028fe28978;
      expv[38] = 66'h30f17df028fe28978;
      expv[39] = 66'h30f17df028fe28978;
      expv[40] = 66'h30f17df028fe28978;
      expv[41] = 66'h30f17df028fe28978;
      expv[42] = 66'h30f17df028fe28978;
      expv[43] = 66'h30f17df028fe28978;
      expv[44] = 66'h30f17df028fe28978;
      expv[45] = 66'h30f17df028fe28978;
      expv[46] = 66'h10e9a34115afaec5e;
      expv[47] = 66'h10e9a34115afaec5e;
      expv[48] = 66'h10e9a34115afaec5e;
      expv[49] = 66'h10e9a34115afaec5e;
      expv[50] = 66'h10e9a34115afaec5e;
      expv[51] = 66'h10e9a34115afaec5e;
      expv[52] = 66'h10e9a34115afaec5e;
      expv[53] = 66'h10e9a34115afaec5e;
      expv[54] = 66'h10e9a34115afaec5c;
      expv[55] = 66'h10e9a34115afaec5d;
      expv[56] = 66'h10e9a34115afaec5c;
      expv[57] = 66'h10e9a34115afaec5c;
      expv[58] = 66'h10e9a34115afaec5c;
      expv[59] = 66'h10e9a34115afaec5c;
      expv[60] = 66'h10e9a34115afaec5c;
      expv[61] = 66'h10e9a34115afaec5c;
      expv[62] = 66'h10e9a34115afaec5c;
      expv[63] = 66'h10e9a34115afaec5d;
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
