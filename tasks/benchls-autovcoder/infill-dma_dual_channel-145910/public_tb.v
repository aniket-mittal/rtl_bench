// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 53;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_145910 dut (
    .clk(clk),
    .reset(in_vec[52:52]),
    .start_ch0(in_vec[51:51]),
    .stop_ch0(in_vec[50:50]),
    .src_addr_ch0(in_vec[49:42]),
    .dest_addr_ch0(in_vec[41:34]),
    .data_in_ch0(in_vec[33:26]),
    .start_ch1(in_vec[25:25]),
    .stop_ch1(in_vec[24:24]),
    .src_addr_ch1(in_vec[23:16]),
    .dest_addr_ch1(in_vec[15:8]),
    .data_in_ch1(in_vec[7:0]),
    .data_out_ch0(out_vec[17:10]),
    .busy_ch0(out_vec[9:9]),
    .data_out_ch1(out_vec[8:1]),
    .busy_ch1(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 53'h1fd28a67bc6121;
    stim[1] = 53'h1433d4034a04e4;
    stim[2] = 53'h0bdc95571c9e07;
    stim[3] = 53'h0b8a47d737d027;
    stim[4] = 53'h06055716783d43;
    stim[5] = 53'h05412225802d2d;
    stim[6] = 53'h087b4d0c7bfb96;
    stim[7] = 53'h093aa55de7b492;
    stim[8] = 53'h06abc661001065;
    stim[9] = 53'h0c09bfbd0f7bdf;
    stim[10] = 53'h0de7a650ed128e;
    stim[11] = 53'h0f0e10ff7409a9;
    stim[12] = 53'h0e11c2190d4058;
    stim[13] = 53'h092b943cf71ace;
    stim[14] = 53'h0c6ccc1952976d;
    stim[15] = 53'h05d590e2525a33;
    stim[16] = 53'h04d2106b7d6c46;
    stim[17] = 53'h00a64c22c60156;
    stim[18] = 53'h0a817848a728df;
    stim[19] = 53'h051e1c7cc2a6ff;
    stim[20] = 53'h0b8d0e58b2197e;
    stim[21] = 53'h071ab7bbbce759;
    stim[22] = 53'h04ef547b840653;
    stim[23] = 53'h06172387430109;
    stim[24] = 53'h0e5fdda76f928a;
    stim[25] = 53'h0a68bab386bf00;
    stim[26] = 53'h087a0a267aa0dc;
    stim[27] = 53'h0a0a792b95bf0c;
    stim[28] = 53'h02385605ba9c1b;
    stim[29] = 53'h1d8da43936eba0;
    stim[30] = 53'h0d383bd49e041e;
    stim[31] = 53'h006c730f7394ea;
    stim[32] = 53'h00e31bb9921dc0;
    stim[33] = 53'h0b66e6de67bcde;
    stim[34] = 53'h0a0c8aac8758f5;
    stim[35] = 53'h0afcf0843272ad;
    stim[36] = 53'h0d9aebfd7419e5;
    stim[37] = 53'h049aa2a9758f65;
    stim[38] = 53'h050a3f23c54e35;
    stim[39] = 53'h03cdf5d2679c82;
    stim[40] = 53'h0966fc3fed5a8b;
    stim[41] = 53'h02f170429d99d2;
    stim[42] = 53'h05b95f91b1e25e;
    stim[43] = 53'h003dd3f3d4a4cd;
    stim[44] = 53'h0bcfb43dc6b913;
    stim[45] = 53'h01925bbc35c1d0;
    stim[46] = 53'h006ea8eb9c6d43;
    stim[47] = 53'h0dc7866ccbfe97;
    stim[48] = 53'h0d234072200a67;
    stim[49] = 53'h0a8919323df940;
    stim[50] = 53'h00c44987174bfd;
    stim[51] = 53'h090570d074778d;
    stim[52] = 53'h0addab7f1fb93a;
    stim[53] = 53'h00feb671b93fe6;
    stim[54] = 53'h04f6281c8bf8e7;
    stim[55] = 53'h0fb8d0bebcf6d2;
    stim[56] = 53'h0b63fadd84fb17;
    stim[57] = 53'h05e529d88304b1;
    stim[58] = 53'h00608c162c4333;
    stim[59] = 53'h0a36a3b2ef4181;
    stim[60] = 53'h09313274a40ddd;
    stim[61] = 53'h0ca5246b6a2e20;
    stim[62] = 53'h026b38c7f9e8fb;
    stim[63] = 53'h055e0dc42d1a18;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h1560e;
      expv[4] = 18'h1564e;
      expv[5] = 18'h15487;
      expv[6] = 18'h15486;
      expv[7] = 18'h10e86;
      expv[8] = 18'h10e86;
      expv[9] = 18'h10c86;
      expv[10] = 18'h3bc86;
      expv[11] = 18'h25086;
      expv[12] = 18'h0fd52;
      expv[13] = 18'h21952;
      expv[14] = 18'h03f52;
      expv[15] = 18'h03d52;
      expv[16] = 18'h03c67;
      expv[17] = 18'h03c66;
      expv[18] = 18'h03cad;
      expv[19] = 18'h04aad;
      expv[20] = 18'h048ad;
      expv[21] = 18'h25aad;
      expv[22] = 18'h258ac;
      expv[23] = 18'h258a6;
      expv[24] = 18'h25812;
      expv[25] = 18'h1a514;
      expv[26] = 18'h2b200;
      expv[27] = 18'h2b3b9;
      expv[28] = 18'h2b3b8;
      expv[29] = 18'h00000;
      expv[30] = 18'h00000;
      expv[31] = 18'h3d400;
      expv[32] = 18'h3d5d4;
      expv[33] = 18'h3d5d4;
      expv[34] = 18'h2dfbd;
      expv[35] = 18'h2dfbd;
      expv[36] = 18'h2dfbd;
      expv[37] = 18'h2ddbc;
      expv[38] = 18'h2ddbc;
      expv[39] = 18'h2dc6a;
      expv[40] = 18'h2dd05;
      expv[41] = 18'h03f04;
      expv[42] = 18'h03fa5;
      expv[43] = 18'h03da4;
      expv[44] = 18'h03d9a;
      expv[45] = 18'h03f9a;
      expv[46] = 18'h03f9a;
      expv[47] = 18'h03e86;
      expv[48] = 18'h03c86;
      expv[49] = 18'h070cf;
      expv[50] = 18'h132cf;
      expv[51] = 18'h132ce;
      expv[52] = 18'h132ce;
      expv[53] = 18'h13274;
      expv[54] = 18'h13274;
      expv[55] = 18'h13074;
      expv[56] = 18'h0bda5;
      expv[57] = 18'h2dfa4;
      expv[58] = 18'h2dda4;
      expv[59] = 18'h2dc67;
      expv[60] = 18'h3b267;
      expv[61] = 18'h3b267;
      expv[62] = 18'h3b066;
      expv[63] = 18'h3b1f6;
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
