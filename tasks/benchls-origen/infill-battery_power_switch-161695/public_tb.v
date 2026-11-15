// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_161695 dut (
    .MCU_CLK_IN(clk),
    .nRST(in_vec[13:13]),
    .MCU_IN_BATT_1_EN(in_vec[12:12]),
    .MCU_IN_BATT_2_EN(in_vec[11:11]),
    .MCU_IN_BATT_BOTH_EN(in_vec[10:10]),
    .MCU_IN_EN(in_vec[9:1]),
    .KILLSWITCH_RED(in_vec[0:0]),
    .BATT_1_EN(out_vec[12:12]),
    .BATT_2_EN(out_vec[11:11]),
    .nBATT_BOTH_EN(out_vec[10:10]),
    .PWR_OUT_EN(out_vec[9:3]),
    .nPWR_OUT_EN_8(out_vec[2:2]),
    .nPWR_OUT_EN_9(out_vec[1:1]),
    .MCU_OUT_KILLSWITCH_ACTIVE(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h29b5;
    stim[1] = 14'h2694;
    stim[2] = 14'h0a8b;
    stim[3] = 14'h0f2e;
    stim[4] = 14'h12a4;
    stim[5] = 14'h0c14;
    stim[6] = 14'h092a;
    stim[7] = 14'h055a;
    stim[8] = 14'h0e8a;
    stim[9] = 14'h01c8;
    stim[10] = 14'h0bb5;
    stim[11] = 14'h18a8;
    stim[12] = 14'h1350;
    stim[13] = 14'h08e7;
    stim[14] = 14'h0e66;
    stim[15] = 14'h1d04;
    stim[16] = 14'h0684;
    stim[17] = 14'h1619;
    stim[18] = 14'h029f;
    stim[19] = 14'h0daa;
    stim[20] = 14'h1ffc;
    stim[21] = 14'h39a3;
    stim[22] = 14'h0334;
    stim[23] = 14'h0a21;
    stim[24] = 14'h179b;
    stim[25] = 14'h0187;
    stim[26] = 14'h0fd6;
    stim[27] = 14'h17ed;
    stim[28] = 14'h17b1;
    stim[29] = 14'h1437;
    stim[30] = 14'h0053;
    stim[31] = 14'h1915;
    stim[32] = 14'h1b6c;
    stim[33] = 14'h149e;
    stim[34] = 14'h3b88;
    stim[35] = 14'h1961;
    stim[36] = 14'h1c54;
    stim[37] = 14'h091c;
    stim[38] = 14'h0c04;
    stim[39] = 14'h05ca;
    stim[40] = 14'h135a;
    stim[41] = 14'h00c1;
    stim[42] = 14'h0c4e;
    stim[43] = 14'h181d;
    stim[44] = 14'h0417;
    stim[45] = 14'h1d56;
    stim[46] = 14'h0503;
    stim[47] = 14'h1322;
    stim[48] = 14'h0ffc;
    stim[49] = 14'h001f;
    stim[50] = 14'h0ac7;
    stim[51] = 14'h01d9;
    stim[52] = 14'h1f2d;
    stim[53] = 14'h1192;
    stim[54] = 14'h016c;
    stim[55] = 14'h15c2;
    stim[56] = 14'h18b3;
    stim[57] = 14'h0f6c;
    stim[58] = 14'h0f97;
    stim[59] = 14'h07f3;
    stim[60] = 14'h0fff;
    stim[61] = 14'h0478;
    stim[62] = 14'h0495;
    stim[63] = 14'h1fff;
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
      expv[0] = 13'h0406;
      expv[1] = 13'h0ed3;
      expv[2] = 13'h0406;
      expv[3] = 13'h040e;
      expv[4] = 13'h0406;
      expv[5] = 13'h0406;
      expv[6] = 13'h040e;
      expv[7] = 13'h040e;
      expv[8] = 13'h040e;
      expv[9] = 13'h0406;
      expv[10] = 13'h0406;
      expv[11] = 13'h0406;
      expv[12] = 13'h0406;
      expv[13] = 13'h040e;
      expv[14] = 13'h040e;
      expv[15] = 13'h0406;
      expv[16] = 13'h0406;
      expv[17] = 13'h0406;
      expv[18] = 13'h040e;
      expv[19] = 13'h040e;
      expv[20] = 13'h0406;
      expv[21] = 13'h040e;
      expv[22] = 13'h0406;
      expv[23] = 13'h0406;
      expv[24] = 13'h040e;
      expv[25] = 13'h040e;
      expv[26] = 13'h040e;
      expv[27] = 13'h0406;
      expv[28] = 13'h0406;
      expv[29] = 13'h040e;
      expv[30] = 13'h040e;
      expv[31] = 13'h0406;
      expv[32] = 13'h0406;
      expv[33] = 13'h040e;
      expv[34] = 13'h0406;
      expv[35] = 13'h0406;
      expv[36] = 13'h0406;
      expv[37] = 13'h0406;
      expv[38] = 13'h0406;
      expv[39] = 13'h040e;
      expv[40] = 13'h040e;
      expv[41] = 13'h0406;
      expv[42] = 13'h040e;
      expv[43] = 13'h0406;
      expv[44] = 13'h040e;
      expv[45] = 13'h040e;
      expv[46] = 13'h040e;
      expv[47] = 13'h040e;
      expv[48] = 13'h0406;
      expv[49] = 13'h040e;
      expv[50] = 13'h040e;
      expv[51] = 13'h0406;
      expv[52] = 13'h0406;
      expv[53] = 13'h040e;
      expv[54] = 13'h0406;
      expv[55] = 13'h040e;
      expv[56] = 13'h040e;
      expv[57] = 13'h0406;
      expv[58] = 13'h040e;
      expv[59] = 13'h040e;
      expv[60] = 13'h040e;
      expv[61] = 13'h0406;
      expv[62] = 13'h0406;
      expv[63] = 13'h040e;
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
