// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_078539 dut (
    .iCLK(clk),
    .iTxD_DATA(in_vec[12:5]),
    .iTxD_Start(in_vec[4:4]),
    .iRST_n(in_vec[3:3]),
    .TDI(in_vec[2:2]),
    .TCS(in_vec[1:1]),
    .TCK(in_vec[0:0]),
    .oRxD_DATA(out_vec[10:3]),
    .oTxD_Done(out_vec[2:2]),
    .oRxD_Ready(out_vec[1:1]),
    .TDO(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h05a6;
    stim[1] = 13'h1e45;
    stim[2] = 13'h0b1a;
    stim[3] = 13'h0538;
    stim[4] = 13'h02ae;
    stim[5] = 13'h15e8;
    stim[6] = 13'h0d2d;
    stim[7] = 13'h10ea;
    stim[8] = 13'h0c4c;
    stim[9] = 13'h1719;
    stim[10] = 13'h06ac;
    stim[11] = 13'h196d;
    stim[12] = 13'h162e;
    stim[13] = 13'h14cc;
    stim[14] = 13'h109c;
    stim[15] = 13'h165d;
    stim[16] = 13'h1fa6;
    stim[17] = 13'h0cdd;
    stim[18] = 13'h1fad;
    stim[19] = 13'h01ee;
    stim[20] = 13'h1c8c;
    stim[21] = 13'h1378;
    stim[22] = 13'h0e2c;
    stim[23] = 13'h14c9;
    stim[24] = 13'h1c4d;
    stim[25] = 13'h0b18;
    stim[26] = 13'h1789;
    stim[27] = 13'h0479;
    stim[28] = 13'h1628;
    stim[29] = 13'h1f2e;
    stim[30] = 13'h144f;
    stim[31] = 13'h1059;
    stim[32] = 13'h06e9;
    stim[33] = 13'h0a3d;
    stim[34] = 13'h09ca;
    stim[35] = 13'h03fe;
    stim[36] = 13'h0fea;
    stim[37] = 13'h06de;
    stim[38] = 13'h17fe;
    stim[39] = 13'h089f;
    stim[40] = 13'h011b;
    stim[41] = 13'h0c7c;
    stim[42] = 13'h1db9;
    stim[43] = 13'h18ec;
    stim[44] = 13'h0f7b;
    stim[45] = 13'h1ffe;
    stim[46] = 13'h0f7c;
    stim[47] = 13'h114f;
    stim[48] = 13'h1ea8;
    stim[49] = 13'h0d99;
    stim[50] = 13'h0c0d;
    stim[51] = 13'h12cc;
    stim[52] = 13'h079c;
    stim[53] = 13'h0d59;
    stim[54] = 13'h13bf;
    stim[55] = 13'h025c;
    stim[56] = 13'h011d;
    stim[57] = 13'h1eaf;
    stim[58] = 13'h120f;
    stim[59] = 13'h131e;
    stim[60] = 13'h108e;
    stim[61] = 13'h0c3e;
    stim[62] = 13'h09aa;
    stim[63] = 13'h0a1d;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h000;
      expv[4] = 11'h000;
      expv[5] = 11'h000;
      expv[6] = 11'h000;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h000;
      expv[10] = 11'h000;
      expv[11] = 11'h000;
      expv[12] = 11'h001;
      expv[13] = 11'h001;
      expv[14] = 11'h001;
      expv[15] = 11'h001;
      expv[16] = 11'h000;
      expv[17] = 11'h000;
      expv[18] = 11'h000;
      expv[19] = 11'h000;
      expv[20] = 11'h000;
      expv[21] = 11'h000;
      expv[22] = 11'h000;
      expv[23] = 11'h000;
      expv[24] = 11'h001;
      expv[25] = 11'h001;
      expv[26] = 11'h001;
      expv[27] = 11'h000;
      expv[28] = 11'h000;
      expv[29] = 11'h000;
      expv[30] = 11'h000;
      expv[31] = 11'h000;
      expv[32] = 11'h000;
      expv[33] = 11'h000;
      expv[34] = 11'h000;
      expv[35] = 11'h000;
      expv[36] = 11'h000;
      expv[37] = 11'h000;
      expv[38] = 11'h000;
      expv[39] = 11'h000;
      expv[40] = 11'h000;
      expv[41] = 11'h000;
      expv[42] = 11'h000;
      expv[43] = 11'h000;
      expv[44] = 11'h000;
      expv[45] = 11'h000;
      expv[46] = 11'h000;
      expv[47] = 11'h000;
      expv[48] = 11'h000;
      expv[49] = 11'h000;
      expv[50] = 11'h000;
      expv[51] = 11'h000;
      expv[52] = 11'h000;
      expv[53] = 11'h000;
      expv[54] = 11'h000;
      expv[55] = 11'h000;
      expv[56] = 11'h000;
      expv[57] = 11'h000;
      expv[58] = 11'h000;
      expv[59] = 11'h000;
      expv[60] = 11'h000;
      expv[61] = 11'h000;
      expv[62] = 11'h000;
      expv[63] = 11'h000;
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
