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

  rtlpp_10350 dut (
    .clk(clk),
    .A_mul_src1(in_vec[64:33]),
    .A_mul_src2(in_vec[32:1]),
    .reset_n(in_vec[0:0]),
    .A_mul_cell_result(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 65'h16fb2f5fd76bb04e4;
    stim[1] = 65'h1f068562f626f86ec;
    stim[2] = 65'h182cbc22461618509;
    stim[3] = 65'h0a72bed94aae07fe5;
    stim[4] = 65'h099f47a2f6ccafa7d;
    stim[5] = 65'h0cdbc2200019bb67d;
    stim[6] = 65'h05a0fe6fa7d86a7d7;
    stim[7] = 65'h1ea4325290714940b;
    stim[8] = 65'h19125b6b13451124f;
    stim[9] = 65'h0d0eea7c91576bd37;
    stim[10] = 65'h0ff67d0fac095d0db;
    stim[11] = 65'h1a37f96f0aa89e2fb;
    stim[12] = 65'h095d9dcaa9f56b39d;
    stim[13] = 65'h154c57c040af940b5;
    stim[14] = 65'h1f695a0248076a1bf;
    stim[15] = 65'h0a8dcef6d939b601b;
    stim[16] = 65'h09165871d8399b9bd;
    stim[17] = 65'h09c5e42b901c310c7;
    stim[18] = 65'h0da140e130b9d896b;
    stim[19] = 65'h0c75db17c8cc3753b;
    stim[20] = 65'h1d2c7f4a14a0a07e9;
    stim[21] = 65'h1d540da6c1ec4f56d;
    stim[22] = 65'h06a78cdc9172cfc11;
    stim[23] = 65'h12bcf9061124c3d1f;
    stim[24] = 65'h042b383032af165c5;
    stim[25] = 65'h1c91e81a05be03c73;
    stim[26] = 65'h0baa0de0191b55593;
    stim[27] = 65'h0bce9a8c72bf0110d;
    stim[28] = 65'h18b303d340e820d0d;
    stim[29] = 65'h19eb9060905631be5;
    stim[30] = 65'h1c127e8c7faf3fff9;
    stim[31] = 65'h0b30a5e750be616e7;
    stim[32] = 65'h138a5b40655ba3a49;
    stim[33] = 65'h0fedf79bca749ad8f;
    stim[34] = 65'h08071a01c1b874f2d;
    stim[35] = 65'h1e8e5ac26fb69cbfd;
    stim[36] = 65'h1812de58769f52a93;
    stim[37] = 65'h09991f9d666d47d87;
    stim[38] = 65'h0ecd116d2c6183f2d;
    stim[39] = 65'h0868cabf9c472696b;
    stim[40] = 65'h017175860c616f0b9;
    stim[41] = 65'h10c215006876e27cb;
    stim[42] = 65'h04d491404855cdf79;
    stim[43] = 65'h0e75e5782e04c3a81;
    stim[44] = 65'h1102f7b70135cc515;
    stim[45] = 65'h112df1551b656a059;
    stim[46] = 65'h0c9ae92580f407847;
    stim[47] = 65'h1bff16595ba142229;
    stim[48] = 65'h0374b04af937bc12d;
    stim[49] = 65'h12529123a4bc9b121;
    stim[50] = 65'h133a7e4e6088f2e59;
    stim[51] = 65'h12d49cc924d81baf9;
    stim[52] = 65'h01131fe295a21e02f;
    stim[53] = 65'h1463bb363db261d3b;
    stim[54] = 65'h117e41669265ae2e7;
    stim[55] = 65'h1c203f49beeb76437;
    stim[56] = 65'h194eebda09968337d;
    stim[57] = 65'h185c1b4be1b2733b3;
    stim[58] = 65'h007e5a21b066c58d9;
    stim[59] = 65'h0c3ef3fc80b50bc53;
    stim[60] = 65'h1d94a2490404ed7d5;
    stim[61] = 65'h000be858172e26a0d;
    stim[62] = 65'h06ed9deefeff2f24b;
    stim[63] = 65'h0052c5d10825f929b;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h00000000;
      expv[4] = 32'hed17b148;
      expv[5] = 32'heb7f00f4;
      expv[6] = 32'hd46f0692;
      expv[7] = 32'he2531e00;
      expv[8] = 32'hea3e0abf;
      expv[9] = 32'h7e06a4e4;
      expv[10] = 32'h25c18268;
      expv[11] = 32'h110d830c;
      expv[12] = 32'h6a4b4539;
      expv[13] = 32'hf9325198;
      expv[14] = 32'ha9835566;
      expv[15] = 32'h9d780cb4;
      expv[16] = 32'h4730dfae;
      expv[17] = 32'h3be9343e;
      expv[18] = 32'hab139d24;
      expv[19] = 32'h45f2c694;
      expv[20] = 32'hc579dd5d;
      expv[21] = 32'h2bb4f886;
      expv[22] = 32'h9f398440;
      expv[23] = 32'h42196064;
      expv[24] = 32'h64876f20;
      expv[25] = 32'he5ee72d0;
      expv[26] = 32'hd9c885e2;
      expv[27] = 32'had7dce50;
      expv[28] = 32'haddd2700;
      expv[29] = 32'h17ca43d2;
      expv[30] = 32'hfe57a09c;
      expv[31] = 32'hf99d0dc8;
      expv[32] = 32'h72132e74;
      expv[33] = 32'hefdbb50e;
      expv[34] = 32'h5e58ff6c;
      expv[35] = 32'h77bd6492;
      expv[36] = 32'hb1030a34;
      expv[37] = 32'h436f65da;
      expv[38] = 32'hc656b89b;
      expv[39] = 32'h2a599101;
      expv[40] = 32'h0a236686;
      expv[41] = 32'hda31fb2c;
      expv[42] = 32'h9ee86140;
      expv[43] = 32'h295e83af;
      expv[44] = 32'hb8ac3778;
      expv[45] = 32'hc3bfcd40;
      expv[46] = 32'h736cb530;
      expv[47] = 32'h7a8054e0;
      expv[48] = 32'h3e955104;
      expv[49] = 32'h034d61c8;
      expv[50] = 32'h05067efa;
      expv[51] = 32'hc73d9850;
      expv[52] = 32'h746f80c4;
      expv[53] = 32'h52ac905c;
      expv[54] = 32'h34e1aacc;
      expv[55] = 32'hab362f8d;
      expv[56] = 32'hb4acfc5c;
      expv[57] = 32'h1b3ef01f;
      expv[58] = 32'hecdaae60;
      expv[59] = 32'h931be187;
      expv[60] = 32'h665e6d7c;
      expv[61] = 32'h9d5e5384;
      expv[62] = 32'h4d86cdd0;
      expv[63] = 32'hbb0d5080;
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
