// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02832 dut (
    .CLK(clk),
    .RST(in_vec[33:33]),
    .I_STB(in_vec[32:32]),
    .I_DAT(in_vec[31:0]),
    .O_STB(out_vec[32:32]),
    .O_DAT(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h2363d2c91;
    stim[1] = 34'h255bd7083;
    stim[2] = 34'h01a863d16;
    stim[3] = 34'h11031f078;
    stim[4] = 34'h1e701bb32;
    stim[5] = 34'h174194da4;
    stim[6] = 34'h073c67720;
    stim[7] = 34'h1636d0e15;
    stim[8] = 34'h1130d9f11;
    stim[9] = 34'h0b702e619;
    stim[10] = 34'h02d1f7531;
    stim[11] = 34'h1f3b767b4;
    stim[12] = 34'h1831e4e19;
    stim[13] = 34'h0e5455e3b;
    stim[14] = 34'h1f2d69d36;
    stim[15] = 34'h1d97410d5;
    stim[16] = 34'h1c325fb1e;
    stim[17] = 34'h0ca78b56d;
    stim[18] = 34'h09cfce35c;
    stim[19] = 34'h083275b13;
    stim[20] = 34'h2f7c6a971;
    stim[21] = 34'h0a8012da1;
    stim[22] = 34'h107ca98c5;
    stim[23] = 34'h07ef23654;
    stim[24] = 34'h0aeaad5db;
    stim[25] = 34'h1b17de5e0;
    stim[26] = 34'h02c176643;
    stim[27] = 34'h022f0801a;
    stim[28] = 34'h01828ed74;
    stim[29] = 34'h0118074ff;
    stim[30] = 34'h1693acb96;
    stim[31] = 34'h0c65983f8;
    stim[32] = 34'h107617bcb;
    stim[33] = 34'h14cd4f9f9;
    stim[34] = 34'h04aaa96af;
    stim[35] = 34'h1ccabccf9;
    stim[36] = 34'h14ecd4883;
    stim[37] = 34'h1355033b6;
    stim[38] = 34'h07725e1c8;
    stim[39] = 34'h29c2c0cbf;
    stim[40] = 34'h10883aab8;
    stim[41] = 34'h02c171431;
    stim[42] = 34'h165eaa01a;
    stim[43] = 34'h16f008b49;
    stim[44] = 34'h0b45dd6a1;
    stim[45] = 34'h0e0f807cf;
    stim[46] = 34'h03577aa98;
    stim[47] = 34'h1007a9550;
    stim[48] = 34'h11fe67402;
    stim[49] = 34'h02b4dbd06;
    stim[50] = 34'h124eb0871;
    stim[51] = 34'h17c439053;
    stim[52] = 34'h1790ac531;
    stim[53] = 34'h0c523e779;
    stim[54] = 34'h0fbdf614d;
    stim[55] = 34'h0455511d1;
    stim[56] = 34'h1863c0d60;
    stim[57] = 34'h14bd6cba4;
    stim[58] = 34'h189889106;
    stim[59] = 34'h00a428c37;
    stim[60] = 34'h1106a02b4;
    stim[61] = 34'h121a416f9;
    stim[62] = 34'h0ec793db0;
    stim[63] = 34'h1ee6285f4;
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
      expv[0] = 33'h0xxxxxxxx;
      expv[1] = 33'h00971348d;
      expv[2] = 33'h025ae8fb7;
      expv[3] = 33'h006543584;
      expv[4] = 33'h10f3586f8;
      expv[5] = 33'h1a8ead932;
      expv[6] = 33'h12335e504;
      expv[7] = 33'h035df82c0;
      expv[8] = 33'h105781df1;
      expv[9] = 33'h10bd656dd;
      expv[10] = 33'h0a47dab32;
      expv[11] = 33'h014a7cdef;
      expv[12] = 33'h162b9fdac;
      expv[13] = 33'h127fff1ee;
      expv[14] = 33'h054642ce7;
      expv[15] = 33'h195207724;
      expv[16] = 33'h10e4c2d84;
      expv[17] = 33'h1bf6c2556;
      expv[18] = 33'h08f7d0d18;
      expv[19] = 33'h08b6bde90;
      expv[20] = 33'h02ea898e5;
      expv[21] = 33'h0a3ff1466;
      expv[22] = 33'h01df1d5a1;
      expv[23] = 33'h104a5ee72;
      expv[24] = 33'h01af0b368;
      expv[25] = 33'h091e8dd6e;
      expv[26] = 33'h19f601e60;
      expv[27] = 33'h0119cb405;
      expv[28] = 33'h0117b8c60;
      expv[29] = 33'h01667fa20;
      expv[30] = 33'h007ff6e80;
      expv[31] = 33'h153aea5fc;
      expv[32] = 33'h0663fb138;
      expv[33] = 33'h1039174eb;
      expv[34] = 33'h14b04ee34;
      expv[35] = 33'h02bf2a636;
      expv[36] = 33'h1a3df5653;
      expv[37] = 33'h11651fae7;
      expv[38] = 33'h10ac4d6e0;
      expv[39] = 33'h0691499e8;
      expv[40] = 33'h007c694d4;
      expv[41] = 33'h105ad1c28;
      expv[42] = 33'h0037a3c67;
      expv[43] = 33'h13fbc99c4;
      expv[44] = 33'h13c64a700;
      expv[45] = 33'h097372c7d;
      expv[46] = 33'h006dcb088;
      expv[47] = 33'h023a0c4a8;
      expv[48] = 33'h100472820;
      expv[49] = 33'h10e7477cc;
      expv[50] = 33'h01ff8dcce;
      expv[51] = 33'h10137a3bb;
      expv[52] = 33'h1460df9b9;
      expv[53] = 33'h15d3bdcea;
      expv[54] = 33'h0b23fc28b;
      expv[55] = 33'h05fbb4113;
      expv[56] = 33'h004d33f65;
      expv[57] = 33'h107036280;
      expv[58] = 33'h13c534718;
      expv[59] = 33'h14de94130;
      expv[60] = 33'h0059e4c2e;
      expv[61] = 33'h1002c5e88;
      expv[62] = 33'h10304d084;
      expv[63] = 33'h038fb6830;
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
