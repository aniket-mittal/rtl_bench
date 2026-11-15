// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_141857 dut (
    .clk(clk),
    .rst(in_vec[18:18]),
    .A(in_vec[17:10]),
    .B(in_vec[9:2]),
    .CIN(in_vec[1:1]),
    .SUB(in_vec[0:0]),
    .SUM(out_vec[8:1]),
    .OVF(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h7f9be;
    stim[1] = 19'h71bc1;
    stim[2] = 19'h1cde1;
    stim[3] = 19'h043c8;
    stim[4] = 19'h1dbaa;
    stim[5] = 19'h13cfc;
    stim[6] = 19'h2b44c;
    stim[7] = 19'h35b37;
    stim[8] = 19'h130cb;
    stim[9] = 19'h04b99;
    stim[10] = 19'h37a91;
    stim[11] = 19'h20100;
    stim[12] = 19'h024c1;
    stim[13] = 19'h10536;
    stim[14] = 19'h02b8a;
    stim[15] = 19'h18835;
    stim[16] = 19'h110b8;
    stim[17] = 19'h0ccd0;
    stim[18] = 19'h0dd28;
    stim[19] = 19'h25fb2;
    stim[20] = 19'h0bcdb;
    stim[21] = 19'h0690c;
    stim[22] = 19'h3ea6f;
    stim[23] = 19'h29958;
    stim[24] = 19'h0f3b6;
    stim[25] = 19'h31c82;
    stim[26] = 19'h161bd;
    stim[27] = 19'h20ebf;
    stim[28] = 19'h09ee1;
    stim[29] = 19'h25048;
    stim[30] = 19'h31991;
    stim[31] = 19'h209d9;
    stim[32] = 19'h3a421;
    stim[33] = 19'h0085a;
    stim[34] = 19'h3fc2e;
    stim[35] = 19'h18e5b;
    stim[36] = 19'h29ed5;
    stim[37] = 19'h365aa;
    stim[38] = 19'h26f4c;
    stim[39] = 19'h34a91;
    stim[40] = 19'h030ea;
    stim[41] = 19'h14a49;
    stim[42] = 19'h2b653;
    stim[43] = 19'h069f3;
    stim[44] = 19'h21a1a;
    stim[45] = 19'h2c332;
    stim[46] = 19'h3cd67;
    stim[47] = 19'h35944;
    stim[48] = 19'h085c0;
    stim[49] = 19'h12bb4;
    stim[50] = 19'h3c969;
    stim[51] = 19'h0ea20;
    stim[52] = 19'h0ffc0;
    stim[53] = 19'h31e09;
    stim[54] = 19'h043b6;
    stim[55] = 19'h3250c;
    stim[56] = 19'h1d60f;
    stim[57] = 19'h354b7;
    stim[58] = 19'h2723d;
    stim[59] = 19'h0e5d7;
    stim[60] = 19'h2a6aa;
    stim[61] = 19'h2899a;
    stim[62] = 19'h311a0;
    stim[63] = 19'h18800;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h1f7;
      expv[6] = 9'h005;
      expv[7] = 9'h0c3;
      expv[8] = 9'h11c;
      expv[9] = 9'h180;
      expv[10] = 9'h010;
      expv[11] = 9'h032;
      expv[12] = 9'h059;
      expv[13] = 9'h074;
      expv[14] = 9'h180;
      expv[15] = 9'h1b3;
      expv[16] = 9'h11e;
      expv[17] = 9'h1da;
      expv[18] = 9'h0aa;
      expv[19] = 9'h0e4;
      expv[20] = 9'h0ce;
      expv[21] = 9'h102;
      expv[22] = 9'h109;
      expv[23] = 9'h1f1;
      expv[24] = 9'h0ba;
      expv[25] = 9'h0bc;
      expv[26] = 9'h1f8;
      expv[27] = 9'h055;
      expv[28] = 9'h1d0;
      expv[29] = 9'h1d3;
      expv[30] = 9'h1a7;
      expv[31] = 9'h0df;
      expv[32] = 9'h14c;
      expv[33] = 9'h0c4;
      expv[34] = 9'h018;
      expv[35] = 9'h1c2;
      expv[36] = 9'h032;
      expv[37] = 9'h017;
      expv[38] = 9'h199;
      expv[39] = 9'h1e5;
      expv[40] = 9'h089;
      expv[41] = 9'h0dd;
      expv[42] = 9'h05c;
      expv[43] = 9'h08e;
      expv[44] = 9'h181;
      expv[45] = 9'h030;
      expv[46] = 9'h13b;
      expv[47] = 9'h01b;
      expv[48] = 9'h0fb;
      expv[49] = 9'h132;
      expv[50] = 9'h04f;
      expv[51] = 9'h122;
      expv[52] = 9'h06f;
      expv[53] = 9'h130;
      expv[54] = 9'h184;
      expv[55] = 9'h05f;
      expv[56] = 9'h08a;
      expv[57] = 9'h1fc;
      expv[58] = 9'h019;
      expv[59] = 9'h1e3;
      expv[60] = 9'h14e;
      expv[61] = 9'h01a;
      expv[62] = 9'h187;
      expv[63] = 9'h0a9;
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
