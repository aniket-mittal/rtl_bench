// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 64;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_061661 dut (
    .in1(in_vec[63:63]),
    .in2(in_vec[62:55]),
    .in3(in_vec[54:32]),
    .in4(in_vec[31:24]),
    .in5(in_vec[23:1]),
    .in6(in_vec[0:0]),
    .out1(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 64'h6f7808bddba3775c;
    stim[1] = 64'ha5d57eebd1159b4c;
    stim[2] = 64'h88e04c4db4309e06;
    stim[3] = 64'hbd05f498c470fbde;
    stim[4] = 64'h4b77d2a24d85acb4;
    stim[5] = 64'h827007a3bc5f2c22;
    stim[6] = 64'hb0f7f7e2e822dcc0;
    stim[7] = 64'ha661a2c04ed0012f;
    stim[8] = 64'h2c8a7aa8eab0d17b;
    stim[9] = 64'h6506f55277da6a3d;
    stim[10] = 64'h502370a1dc24fde8;
    stim[11] = 64'hae7d24c4aae0b5da;
    stim[12] = 64'h6b2f073b889c1a65;
    stim[13] = 64'haa719f2f0707a6ab;
    stim[14] = 64'hd87db948f457d0b7;
    stim[15] = 64'hf8eb70f2cd7e2265;
    stim[16] = 64'hbc0b416e7f09e7b9;
    stim[17] = 64'h5b56caddf8e6c6ae;
    stim[18] = 64'h30ce42e61e758662;
    stim[19] = 64'h8f989273edcfa80c;
    stim[20] = 64'h43dafa746cde396a;
    stim[21] = 64'h1cfa18050a9c043d;
    stim[22] = 64'h46a89c92c2064482;
    stim[23] = 64'hc48ba97f7cf18f0a;
    stim[24] = 64'h6fe172d11448255d;
    stim[25] = 64'h76d33280f15d547c;
    stim[26] = 64'h68d6fd2b1054118d;
    stim[27] = 64'h95c5291b5f5ea434;
    stim[28] = 64'hd2ee745abf166b9d;
    stim[29] = 64'h7b2b4ad4946a3bab;
    stim[30] = 64'h2a9a85ba25dd2ebf;
    stim[31] = 64'h9dd39dd0eff12d41;
    stim[32] = 64'ha848724192d5b750;
    stim[33] = 64'haa660be589f326e2;
    stim[34] = 64'h53b3e4cd8ba93fe2;
    stim[35] = 64'h814d931eccbfad65;
    stim[36] = 64'he181cbcb2da65336;
    stim[37] = 64'hec11fcec7967af75;
    stim[38] = 64'hb90fe86ea14aeaa6;
    stim[39] = 64'ha3f422b0413dddd5;
    stim[40] = 64'hb624ce0cb6f2c596;
    stim[41] = 64'he90d03ad51bba29a;
    stim[42] = 64'h7ac33e928543d26f;
    stim[43] = 64'hb1d154d998f8c31a;
    stim[44] = 64'h3bbe0f2c1aeee1e6;
    stim[45] = 64'h9233bce7c56f6264;
    stim[46] = 64'h8a0eea42115abace;
    stim[47] = 64'h8bee69a87a23e1c1;
    stim[48] = 64'h87229f25937d9128;
    stim[49] = 64'hcc029a48a9631c7f;
    stim[50] = 64'h23080f7c33495e58;
    stim[51] = 64'h75f8c10e65ea462e;
    stim[52] = 64'h7eea845ffaa00faf;
    stim[53] = 64'h9a31190a83797548;
    stim[54] = 64'hc9a647d1117393ee;
    stim[55] = 64'hb96a976f1b9ea4b8;
    stim[56] = 64'h399c8dddd01b9388;
    stim[57] = 64'h5a2856d4b088b0b8;
    stim[58] = 64'hfe3ebb873d66a437;
    stim[59] = 64'hc297e16635929dfe;
    stim[60] = 64'h091637e443587dc9;
    stim[61] = 64'h7d4f4566b167b6f5;
    stim[62] = 64'hc7781a587d35c2f7;
    stim[63] = 64'hf50a1c9812971f89;
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
      expv[0] = 2'h1;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h0;
      expv[4] = 2'h1;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h1;
      expv[8] = 2'h1;
      expv[9] = 2'h1;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h1;
      expv[13] = 2'h0;
      expv[14] = 2'h1;
      expv[15] = 2'h0;
      expv[16] = 2'h1;
      expv[17] = 2'h0;
      expv[18] = 2'h1;
      expv[19] = 2'h0;
      expv[20] = 2'h1;
      expv[21] = 2'h1;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h1;
      expv[25] = 2'h0;
      expv[26] = 2'h1;
      expv[27] = 2'h0;
      expv[28] = 2'h1;
      expv[29] = 2'h1;
      expv[30] = 2'h1;
      expv[31] = 2'h1;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h1;
      expv[35] = 2'h1;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h1;
      expv[43] = 2'h0;
      expv[44] = 2'h1;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h1;
      expv[48] = 2'h0;
      expv[49] = 2'h1;
      expv[50] = 2'h1;
      expv[51] = 2'h1;
      expv[52] = 2'h1;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h1;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h1;
      expv[61] = 2'h1;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
