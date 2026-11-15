// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 45;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_117451 dut (
    .clk_i(clk),
    .rst_i(in_vec[44:44]),
    .wen_i(in_vec[43:43]),
    .wadr_i(in_vec[42:34]),
    .radr0_i(in_vec[33:25]),
    .radr1_i(in_vec[24:16]),
    .datao0_i(in_vec[15:8]),
    .datao1_i(in_vec[7:0]),
    .data0_o(out_vec[35:27]),
    .data1_o(out_vec[26:18]),
    .we0_o(out_vec[17:17]),
    .adr0_o(out_vec[16:9]),
    .we1_o(out_vec[8:8]),
    .adr1_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 45'h12c524510155;
    stim[1] = 45'h1b354e586983;
    stim[2] = 45'h068ac59ce172;
    stim[3] = 45'h046c1af5d071;
    stim[4] = 45'h0df960e32bb8;
    stim[5] = 45'h0f97d2d15d01;
    stim[6] = 45'h006c7bd23bbc;
    stim[7] = 45'h063f3682001a;
    stim[8] = 45'h0bb98ea24a01;
    stim[9] = 45'h03e44d7e860f;
    stim[10] = 45'h05031c3a8c00;
    stim[11] = 45'h0dbe9567163e;
    stim[12] = 45'h06df5940cd3e;
    stim[13] = 45'h057e6bf40ec3;
    stim[14] = 45'h092289baf1d0;
    stim[15] = 45'h089ab156f226;
    stim[16] = 45'h0f0af12753c0;
    stim[17] = 45'h0c8a26327e54;
    stim[18] = 45'h0626a83b2aaa;
    stim[19] = 45'h01847ad098ef;
    stim[20] = 45'h0a11bf3b75aa;
    stim[21] = 45'h0edcd851c764;
    stim[22] = 45'h082406a75ff4;
    stim[23] = 45'h0049ef1b18f6;
    stim[24] = 45'h064e9c0e8a87;
    stim[25] = 45'h061d512d4076;
    stim[26] = 45'h037dbe8a0b16;
    stim[27] = 45'h06cfff651cc7;
    stim[28] = 45'h0096313067ee;
    stim[29] = 45'h05c1803a612d;
    stim[30] = 45'h0b8141ef6476;
    stim[31] = 45'h085db88be6ed;
    stim[32] = 45'h062842df66bd;
    stim[33] = 45'h052765f8a229;
    stim[34] = 45'h06c9875f87a3;
    stim[35] = 45'h09d8d083327f;
    stim[36] = 45'h05110dbf2a94;
    stim[37] = 45'h01589422c0d2;
    stim[38] = 45'h0e21fe810ce3;
    stim[39] = 45'h0aafb1a95b53;
    stim[40] = 45'h0b3887a56efb;
    stim[41] = 45'h0e5364e2c778;
    stim[42] = 45'h03d031157377;
    stim[43] = 45'h078e87097501;
    stim[44] = 45'h00f2696d0383;
    stim[45] = 45'h0e220be671ed;
    stim[46] = 45'h026e56f5e712;
    stim[47] = 45'h066d87517c67;
    stim[48] = 45'h0cedfd51d89c;
    stim[49] = 45'h0f42ec6ed080;
    stim[50] = 45'h0943173dad19;
    stim[51] = 45'h0cf862915743;
    stim[52] = 45'h0767c8f50615;
    stim[53] = 45'h0b7986f6c985;
    stim[54] = 45'h0085bf9123d7;
    stim[55] = 45'h1575bb415f59;
    stim[56] = 45'h0b90584a8b64;
    stim[57] = 45'h09b5f7cbd859;
    stim[58] = 45'h0cd2d114cd20;
    stim[59] = 45'h0738648064a6;
    stim[60] = 45'h0e1f7ea93cf0;
    stim[61] = 45'h07af6821feb5;
    stim[62] = 45'h0db6e84dc47c;
    stim[63] = 45'h0229a2d20faf;
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
      expv[0] = 36'hx0x549228;
      expv[1] = 36'h419a4cd66;
      expv[2] = 36'h709c962ce;
      expv[3] = 36'h38b400c7a;
      expv[4] = 36'h15ae37ebf;
      expv[5] = 36'h00975e5f2;
      expv[6] = 36'h5e0ec3ce9;
      expv[7] = 36'h0d0019a41;
      expv[8] = 36'h0092aee77;
      expv[9] = 36'h4343c26bf;
      expv[10] = 36'h460018e1d;
      expv[11] = 36'h0b0f96fb7;
      expv[12] = 36'h668f9aca0;
      expv[13] = 36'h6183934fa;
      expv[14] = 36'h78b424824;
      expv[15] = 36'h7909a2613;
      expv[16] = 36'h29b03c2e1;
      expv[17] = 36'h2a1fb2291;
      expv[18] = 36'h152a9541d;
      expv[19] = 36'h77a603c68;
      expv[20] = 36'h551d68442;
      expv[21] = 36'h63991b7db;
      expv[22] = 36'h7a17c0904;
      expv[23] = 36'h7b060f68d;
      expv[24] = 36'h4521d4e07;
      expv[25] = 36'h201d8a896;
      expv[26] = 36'h0b02cde45;
      expv[27] = 36'h63871feb2;
      expv[28] = 36'h33bb91898;
      expv[29] = 36'h308b4c01d;
      expv[30] = 36'h321dae070;
      expv[31] = 36'h733b4170b;
      expv[32] = 36'h5e998206f;
      expv[33] = 36'h510a5b2fc;
      expv[34] = 36'h51a1cc2af;
      expv[35] = 36'h191fe763b;
      expv[36] = 36'h1525086df;
      expv[37] = 36'h603484a11;
      expv[38] = 36'h7183388c4;
      expv[39] = 36'h2d94cab55;
      expv[40] = 36'h7d9bace67;
      expv[41] = 36'h639e394ca;
      expv[42] = 36'h399dc188a;
      expv[43] = 36'h009d54284;
      expv[44] = 36'h01a0d34b6;
      expv[45] = 36'h769c788c4;
      expv[46] = 36'h0939d2a7a;
      expv[47] = 36'h339f0c2a8;
      expv[48] = 36'h6c2713b9d;
      expv[49] = 36'h68203d0e8;
      expv[50] = 36'h0cab65028;
      expv[51] = 36'h2195f3e9f;
      expv[52] = 36'h03055e47a;
      expv[53] = 36'h42b26de6f;
      expv[54] = 36'h6b88cdec8;
      expv[55] = 36'h2c97cdca0;
      expv[56] = 36'h45992e472;
      expv[57] = 36'h2cb606d36;
      expv[58] = 36'h66883349a;
      expv[59] = 36'h322983240;
      expv[60] = 36'h780f187c3;
      expv[61] = 36'h7f2d5b410;
      expv[62] = 36'h621f16db6;
      expv[63] = 36'h5783cd069;
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
