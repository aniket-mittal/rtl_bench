// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_146879 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .in1(in_vec[31:16]),
    .in2(in_vec[15:0]),
    .out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1cb661d8f;
    stim[1] = 33'h19edc0d89;
    stim[2] = 33'h08b805efc;
    stim[3] = 33'h0ea3c4b83;
    stim[4] = 33'h01aa13b04;
    stim[5] = 33'h023005d42;
    stim[6] = 33'h030f6cb4a;
    stim[7] = 33'h0294f9605;
    stim[8] = 33'h0847ff370;
    stim[9] = 33'h03daa6933;
    stim[10] = 33'h051ed888a;
    stim[11] = 33'h0a806be1a;
    stim[12] = 33'h0ba97a6b1;
    stim[13] = 33'h17c3de997;
    stim[14] = 33'h0c3174c7e;
    stim[15] = 33'h0c73e40a0;
    stim[16] = 33'h0240a0f6d;
    stim[17] = 33'h0c57014df;
    stim[18] = 33'h052fbbbba;
    stim[19] = 33'h0bda8bea8;
    stim[20] = 33'h01e35879c;
    stim[21] = 33'h04d0ae4f9;
    stim[22] = 33'h0bff5accb;
    stim[23] = 33'h0efeda2ab;
    stim[24] = 33'h0d5be09e2;
    stim[25] = 33'h07034e01e;
    stim[26] = 33'h0064eec95;
    stim[27] = 33'h0bf9d8dee;
    stim[28] = 33'h0735646ab;
    stim[29] = 33'h0acdf8080;
    stim[30] = 33'h0ece3bde5;
    stim[31] = 33'h09bd65f0b;
    stim[32] = 33'h0f91cf9a6;
    stim[33] = 33'h0ad93e108;
    stim[34] = 33'h0ce080a85;
    stim[35] = 33'h0fe22e332;
    stim[36] = 33'h0a415ac2a;
    stim[37] = 33'h06e97a80c;
    stim[38] = 33'h05dfc9fda;
    stim[39] = 33'h043f9213e;
    stim[40] = 33'h06c01db1b;
    stim[41] = 33'h0eb4a600f;
    stim[42] = 33'h0967ddbf4;
    stim[43] = 33'h000359762;
    stim[44] = 33'h0a31d45bd;
    stim[45] = 33'h0d12117fc;
    stim[46] = 33'h06a679a14;
    stim[47] = 33'h0ac50c685;
    stim[48] = 33'h0077a2db2;
    stim[49] = 33'h0e5f0802c;
    stim[50] = 33'h053249130;
    stim[51] = 33'h06da6158d;
    stim[52] = 33'h05a231faa;
    stim[53] = 33'h0d9f973bd;
    stim[54] = 33'h0d0199068;
    stim[55] = 33'h023adc4e4;
    stim[56] = 33'h0919d4914;
    stim[57] = 33'h06374d8a9;
    stim[58] = 33'h035f33189;
    stim[59] = 33'h0b8d0ac07;
    stim[60] = 33'h09b71547d;
    stim[61] = 33'h0f86abba0;
    stim[62] = 33'h1e4b085e9;
    stim[63] = 33'h023216d1a;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hea3c;
      expv[4] = 16'h1aa1;
      expv[5] = 16'h2300;
      expv[6] = 16'h30f6;
      expv[7] = 16'h2950;
      expv[8] = 16'h847f;
      expv[9] = 16'h3daa;
      expv[10] = 16'h51ed;
      expv[11] = 16'ha806;
      expv[12] = 16'hba98;
      expv[13] = 16'h7c3e;
      expv[14] = 16'hc318;
      expv[15] = 16'hc73e;
      expv[16] = 16'h240a;
      expv[17] = 16'hc570;
      expv[18] = 16'h52fb;
      expv[19] = 16'hbda8;
      expv[20] = 16'h1e35;
      expv[21] = 16'h4d0a;
      expv[22] = 16'hbff6;
      expv[23] = 16'hefee;
      expv[24] = 16'hd5be;
      expv[25] = 16'h7034;
      expv[26] = 16'h064e;
      expv[27] = 16'hbf9d;
      expv[28] = 16'h7357;
      expv[29] = 16'hacdf;
      expv[30] = 16'hece3;
      expv[31] = 16'h9bd6;
      expv[32] = 16'hf91c;
      expv[33] = 16'had93;
      expv[34] = 16'hce08;
      expv[35] = 16'hfe22;
      expv[36] = 16'ha416;
      expv[37] = 16'h6e98;
      expv[38] = 16'h5dfc;
      expv[39] = 16'h43f9;
      expv[40] = 16'h6c01;
      expv[41] = 16'heb4b;
      expv[42] = 16'h967e;
      expv[43] = 16'h0035;
      expv[44] = 16'ha31d;
      expv[45] = 16'hd121;
      expv[46] = 16'h6a67;
      expv[47] = 16'hac50;
      expv[48] = 16'h077b;
      expv[49] = 16'he5f1;
      expv[50] = 16'h5324;
      expv[51] = 16'h6da6;
      expv[52] = 16'h5a24;
      expv[53] = 16'hd9fa;
      expv[54] = 16'hd019;
      expv[55] = 16'h23ae;
      expv[56] = 16'h919d;
      expv[57] = 16'h6374;
      expv[58] = 16'h35f4;
      expv[59] = 16'hb8d1;
      expv[60] = 16'h9b72;
      expv[61] = 16'hf86a;
      expv[62] = 16'he4b1;
      expv[63] = 16'h2322;
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
