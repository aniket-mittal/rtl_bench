// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 50;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_175267 dut (
    .mclk_i(clk),
    .sernum_i(in_vec[49:34]),
    .count_i(in_vec[33:2]),
    .write_strobe_i(in_vec[1:1]),
    .fifo_full_i(in_vec[0:0]),
    .fifo_in_o(out_vec[9:2]),
    .fifo_write_strobe_o(out_vec[1:1]),
    .busy_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 50'h20f245b796bde;
    stim[1] = 50'h27064e6af7137;
    stim[2] = 50'h2269b99de53b1;
    stim[3] = 50'h28268c4816b8b;
    stim[4] = 50'h0e318f070d138;
    stim[5] = 50'h026a06a6e5baa;
    stim[6] = 50'h3b4d00839db3d;
    stim[7] = 50'h0894ac4c971f3;
    stim[8] = 50'h2b180cec685a1;
    stim[9] = 50'h3161ba9ee7edd;
    stim[10] = 50'h041c2268c73a6;
    stim[11] = 50'h2ee6d49668943;
    stim[12] = 50'h2585502fc1985;
    stim[13] = 50'h32f0cb07195e4;
    stim[14] = 50'h05558c1ed9dd0;
    stim[15] = 50'h0afa7657bad88;
    stim[16] = 50'h3279c641be4ff;
    stim[17] = 50'h3ad41ee73cec9;
    stim[18] = 50'h2f75a5227df92;
    stim[19] = 50'h06ca5c657c578;
    stim[20] = 50'h3767e771b63a2;
    stim[21] = 50'h1681e268aa718;
    stim[22] = 50'h20a0b2f1c10a7;
    stim[23] = 50'h2829496fb106b;
    stim[24] = 50'h06ac38e2c94ea;
    stim[25] = 50'h24f4131c7049b;
    stim[26] = 50'h269f3cfc83a14;
    stim[27] = 50'h3c25ce72cebed;
    stim[28] = 50'h3dce97368bf19;
    stim[29] = 50'h0fcba89c5da65;
    stim[30] = 50'h27a81e859e429;
    stim[31] = 50'h08a7d4699c536;
    stim[32] = 50'h324ac48de06f6;
    stim[33] = 50'h122ee9707d873;
    stim[34] = 50'h1bdf8b8dbb0b6;
    stim[35] = 50'h0524ee23e99be;
    stim[36] = 50'h0121b37e65f3d;
    stim[37] = 50'h133f0557f67e9;
    stim[38] = 50'h1d2e4830aa894;
    stim[39] = 50'h16b52cac56bea;
    stim[40] = 50'h0d7e13d17658a;
    stim[41] = 50'h3509b2db0d566;
    stim[42] = 50'h078661c3a663f;
    stim[43] = 50'h33ea7d158c401;
    stim[44] = 50'h2b89d707e21d4;
    stim[45] = 50'h0bef230c37706;
    stim[46] = 50'h2c1ea4e66fad1;
    stim[47] = 50'h28c30313450bd;
    stim[48] = 50'h34d7b5b5d4e64;
    stim[49] = 50'h1137591a35f9a;
    stim[50] = 50'h16f5e5d266b91;
    stim[51] = 50'h0e01745e8094e;
    stim[52] = 50'h229c893958e2b;
    stim[53] = 50'h01768db7cf131;
    stim[54] = 50'h0d1092c3c53e3;
    stim[55] = 50'h3e43a0e4e64d0;
    stim[56] = 50'h24d0bd55fafae;
    stim[57] = 50'h048db189ecfc0;
    stim[58] = 50'h2db3a4d17651c;
    stim[59] = 50'h224d6b3726a17;
    stim[60] = 50'h24230b227539f;
    stim[61] = 50'h053a761457a53;
    stim[62] = 50'h3cec244473a96;
    stim[63] = 50'h082e3b7a1b8b1;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'hxxx;
      expv[4] = 10'hxxx;
      expv[5] = 10'hxxx;
      expv[6] = 10'h3ff;
      expv[7] = 10'h3ff;
      expv[8] = 10'h3ff;
      expv[9] = 10'h3ff;
      expv[10] = 10'h3ff;
      expv[11] = 10'h3ff;
      expv[12] = 10'h3ff;
      expv[13] = 10'h3ff;
      expv[14] = 10'h3fd;
      expv[15] = 10'h0e3;
      expv[16] = 10'h0e3;
      expv[17] = 10'h0e3;
      expv[18] = 10'h0e3;
      expv[19] = 10'h0e3;
      expv[20] = 10'h0e3;
      expv[21] = 10'h0e3;
      expv[22] = 10'h0e3;
      expv[23] = 10'h0e1;
      expv[24] = 10'h31b;
      expv[25] = 10'h31b;
      expv[26] = 10'h31b;
      expv[27] = 10'h31b;
      expv[28] = 10'h31b;
      expv[29] = 10'h31b;
      expv[30] = 10'h31b;
      expv[31] = 10'h31b;
      expv[32] = 10'h319;
      expv[33] = 10'h0c7;
      expv[34] = 10'h0c7;
      expv[35] = 10'h0c7;
      expv[36] = 10'h0c7;
      expv[37] = 10'h0c7;
      expv[38] = 10'h0c7;
      expv[39] = 10'h0c7;
      expv[40] = 10'h0c7;
      expv[41] = 10'h0c5;
      expv[42] = 10'h083;
      expv[43] = 10'h083;
      expv[44] = 10'h083;
      expv[45] = 10'h083;
      expv[46] = 10'h083;
      expv[47] = 10'h083;
      expv[48] = 10'h083;
      expv[49] = 10'h083;
      expv[50] = 10'h081;
      expv[51] = 10'h16b;
      expv[52] = 10'h16b;
      expv[53] = 10'h16b;
      expv[54] = 10'h16b;
      expv[55] = 10'h16b;
      expv[56] = 10'h16b;
      expv[57] = 10'h16b;
      expv[58] = 10'h16b;
      expv[59] = 10'h169;
      expv[60] = 10'h38b;
      expv[61] = 10'h38b;
      expv[62] = 10'h38b;
      expv[63] = 10'h38b;
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
