// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_085012 dut (
    .sel(in_vec[66:62]),
    .inp0(in_vec[61:60]),
    .inp1(in_vec[59:58]),
    .inp2(in_vec[57:56]),
    .inp3(in_vec[55:54]),
    .inp4(in_vec[53:52]),
    .inp5(in_vec[51:50]),
    .inp6(in_vec[49:48]),
    .inp7(in_vec[47:46]),
    .inp8(in_vec[45:44]),
    .inp9(in_vec[43:42]),
    .inp10(in_vec[41:40]),
    .inp11(in_vec[39:38]),
    .inp12(in_vec[37:36]),
    .inp13(in_vec[35:34]),
    .inp14(in_vec[33:32]),
    .inp15(in_vec[31:30]),
    .inp16(in_vec[29:28]),
    .inp17(in_vec[27:26]),
    .inp18(in_vec[25:24]),
    .inp19(in_vec[23:22]),
    .inp20(in_vec[21:20]),
    .inp21(in_vec[19:18]),
    .inp22(in_vec[17:16]),
    .inp23(in_vec[15:14]),
    .inp24(in_vec[13:12]),
    .inp25(in_vec[11:10]),
    .inp26(in_vec[9:8]),
    .inp27(in_vec[7:6]),
    .inp28(in_vec[5:4]),
    .inp29(in_vec[3:2]),
    .inp30(in_vec[1:0]),
    .out(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h5bca8528ff0e39d69;
    stim[1] = 67'h44fe2629d4eecb54c;
    stim[2] = 67'h14b5623bb1a160796;
    stim[3] = 67'h462bcadb36724e5b2;
    stim[4] = 67'h531f3f6cde4fcf9c7;
    stim[5] = 67'h612ad8dee73c5bd15;
    stim[6] = 67'h756639cf5436f89c3;
    stim[7] = 67'h5651f6c0bb3883fcb;
    stim[8] = 67'h761de1f7eb1aa20c4;
    stim[9] = 67'h6614727829ce14040;
    stim[10] = 67'h566b032f09b5f2f63;
    stim[11] = 67'h7d557a3f15774721a;
    stim[12] = 67'h3bad7d0a17c2e6cab;
    stim[13] = 67'h6ad5d6bd20384a2e1;
    stim[14] = 67'h7b2200c6bc23c803b;
    stim[15] = 67'h2d25531fd2e5b637d;
    stim[16] = 67'h6d1c33a0974b2554e;
    stim[17] = 67'h55f8d883876a0f01b;
    stim[18] = 67'h25f1c42fbffcabf06;
    stim[19] = 67'h5c400004bad34eacb;
    stim[20] = 67'h1df4c41660c6afc4a;
    stim[21] = 67'h50d576abca33ca4a1;
    stim[22] = 67'h68be3c29d523608fb;
    stim[23] = 67'h779c94388decad5fb;
    stim[24] = 67'h696f336f40dc2a02d;
    stim[25] = 67'h4a950c9e52b70bc93;
    stim[26] = 67'h6c0592e8da705adf9;
    stim[27] = 67'h41f0595fa68e874e3;
    stim[28] = 67'h45f47bb76907d93db;
    stim[29] = 67'h0da42c273849e2d95;
    stim[30] = 67'h75dd588444bd861d1;
    stim[31] = 67'h53203cee34d44ad77;
    stim[32] = 67'h451807120e5b5508e;
    stim[33] = 67'h75df967782a0dbd85;
    stim[34] = 67'h4879197fa7095cea2;
    stim[35] = 67'h1f990a5ad266600a2;
    stim[36] = 67'h4cbea85b3d9878b75;
    stim[37] = 67'h77e69f3b538229044;
    stim[38] = 67'h2c8d1df0120c29b42;
    stim[39] = 67'h794ee1064245d1745;
    stim[40] = 67'h142a905aa0ea7d073;
    stim[41] = 67'h71f52ac6dfba536af;
    stim[42] = 67'h61dd3a96610cf41cc;
    stim[43] = 67'h01d19eca9945ab1f1;
    stim[44] = 67'h1a8ccacffe3bd48c3;
    stim[45] = 67'h649662cbc08a9c154;
    stim[46] = 67'h32d0880713aeace27;
    stim[47] = 67'h4902d1ec56fa0ff1d;
    stim[48] = 67'h7148eb50ebb5c5347;
    stim[49] = 67'h04fd99f072657ded0;
    stim[50] = 67'h786e46345c1679f1d;
    stim[51] = 67'h2a64218981b28acd1;
    stim[52] = 67'h3d47f1dc547a340b0;
    stim[53] = 67'h593512e4fa8b713a5;
    stim[54] = 67'h4a4ce1b35dc5f5551;
    stim[55] = 67'h62f2842a5e0932bbf;
    stim[56] = 67'h4561fe80a30735381;
    stim[57] = 67'h600f1db179868670b;
    stim[58] = 67'h29e09d279454f3afe;
    stim[59] = 67'h34c1d5fb805da11f2;
    stim[60] = 67'h780d761a560cf2c24;
    stim[61] = 67'h1c924591681bd69da;
    stim[62] = 67'h31c6214310f57e22d;
    stim[63] = 67'h6ae53662ca758f2de;
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
      expv[0] = 2'h3;
      expv[1] = 2'h3;
      expv[2] = 2'h1;
      expv[3] = 2'h1;
      expv[4] = 2'h3;
      expv[5] = 2'h3;
      expv[6] = 2'h0;
      expv[7] = 2'h2;
      expv[8] = 2'h1;
      expv[9] = 2'h0;
      expv[10] = 2'h3;
      expv[11] = 2'h0;
      expv[12] = 2'h1;
      expv[13] = 2'h2;
      expv[14] = 2'h3;
      expv[15] = 2'h3;
      expv[16] = 2'h1;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h3;
      expv[20] = 2'h1;
      expv[21] = 2'h3;
      expv[22] = 2'h0;
      expv[23] = 2'h2;
      expv[24] = 2'h0;
      expv[25] = 2'h3;
      expv[26] = 2'h3;
      expv[27] = 2'h2;
      expv[28] = 2'h0;
      expv[29] = 2'h1;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h1;
      expv[33] = 2'h1;
      expv[34] = 2'h0;
      expv[35] = 2'h2;
      expv[36] = 2'h2;
      expv[37] = 2'h1;
      expv[38] = 2'h0;
      expv[39] = 2'h1;
      expv[40] = 2'h2;
      expv[41] = 2'h2;
      expv[42] = 2'h0;
      expv[43] = 2'h1;
      expv[44] = 2'h0;
      expv[45] = 2'h0;
      expv[46] = 2'h3;
      expv[47] = 2'h3;
      expv[48] = 2'h0;
      expv[49] = 2'h3;
      expv[50] = 2'h1;
      expv[51] = 2'h0;
      expv[52] = 2'h1;
      expv[53] = 2'h3;
      expv[54] = 2'h0;
      expv[55] = 2'h2;
      expv[56] = 2'h0;
      expv[57] = 2'h2;
      expv[58] = 2'h2;
      expv[59] = 2'h2;
      expv[60] = 2'h0;
      expv[61] = 2'h1;
      expv[62] = 2'h3;
      expv[63] = 2'h2;
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
