// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_015206 dut (
    .score(in_vec[19:0]),
    .hundred_thousands(out_vec[23:20]),
    .ten_thousands(out_vec[19:16]),
    .thousands(out_vec[15:12]),
    .hundreds(out_vec[11:8]),
    .tens(out_vec[7:4]),
    .ones(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h33027;
    stim[1] = 20'ha9059;
    stim[2] = 20'habbd5;
    stim[3] = 20'h7e86a;
    stim[4] = 20'h2e0ac;
    stim[5] = 20'hdb3a1;
    stim[6] = 20'hbe744;
    stim[7] = 20'h038c7;
    stim[8] = 20'hd24fe;
    stim[9] = 20'hff9b1;
    stim[10] = 20'h20e5f;
    stim[11] = 20'hee826;
    stim[12] = 20'h983eb;
    stim[13] = 20'h274a7;
    stim[14] = 20'hb1841;
    stim[15] = 20'h5f465;
    stim[16] = 20'hdd0e7;
    stim[17] = 20'hdfea1;
    stim[18] = 20'h214ad;
    stim[19] = 20'h80870;
    stim[20] = 20'h9074d;
    stim[21] = 20'hf83d7;
    stim[22] = 20'h7146d;
    stim[23] = 20'h25411;
    stim[24] = 20'hdc393;
    stim[25] = 20'h223b1;
    stim[26] = 20'hbc577;
    stim[27] = 20'hf20f9;
    stim[28] = 20'h3461c;
    stim[29] = 20'hc246d;
    stim[30] = 20'h6296c;
    stim[31] = 20'hcb7cf;
    stim[32] = 20'hf2883;
    stim[33] = 20'h3090e;
    stim[34] = 20'he2e8e;
    stim[35] = 20'hfda7f;
    stim[36] = 20'hbc580;
    stim[37] = 20'hc829d;
    stim[38] = 20'h27a31;
    stim[39] = 20'h2a02f;
    stim[40] = 20'h21d1e;
    stim[41] = 20'h18f62;
    stim[42] = 20'ha0d1a;
    stim[43] = 20'h2a6d7;
    stim[44] = 20'hac453;
    stim[45] = 20'h0cb18;
    stim[46] = 20'h184ec;
    stim[47] = 20'h14d89;
    stim[48] = 20'h06a31;
    stim[49] = 20'hdfd6e;
    stim[50] = 20'h4a5a2;
    stim[51] = 20'h418af;
    stim[52] = 20'hfca08;
    stim[53] = 20'hc7d46;
    stim[54] = 20'h2d278;
    stim[55] = 20'hc8aac;
    stim[56] = 20'h6c6e5;
    stim[57] = 20'hca73f;
    stim[58] = 20'h9555a;
    stim[59] = 20'h52e27;
    stim[60] = 20'h8ef95;
    stim[61] = 20'h9e406;
    stim[62] = 20'h2e307;
    stim[63] = 20'h8c612;
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
      expv[0] = 24'h208935;
      expv[1] = 24'h692313;
      expv[2] = 24'h703445;
      expv[3] = 24'h518250;
      expv[4] = 24'h188588;
      expv[5] = 24'h897953;
      expv[6] = 24'h780100;
      expv[7] = 24'h014535;
      expv[8] = 24'h861438;
      expv[9] = 24'h046961;
      expv[10] = 24'h134751;
      expv[11] = 24'h976934;
      expv[12] = 24'h623595;
      expv[13] = 24'h160935;
      expv[14] = 24'h727105;
      expv[15] = 24'h390245;
      expv[16] = 24'h905447;
      expv[17] = 24'h917153;
      expv[18] = 24'h136365;
      expv[19] = 24'h526448;
      expv[20] = 24'h591693;
      expv[21] = 24'h016791;
      expv[22] = 24'h463981;
      expv[23] = 24'h152593;
      expv[24] = 24'h902035;
      expv[25] = 24'h140209;
      expv[26] = 24'h771447;
      expv[27] = 24'h991481;
      expv[28] = 24'h214556;
      expv[29] = 24'h795757;
      expv[30] = 24'h403820;
      expv[31] = 24'h833487;
      expv[32] = 24'h993411;
      expv[33] = 24'h198926;
      expv[34] = 24'h929422;
      expv[35] = 24'h038975;
      expv[36] = 24'h771456;
      expv[37] = 24'h819869;
      expv[38] = 24'h162353;
      expv[39] = 24'h172079;
      expv[40] = 24'h138526;
      expv[41] = 24'h102242;
      expv[42] = 24'h658714;
      expv[43] = 24'h173783;
      expv[44] = 24'h705619;
      expv[45] = 24'h051992;
      expv[46] = 24'h099564;
      expv[47] = 24'h085385;
      expv[48] = 24'h027185;
      expv[49] = 24'h916846;
      expv[50] = 24'h304546;
      expv[51] = 24'h268463;
      expv[52] = 24'h034760;
      expv[53] = 24'h818502;
      expv[54] = 24'h184952;
      expv[55] = 24'h821932;
      expv[56] = 24'h444133;
      expv[57] = 24'h829247;
      expv[58] = 24'h611674;
      expv[59] = 24'h339495;
      expv[60] = 24'h585621;
      expv[61] = 24'h648198;
      expv[62] = 24'h189191;
      expv[63] = 24'h574994;
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
