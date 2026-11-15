// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05639 dut (
    .clk(clk),
    .Estado(in_vec[40:33]),
    .Cuenta_Segundos(in_vec[32:27]),
    .Cuenta_Minutos(in_vec[26:21]),
    .Cuenta_Horas(in_vec[20:16]),
    .Cuenta_Year(in_vec[15:11]),
    .Cuenta_Mes(in_vec[10:7]),
    .Cuenta_Dia(in_vec[6:0]),
    .Salida_1(out_vec[23:16]),
    .Salida_2(out_vec[15:8]),
    .Salida_3(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h15c5ba55960;
    stim[1] = 41'h056246f9b84;
    stim[2] = 41'h02acb5b203c;
    stim[3] = 41'h0b45635a99c;
    stim[4] = 41'h173ca28dc28;
    stim[5] = 41'h1ab52003ce3;
    stim[6] = 41'h0b91c163ee9;
    stim[7] = 41'h147c5ebaa9f;
    stim[8] = 41'h01d913c7591;
    stim[9] = 41'h13e56efe9ec;
    stim[10] = 41'h13a1ffa505b;
    stim[11] = 41'h176c3e6e0bf;
    stim[12] = 41'h1e201fa2828;
    stim[13] = 41'h0332694ce6f;
    stim[14] = 41'h06a3b6e4391;
    stim[15] = 41'h0ed5715fbf9;
    stim[16] = 41'h101d94213cb;
    stim[17] = 41'h034409ae351;
    stim[18] = 41'h0fc8f7bd818;
    stim[19] = 41'h15197173c3b;
    stim[20] = 41'h0862e851775;
    stim[21] = 41'h14d84ae7567;
    stim[22] = 41'h09f169f7b07;
    stim[23] = 41'h1ac1010f93b;
    stim[24] = 41'h09ed928d348;
    stim[25] = 41'h0f6819e2e33;
    stim[26] = 41'h18832db9c0a;
    stim[27] = 41'h0e7fe9aa5f2;
    stim[28] = 41'h1bc54f6d1a4;
    stim[29] = 41'h168e6061ebd;
    stim[30] = 41'h169cea032ef;
    stim[31] = 41'h1826c17085a;
    stim[32] = 41'h1cb7f5353e1;
    stim[33] = 41'h087f99c76e9;
    stim[34] = 41'h11f218b1c64;
    stim[35] = 41'h066e7db1c3b;
    stim[36] = 41'h064ea63a5db;
    stim[37] = 41'h1d363164b2f;
    stim[38] = 41'h1169d93fec9;
    stim[39] = 41'h0d04247d6c6;
    stim[40] = 41'h0f72968e443;
    stim[41] = 41'h0502f949a7c;
    stim[42] = 41'h1cd60fd3d86;
    stim[43] = 41'h0ecd8a02719;
    stim[44] = 41'h0066e07a939;
    stim[45] = 41'h14af188b5f7;
    stim[46] = 41'h1ec31809879;
    stim[47] = 41'h07157aea776;
    stim[48] = 41'h1257deef2bc;
    stim[49] = 41'h0ac4ac7756f;
    stim[50] = 41'h16335c32f02;
    stim[51] = 41'h15673e2ab8c;
    stim[52] = 41'h00ddde29a10;
    stim[53] = 41'h1875c7e62c6;
    stim[54] = 41'h17cdcf43280;
    stim[55] = 41'h181a38c93c3;
    stim[56] = 41'h0a46ea89523;
    stim[57] = 41'h1c7699f86cd;
    stim[58] = 41'h0326dc1e18f;
    stim[59] = 41'h12e452324d1;
    stim[60] = 41'h1421f25deef;
    stim[61] = 41'h03d74d4c35c;
    stim[62] = 41'h0222746781e;
    stim[63] = 41'h193b2930f30;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'h0b0260;
      expv[2] = 24'h130704;
      expv[3] = 24'h04003c;
      expv[4] = 24'h15031c;
      expv[5] = 24'h1b0828;
      expv[6] = 24'h070963;
      expv[7] = 24'h070d69;
      expv[8] = 24'h15051f;
      expv[9] = 24'h0e0b11;
      expv[10] = 24'h1d036c;
      expv[11] = 24'h0a005b;
      expv[12] = 24'h1c013f;
      expv[13] = 24'h050028;
      expv[14] = 24'h190c6f;
      expv[15] = 24'h080711;
      expv[16] = 24'h1f0779;
      expv[17] = 24'h02074b;
      expv[18] = 24'h1c0651;
      expv[19] = 24'h1b0018;
      expv[20] = 24'h07083b;
      expv[21] = 24'h020e75;
      expv[22] = 24'h0e0a67;
      expv[23] = 24'h0f0607;
      expv[24] = 24'h1f023b;
      expv[25] = 24'h1a0648;
      expv[26] = 24'h050c33;
      expv[27] = 24'h13080a;
      expv[28] = 24'h140b72;
      expv[29] = 24'h1a0324;
      expv[30] = 24'h030d3d;
      expv[31] = 24'h06056f;
      expv[32] = 24'h01005a;
      expv[33] = 24'h0a0761;
      expv[34] = 24'h0e0d69;
      expv[35] = 24'h030864;
      expv[36] = 24'h03083b;
      expv[37] = 24'h140b5b;
      expv[38] = 24'h09062f;
      expv[39] = 24'h1f0d49;
      expv[40] = 24'h1a0d46;
      expv[41] = 24'h1c0843;
      expv[42] = 24'h13047c;
      expv[43] = 24'h070b06;
      expv[44] = 24'h040e19;
      expv[45] = 24'h150239;
      expv[46] = 24'h160b77;
      expv[47] = 24'h130079;
      expv[48] = 24'h140e76;
      expv[49] = 24'h1e053c;
      expv[50] = 24'h0e0a6f;
      expv[51] = 24'h050e02;
      expv[52] = 24'h15070c;
      expv[53] = 24'h130410;
      expv[54] = 24'h0c0546;
      expv[55] = 24'h060500;
      expv[56] = 24'h120743;
      expv[57] = 24'h120a23;
      expv[58] = 24'h100d4d;
      expv[59] = 24'h1c030f;
      expv[60] = 24'h040951;
      expv[61] = 24'h1b0d6f;
      expv[62] = 24'h18065c;
      expv[63] = 24'h0f001e;
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
