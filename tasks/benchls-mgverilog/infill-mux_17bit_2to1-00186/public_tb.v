// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00186 dut (
    .A(in_vec[34:18]),
    .B(in_vec[17:1]),
    .S(in_vec[0:0]),
    .MO(out_vec[16:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h04cac9b18;
    stim[1] = 35'h3ef8b60f0;
    stim[2] = 35'h5a8fc74b1;
    stim[3] = 35'h7312bb1dc;
    stim[4] = 35'h5b9b518f9;
    stim[5] = 35'h4b145c956;
    stim[6] = 35'h0535846a3;
    stim[7] = 35'h0955200d8;
    stim[8] = 35'h2c03ab066;
    stim[9] = 35'h06fab1959;
    stim[10] = 35'h23b947c47;
    stim[11] = 35'h184fb5c13;
    stim[12] = 35'h69e689415;
    stim[13] = 35'h17d3dc86c;
    stim[14] = 35'h1e0070cdb;
    stim[15] = 35'h474d1fefa;
    stim[16] = 35'h781d25953;
    stim[17] = 35'h115cf9acc;
    stim[18] = 35'h384f0ca0c;
    stim[19] = 35'h3b7ef8c4d;
    stim[20] = 35'h5dffc635e;
    stim[21] = 35'h4de91d147;
    stim[22] = 35'h32a544c3b;
    stim[23] = 35'h28cb9a622;
    stim[24] = 35'h3aeed4cf6;
    stim[25] = 35'h086d15874;
    stim[26] = 35'h431ec061f;
    stim[27] = 35'h645d5f85c;
    stim[28] = 35'h4d2ddef03;
    stim[29] = 35'h0980660c5;
    stim[30] = 35'h61ce10555;
    stim[31] = 35'h752e18119;
    stim[32] = 35'h171a5cef4;
    stim[33] = 35'h319730cee;
    stim[34] = 35'h347b1727e;
    stim[35] = 35'h6ee7c366a;
    stim[36] = 35'h1a2eee294;
    stim[37] = 35'h224886ab3;
    stim[38] = 35'h261db7d75;
    stim[39] = 35'h2041a2bd4;
    stim[40] = 35'h33bb7e2d2;
    stim[41] = 35'h1267d27d8;
    stim[42] = 35'h77ed61f2d;
    stim[43] = 35'h3b13f95e0;
    stim[44] = 35'h24d2867d9;
    stim[45] = 35'h352995318;
    stim[46] = 35'h594afbcb6;
    stim[47] = 35'h5ac994826;
    stim[48] = 35'h660a31fa3;
    stim[49] = 35'h5a8f7b86d;
    stim[50] = 35'h68e31dc1e;
    stim[51] = 35'h1b3e552a7;
    stim[52] = 35'h3f1dfef97;
    stim[53] = 35'h090147b13;
    stim[54] = 35'h32ff6be63;
    stim[55] = 35'h29ae56eae;
    stim[56] = 35'h2075a5be6;
    stim[57] = 35'h6a73ead69;
    stim[58] = 35'h594cadcdb;
    stim[59] = 35'h1a299eddd;
    stim[60] = 35'h098361b29;
    stim[61] = 35'h418869eb2;
    stim[62] = 35'h40b52ecd6;
    stim[63] = 35'h6a67e09be;
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
      expv[0] = 17'h0132b;
      expv[1] = 17'h0fbe2;
      expv[2] = 17'h03a58;
      expv[3] = 17'h1cc4a;
      expv[4] = 17'h08c7c;
      expv[5] = 17'h12c51;
      expv[6] = 17'h02351;
      expv[7] = 17'h02554;
      expv[8] = 17'h0b00e;
      expv[9] = 17'h18cac;
      expv[10] = 17'h03e23;
      expv[11] = 17'h1ae09;
      expv[12] = 17'h04a0a;
      expv[13] = 17'h05f4f;
      expv[14] = 17'h1866d;
      expv[15] = 17'h11d34;
      expv[16] = 17'h12ca9;
      expv[17] = 17'h04573;
      expv[18] = 17'h0e13c;
      expv[19] = 17'h1c626;
      expv[20] = 17'h177ff;
      expv[21] = 17'h0e8a3;
      expv[22] = 17'h0261d;
      expv[23] = 17'h0a32e;
      expv[24] = 17'h0ebbb;
      expv[25] = 17'h021b4;
      expv[26] = 17'h0030f;
      expv[27] = 17'h19175;
      expv[28] = 17'h0f781;
      expv[29] = 17'h13062;
      expv[30] = 17'h082aa;
      expv[31] = 17'h0c08c;
      expv[32] = 17'h05c69;
      expv[33] = 17'h0c65c;
      expv[34] = 17'h0d1ec;
      expv[35] = 17'h1bb9f;
      expv[36] = 17'h068bb;
      expv[37] = 17'h03559;
      expv[38] = 17'h1beba;
      expv[39] = 17'h08106;
      expv[40] = 17'h0ceed;
      expv[41] = 17'h0499f;
      expv[42] = 17'h10f96;
      expv[43] = 17'h0ec4f;
      expv[44] = 17'h033ec;
      expv[45] = 17'h0d4a6;
      expv[46] = 17'h1652b;
      expv[47] = 17'h16b26;
      expv[48] = 17'h18fd1;
      expv[49] = 17'h1dc36;
      expv[50] = 17'h1a38c;
      expv[51] = 17'h0a953;
      expv[52] = 17'h1f7cb;
      expv[53] = 17'h03d89;
      expv[54] = 17'h15f31;
      expv[55] = 17'h0a6b9;
      expv[56] = 17'h081d6;
      expv[57] = 17'h156b4;
      expv[58] = 17'h16e6d;
      expv[59] = 17'h0f6ee;
      expv[60] = 17'h10d94;
      expv[61] = 17'h10621;
      expv[62] = 17'h102d4;
      expv[63] = 17'h1a99f;
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
