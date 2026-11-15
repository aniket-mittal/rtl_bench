// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_011911 dut (
    .clk_2f_c(clk),
    .reset(in_vec[33:33]),
    .valid_in(in_vec[32:32]),
    .Data_in(in_vec[31:0]),
    .valid_0_c(out_vec[65:65]),
    .lane_0_c(out_vec[64:33]),
    .valid_1_c(out_vec[32:32]),
    .lane_1_c(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h38000d2a8;
    stim[1] = 34'h32f1959bf;
    stim[2] = 34'h1852dda9a;
    stim[3] = 34'h0d58b9083;
    stim[4] = 34'h02182f05a;
    stim[5] = 34'h1c99e69b9;
    stim[6] = 34'h19994ceb1;
    stim[7] = 34'h122fcf88e;
    stim[8] = 34'h0c183b2dc;
    stim[9] = 34'h1bcc156c3;
    stim[10] = 34'h13fb220ad;
    stim[11] = 34'h06a7323da;
    stim[12] = 34'h172b46879;
    stim[13] = 34'h0df1a64d3;
    stim[14] = 34'h1ac15a1ea;
    stim[15] = 34'h160bd2e44;
    stim[16] = 34'h1334397b8;
    stim[17] = 34'h0c3bd2ead;
    stim[18] = 34'h0682d1c0e;
    stim[19] = 34'h1a8e88c2d;
    stim[20] = 34'h16561d237;
    stim[21] = 34'h0f0b0b94d;
    stim[22] = 34'h16c8795c4;
    stim[23] = 34'h13a1fcd7a;
    stim[24] = 34'h0a19c2011;
    stim[25] = 34'h0d66323db;
    stim[26] = 34'h0868e8985;
    stim[27] = 34'h1372c9228;
    stim[28] = 34'h0550f5b35;
    stim[29] = 34'h0492960ae;
    stim[30] = 34'h19a5c6d6b;
    stim[31] = 34'h02d680a44;
    stim[32] = 34'h189233667;
    stim[33] = 34'h038d7bffc;
    stim[34] = 34'h166360a24;
    stim[35] = 34'h0a91ac0c8;
    stim[36] = 34'h12fcc1720;
    stim[37] = 34'h0ff817b01;
    stim[38] = 34'h1ecc6235b;
    stim[39] = 34'h15e830a78;
    stim[40] = 34'h1d378bec4;
    stim[41] = 34'h148f7812e;
    stim[42] = 34'h120b9184d;
    stim[43] = 34'h01da41c1f;
    stim[44] = 34'h0d1959705;
    stim[45] = 34'h17944dad6;
    stim[46] = 34'h196e28eeb;
    stim[47] = 34'h071f93b55;
    stim[48] = 34'h119a94a86;
    stim[49] = 34'h0ac52c118;
    stim[50] = 34'h0ce17860e;
    stim[51] = 34'h0d3bbe0c4;
    stim[52] = 34'h086903b54;
    stim[53] = 34'h01d51d8a1;
    stim[54] = 34'h0e61032c5;
    stim[55] = 34'h11ffdf69e;
    stim[56] = 34'h154e205a4;
    stim[57] = 34'h13988c9a6;
    stim[58] = 34'h1c04fb29e;
    stim[59] = 34'h10185bd2b;
    stim[60] = 34'h0059cbe6f;
    stim[61] = 34'h16243af6d;
    stim[62] = 34'h1dae71240;
    stim[63] = 34'h10892f637;
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
      expv[0] = 66'h00000000000000000;
      expv[1] = 66'h30001a55000000000;
      expv[2] = 66'h00000000000000000;
      expv[3] = 66'h30a5bb53400000000;
      expv[4] = 66'h00000000000000000;
      expv[5] = 66'h00000000000000000;
      expv[6] = 66'h000000001c99e69b9;
      expv[7] = 66'h333299d63c99e69b9;
      expv[8] = 66'h333299d6322fcf88e;
      expv[9] = 66'h00000000122fcf88e;
      expv[10] = 66'h37982ad8722fcf88e;
      expv[11] = 66'h37982ad873fb220ad;
      expv[12] = 66'h0000000013fb220ad;
      expv[13] = 66'h2e568d0f33fb220ad;
      expv[14] = 66'h0000000013fb220ad;
      expv[15] = 66'h000000001ac15a1ea;
      expv[16] = 66'h2c17a5c89ac15a1ea;
      expv[17] = 66'h2c17a5c89334397b8;
      expv[18] = 66'h000000001334397b8;
      expv[19] = 66'h00000000000000000;
      expv[20] = 66'h351d1185a00000000;
      expv[21] = 66'h351d1185b6561d237;
      expv[22] = 66'h0000000016561d237;
      expv[23] = 66'h2d90f2b896561d237;
      expv[24] = 66'h2d90f2b893a1fcd7a;
      expv[25] = 66'h0000000013a1fcd7a;
      expv[26] = 66'h00000000000000000;
      expv[27] = 66'h00000000000000000;
      expv[28] = 66'h26e59245000000000;
      expv[29] = 66'h00000000000000000;
      expv[30] = 66'h00000000000000000;
      expv[31] = 66'h0000000019a5c6d6b;
      expv[32] = 66'h00000000000000000;
      expv[33] = 66'h312466cce00000000;
      expv[34] = 66'h00000000000000000;
      expv[35] = 66'h00000000166360a24;
      expv[36] = 66'h00000000000000000;
      expv[37] = 66'h25f982e4000000000;
      expv[38] = 66'h00000000000000000;
      expv[39] = 66'h000000001ecc6235b;
      expv[40] = 66'h2bd0614f1ecc6235b;
      expv[41] = 66'h2bd0614f1d378bec4;
      expv[42] = 66'h291ef025dd378bec4;
      expv[43] = 66'h291ef025d20b9184d;
      expv[44] = 66'h00000000120b9184d;
      expv[45] = 66'h00000000000000000;
      expv[46] = 66'h2f289b5ac00000000;
      expv[47] = 66'h2f289b5ad96e28eeb;
      expv[48] = 66'h00000000196e28eeb;
      expv[49] = 66'h23352950d96e28eeb;
      expv[50] = 66'h00000000196e28eeb;
      expv[51] = 66'h00000000000000000;
      expv[52] = 66'h00000000000000000;
      expv[53] = 66'h00000000000000000;
      expv[54] = 66'h00000000000000000;
      expv[55] = 66'h00000000000000000;
      expv[56] = 66'h0000000011ffdf69e;
      expv[57] = 66'h2a9c40b491ffdf69e;
      expv[58] = 66'h2a9c40b493988c9a6;
      expv[59] = 66'h3809f653d3988c9a6;
      expv[60] = 66'h3809f653d0185bd2b;
      expv[61] = 66'h0000000010185bd2b;
      expv[62] = 66'h2c4875edb0185bd2b;
      expv[63] = 66'h2c4875edbdae71240;
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
