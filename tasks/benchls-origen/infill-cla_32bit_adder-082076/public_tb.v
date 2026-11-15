// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 65;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_082076 dut (
    .a(in_vec[64:33]),
    .b(in_vec[32:1]),
    .c_in(in_vec[0:0]),
    .s(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h0b3c4f4899c3d79e8;
    stim[1] = 65'h160c6b16a90a848e9;
    stim[2] = 65'h15f7d92a27bbc174a;
    stim[3] = 65'h0f3218572a3fdce97;
    stim[4] = 65'h0cca051c53a1b54fb;
    stim[5] = 65'h1020f17ca34a607ba;
    stim[6] = 65'h0ae1f196038e7d7ac;
    stim[7] = 65'h0996160b11f792d09;
    stim[8] = 65'h123a457e911d92cce;
    stim[9] = 65'h008bd0ab8177cf948;
    stim[10] = 65'h0eafce34b6594c9d4;
    stim[11] = 65'h0be2f0ff9f7a456b9;
    stim[12] = 65'h1a56fcfe01127b6b2;
    stim[13] = 65'h1895108efa9d8b15d;
    stim[14] = 65'h0a4e0c41cc1553f03;
    stim[15] = 65'h073a350be1b53e2ca;
    stim[16] = 65'h02c32db2ae09b6bf1;
    stim[17] = 65'h123348035d9dd115c;
    stim[18] = 65'h1d587a5be329c8962;
    stim[19] = 65'h006734e3185a0e8a6;
    stim[20] = 65'h0e489f2862b875be3;
    stim[21] = 65'h1c48000216d4f6abf;
    stim[22] = 65'h161f5e3e118a6bdfd;
    stim[23] = 65'h03b61f5facfc32319;
    stim[24] = 65'h0a6428f25e53ea7be;
    stim[25] = 65'h1913a511e78a72971;
    stim[26] = 65'h0c19aa8c655704023;
    stim[27] = 65'h0db40ed9219367328;
    stim[28] = 65'h1c3c68e9ed05d04d6;
    stim[29] = 65'h14d3efaceab5105e0;
    stim[30] = 65'h05e0ccb4e402f2525;
    stim[31] = 65'h04823913e4855e751;
    stim[32] = 65'h0e2e6601e4430c1bd;
    stim[33] = 65'h12f2d1191b1a9f3bc;
    stim[34] = 65'h09be6000e90ffd4b3;
    stim[35] = 65'h1b93a9296f79b14d9;
    stim[36] = 65'h0a2eb7d621261ccd6;
    stim[37] = 65'h1d0e8b7a6be941509;
    stim[38] = 65'h1f881b0c55ac3ac9c;
    stim[39] = 65'h0fa7b88336efb6ac3;
    stim[40] = 65'h0712862aa26f92fdc;
    stim[41] = 65'h0da001565f8a44044;
    stim[42] = 65'h07ba2ab74b9e33d83;
    stim[43] = 65'h11b0293a1009af625;
    stim[44] = 65'h0336ecf5ade5f44ca;
    stim[45] = 65'h07028bdee652e7b9c;
    stim[46] = 65'h1ce7e5658ebb092c4;
    stim[47] = 65'h1c4ee93eb5ef14e3c;
    stim[48] = 65'h09118514d5c7eb1da;
    stim[49] = 65'h0441c062ec27f5bf7;
    stim[50] = 65'h1eb3974abfc8a4eb1;
    stim[51] = 65'h0557f353b50798d65;
    stim[52] = 65'h042cb8bd4d13d265d;
    stim[53] = 65'h0cef0841c4a2f67c2;
    stim[54] = 65'h04e88a4d98a48c7fd;
    stim[55] = 65'h0e4350b3799350d8f;
    stim[56] = 65'h10e14f9231a5dceec;
    stim[57] = 65'h1d8a25b697099305a;
    stim[58] = 65'h11fcf64a2f30482f6;
    stim[59] = 65'h02cc5ba61a6e2d46c;
    stim[60] = 65'h029668c45fbbe18d4;
    stim[61] = 65'h148574e01c22a281a;
    stim[62] = 65'h14ef0af89904d6063;
    stim[63] = 65'h13bbd46dda290aa80;
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
      expv[0] = 32'h28013738;
      expv[1] = 32'hf8b77d2a;
      expv[2] = 32'hed9cd4f6;
      expv[3] = 32'hcb8faa05;
      expv[4] = 32'h035dd360;
      expv[5] = 32'h9b5a8fc2;
      expv[6] = 32'h73837886;
      expv[7] = 32'hdc6d46dd;
      expv[8] = 32'h1abec25b;
      expv[9] = 32'h101d0200;
      expv[10] = 32'h2848d68f;
      expv[11] = 32'h5ae9b359;
      expv[12] = 32'hdb4bc349;
      expv[13] = 32'h9994dd26;
      expv[14] = 32'hb31b0190;
      expv[15] = 32'h477b99c4;
      expv[16] = 32'h8667238e;
      expv[17] = 32'h7e88c8c8;
      expv[18] = 32'h04121790;
      expv[19] = 32'hc60a1b6b;
      expv[20] = 32'h8808a735;
      expv[21] = 32'h98e7b570;
      expv[22] = 32'h3d4e50ef;
      expv[23] = 32'h85928c8a;
      expv[24] = 32'h45c09b71;
      expv[25] = 32'h04f0bd48;
      expv[26] = 32'h8b857475;
      expv[27] = 32'h7a3bb05d;
      expv[28] = 32'h4a11c9ba;
      expv[29] = 32'hfc480057;
      expv[30] = 32'h4f1df83a;
      expv[31] = 32'h483cbc48;
      expv[32] = 32'h938b90ee;
      expv[33] = 32'h706b82a6;
      expv[34] = 32'h9672ea61;
      expv[35] = 32'h586ad3b8;
      expv[36] = 32'h5aa6a51c;
      expv[37] = 32'h47be6658;
      expv[38] = 32'ha9a2aeb0;
      expv[39] = 32'h34bb797b;
      expv[40] = 32'h4c10c943;
      expv[41] = 32'h69522ad4;
      expv[42] = 32'h9ac2f47c;
      expv[43] = 32'h0dcec4e3;
      expv[44] = 32'h88e70a12;
      expv[45] = 32'h6aab9cc5;
      expv[46] = 32'h5d17748e;
      expv[47] = 32'h91eff113;
      expv[48] = 32'hf6cb8193;
      expv[49] = 32'h834db113;
      expv[50] = 32'hf3e1e1ae;
      expv[51] = 32'hd2fc6150;
      expv[52] = 32'h8a045919;
      expv[53] = 32'h8c8ff5ef;
      expv[54] = 32'hec68b66b;
      expv[55] = 32'h3eb50c63;
      expv[56] = 32'h14396407;
      expv[57] = 32'ha49dc5e1;
      expv[58] = 32'h0969f3cc;
      expv[59] = 32'he9d44766;
      expv[60] = 32'h1292528c;
      expv[61] = 32'h8540bb0d;
      expv[62] = 32'h6f9f07f6;
      expv[63] = 32'h6f26f8ae;
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
