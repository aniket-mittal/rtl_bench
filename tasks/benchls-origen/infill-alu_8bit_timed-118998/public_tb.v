// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_118998 dut (
    .A(in_vec[18:11]),
    .B(in_vec[10:3]),
    .F(in_vec[2:0]),
    .S(out_vec[9:2]),
    .G(out_vec[1:1]),
    .CarryOut(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h38c87;
    stim[1] = 19'h38477;
    stim[2] = 19'h7c62f;
    stim[3] = 19'h3648c;
    stim[4] = 19'h723f9;
    stim[5] = 19'h6687e;
    stim[6] = 19'h54710;
    stim[7] = 19'h18c6b;
    stim[8] = 19'h13726;
    stim[9] = 19'h26a74;
    stim[10] = 19'h7dd8c;
    stim[11] = 19'h1c2e0;
    stim[12] = 19'h7894e;
    stim[13] = 19'h39852;
    stim[14] = 19'h363c7;
    stim[15] = 19'h1b2d8;
    stim[16] = 19'h2a612;
    stim[17] = 19'h1b630;
    stim[18] = 19'h04b97;
    stim[19] = 19'h077fb;
    stim[20] = 19'h5a78f;
    stim[21] = 19'h0b446;
    stim[22] = 19'h4d0a7;
    stim[23] = 19'h72033;
    stim[24] = 19'h3091b;
    stim[25] = 19'h26307;
    stim[26] = 19'h51fc4;
    stim[27] = 19'h21f2f;
    stim[28] = 19'h652e7;
    stim[29] = 19'h2b4c1;
    stim[30] = 19'h43539;
    stim[31] = 19'h0f1aa;
    stim[32] = 19'h0d042;
    stim[33] = 19'h4e621;
    stim[34] = 19'h01632;
    stim[35] = 19'h1cccf;
    stim[36] = 19'h1e918;
    stim[37] = 19'h61b3f;
    stim[38] = 19'h0cd09;
    stim[39] = 19'h38d2d;
    stim[40] = 19'h3642e;
    stim[41] = 19'h5711e;
    stim[42] = 19'h3c35f;
    stim[43] = 19'h7ac5e;
    stim[44] = 19'h5b192;
    stim[45] = 19'h6adce;
    stim[46] = 19'h31013;
    stim[47] = 19'h45431;
    stim[48] = 19'h3e161;
    stim[49] = 19'h08c6b;
    stim[50] = 19'h71fb9;
    stim[51] = 19'h7838b;
    stim[52] = 19'h6d94b;
    stim[53] = 19'h549aa;
    stim[54] = 19'h6aa6b;
    stim[55] = 19'h3a358;
    stim[56] = 19'h12611;
    stim[57] = 19'h2854a;
    stim[58] = 19'h20d8a;
    stim[59] = 19'h05576;
    stim[60] = 19'h2782c;
    stim[61] = 19'h380bf;
    stim[62] = 19'h3291c;
    stim[63] = 19'h6a7d0;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'hxxx;
      expv[4] = 10'h08a;
      expv[5] = 10'h08a;
      expv[6] = 10'h08a;
      expv[7] = 10'h08a;
      expv[8] = 10'h08a;
      expv[9] = 10'h08a;
      expv[10] = 10'h08a;
      expv[11] = 10'h08a;
      expv[12] = 10'h08a;
      expv[13] = 10'h08a;
      expv[14] = 10'h08a;
      expv[15] = 10'h08a;
      expv[16] = 10'h08a;
      expv[17] = 10'h08a;
      expv[18] = 10'h08a;
      expv[19] = 10'h08a;
      expv[20] = 10'h08a;
      expv[21] = 10'h08a;
      expv[22] = 10'h08a;
      expv[23] = 10'h08a;
      expv[24] = 10'h08a;
      expv[25] = 10'h08a;
      expv[26] = 10'h08a;
      expv[27] = 10'h08a;
      expv[28] = 10'h08a;
      expv[29] = 10'h08a;
      expv[30] = 10'h08a;
      expv[31] = 10'h08a;
      expv[32] = 10'h08a;
      expv[33] = 10'h08a;
      expv[34] = 10'h08a;
      expv[35] = 10'h08a;
      expv[36] = 10'h06a;
      expv[37] = 10'h06a;
      expv[38] = 10'h06a;
      expv[39] = 10'h06a;
      expv[40] = 10'h06a;
      expv[41] = 10'h02a;
      expv[42] = 10'h02a;
      expv[43] = 10'h02a;
      expv[44] = 10'h02a;
      expv[45] = 10'h02a;
      expv[46] = 10'h02a;
      expv[47] = 10'h02a;
      expv[48] = 10'h02a;
      expv[49] = 10'h02a;
      expv[50] = 10'h02a;
      expv[51] = 10'h02a;
      expv[52] = 10'h02a;
      expv[53] = 10'h02a;
      expv[54] = 10'h02a;
      expv[55] = 10'h02a;
      expv[56] = 10'h02a;
      expv[57] = 10'h02a;
      expv[58] = 10'h02a;
      expv[59] = 10'h02a;
      expv[60] = 10'h02a;
      expv[61] = 10'h02a;
      expv[62] = 10'h02a;
      expv[63] = 10'h02a;
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
