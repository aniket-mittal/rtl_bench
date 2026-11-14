// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04091 dut (
    .out_0r(in_vec[19:19]),
    .inp_0a(in_vec[18:18]),
    .inp_0d(in_vec[17:0]),
    .out_0a(out_vec[17:17]),
    .out_0d(out_vec[16:1]),
    .inp_0r(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'hee0b4;
    stim[1] = 20'h022fa;
    stim[2] = 20'hdb3a2;
    stim[3] = 20'h801d5;
    stim[4] = 20'h00117;
    stim[5] = 20'h3012b;
    stim[6] = 20'h43235;
    stim[7] = 20'h329f9;
    stim[8] = 20'h61c6c;
    stim[9] = 20'hfe0ac;
    stim[10] = 20'h7f5f5;
    stim[11] = 20'hc62f8;
    stim[12] = 20'h21c66;
    stim[13] = 20'h027cb;
    stim[14] = 20'h34518;
    stim[15] = 20'he83b6;
    stim[16] = 20'h8a46d;
    stim[17] = 20'h03e76;
    stim[18] = 20'h8d06b;
    stim[19] = 20'h51306;
    stim[20] = 20'h9d323;
    stim[21] = 20'h2b92c;
    stim[22] = 20'heccd7;
    stim[23] = 20'hf6826;
    stim[24] = 20'h4c247;
    stim[25] = 20'h54309;
    stim[26] = 20'h6ad95;
    stim[27] = 20'heda91;
    stim[28] = 20'h1d302;
    stim[29] = 20'heb8bc;
    stim[30] = 20'h00f21;
    stim[31] = 20'hbe1cd;
    stim[32] = 20'h2c6b1;
    stim[33] = 20'hc2a3e;
    stim[34] = 20'h7b278;
    stim[35] = 20'hd8f65;
    stim[36] = 20'hbea4e;
    stim[37] = 20'h98eac;
    stim[38] = 20'h23506;
    stim[39] = 20'h574de;
    stim[40] = 20'h478e0;
    stim[41] = 20'h31734;
    stim[42] = 20'hcd4a8;
    stim[43] = 20'h3469c;
    stim[44] = 20'h68d5d;
    stim[45] = 20'h4e863;
    stim[46] = 20'h7d74c;
    stim[47] = 20'h135b3;
    stim[48] = 20'hc140f;
    stim[49] = 20'h2d5b9;
    stim[50] = 20'hd1392;
    stim[51] = 20'ha0ae9;
    stim[52] = 20'h4839e;
    stim[53] = 20'h6c87c;
    stim[54] = 20'h0d1a6;
    stim[55] = 20'he2b6b;
    stim[56] = 20'h7a308;
    stim[57] = 20'h91e7c;
    stim[58] = 20'h43ea6;
    stim[59] = 20'heafe9;
    stim[60] = 20'h6064c;
    stim[61] = 20'h20ac2;
    stim[62] = 20'h74874;
    stim[63] = 20'he35fc;
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
      expv[0] = 18'h2e0b5;
      expv[1] = 18'h022fa;
      expv[2] = 18'h3b3a3;
      expv[3] = 18'h001d5;
      expv[4] = 18'h00116;
      expv[5] = 18'h1012a;
      expv[6] = 18'h23234;
      expv[7] = 18'h129f8;
      expv[8] = 18'h21c6c;
      expv[9] = 18'h3e0ad;
      expv[10] = 18'h3f5f4;
      expv[11] = 18'h262f9;
      expv[12] = 18'h01c66;
      expv[13] = 18'h027ca;
      expv[14] = 18'h14518;
      expv[15] = 18'h283b7;
      expv[16] = 18'h0a46d;
      expv[17] = 18'h03e76;
      expv[18] = 18'h0d06b;
      expv[19] = 18'h31306;
      expv[20] = 18'h1d323;
      expv[21] = 18'h0b92c;
      expv[22] = 18'h2ccd7;
      expv[23] = 18'h36827;
      expv[24] = 18'h2c246;
      expv[25] = 18'h34308;
      expv[26] = 18'h2ad94;
      expv[27] = 18'h2da91;
      expv[28] = 18'h1d302;
      expv[29] = 18'h2b8bd;
      expv[30] = 18'h00f20;
      expv[31] = 18'h1e1cd;
      expv[32] = 18'h0c6b0;
      expv[33] = 18'h22a3f;
      expv[34] = 18'h3b278;
      expv[35] = 18'h38f65;
      expv[36] = 18'h1ea4f;
      expv[37] = 18'h18ead;
      expv[38] = 18'h03506;
      expv[39] = 18'h374de;
      expv[40] = 18'h278e0;
      expv[41] = 18'h11734;
      expv[42] = 18'h2d4a9;
      expv[43] = 18'h1469c;
      expv[44] = 18'h28d5c;
      expv[45] = 18'h2e862;
      expv[46] = 18'h3d74c;
      expv[47] = 18'h135b2;
      expv[48] = 18'h2140f;
      expv[49] = 18'h0d5b8;
      expv[50] = 18'h31393;
      expv[51] = 18'h00ae9;
      expv[52] = 18'h2839e;
      expv[53] = 18'h2c87c;
      expv[54] = 18'h0d1a6;
      expv[55] = 18'h22b6b;
      expv[56] = 18'h3a308;
      expv[57] = 18'h11e7d;
      expv[58] = 18'h23ea6;
      expv[59] = 18'h2afe9;
      expv[60] = 18'h2064c;
      expv[61] = 18'h00ac2;
      expv[62] = 18'h34874;
      expv[63] = 18'h235fd;
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
