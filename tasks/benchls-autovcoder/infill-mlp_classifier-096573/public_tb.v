// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 44;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_096573 dut (
    .inp(in_vec[43:0]),
    .out(out_vec[13:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 44'h9c057a7ddda;
    stim[1] = 44'h14b6ebd07fe;
    stim[2] = 44'h64f387d768b;
    stim[3] = 44'h2b66f0771a5;
    stim[4] = 44'h088071569f0;
    stim[5] = 44'he7a851afb6f;
    stim[6] = 44'hfe9f578d5a2;
    stim[7] = 44'hab6dde79f2b;
    stim[8] = 44'h7dc2ab06916;
    stim[9] = 44'h87320ac58cd;
    stim[10] = 44'h58284034e29;
    stim[11] = 44'h3550424df85;
    stim[12] = 44'h4b56a10663e;
    stim[13] = 44'hd17d1020a60;
    stim[14] = 44'h881dbc48651;
    stim[15] = 44'h73ce1c6c1a0;
    stim[16] = 44'hfc71a3e0767;
    stim[17] = 44'he1277b2a061;
    stim[18] = 44'hf51a54d37d4;
    stim[19] = 44'hdb26ce58445;
    stim[20] = 44'h924c1a36a88;
    stim[21] = 44'hbbf736fb305;
    stim[22] = 44'h293eabab4f6;
    stim[23] = 44'h7f0cc3daa32;
    stim[24] = 44'h42b1f4ab37f;
    stim[25] = 44'hfaecd730141;
    stim[26] = 44'hf410fdc96f0;
    stim[27] = 44'h4acd4925c2a;
    stim[28] = 44'hcea7ad1c46a;
    stim[29] = 44'h2e7ae97ddb6;
    stim[30] = 44'h57cacf49c2f;
    stim[31] = 44'h5934b3f0acf;
    stim[32] = 44'h78bcc5cad94;
    stim[33] = 44'hcb941419ef5;
    stim[34] = 44'h079efd30019;
    stim[35] = 44'h8c16f39efb5;
    stim[36] = 44'hd4f4baf449b;
    stim[37] = 44'hab84bf18299;
    stim[38] = 44'ha2872de5896;
    stim[39] = 44'h379ae0cc001;
    stim[40] = 44'h77d58cac1f1;
    stim[41] = 44'hbc6d03160a5;
    stim[42] = 44'hec698c3e1ad;
    stim[43] = 44'hb097022abd3;
    stim[44] = 44'h1b3eca04b5a;
    stim[45] = 44'h3bdeffb257b;
    stim[46] = 44'h6ef7b6d816e;
    stim[47] = 44'hfe5127024b6;
    stim[48] = 44'hfc073249f34;
    stim[49] = 44'h37e942a0fab;
    stim[50] = 44'hb8aec744098;
    stim[51] = 44'hd2d8c76eef5;
    stim[52] = 44'had54449a387;
    stim[53] = 44'hb94c9dd89be;
    stim[54] = 44'h96c24558842;
    stim[55] = 44'h6af92901d33;
    stim[56] = 44'h1f2c069475a;
    stim[57] = 44'hbef11bc6bd0;
    stim[58] = 44'h7b472f794aa;
    stim[59] = 44'h193573a6a4a;
    stim[60] = 44'h3dfa4ac01e1;
    stim[61] = 44'h82ae4c95179;
    stim[62] = 44'h993ad904b96;
    stim[63] = 44'hd71e0298431;
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
      expv[0] = 14'h0c9b;
      expv[1] = 14'h072e;
      expv[2] = 14'h0a50;
      expv[3] = 14'h096f;
      expv[4] = 14'h0868;
      expv[5] = 14'h0df5;
      expv[6] = 14'h0da2;
      expv[7] = 14'h0d42;
      expv[8] = 14'h0dd7;
      expv[9] = 14'h0bd9;
      expv[10] = 14'h0c4e;
      expv[11] = 14'h0b09;
      expv[12] = 14'h0cb4;
      expv[13] = 14'h0bd0;
      expv[14] = 14'h0bcb;
      expv[15] = 14'h0aa2;
      expv[16] = 14'h0d3c;
      expv[17] = 14'h0d34;
      expv[18] = 14'h0b4d;
      expv[19] = 14'h0e30;
      expv[20] = 14'h0be4;
      expv[21] = 14'h0dc1;
      expv[22] = 14'h08ba;
      expv[23] = 14'h0bdb;
      expv[24] = 14'h0a0b;
      expv[25] = 14'h0d07;
      expv[26] = 14'h0b05;
      expv[27] = 14'h0c4e;
      expv[28] = 14'h0edc;
      expv[29] = 14'h0a0e;
      expv[30] = 14'h0c2c;
      expv[31] = 14'h0990;
      expv[32] = 14'h09d4;
      expv[33] = 14'h0d04;
      expv[34] = 14'h09ec;
      expv[35] = 14'h0b2c;
      expv[36] = 14'h0b52;
      expv[37] = 14'h0d5d;
      expv[38] = 14'h0af8;
      expv[39] = 14'h0a21;
      expv[40] = 14'h09f0;
      expv[41] = 14'h0d5f;
      expv[42] = 14'h0ebf;
      expv[43] = 14'h0b48;
      expv[44] = 14'h0ad8;
      expv[45] = 14'h09a2;
      expv[46] = 14'h0bda;
      expv[47] = 14'h0f03;
      expv[48] = 14'h0f57;
      expv[49] = 14'h093d;
      expv[50] = 14'h0ba5;
      expv[51] = 14'h0a9b;
      expv[52] = 14'h0d67;
      expv[53] = 14'h0bdc;
      expv[54] = 14'h0c9f;
      expv[55] = 14'h0c6e;
      expv[56] = 14'h0bb9;
      expv[57] = 14'h0c3e;
      expv[58] = 14'h0cba;
      expv[59] = 14'h0ab0;
      expv[60] = 14'h08f5;
      expv[61] = 14'h0ae6;
      expv[62] = 14'h0bc1;
      expv[63] = 14'h0d69;
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
