// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 44;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_000749 dut (
    .OP(in_vec[43:40]),
    .FLGIN(in_vec[39:32]),
    .A(in_vec[31:16]),
    .B(in_vec[15:0]),
    .flgOut(out_vec[24:17]),
    .out(out_vec[16:1]),
    .shouldWriteBack(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 44'h39f0df6531b;
    stim[1] = 44'hc5356ced3f3;
    stim[2] = 44'h01393059486;
    stim[3] = 44'h1945df0b4d4;
    stim[4] = 44'he75aefb05e6;
    stim[5] = 44'h7fe7a3b7730;
    stim[6] = 44'h79da84c9efa;
    stim[7] = 44'h8e3b9a75f87;
    stim[8] = 44'h9d9910eb765;
    stim[9] = 44'ha70fac96464;
    stim[10] = 44'h3bcb6ad78ec;
    stim[11] = 44'hac43d227438;
    stim[12] = 44'ha50f8bc0928;
    stim[13] = 44'h42247647aef;
    stim[14] = 44'hc9e16763c91;
    stim[15] = 44'h686c3739155;
    stim[16] = 44'hed458018bec;
    stim[17] = 44'h134d7b09c90;
    stim[18] = 44'h32434f06fc6;
    stim[19] = 44'h41a4fc44d1f;
    stim[20] = 44'h52fa3465df6;
    stim[21] = 44'h323bb345b7d;
    stim[22] = 44'hde6c1cdbb9b;
    stim[23] = 44'h99792a0e84b;
    stim[24] = 44'hbd046cb4fb4;
    stim[25] = 44'h89e40120dcb;
    stim[26] = 44'h5abce57230f;
    stim[27] = 44'hcbad26fd18c;
    stim[28] = 44'h0c69fdcc278;
    stim[29] = 44'hc18513147cf;
    stim[30] = 44'he3093fd36d3;
    stim[31] = 44'hbd1ec58162e;
    stim[32] = 44'hc29c78d6d75;
    stim[33] = 44'h3cef0723fa9;
    stim[34] = 44'h7fdbfc7bf14;
    stim[35] = 44'h2c587b29d46;
    stim[36] = 44'h843efe5e45c;
    stim[37] = 44'h90f783416c9;
    stim[38] = 44'h57d443e0d02;
    stim[39] = 44'ha2021049634;
    stim[40] = 44'heebdc17a6ab;
    stim[41] = 44'ha1f20953655;
    stim[42] = 44'h886ebd76d2e;
    stim[43] = 44'h0a1f33b1315;
    stim[44] = 44'h4d7b32b621c;
    stim[45] = 44'h8912ef806aa;
    stim[46] = 44'hd93a0202b93;
    stim[47] = 44'hca3bdbc4925;
    stim[48] = 44'h87dc96eb015;
    stim[49] = 44'h831e766add4;
    stim[50] = 44'h905a4c4dc65;
    stim[51] = 44'h1c6a9c7d17f;
    stim[52] = 44'h9f44d2dceb6;
    stim[53] = 44'h3e574399040;
    stim[54] = 44'h955f43cd0a0;
    stim[55] = 44'h8d9ff694fe1;
    stim[56] = 44'h042e02da6c2;
    stim[57] = 44'hd95e94fdf18;
    stim[58] = 44'h4cb4daccdf7;
    stim[59] = 44'h0ccf8b55047;
    stim[60] = 44'h4d8f2f128e5;
    stim[61] = 44'hb44f9af8271;
    stim[62] = 44'h8f44626a84e;
    stim[63] = 44'hb92dbe56dab;
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
      expv[0] = 25'h00d75b7;
      expv[1] = 25'h0a60000;
      expv[2] = 25'h0260000;
      expv[3] = 25'h0042589;
      expv[4] = 25'h0ea0000;
      expv[5] = 25'h000e461;
      expv[6] = 25'h0091091;
      expv[7] = 25'h009ff4f;
      expv[8] = 25'h000dde3;
      expv[9] = 25'h0093d5b;
      expv[10] = 25'h0007b83;
      expv[11] = 25'h0009235;
      expv[12] = 25'h009e329;
      expv[13] = 25'h00d98eb;
      expv[14] = 25'h13c0000;
      expv[15] = 25'h0000c37;
      expv[16] = 25'h1a80000;
      expv[17] = 25'h004e881;
      expv[18] = 25'h00d8a55;
      expv[19] = 25'h000054b;
      expv[20] = 25'h009a301;
      expv[21] = 25'h000bf6f;
      expv[22] = 25'h1cc0000;
      expv[23] = 25'h000dabf;
      expv[24] = 25'h1a00000;
      expv[25] = 25'h0009bb7;
      expv[26] = 25'h0090001;
      expv[27] = 25'h1740000;
      expv[28] = 25'h18c0000;
      expv[29] = 25'h0300000;
      expv[30] = 25'h0600000;
      expv[31] = 25'h1a20000;
      expv[32] = 25'h0520000;
      expv[33] = 25'h0096193;
      expv[34] = 25'h0097e09;
      expv[35] = 25'h00449f3;
      expv[36] = 25'h009dffb;
      expv[37] = 25'h0090f97;
      expv[38] = 25'h00021f1;
      expv[39] = 25'h0096e61;
      expv[40] = 25'h1d60000;
      expv[41] = 25'h0002d81;
      expv[42] = 25'h009dfff;
      expv[43] = 25'h1420000;
      expv[44] = 25'h000a21d;
      expv[45] = 25'h0005df5;
      expv[46] = 25'h1260000;
      expv[47] = 25'h1460000;
      expv[48] = 25'h009f2ff;
      expv[49] = 25'h009dfed;
      expv[50] = 25'h000b677;
      expv[51] = 25'h004f68d;
      expv[52] = 25'h00965a5;
      expv[53] = 25'h00dc7f3;
      expv[54] = 25'h0001787;
      expv[55] = 25'h009ffd3;
      expv[56] = 25'h0840000;
      expv[57] = 25'h12a0000;
      expv[58] = 25'h004ff69;
      expv[59] = 25'h1980000;
      expv[60] = 25'h0099419;
      expv[61] = 25'h0880000;
      expv[62] = 25'h009dcdd;
      expv[63] = 25'h1240000;
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
