// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_006348 dut (
    .SCLK(clk),
    .RESET(in_vec[10:10]),
    .RX(in_vec[9:9]),
    .TX_VALID(in_vec[8:8]),
    .TX_DATA_IN(in_vec[7:0]),
    .RX_VALID(out_vec[11:11]),
    .RX_PARITY(out_vec[10:10]),
    .RX_DATA_OUT(out_vec[9:2]),
    .TX(out_vec[1:1]),
    .TX_READY(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h7ce;
    stim[1] = 11'h503;
    stim[2] = 11'h1b7;
    stim[3] = 11'h06f;
    stim[4] = 11'h32e;
    stim[5] = 11'h125;
    stim[6] = 11'h145;
    stim[7] = 11'h073;
    stim[8] = 11'h020;
    stim[9] = 11'h296;
    stim[10] = 11'h18f;
    stim[11] = 11'h30a;
    stim[12] = 11'h0f0;
    stim[13] = 11'h1b2;
    stim[14] = 11'h089;
    stim[15] = 11'h121;
    stim[16] = 11'h086;
    stim[17] = 11'h114;
    stim[18] = 11'h025;
    stim[19] = 11'h6df;
    stim[20] = 11'h31b;
    stim[21] = 11'h16f;
    stim[22] = 11'h1c5;
    stim[23] = 11'h387;
    stim[24] = 11'h188;
    stim[25] = 11'h250;
    stim[26] = 11'h19c;
    stim[27] = 11'h0a0;
    stim[28] = 11'h0b0;
    stim[29] = 11'h161;
    stim[30] = 11'h00a;
    stim[31] = 11'h1ff;
    stim[32] = 11'h11f;
    stim[33] = 11'h0b6;
    stim[34] = 11'h252;
    stim[35] = 11'h2cd;
    stim[36] = 11'h115;
    stim[37] = 11'h2a1;
    stim[38] = 11'h1f2;
    stim[39] = 11'h20d;
    stim[40] = 11'h2b4;
    stim[41] = 11'h126;
    stim[42] = 11'h029;
    stim[43] = 11'h15a;
    stim[44] = 11'h494;
    stim[45] = 11'h318;
    stim[46] = 11'h2cd;
    stim[47] = 11'h23c;
    stim[48] = 11'h0d0;
    stim[49] = 11'h3be;
    stim[50] = 11'h224;
    stim[51] = 11'h2d5;
    stim[52] = 11'h3ac;
    stim[53] = 11'h073;
    stim[54] = 11'h0ee;
    stim[55] = 11'h2de;
    stim[56] = 11'h1a3;
    stim[57] = 11'h3af;
    stim[58] = 11'h34f;
    stim[59] = 11'h266;
    stim[60] = 11'h11d;
    stim[61] = 11'h2f6;
    stim[62] = 11'h1d0;
    stim[63] = 11'h254;
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
      expv[0] = 12'h003;
      expv[1] = 12'h003;
      expv[2] = 12'h003;
      expv[3] = 12'h003;
      expv[4] = 12'h003;
      expv[5] = 12'h003;
      expv[6] = 12'h003;
      expv[7] = 12'h003;
      expv[8] = 12'h003;
      expv[9] = 12'h003;
      expv[10] = 12'h003;
      expv[11] = 12'h003;
      expv[12] = 12'h003;
      expv[13] = 12'h003;
      expv[14] = 12'h003;
      expv[15] = 12'h003;
      expv[16] = 12'h003;
      expv[17] = 12'h003;
      expv[18] = 12'h003;
      expv[19] = 12'h003;
      expv[20] = 12'h003;
      expv[21] = 12'h003;
      expv[22] = 12'h003;
      expv[23] = 12'h003;
      expv[24] = 12'h003;
      expv[25] = 12'h003;
      expv[26] = 12'h003;
      expv[27] = 12'h003;
      expv[28] = 12'h003;
      expv[29] = 12'h003;
      expv[30] = 12'h003;
      expv[31] = 12'h003;
      expv[32] = 12'h003;
      expv[33] = 12'h003;
      expv[34] = 12'h003;
      expv[35] = 12'h003;
      expv[36] = 12'h003;
      expv[37] = 12'h003;
      expv[38] = 12'h003;
      expv[39] = 12'h003;
      expv[40] = 12'h003;
      expv[41] = 12'h003;
      expv[42] = 12'h003;
      expv[43] = 12'h003;
      expv[44] = 12'h003;
      expv[45] = 12'h003;
      expv[46] = 12'h003;
      expv[47] = 12'h003;
      expv[48] = 12'h003;
      expv[49] = 12'h003;
      expv[50] = 12'h003;
      expv[51] = 12'h003;
      expv[52] = 12'h003;
      expv[53] = 12'h003;
      expv[54] = 12'h003;
      expv[55] = 12'h003;
      expv[56] = 12'h003;
      expv[57] = 12'h003;
      expv[58] = 12'h003;
      expv[59] = 12'h003;
      expv[60] = 12'h003;
      expv[61] = 12'h003;
      expv[62] = 12'h003;
      expv[63] = 12'h003;
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
