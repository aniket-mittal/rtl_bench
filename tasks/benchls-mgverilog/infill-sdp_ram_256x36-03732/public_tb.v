// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03732 dut (
    .clock(clk),
    .data(in_vec[52:17]),
    .rdaddress(in_vec[16:9]),
    .wraddress(in_vec[8:1]),
    .wren(in_vec[0:0]),
    .q(out_vec[35:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h11907adf7526dc;
    stim[1] = 53'h0317b318101e59;
    stim[2] = 53'h15a7d56248ea50;
    stim[3] = 53'h0489f1b79119e9;
    stim[4] = 53'h1a117be7ce729a;
    stim[5] = 53'h18d4b8fed963ed;
    stim[6] = 53'h01333be1f0d93e;
    stim[7] = 53'h1f31d1a9f74b7d;
    stim[8] = 53'h04efe6b095acb2;
    stim[9] = 53'h012f93ac2d49b3;
    stim[10] = 53'h09ecbe2b93e14f;
    stim[11] = 53'h11ff4a097eb9b7;
    stim[12] = 53'h15a678f1cca15b;
    stim[13] = 53'h1d0597d5ea8949;
    stim[14] = 53'h1c9fdf066c17aa;
    stim[15] = 53'h1cfa33996bb498;
    stim[16] = 53'h121b7e23885a29;
    stim[17] = 53'h051e1cfb2c59ee;
    stim[18] = 53'h092b0d3d03ef67;
    stim[19] = 53'h0f3b0b934b95d6;
    stim[20] = 53'h00001b21d4eba1;
    stim[21] = 53'h0522ec41c0f57b;
    stim[22] = 53'h1bd860937345cc;
    stim[23] = 53'h15407f6cc8a95c;
    stim[24] = 53'h111513492262cf;
    stim[25] = 53'h01aee35e0f8368;
    stim[26] = 53'h098dcfa9f24919;
    stim[27] = 53'h0fdf2f04e922ad;
    stim[28] = 53'h00de3442b7490b;
    stim[29] = 53'h191d3af772e12c;
    stim[30] = 53'h0af6f31e4b0991;
    stim[31] = 53'h111221a925b557;
    stim[32] = 53'h1e53ed58ef4160;
    stim[33] = 53'h07aea71091bd1d;
    stim[34] = 53'h0c32244f5b2feb;
    stim[35] = 53'h0a864f7beb2e3a;
    stim[36] = 53'h0fc6f2234bc237;
    stim[37] = 53'h1d21f36051d3d9;
    stim[38] = 53'h1702ba890cf6b4;
    stim[39] = 53'h06cf7fa0d1440d;
    stim[40] = 53'h121d82eca8e3d5;
    stim[41] = 53'h0340abf02ce2dd;
    stim[42] = 53'h19ee9f9a5aa9f7;
    stim[43] = 53'h15b64a2660fec7;
    stim[44] = 53'h0360084042cfdd;
    stim[45] = 53'h1146f264e17abd;
    stim[46] = 53'h08c6953ca5216f;
    stim[47] = 53'h15fab0d3e3538f;
    stim[48] = 53'h178853c85b1edf;
    stim[49] = 53'h02f540b33c20f5;
    stim[50] = 53'h132a33bfbd8d75;
    stim[51] = 53'h10ff8718c3ac6f;
    stim[52] = 53'h00caa5c21b2bda;
    stim[53] = 53'h1e493f4e8192bf;
    stim[54] = 53'h07f47357d11505;
    stim[55] = 53'h18208f02c323d3;
    stim[56] = 53'h096fd133a7d7d4;
    stim[57] = 53'h19f3a090fc1bcf;
    stim[58] = 53'h018fa2d22cc579;
    stim[59] = 53'h17ac266785853f;
    stim[60] = 53'h1f32b3012d0cab;
    stim[61] = 53'h0d532849938c93;
    stim[62] = 53'h1cf009c4621eb9;
    stim[63] = 53'h1b3507094c305a;
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
      expv[0] = 36'hxxxxxxxxx;
      expv[1] = 36'hxxxxxxxxx;
      expv[2] = 36'hxxxxxxxxx;
      expv[3] = 36'hxxxxxxxxx;
      expv[4] = 36'hxxxxxxxxx;
      expv[5] = 36'hxxxxxxxxx;
      expv[6] = 36'hxxxxxxxxx;
      expv[7] = 36'hxxxxxxxxx;
      expv[8] = 36'hxxxxxxxxx;
      expv[9] = 36'hxxxxxxxxx;
      expv[10] = 36'hxxxxxxxxx;
      expv[11] = 36'hxxxxxxxxx;
      expv[12] = 36'hxxxxxxxxx;
      expv[13] = 36'hxxxxxxxxx;
      expv[14] = 36'hxxxxxxxxx;
      expv[15] = 36'hxxxxxxxxx;
      expv[16] = 36'hxxxxxxxxx;
      expv[17] = 36'hxxxxxxxxx;
      expv[18] = 36'h18bd98c08;
      expv[19] = 36'hxxxxxxxxx;
      expv[20] = 36'hxxxxxxxxx;
      expv[21] = 36'hxxxxxxxxx;
      expv[22] = 36'hxxxxxxxxx;
      expv[23] = 36'hxxxxxxxxx;
      expv[24] = 36'hxxxxxxxxx;
      expv[25] = 36'hxxxxxxxxx;
      expv[26] = 36'hxxxxxxxxx;
      expv[27] = 36'hxxxxxxxxx;
      expv[28] = 36'hxxxxxxxxx;
      expv[29] = 36'he82cbeaf5;
      expv[30] = 36'hxxxxxxxxx;
      expv[31] = 36'hxxxxxxxxx;
      expv[32] = 36'hxxxxxxxxx;
      expv[33] = 36'hxxxxxxxxx;
      expv[34] = 36'hxxxxxxxxx;
      expv[35] = 36'hxxxxxxxxx;
      expv[36] = 36'hxxxxxxxxx;
      expv[37] = 36'hxxxxxxxxx;
      expv[38] = 36'hxxxxxxxxx;
      expv[39] = 36'hxxxxxxxxx;
      expv[40] = 36'hxxxxxxxxx;
      expv[41] = 36'hxxxxxxxxx;
      expv[42] = 36'hxxxxxxxxx;
      expv[43] = 36'hxxxxxxxxx;
      expv[44] = 36'hxxxxxxxxx;
      expv[45] = 36'h88a89a491;
      expv[46] = 36'h2917620e0;
      expv[47] = 36'hxxxxxxxxx;
      expv[48] = 36'hxxxxxxxxx;
      expv[49] = 36'hxxxxxxxxx;
      expv[50] = 36'hxxxxxxxxx;
      expv[51] = 36'hxxxxxxxxx;
      expv[52] = 36'hxxxxxxxxx;
      expv[53] = 36'hxxxxxxxxx;
      expv[54] = 36'hxxxxxxxxx;
      expv[55] = 36'hxxxxxxxxx;
      expv[56] = 36'hxxxxxxxxx;
      expv[57] = 36'hxxxxxxxxx;
      expv[58] = 36'hxxxxxxxxx;
      expv[59] = 36'hxxxxxxxxx;
      expv[60] = 36'hxxxxxxxxx;
      expv[61] = 36'hxxxxxxxxx;
      expv[62] = 36'hxxxxxxxxx;
      expv[63] = 36'hxxxxxxxxx;
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
