// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_137912 dut (
    .clk(clk),
    .reset(in_vec[10:10]),
    .command(in_vec[9:8]),
    .data_in(in_vec[7:0]),
    .busy(out_vec[9:9]),
    .done(out_vec[8:8]),
    .data_out(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h694;
    stim[1] = 11'h7ec;
    stim[2] = 11'h28f;
    stim[3] = 11'h189;
    stim[4] = 11'h1ff;
    stim[5] = 11'h26d;
    stim[6] = 11'h371;
    stim[7] = 11'h377;
    stim[8] = 11'h3ee;
    stim[9] = 11'h260;
    stim[10] = 11'h112;
    stim[11] = 11'h22d;
    stim[12] = 11'h1d6;
    stim[13] = 11'h175;
    stim[14] = 11'h259;
    stim[15] = 11'h141;
    stim[16] = 11'h330;
    stim[17] = 11'h204;
    stim[18] = 11'h02c;
    stim[19] = 11'h314;
    stim[20] = 11'h04b;
    stim[21] = 11'h067;
    stim[22] = 11'h1f3;
    stim[23] = 11'h0ff;
    stim[24] = 11'h3cc;
    stim[25] = 11'h312;
    stim[26] = 11'h143;
    stim[27] = 11'h01b;
    stim[28] = 11'h1d7;
    stim[29] = 11'h2e9;
    stim[30] = 11'h38b;
    stim[31] = 11'h1eb;
    stim[32] = 11'h288;
    stim[33] = 11'h2a2;
    stim[34] = 11'h1e6;
    stim[35] = 11'h3b4;
    stim[36] = 11'h07e;
    stim[37] = 11'h0a8;
    stim[38] = 11'h38a;
    stim[39] = 11'h30a;
    stim[40] = 11'h09c;
    stim[41] = 11'h318;
    stim[42] = 11'h36f;
    stim[43] = 11'h180;
    stim[44] = 11'h335;
    stim[45] = 11'h272;
    stim[46] = 11'h33a;
    stim[47] = 11'h058;
    stim[48] = 11'h2e5;
    stim[49] = 11'h138;
    stim[50] = 11'h084;
    stim[51] = 11'h173;
    stim[52] = 11'h0bc;
    stim[53] = 11'h21d;
    stim[54] = 11'h203;
    stim[55] = 11'h14b;
    stim[56] = 11'h310;
    stim[57] = 11'h0b2;
    stim[58] = 11'h1b3;
    stim[59] = 11'h02f;
    stim[60] = 11'h067;
    stim[61] = 11'h0cd;
    stim[62] = 11'h30b;
    stim[63] = 11'h1b8;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h300;
      expv[4] = 10'h38f;
      expv[5] = 10'h38f;
      expv[6] = 10'h38f;
      expv[7] = 10'h08f;
      expv[8] = 10'h08f;
      expv[9] = 10'h08f;
      expv[10] = 10'h38f;
      expv[11] = 10'h360;
      expv[12] = 10'h360;
      expv[13] = 10'h32d;
      expv[14] = 10'h32d;
      expv[15] = 10'h32d;
      expv[16] = 10'h359;
      expv[17] = 10'h059;
      expv[18] = 10'h359;
      expv[19] = 10'h059;
      expv[20] = 10'h059;
      expv[21] = 10'h059;
      expv[22] = 10'h059;
      expv[23] = 10'h304;
      expv[24] = 10'h004;
      expv[25] = 10'h004;
      expv[26] = 10'h004;
      expv[27] = 10'h304;
      expv[28] = 10'h004;
      expv[29] = 10'h304;
      expv[30] = 10'h304;
      expv[31] = 10'h004;
      expv[32] = 10'h3e9;
      expv[33] = 10'h3e9;
      expv[34] = 10'h3e9;
      expv[35] = 10'h3a2;
      expv[36] = 10'h0a2;
      expv[37] = 10'h0a2;
      expv[38] = 10'h0a2;
      expv[39] = 10'h0a2;
      expv[40] = 10'h0a2;
      expv[41] = 10'h0a2;
      expv[42] = 10'h0a2;
      expv[43] = 10'h0a2;
      expv[44] = 10'h3a2;
      expv[45] = 10'h0a2;
      expv[46] = 10'h3a2;
      expv[47] = 10'h0a2;
      expv[48] = 10'h0a2;
      expv[49] = 10'h3a2;
      expv[50] = 10'h3e5;
      expv[51] = 10'h0e5;
      expv[52] = 10'h3e5;
      expv[53] = 10'h0e5;
      expv[54] = 10'h3e5;
      expv[55] = 10'h3e5;
      expv[56] = 10'h303;
      expv[57] = 10'h003;
      expv[58] = 10'h003;
      expv[59] = 10'h303;
      expv[60] = 10'h003;
      expv[61] = 10'h003;
      expv[62] = 10'h003;
      expv[63] = 10'h003;
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
