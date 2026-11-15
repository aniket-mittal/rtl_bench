// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 70;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_047771 dut (
    .ALUCon(in_vec[69:64]),
    .A(in_vec[63:32]),
    .B(in_vec[31:0]),
    .ALUOut(out_vec[32:1]),
    .Zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 70'h0633168a5dcdc0d77d;
    stim[1] = 70'h1c7d819112d445d356;
    stim[2] = 70'h3ea41a6a476ee90b1a;
    stim[3] = 70'h081d18f2c985dbdf00;
    stim[4] = 70'h0b370548ef2348b056;
    stim[5] = 70'h36e22ccb6cc790d2a6;
    stim[6] = 70'h26fe091320c9e41d1a;
    stim[7] = 70'h2fd4cb3180fc5ebbdd;
    stim[8] = 70'h286b06c960a216926a;
    stim[9] = 70'h21de3025809e596228;
    stim[10] = 70'h3cab81b0577a04ec3c;
    stim[11] = 70'h1433b88ea4f18e6df5;
    stim[12] = 70'h026c4c8805c9709b17;
    stim[13] = 70'h25e66f2b3bbbf3748a;
    stim[14] = 70'h16aafb457c7026ed4c;
    stim[15] = 70'h06b9c5a75dfa2698b2;
    stim[16] = 70'h3d7d7fa1ed59bbf4c5;
    stim[17] = 70'h176212a8c522fdb576;
    stim[18] = 70'h0d8f72c075830fd2d2;
    stim[19] = 70'h1c0db822ac87d2e6f3;
    stim[20] = 70'h025b23c81971b87c02;
    stim[21] = 70'h1990a6f12b5ec6899f;
    stim[22] = 70'h08a224cf3e333df1b8;
    stim[23] = 70'h2ae0591e1b4995020f;
    stim[24] = 70'h0291c125b14ef8aad0;
    stim[25] = 70'h2d217a73dac9c09aab;
    stim[26] = 70'h1b1282136ae8cec231;
    stim[27] = 70'h1ab4cdff5048c7c045;
    stim[28] = 70'h03f85bf8ce364b62d2;
    stim[29] = 70'h0c7117aaa368be5f7f;
    stim[30] = 70'h1e1885b0cd00ffb555;
    stim[31] = 70'h2e42fa3aa53120e354;
    stim[32] = 70'h3958eaa72a4b58b152;
    stim[33] = 70'h30285007db05bb4ac8;
    stim[34] = 70'h11158564d0ad9e8b56;
    stim[35] = 70'h1edb59e270949e03e1;
    stim[36] = 70'h02bd1513dec5f89763;
    stim[37] = 70'h31b3b18dc92cbcce1a;
    stim[38] = 70'h177cd322abba38a132;
    stim[39] = 70'h3a650e850c0c69d18d;
    stim[40] = 70'h0752832eef74254b73;
    stim[41] = 70'h3141706c5dfecf97eb;
    stim[42] = 70'h0643b86b7332ec1fb3;
    stim[43] = 70'h04f51fcf19c79e27d3;
    stim[44] = 70'h2245bf8b7d0df5021f;
    stim[45] = 70'h0beac913187f11db5c;
    stim[46] = 70'h201fbd7537fd464082;
    stim[47] = 70'h0c8c19d0537cf6a3a1;
    stim[48] = 70'h39e809fffea1b21144;
    stim[49] = 70'h37fc99de2805b76a22;
    stim[50] = 70'h1bd432eac7186642b0;
    stim[51] = 70'h3f7fc39e7e21001807;
    stim[52] = 70'h2481fadbc824444be9;
    stim[53] = 70'h0222528d1a0036ed8b;
    stim[54] = 70'h0db511f0077a91936b;
    stim[55] = 70'h1355ff335061720157;
    stim[56] = 70'h2178c8d894967413ae;
    stim[57] = 70'h14bb5bf8e20d4d9fd1;
    stim[58] = 70'h1bfaa0d04ceee9218c;
    stim[59] = 70'h0bd487e7b559ed1762;
    stim[60] = 70'h07e5833c5aea67d90e;
    stim[61] = 70'h38d60733ea68f04f46;
    stim[62] = 70'h2eae38cadb45b051c4;
    stim[63] = 70'h2019936a0592d7607a;
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
      expv[0] = 33'h000000002;
      expv[1] = 33'h000000001;
      expv[2] = 33'h000000001;
      expv[3] = 33'h000000001;
      expv[4] = 33'h000000001;
      expv[5] = 33'h000000001;
      expv[6] = 33'h06fda1c74;
      expv[7] = 33'h000000001;
      expv[8] = 33'h000000001;
      expv[9] = 33'h0f9130f50;
      expv[10] = 33'h000000001;
      expv[11] = 33'h000000001;
      expv[12] = 33'h000000001;
      expv[13] = 33'h1fffeff76;
      expv[14] = 33'h000000001;
      expv[15] = 33'h000005ce2;
      expv[16] = 33'h000000001;
      expv[17] = 33'h000000001;
      expv[18] = 33'h000000001;
      expv[19] = 33'h000000001;
      expv[20] = 33'h000000001;
      expv[21] = 33'h000000001;
      expv[22] = 33'h000000001;
      expv[23] = 33'h000000002;
      expv[24] = 33'h000000001;
      expv[25] = 33'h000000001;
      expv[26] = 33'h000000001;
      expv[27] = 33'h000000001;
      expv[28] = 33'h1fffffffe;
      expv[29] = 33'h000000001;
      expv[30] = 33'h000000001;
      expv[31] = 33'h000000001;
      expv[32] = 33'h000000001;
      expv[33] = 33'h000000001;
      expv[34] = 33'h000000001;
      expv[35] = 33'h000000001;
      expv[36] = 33'h000000001;
      expv[37] = 33'h000000001;
      expv[38] = 33'h000000001;
      expv[39] = 33'h000000001;
      expv[40] = 33'h0000014a0;
      expv[41] = 33'h000000001;
      expv[42] = 33'h0000010ee;
      expv[43] = 33'h0f1900000;
      expv[44] = 33'h06f9512bc;
      expv[45] = 33'h000000001;
      expv[46] = 33'h03a076b72;
      expv[47] = 33'h000000001;
      expv[48] = 33'h000000001;
      expv[49] = 33'h000000001;
      expv[50] = 33'h000000001;
      expv[51] = 33'h000000001;
      expv[52] = 33'h000809790;
      expv[53] = 33'h000000001;
      expv[54] = 33'h000000001;
      expv[55] = 33'h000000001;
      expv[56] = 33'h01e79d884;
      expv[57] = 33'h000000001;
      expv[58] = 33'h000000001;
      expv[59] = 33'h000000001;
      expv[60] = 33'h1ffff2c18;
      expv[61] = 33'h000000001;
      expv[62] = 33'h000000001;
      expv[63] = 33'h158d594fe;
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
