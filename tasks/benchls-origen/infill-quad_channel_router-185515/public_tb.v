// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 72;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_185515 dut (
    .clk(clk),
    .IDL(in_vec[36:36]),
    .data_in0(in_vec[35:28]),
    .data_in1(in_vec[27:20]),
    .data_in2(in_vec[19:12]),
    .data_in3(in_vec[11:4]),
    .valid0(in_vec[3:3]),
    .valid1(in_vec[2:2]),
    .valid2(in_vec[1:1]),
    .valid3(in_vec[0:0]),
    .L1_in0(out_vec[71:64]),
    .L1_in1(out_vec[63:56]),
    .L1_in2(out_vec[55:48]),
    .L1_in3(out_vec[47:40]),
    .L1_valid0(out_vec[39:39]),
    .L1_valid1(out_vec[38:38]),
    .L1_valid2(out_vec[37:37]),
    .L1_valid3(out_vec[36:36]),
    .probador_in0(out_vec[35:28]),
    .probador_in1(out_vec[27:20]),
    .probador_in2(out_vec[19:12]),
    .probador_in3(out_vec[11:4]),
    .probador_valid0(out_vec[3:3]),
    .probador_valid1(out_vec[2:2]),
    .probador_valid2(out_vec[1:1]),
    .probador_valid3(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h074a559d12;
    stim[1] = 37'h12fd51c59b;
    stim[2] = 37'h1e2350902b;
    stim[3] = 37'h14b0c474f7;
    stim[4] = 37'h11aea051d4;
    stim[5] = 37'h1a602f37e6;
    stim[6] = 37'h00a45a6766;
    stim[7] = 37'h1cd33adc39;
    stim[8] = 37'h0dc924d55a;
    stim[9] = 37'h13c549abe8;
    stim[10] = 37'h0b93e3640c;
    stim[11] = 37'h16866ab6c4;
    stim[12] = 37'h072588e799;
    stim[13] = 37'h0dd5f3cda9;
    stim[14] = 37'h1cc02ca92b;
    stim[15] = 37'h0517e81250;
    stim[16] = 37'h1d6e7cdeb4;
    stim[17] = 37'h1d6960af72;
    stim[18] = 37'h083885db74;
    stim[19] = 37'h1a03de0487;
    stim[20] = 37'h0879554cee;
    stim[21] = 37'h0a1e1bd370;
    stim[22] = 37'h0c9e6a4490;
    stim[23] = 37'h02ea99d603;
    stim[24] = 37'h18e1d55cdc;
    stim[25] = 37'h1e2571dfc1;
    stim[26] = 37'h0c882e0c07;
    stim[27] = 37'h1e3b54ec31;
    stim[28] = 37'h10e02d547b;
    stim[29] = 37'h1c8dae22dc;
    stim[30] = 37'h09f7179a44;
    stim[31] = 37'h16fa583169;
    stim[32] = 37'h1da0ff720a;
    stim[33] = 37'h12fd15578c;
    stim[34] = 37'h168e964d3a;
    stim[35] = 37'h18ad485c56;
    stim[36] = 37'h122a843c9f;
    stim[37] = 37'h0df0b09813;
    stim[38] = 37'h0190ec0026;
    stim[39] = 37'h10272098b1;
    stim[40] = 37'h120ba0b1f6;
    stim[41] = 37'h0de2c84c72;
    stim[42] = 37'h0982315570;
    stim[43] = 37'h15b8e956e2;
    stim[44] = 37'h0c4164b711;
    stim[45] = 37'h15c87f4519;
    stim[46] = 37'h15118c97fb;
    stim[47] = 37'h05f2420e2e;
    stim[48] = 37'h02f3418021;
    stim[49] = 37'h11b1f6092a;
    stim[50] = 37'h10eddff876;
    stim[51] = 37'h1427c84961;
    stim[52] = 37'h0326d79f2d;
    stim[53] = 37'h1731fa7c94;
    stim[54] = 37'h16dfd9ff8b;
    stim[55] = 37'h12f5f9c1b8;
    stim[56] = 37'h1e6beac0f2;
    stim[57] = 37'h06c272c435;
    stim[58] = 37'h10b7be5760;
    stim[59] = 37'h11b836b46f;
    stim[60] = 37'h0f4562d7b3;
    stim[61] = 37'h1f968aaff8;
    stim[62] = 37'h1062625583;
    stim[63] = 37'h06275e4ab5;
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
      expv[0] = 72'hxxxxxxxxxxxxxxxxxx;
      expv[1] = 72'h00000000074a559d12;
      expv[2] = 72'h2fd51c59b000000000;
      expv[3] = 72'he2350902b000000000;
      expv[4] = 72'h4b0c474f7000000000;
      expv[5] = 72'h1aea051d4000000000;
      expv[6] = 72'ha602f37e6000000000;
      expv[7] = 72'h0000000000a45a6766;
      expv[8] = 72'hcd33adc39000000000;
      expv[9] = 72'h000000000dc924d55a;
      expv[10] = 72'h3c549abe8000000000;
      expv[11] = 72'h000000000b93e3640c;
      expv[12] = 72'h6866ab6c4000000000;
      expv[13] = 72'h00000000072588e799;
      expv[14] = 72'h000000000dd5f3cda9;
      expv[15] = 72'hcc02ca92b000000000;
      expv[16] = 72'h000000000517e81250;
      expv[17] = 72'hd6e7cdeb4000000000;
      expv[18] = 72'hd6960af72000000000;
      expv[19] = 72'h00000000083885db74;
      expv[20] = 72'ha03de0487000000000;
      expv[21] = 72'h000000000879554cee;
      expv[22] = 72'h000000000a1e1bd370;
      expv[23] = 72'h000000000c9e6a4490;
      expv[24] = 72'h0000000002ea99d603;
      expv[25] = 72'h8e1d55cdc000000000;
      expv[26] = 72'he2571dfc1000000000;
      expv[27] = 72'h000000000c882e0c07;
      expv[28] = 72'he3b54ec31000000000;
      expv[29] = 72'h0e02d547b000000000;
      expv[30] = 72'hc8dae22dc000000000;
      expv[31] = 72'h0000000009f7179a44;
      expv[32] = 72'h6fa583169000000000;
      expv[33] = 72'hda0ff720a000000000;
      expv[34] = 72'h2fd15578c000000000;
      expv[35] = 72'h68e964d3a000000000;
      expv[36] = 72'h8ad485c56000000000;
      expv[37] = 72'h22a843c9f000000000;
      expv[38] = 72'h000000000df0b09813;
      expv[39] = 72'h000000000190ec0026;
      expv[40] = 72'h0272098b1000000000;
      expv[41] = 72'h20ba0b1f6000000000;
      expv[42] = 72'h000000000de2c84c72;
      expv[43] = 72'h000000000982315570;
      expv[44] = 72'h5b8e956e2000000000;
      expv[45] = 72'h000000000c4164b711;
      expv[46] = 72'h5c87f4519000000000;
      expv[47] = 72'h5118c97fb000000000;
      expv[48] = 72'h0000000005f2420e2e;
      expv[49] = 72'h0000000002f3418021;
      expv[50] = 72'h1b1f6092a000000000;
      expv[51] = 72'h0eddff876000000000;
      expv[52] = 72'h427c84961000000000;
      expv[53] = 72'h000000000326d79f2d;
      expv[54] = 72'h731fa7c94000000000;
      expv[55] = 72'h6dfd9ff8b000000000;
      expv[56] = 72'h2f5f9c1b8000000000;
      expv[57] = 72'he6beac0f2000000000;
      expv[58] = 72'h0000000006c272c435;
      expv[59] = 72'h0b7be5760000000000;
      expv[60] = 72'h1b836b46f000000000;
      expv[61] = 72'h000000000f4562d7b3;
      expv[62] = 72'hf968aaff8000000000;
      expv[63] = 72'h062625583000000000;
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
