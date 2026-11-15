// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 51;
  localparam OW = 54;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_009440 dut (
    .clk(clk),
    .pixel_in(in_vec[50:39]),
    .predic_in(in_vec[38:27]),
    .pixel_in$1(in_vec[26:15]),
    .predic_in$2(in_vec[14:3]),
    .end_in(in_vec[2:2]),
    .rst(in_vec[1:1]),
    .valid_in(in_vec[0:0]),
    .val_out(out_vec[53:41]),
    .val_out$3(out_vec[40:28]),
    .val_out$4(out_vec[27:15]),
    .val_out$5(out_vec[14:2]),
    .valid_out(out_vec[1:1]),
    .end_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 51'h5adfbb4ce59b7;
    stim[1] = 51'h4f220d7327e26;
    stim[2] = 51'h79f2d12625958;
    stim[3] = 51'h1bbe255074d15;
    stim[4] = 51'h6be173fb0b1fd;
    stim[5] = 51'h75093cb1fcab9;
    stim[6] = 51'h39d5b01c76e24;
    stim[7] = 51'h20adc428c8998;
    stim[8] = 51'h51403d5815518;
    stim[9] = 51'h2d97bacafec08;
    stim[10] = 51'h5ff2bbe341841;
    stim[11] = 51'h02c4571e8c2ed;
    stim[12] = 51'h13542d6ae726c;
    stim[13] = 51'h0aebde6cabc24;
    stim[14] = 51'h6fe4a2abf8f35;
    stim[15] = 51'h625bd1f50f3b1;
    stim[16] = 51'h7c65ff32fe59d;
    stim[17] = 51'h5371ee46dff1c;
    stim[18] = 51'h66e15b4d71475;
    stim[19] = 51'h0739c75a23b5d;
    stim[20] = 51'h1f57ba92c2451;
    stim[21] = 51'h7e7c703bbb075;
    stim[22] = 51'h2b1065fa5fec4;
    stim[23] = 51'h53ce0fa025e28;
    stim[24] = 51'h72c0a0b26a924;
    stim[25] = 51'h6533414afecd9;
    stim[26] = 51'h3177b4d3d9748;
    stim[27] = 51'h7c5e7f7337218;
    stim[28] = 51'h6dfd2dd08fd10;
    stim[29] = 51'h048d0fd456e58;
    stim[30] = 51'h153466683278d;
    stim[31] = 51'h074fde7d4efe8;
    stim[32] = 51'h497a87b097640;
    stim[33] = 51'h04a9e10c77ea5;
    stim[34] = 51'h02908c1b91139;
    stim[35] = 51'h799fa41b8ba51;
    stim[36] = 51'h11600e865f28d;
    stim[37] = 51'h7eaaef5d3d615;
    stim[38] = 51'h7ca743d34ffe0;
    stim[39] = 51'h736541057d939;
    stim[40] = 51'h5dee3fb0b33d8;
    stim[41] = 51'h4b51b713bd235;
    stim[42] = 51'h1ada8a3627925;
    stim[43] = 51'h3e0a4f82a4479;
    stim[44] = 51'h6e81c062a2300;
    stim[45] = 51'h550adc8413d10;
    stim[46] = 51'h32c664182b44d;
    stim[47] = 51'h4b7676b302a54;
    stim[48] = 51'h6f21dfef1d318;
    stim[49] = 51'h3986abed81cd4;
    stim[50] = 51'h7b4793ed63f85;
    stim[51] = 51'h7dc882fb5485d;
    stim[52] = 51'h38e11e66c7d1c;
    stim[53] = 51'h1f89bc85c0b1d;
    stim[54] = 51'h1673bf62e1259;
    stim[55] = 51'h33dc7eb9d54e4;
    stim[56] = 51'h03e2b814302f4;
    stim[57] = 51'h7ebf593d83391;
    stim[58] = 51'h4ffb095129690;
    stim[59] = 51'h119581a5b27dc;
    stim[60] = 51'h4d432376ba5fd;
    stim[61] = 51'h2215fae2a158d;
    stim[62] = 51'h7f4ed0bcfd685;
    stim[63] = 51'h6efbaeaad9079;
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
      expv[0] = 54'h00000000000000;
      expv[1] = 54'h00000000000000;
      expv[2] = 54'h00000000000000;
      expv[3] = 54'h00000000000000;
      expv[4] = 54'h2e5a06cb9601af;
      expv[5] = 54'h152a92254a2487;
      expv[6] = 54'h1851ce8613f39e;
      expv[7] = 54'h1851ce8613f39d;
      expv[8] = 54'h1851ce8613f39c;
      expv[9] = 54'h1851ce8613f39c;
      expv[10] = 54'h1851ce8613f39c;
      expv[11] = 54'h0d0e960343257e;
      expv[12] = 54'h2f55b74bd4edcf;
      expv[13] = 54'h2f55b74bd4edcd;
      expv[14] = 54'h2f55b74bd4edcd;
      expv[15] = 54'h096e39925b0e63;
      expv[16] = 54'h095002b25380aa;
      expv[17] = 54'h071d9ac1c6e6af;
      expv[18] = 54'h071d9ac1c6e6ad;
      expv[19] = 54'h144c7205129c7f;
      expv[20] = 54'h3ab23d9eac0f63;
      expv[21] = 54'h28ebdcea3a7736;
      expv[22] = 54'h0dde16937705a3;
      expv[23] = 54'h0dde16937705a1;
      expv[24] = 54'h0dde16937705a0;
      expv[25] = 54'h0dde16937705a1;
      expv[26] = 54'h0c49bc4311ef0e;
      expv[27] = 54'h0c49bc4311ef0c;
      expv[28] = 54'h0c49bc4311ef0c;
      expv[29] = 54'h0c49bc4311ef0c;
      expv[30] = 54'h0c49bc4311ef0c;
      expv[31] = 54'h33b4815ceca053;
      expv[32] = 54'h33b4815ceca050;
      expv[33] = 54'h33b4815ceca050;
      expv[34] = 54'h39a71bae6946e7;
      expv[35] = 54'h3e7414bf9c852a;
      expv[36] = 54'h3fd7c27ff5709a;
      expv[37] = 54'h041f27a10749e7;
      expv[38] = 54'h13ee0e54fb0393;
      expv[39] = 54'h13ee0e54fb0390;
      expv[40] = 54'h07d55881f4d61e;
      expv[41] = 54'h07d55881f4d61c;
      expv[42] = 54'h0bf98312fde0c3;
      expv[43] = 54'h3c8f7a0f235e7f;
      expv[44] = 54'h06457c5190df12;
      expv[45] = 54'h06457c5190df10;
      expv[46] = 54'h06457c5190df10;
      expv[47] = 54'h3321c7ccc7f1ef;
      expv[48] = 54'h3321c7ccc7f1ed;
      expv[49] = 54'h3321c7ccc7f1ec;
      expv[50] = 54'h3321c7ccc7f1ed;
      expv[51] = 54'h00825bc02016ef;
      expv[52] = 54'h1d6865f759997b;
      expv[53] = 54'h1d6865f7599979;
      expv[54] = 54'h00f1f5503bfd53;
      expv[55] = 54'h36a0a11da7a842;
      expv[56] = 54'h36a0a11da7a841;
      expv[57] = 54'h36a0a11da7a841;
      expv[58] = 54'h024a13e09204f6;
      expv[59] = 54'h024a13e09204f4;
      expv[60] = 54'h024a13e09204f5;
      expv[61] = 54'h06c4a181b0a85f;
      expv[62] = 54'h309a9a3c26268b;
      expv[63] = 54'h0491ccf123f33b;
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
