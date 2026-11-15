// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_03468 dut (
    .clock(clk),
    .resetn(in_vec[40:40]),
    .mantissa(in_vec[39:13]),
    .exponent(in_vec[12:4]),
    .sign(in_vec[3:3]),
    .valid_in(in_vec[2:2]),
    .stall_in(in_vec[1:1]),
    .enable(in_vec[0:0]),
    .result(out_vec[33:2]),
    .valid_out(out_vec[1:1]),
    .stall_out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h06b0d61e829;
    stim[1] = 41'h0b2f48c8dce;
    stim[2] = 41'h1745160a773;
    stim[3] = 41'h1c6bcc95b0f;
    stim[4] = 41'h1672e89a969;
    stim[5] = 41'h152e92fb797;
    stim[6] = 41'h064c987576d;
    stim[7] = 41'h183f0c1ad9c;
    stim[8] = 41'h1c78535e5e4;
    stim[9] = 41'h1663c9c3975;
    stim[10] = 41'h1a3f27cf588;
    stim[11] = 41'h14fe3feafac;
    stim[12] = 41'h136748d19bb;
    stim[13] = 41'h16bb790472f;
    stim[14] = 41'h1c8a26da182;
    stim[15] = 41'h16b8704b6e2;
    stim[16] = 41'h1fe0054c4ec;
    stim[17] = 41'h1d2a3d4b749;
    stim[18] = 41'h1e143dfbc18;
    stim[19] = 41'h147f3ee6969;
    stim[20] = 41'h1418880cfbc;
    stim[21] = 41'h14040f9f8bf;
    stim[22] = 41'h10f906c3912;
    stim[23] = 41'h17228e2b5ce;
    stim[24] = 41'h153aee1136c;
    stim[25] = 41'h1514cd05f69;
    stim[26] = 41'h1c904302a0b;
    stim[27] = 41'h125bb3847ea;
    stim[28] = 41'h1edbe534f1a;
    stim[29] = 41'h140a19684bf;
    stim[30] = 41'h0657767dbe6;
    stim[31] = 41'h1c808a37706;
    stim[32] = 41'h15370f0f0ef;
    stim[33] = 41'h1df67737f0f;
    stim[34] = 41'h13d9ec58f1e;
    stim[35] = 41'h11ec7fe8314;
    stim[36] = 41'h19390f5b55b;
    stim[37] = 41'h1d151cc7025;
    stim[38] = 41'h1fa4c316df5;
    stim[39] = 41'h148a9518818;
    stim[40] = 41'h1bd72f845fa;
    stim[41] = 41'h15327fae0f9;
    stim[42] = 41'h135439ece21;
    stim[43] = 41'h13aeccc210e;
    stim[44] = 41'h1d91b5efce0;
    stim[45] = 41'h17d56100dff;
    stim[46] = 41'h1eb9e15fe74;
    stim[47] = 41'h14079684254;
    stim[48] = 41'h15614272427;
    stim[49] = 41'h1f74d3d8c0b;
    stim[50] = 41'h1c74c95ec22;
    stim[51] = 41'h172a1ce4f19;
    stim[52] = 41'h14c3d5eb367;
    stim[53] = 41'h14b2c4f8818;
    stim[54] = 41'h13e14bfab94;
    stim[55] = 41'h13f8b8df703;
    stim[56] = 41'h1688f3af6c5;
    stim[57] = 41'h11fb8cacbb1;
    stim[58] = 41'h118a2bc9d24;
    stim[59] = 41'h179e85f635b;
    stim[60] = 41'h149a9893839;
    stim[61] = 41'h12aed833c8b;
    stim[62] = 41'h1799ec20a94;
    stim[63] = 41'h14a98afc688;
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
      expv[0] = 34'h305ac3584;
      expv[1] = 34'h3b8cbd233;
      expv[2] = 34'h0efd14581;
      expv[3] = 34'h3611af327;
      expv[4] = 34'h32d9cba24;
      expv[5] = 34'h0f34ba4bf;
      expv[6] = 34'h2ed93261e;
      expv[7] = 34'h3b20fc306;
      expv[8] = 34'h0bd1e14d6;
      expv[9] = 34'h12f98f272;
      expv[10] = 34'h2b08fc9f0;
      expv[11] = 34'h3f53f8ffa;
      expv[12] = 34'h336d9d235;
      expv[13] = 34'h2e5aede43;
      expv[14] = 34'h0312289b5;
      expv[15] = 34'h0ddae1c11;
      expv[16] = 34'h29df80152;
      expv[17] = 34'h2e94a8f50;
      expv[18] = 34'h383850f7c;
      expv[19] = 34'h32d1fcfb8;
      expv[20] = 34'h3f7062202;
      expv[21] = 34'h3170103e7;
      expv[22] = 34'h1223e41b1;
      expv[23] = 34'h2b9c8a38b;
      expv[24] = 34'h26d4ebb86;
      expv[25] = 34'h3ed453340;
      expv[26] = 34'h3412410c1;
      expv[27] = 34'h2fc96ece1;
      expv[28] = 34'h3e3b6f94d;
      expv[29] = 34'h29702865b;
      expv[30] = 34'h17d95dd9f;
      expv[31] = 34'h0e120228f;
      expv[32] = 34'h21d4dc3c3;
      expv[33] = 34'h3e17d9dcf;
      expv[34] = 34'h3e2f67b17;
      expv[35] = 34'h0627b1ffa;
      expv[36] = 34'h2aa4e43d5;
      expv[37] = 34'h005454732;
      expv[38] = 34'h1bfe930c6;
      expv[39] = 34'h30322a544;
      expv[40] = 34'h2bef5cbe1;
      expv[41] = 34'h21f4c9fe8;
      expv[42] = 34'h1c4d50e78;
      expv[43] = 34'h220ebb333;
      expv[44] = 34'h19d646d78;
      expv[45] = 34'h3bff55843;
      expv[46] = 34'h1cfae7856;
      expv[47] = 34'h04b01e5a2;
      expv[48] = 34'h08558509f;
      expv[49] = 34'h381dd34f5;
      expv[50] = 34'h1851d3255;
      expv[51] = 34'h3e3ca8738;
      expv[52] = 34'h06d30f57b;
      expv[53] = 34'h3032cb13c;
      expv[54] = 34'h172f852fe;
      expv[55] = 34'h0e0fe2e35;
      expv[56] = 34'h0d9a23cea;
      expv[57] = 34'h1767ee328;
      expv[58] = 34'h1a4628af2;
      expv[59] = 34'h26be7a17d;
      expv[60] = 34'h30726a624;
      expv[61] = 34'h390abb60d;
      expv[62] = 34'h153e67b0a;
      expv[63] = 34'h2d12a62bc;
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
