// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 49;
  localparam OW = 52;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_09781 dut (
    .clk(clk),
    .rstn(in_vec[48:48]),
    .tic_divide(in_vec[47:24]),
    .accum_divide(in_vec[23:0]),
    .pre_tic_enable(out_vec[51:51]),
    .tic_enable(out_vec[50:50]),
    .accum_enable(out_vec[49:49]),
    .accum_sample_enable(out_vec[48:48]),
    .tic_count(out_vec[47:24]),
    .accum_count(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 49'h0b69a05305e1d;
    stim[1] = 49'h0641df3d0654d;
    stim[2] = 49'h11192c0b434cd;
    stim[3] = 49'h0fcc53915372e;
    stim[4] = 49'h189e8b2014e35;
    stim[5] = 49'h1c9b566171129;
    stim[6] = 49'h17be0368055c7;
    stim[7] = 49'h181abc7ffebb8;
    stim[8] = 49'h1a3d5d0ba4f55;
    stim[9] = 49'h18b477b024dd8;
    stim[10] = 49'h1422d1b2ddc7a;
    stim[11] = 49'h1274cbd752b42;
    stim[12] = 49'h11187656ec390;
    stim[13] = 49'h1ca861fba228f;
    stim[14] = 49'h104ebeaed4bbc;
    stim[15] = 49'h16fa738bae058;
    stim[16] = 49'h12b55ca8041f8;
    stim[17] = 49'h1eb1a8fc0e720;
    stim[18] = 49'h1fd8e98fea0b9;
    stim[19] = 49'h1489be2b20a56;
    stim[20] = 49'h1187dbffe5adf;
    stim[21] = 49'h1769bccf0a407;
    stim[22] = 49'h10c09f97adc1c;
    stim[23] = 49'h1de6c8f369b56;
    stim[24] = 49'h1f968c5392f39;
    stim[25] = 49'h1c8545f1c33c7;
    stim[26] = 49'h1149ae756c012;
    stim[27] = 49'h1837f10abad53;
    stim[28] = 49'h17f072cdbb1db;
    stim[29] = 49'h10a6f163440fb;
    stim[30] = 49'h19e8aebfc1ab2;
    stim[31] = 49'h18bc2aeb91a66;
    stim[32] = 49'h134b00cb3dcc9;
    stim[33] = 49'h0e3563ab0f547;
    stim[34] = 49'h1189f60ee42e4;
    stim[35] = 49'h17295aafb2fe6;
    stim[36] = 49'h13292fc7b9e6c;
    stim[37] = 49'h141dd6d54b0b3;
    stim[38] = 49'h1505d3b4e3294;
    stim[39] = 49'h1e502eb27b34e;
    stim[40] = 49'h1b67b64f03ef8;
    stim[41] = 49'h1e853c47c7b7b;
    stim[42] = 49'h158631d76f663;
    stim[43] = 49'h10ab4651a2be7;
    stim[44] = 49'h1848948b84df8;
    stim[45] = 49'h1e92672d85618;
    stim[46] = 49'h19dbccb2c0f3d;
    stim[47] = 49'h1e440099f3811;
    stim[48] = 49'h1606037a835f4;
    stim[49] = 49'h182897276b04d;
    stim[50] = 49'h1fe8382007373;
    stim[51] = 49'h1fbf57982307a;
    stim[52] = 49'h1dfe24e5f6703;
    stim[53] = 49'h1a7a5fa6dc4d7;
    stim[54] = 49'h194e2f50e2a99;
    stim[55] = 49'h1f6e8f94c7c48;
    stim[56] = 49'h168f91d07aaa8;
    stim[57] = 49'h152b00161798f;
    stim[58] = 49'h1ab0079bd4a1b;
    stim[59] = 49'h14a6971aa576d;
    stim[60] = 49'h112b300278307;
    stim[61] = 49'h1a4c4e3cd0d40;
    stim[62] = 49'h1d09a327c3888;
    stim[63] = 49'h111fd5608c862;
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
      expv[0] = 52'ha000000000000;
      expv[1] = 52'ha000000000000;
      expv[2] = 52'ha000000000000;
      expv[3] = 52'ha000000000000;
      expv[4] = 52'ha000000000000;
      expv[5] = 52'h589e8b2014e35;
      expv[6] = 52'h089e8b1014e34;
      expv[7] = 52'h089e8b0014e33;
      expv[8] = 52'h089e8af014e32;
      expv[9] = 52'h089e8ae014e31;
      expv[10] = 52'h189e8ad014e30;
      expv[11] = 52'h089e8ac014e2f;
      expv[12] = 52'h089e8ab014e2e;
      expv[13] = 52'h089e8aa014e2d;
      expv[14] = 52'h089e8a9014e2c;
      expv[15] = 52'h189e8a8014e2b;
      expv[16] = 52'h089e8a7014e2a;
      expv[17] = 52'h089e8a6014e29;
      expv[18] = 52'h089e8a5014e28;
      expv[19] = 52'h089e8a4014e27;
      expv[20] = 52'h189e8a3014e26;
      expv[21] = 52'h089e8a2014e25;
      expv[22] = 52'h089e8a1014e24;
      expv[23] = 52'h089e8a0014e23;
      expv[24] = 52'h089e89f014e22;
      expv[25] = 52'h189e89e014e21;
      expv[26] = 52'h089e89d014e20;
      expv[27] = 52'h089e89c014e1f;
      expv[28] = 52'h089e89b014e1e;
      expv[29] = 52'h089e89a014e1d;
      expv[30] = 52'h189e899014e1c;
      expv[31] = 52'h089e898014e1b;
      expv[32] = 52'h089e897014e1a;
      expv[33] = 52'ha000000000000;
      expv[34] = 52'ha000000000000;
      expv[35] = 52'h5189f60ee42e4;
      expv[36] = 52'h0189f5fee42e3;
      expv[37] = 52'h0189f5eee42e2;
      expv[38] = 52'h0189f5dee42e1;
      expv[39] = 52'h0189f5cee42e0;
      expv[40] = 52'h1189f5bee42df;
      expv[41] = 52'h0189f5aee42de;
      expv[42] = 52'h0189f59ee42dd;
      expv[43] = 52'h0189f58ee42dc;
      expv[44] = 52'h0189f57ee42db;
      expv[45] = 52'h1189f56ee42da;
      expv[46] = 52'h0189f55ee42d9;
      expv[47] = 52'h0189f54ee42d8;
      expv[48] = 52'h0189f53ee42d7;
      expv[49] = 52'h0189f52ee42d6;
      expv[50] = 52'h1189f51ee42d5;
      expv[51] = 52'h0189f50ee42d4;
      expv[52] = 52'h0189f4fee42d3;
      expv[53] = 52'h0189f4eee42d2;
      expv[54] = 52'h0189f4dee42d1;
      expv[55] = 52'h1189f4cee42d0;
      expv[56] = 52'h0189f4bee42cf;
      expv[57] = 52'h0189f4aee42ce;
      expv[58] = 52'h0189f49ee42cd;
      expv[59] = 52'h0189f48ee42cc;
      expv[60] = 52'h1189f47ee42cb;
      expv[61] = 52'h0189f46ee42ca;
      expv[62] = 52'h0189f45ee42c9;
      expv[63] = 52'h0189f44ee42c8;
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
