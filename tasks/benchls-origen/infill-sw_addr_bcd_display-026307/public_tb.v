// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 28;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_026307 dut (
    .SW(in_vec[9:0]),
    .HEX3(out_vec[27:21]),
    .HEX2(out_vec[20:14]),
    .HEX1(out_vec[13:7]),
    .HEX0(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h3c8;
    stim[1] = 10'h242;
    stim[2] = 10'h263;
    stim[3] = 10'h1c8;
    stim[4] = 10'h159;
    stim[5] = 10'h0b1;
    stim[6] = 10'h379;
    stim[7] = 10'h188;
    stim[8] = 10'h347;
    stim[9] = 10'h3c7;
    stim[10] = 10'h224;
    stim[11] = 10'h3e9;
    stim[12] = 10'h1b1;
    stim[13] = 10'h316;
    stim[14] = 10'h2b5;
    stim[15] = 10'h27b;
    stim[16] = 10'h331;
    stim[17] = 10'h23d;
    stim[18] = 10'h03e;
    stim[19] = 10'h311;
    stim[20] = 10'h262;
    stim[21] = 10'h2e7;
    stim[22] = 10'h15c;
    stim[23] = 10'h046;
    stim[24] = 10'h19b;
    stim[25] = 10'h248;
    stim[26] = 10'h266;
    stim[27] = 10'h139;
    stim[28] = 10'h129;
    stim[29] = 10'h074;
    stim[30] = 10'h38d;
    stim[31] = 10'h388;
    stim[32] = 10'h0c0;
    stim[33] = 10'h291;
    stim[34] = 10'h274;
    stim[35] = 10'h188;
    stim[36] = 10'h0e9;
    stim[37] = 10'h233;
    stim[38] = 10'h005;
    stim[39] = 10'h28c;
    stim[40] = 10'h057;
    stim[41] = 10'h0cc;
    stim[42] = 10'h047;
    stim[43] = 10'h297;
    stim[44] = 10'h232;
    stim[45] = 10'h0d0;
    stim[46] = 10'h36f;
    stim[47] = 10'h31a;
    stim[48] = 10'h055;
    stim[49] = 10'h1c2;
    stim[50] = 10'h287;
    stim[51] = 10'h3e4;
    stim[52] = 10'h3c4;
    stim[53] = 10'h213;
    stim[54] = 10'h18e;
    stim[55] = 10'h229;
    stim[56] = 10'h0df;
    stim[57] = 10'h150;
    stim[58] = 10'h25e;
    stim[59] = 10'h028;
    stim[60] = 10'h0e3;
    stim[61] = 10'h085;
    stim[62] = 10'h2d3;
    stim[63] = 10'h216;
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
      expv[0] = 28'hfe4bc82;
      expv[1] = 28'hfe02019;
      expv[2] = 28'hfe02078;
      expv[3] = 28'hfe4bc82;
      expv[4] = 28'hffe7c80;
      expv[5] = 28'hfe66030;
      expv[6] = 28'hffe7c90;
      expv[7] = 28'hfec3c82;
      expv[8] = 28'hffe7c99;
      expv[9] = 28'hfe4bc99;
      expv[10] = 28'hfe0a010;
      expv[11] = 28'hfe4bc90;
      expv[12] = 28'hfe92030;
      expv[13] = 28'hffffca4;
      expv[14] = 28'hffffcf9;
      expv[15] = 28'hfe43cff;
      expv[16] = 28'hfffe030;
      expv[17] = 28'hffe3cf9;
      expv[18] = 28'hffe7cb0;
      expv[19] = 28'hfffe024;
      expv[20] = 28'hfe02012;
      expv[21] = 28'hffffc92;
      expv[22] = 28'hffe7cff;
      expv[23] = 28'hfec3ca4;
      expv[24] = 28'hfec3cff;
      expv[25] = 28'hfe43c82;
      expv[26] = 28'hfe43cb0;
      expv[27] = 28'hfe43c90;
      expv[28] = 28'hfe43c90;
      expv[29] = 28'hfe92010;
      expv[30] = 28'hfec3cc0;
      expv[31] = 28'hfec3c82;
      expv[32] = 28'hfe0a040;
      expv[33] = 28'hfffe024;
      expv[34] = 28'hfe02010;
      expv[35] = 28'hfec3c82;
      expv[36] = 28'hffe3c90;
      expv[37] = 28'hfe0a078;
      expv[38] = 28'hffe7cc0;
      expv[39] = 28'hffffcff;
      expv[40] = 28'hfec3c99;
      expv[41] = 28'hffe3cff;
      expv[42] = 28'hfec3c99;
      expv[43] = 28'hffffc99;
      expv[44] = 28'hfe0a012;
      expv[45] = 28'hfe0a040;
      expv[46] = 28'hffe7c92;
      expv[47] = 28'hffffcff;
      expv[48] = 28'hfec3cc0;
      expv[49] = 28'hfe66019;
      expv[50] = 28'hffffc99;
      expv[51] = 28'hfe66010;
      expv[52] = 28'hfe66000;
      expv[53] = 28'hfe0a002;
      expv[54] = 28'hfec3ca4;
      expv[55] = 28'hffe3c90;
      expv[56] = 28'hffe3c99;
      expv[57] = 28'hff02040;
      expv[58] = 28'hfe43ca4;
      expv[59] = 28'hffe7cf8;
      expv[60] = 28'hfe0a078;
      expv[61] = 28'hfe4bcc0;
      expv[62] = 28'hfffe002;
      expv[63] = 28'hffe3ca4;
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
