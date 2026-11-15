// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_065895 dut (
    .clk(clk),
    .rst(in_vec[9:9]),
    .CSCnt(in_vec[8:1]),
    .CSReq(in_vec[0:0]),
    .RO0Sel(out_vec[9:7]),
    .RO1Sel(out_vec[6:4]),
    .CSAck(out_vec[3:3]),
    .matched(out_vec[2:2]),
    .noFound(out_vec[1:1]),
    .locked(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h25f;
    stim[1] = 10'h214;
    stim[2] = 10'h082;
    stim[3] = 10'h224;
    stim[4] = 10'h18a;
    stim[5] = 10'h0e0;
    stim[6] = 10'h01b;
    stim[7] = 10'h1e1;
    stim[8] = 10'h133;
    stim[9] = 10'h0b0;
    stim[10] = 10'h141;
    stim[11] = 10'h065;
    stim[12] = 10'h115;
    stim[13] = 10'h00a;
    stim[14] = 10'h02d;
    stim[15] = 10'h025;
    stim[16] = 10'h1db;
    stim[17] = 10'h048;
    stim[18] = 10'h055;
    stim[19] = 10'h0b0;
    stim[20] = 10'h1a4;
    stim[21] = 10'h056;
    stim[22] = 10'h054;
    stim[23] = 10'h057;
    stim[24] = 10'h16f;
    stim[25] = 10'h0fc;
    stim[26] = 10'h079;
    stim[27] = 10'h1db;
    stim[28] = 10'h176;
    stim[29] = 10'h1aa;
    stim[30] = 10'h192;
    stim[31] = 10'h112;
    stim[32] = 10'h050;
    stim[33] = 10'h160;
    stim[34] = 10'h0a8;
    stim[35] = 10'h1a1;
    stim[36] = 10'h18a;
    stim[37] = 10'h07c;
    stim[38] = 10'h12a;
    stim[39] = 10'h129;
    stim[40] = 10'h15d;
    stim[41] = 10'h025;
    stim[42] = 10'h07b;
    stim[43] = 10'h070;
    stim[44] = 10'h0fb;
    stim[45] = 10'h0bd;
    stim[46] = 10'h04f;
    stim[47] = 10'h1b7;
    stim[48] = 10'h038;
    stim[49] = 10'h198;
    stim[50] = 10'h161;
    stim[51] = 10'h011;
    stim[52] = 10'h007;
    stim[53] = 10'h154;
    stim[54] = 10'h0c4;
    stim[55] = 10'h076;
    stim[56] = 10'h00d;
    stim[57] = 10'h071;
    stim[58] = 10'h13f;
    stim[59] = 10'h178;
    stim[60] = 10'h00f;
    stim[61] = 10'h013;
    stim[62] = 10'h171;
    stim[63] = 10'h17b;
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
      expv[3] = 10'h000;
      expv[4] = 10'h000;
      expv[5] = 10'h070;
      expv[6] = 10'h070;
      expv[7] = 10'h078;
      expv[8] = 10'h078;
      expv[9] = 10'h078;
      expv[10] = 10'h070;
      expv[11] = 10'h078;
      expv[12] = 10'h078;
      expv[13] = 10'h078;
      expv[14] = 10'h070;
      expv[15] = 10'h078;
      expv[16] = 10'h078;
      expv[17] = 10'h078;
      expv[18] = 10'h070;
      expv[19] = 10'h078;
      expv[20] = 10'h070;
      expv[21] = 10'h070;
      expv[22] = 10'h070;
      expv[23] = 10'h070;
      expv[24] = 10'h078;
      expv[25] = 10'h078;
      expv[26] = 10'h070;
      expv[27] = 10'h078;
      expv[28] = 10'h078;
      expv[29] = 10'h070;
      expv[30] = 10'h070;
      expv[31] = 10'h070;
      expv[32] = 10'h070;
      expv[33] = 10'h070;
      expv[34] = 10'h070;
      expv[35] = 10'h070;
      expv[36] = 10'h078;
      expv[37] = 10'h070;
      expv[38] = 10'h070;
      expv[39] = 10'h070;
      expv[40] = 10'h078;
      expv[41] = 10'h078;
      expv[42] = 10'h078;
      expv[43] = 10'h078;
      expv[44] = 10'h070;
      expv[45] = 10'h070;
      expv[46] = 10'h0e8;
      expv[47] = 10'h0e8;
      expv[48] = 10'h0e8;
      expv[49] = 10'h0e0;
      expv[50] = 10'h0e0;
      expv[51] = 10'h0e8;
      expv[52] = 10'h0e8;
      expv[53] = 10'h0e8;
      expv[54] = 10'h0e0;
      expv[55] = 10'h0e0;
      expv[56] = 10'h0e0;
      expv[57] = 10'h0e8;
      expv[58] = 10'h0e8;
      expv[59] = 10'h0e8;
      expv[60] = 10'h0e0;
      expv[61] = 10'h0e8;
      expv[62] = 10'h0e8;
      expv[63] = 10'h0e8;
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
