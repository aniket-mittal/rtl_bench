// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_074835 dut (
    .clk(clk),
    .sig_in(in_vec[16:1]),
    .rst(in_vec[0:0]),
    .sig_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h027f7;
    stim[1] = 17'h0a1cf;
    stim[2] = 17'h199f8;
    stim[3] = 17'h1b7d1;
    stim[4] = 17'h0af76;
    stim[5] = 17'h0eb9a;
    stim[6] = 17'h1184c;
    stim[7] = 17'h01550;
    stim[8] = 17'h03004;
    stim[9] = 17'h0fb1a;
    stim[10] = 17'h074ac;
    stim[11] = 17'h0a084;
    stim[12] = 17'h01460;
    stim[13] = 17'h11dc8;
    stim[14] = 17'h0cdc2;
    stim[15] = 17'h09252;
    stim[16] = 17'h13852;
    stim[17] = 17'h1a746;
    stim[18] = 17'h1e0e2;
    stim[19] = 17'h10eb4;
    stim[20] = 17'h141c4;
    stim[21] = 17'h00bec;
    stim[22] = 17'h10d76;
    stim[23] = 17'h015ea;
    stim[24] = 17'h0aa50;
    stim[25] = 17'h174cc;
    stim[26] = 17'h0d54c;
    stim[27] = 17'h18226;
    stim[28] = 17'h05ea6;
    stim[29] = 17'h01cdc;
    stim[30] = 17'h0fb24;
    stim[31] = 17'h1acd8;
    stim[32] = 17'h1e51c;
    stim[33] = 17'h0da90;
    stim[34] = 17'h10e06;
    stim[35] = 17'h19bd8;
    stim[36] = 17'h12574;
    stim[37] = 17'h0b482;
    stim[38] = 17'h0a2bc;
    stim[39] = 17'h17868;
    stim[40] = 17'h0070a;
    stim[41] = 17'h1e6d4;
    stim[42] = 17'h13352;
    stim[43] = 17'h1c522;
    stim[44] = 17'h01a1a;
    stim[45] = 17'h169aa;
    stim[46] = 17'h09782;
    stim[47] = 17'h0aede;
    stim[48] = 17'h11954;
    stim[49] = 17'h1207e;
    stim[50] = 17'h1477e;
    stim[51] = 17'h1c6b6;
    stim[52] = 17'h05c90;
    stim[53] = 17'h118d0;
    stim[54] = 17'h0d05e;
    stim[55] = 17'h0b1d4;
    stim[56] = 17'h1b9cc;
    stim[57] = 17'h0852a;
    stim[58] = 17'h0abd6;
    stim[59] = 17'h1e96c;
    stim[60] = 17'h0ac9a;
    stim[61] = 17'h197e0;
    stim[62] = 17'h047ac;
    stim[63] = 17'h1ad34;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'hfffd;
      expv[9] = 16'hfff3;
      expv[10] = 16'hffe5;
      expv[11] = 16'hffd8;
      expv[12] = 16'hffcf;
      expv[13] = 16'hffcf;
      expv[14] = 16'hffdb;
      expv[15] = 16'hfff8;
      expv[16] = 16'h0028;
      expv[17] = 16'h0069;
      expv[18] = 16'h00bc;
      expv[19] = 16'h011c;
      expv[20] = 16'h0185;
      expv[21] = 16'h01ee;
      expv[22] = 16'h0251;
      expv[23] = 16'h02aa;
      expv[24] = 16'h02fa;
      expv[25] = 16'h0346;
      expv[26] = 16'h0397;
      expv[27] = 16'h03f4;
      expv[28] = 16'h0458;
      expv[29] = 16'h04c1;
      expv[30] = 16'h052c;
      expv[31] = 16'h0595;
      expv[32] = 16'h05f9;
      expv[33] = 16'h0656;
      expv[34] = 16'h06a3;
      expv[35] = 16'h06d4;
      expv[36] = 16'h06e0;
      expv[37] = 16'h06c9;
      expv[38] = 16'h0695;
      expv[39] = 16'h064c;
      expv[40] = 16'h0604;
      expv[41] = 16'h05c9;
      expv[42] = 16'h05a9;
      expv[43] = 16'h05a5;
      expv[44] = 16'h05bd;
      expv[45] = 16'h05ec;
      expv[46] = 16'h062d;
      expv[47] = 16'h067b;
      expv[48] = 16'h06d2;
      expv[49] = 16'h0722;
      expv[50] = 16'h0760;
      expv[51] = 16'h0785;
      expv[52] = 16'h0793;
      expv[53] = 16'h078f;
      expv[54] = 16'h0778;
      expv[55] = 16'h0758;
      expv[56] = 16'h0736;
      expv[57] = 16'h0716;
      expv[58] = 16'h06fb;
      expv[59] = 16'h06e6;
      expv[60] = 16'h06d0;
      expv[61] = 16'h06c4;
      expv[62] = 16'h06bb;
      expv[63] = 16'h06bf;
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
