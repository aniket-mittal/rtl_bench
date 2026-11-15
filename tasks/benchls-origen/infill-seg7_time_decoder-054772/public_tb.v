// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_054772 dut (
    .seconds_ones(in_vec[11:8]),
    .seconds_tens(in_vec[7:4]),
    .minutes(in_vec[3:0]),
    .seconds_ones_out(out_vec[20:14]),
    .seconds_tens_out(out_vec[13:7]),
    .minutes_out(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'had2;
    stim[1] = 12'h812;
    stim[2] = 12'h6b9;
    stim[3] = 12'h795;
    stim[4] = 12'ha59;
    stim[5] = 12'h5d5;
    stim[6] = 12'ha57;
    stim[7] = 12'h1a9;
    stim[8] = 12'hbee;
    stim[9] = 12'h3a3;
    stim[10] = 12'ha66;
    stim[11] = 12'hf84;
    stim[12] = 12'hc2e;
    stim[13] = 12'hfec;
    stim[14] = 12'h746;
    stim[15] = 12'he15;
    stim[16] = 12'h6c0;
    stim[17] = 12'h0c9;
    stim[18] = 12'h5a1;
    stim[19] = 12'haf8;
    stim[20] = 12'hfd0;
    stim[21] = 12'hcf0;
    stim[22] = 12'hbee;
    stim[23] = 12'he55;
    stim[24] = 12'h764;
    stim[25] = 12'hecd;
    stim[26] = 12'h056;
    stim[27] = 12'h052;
    stim[28] = 12'h606;
    stim[29] = 12'hcba;
    stim[30] = 12'h25b;
    stim[31] = 12'h8e4;
    stim[32] = 12'hba9;
    stim[33] = 12'hef3;
    stim[34] = 12'hb3b;
    stim[35] = 12'h175;
    stim[36] = 12'he93;
    stim[37] = 12'h6ac;
    stim[38] = 12'hf0e;
    stim[39] = 12'h706;
    stim[40] = 12'h4bf;
    stim[41] = 12'h22e;
    stim[42] = 12'hcab;
    stim[43] = 12'h09f;
    stim[44] = 12'h478;
    stim[45] = 12'hf6c;
    stim[46] = 12'h357;
    stim[47] = 12'h11e;
    stim[48] = 12'h61e;
    stim[49] = 12'hf3f;
    stim[50] = 12'h382;
    stim[51] = 12'hee1;
    stim[52] = 12'h4d5;
    stim[53] = 12'h5e3;
    stim[54] = 12'hfac;
    stim[55] = 12'hcaf;
    stim[56] = 12'h4f3;
    stim[57] = 12'hc0c;
    stim[58] = 12'h743;
    stim[59] = 12'hcab;
    stim[60] = 12'h63f;
    stim[61] = 12'hfde;
    stim[62] = 12'hcbb;
    stim[63] = 12'hc1f;
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
      expv[0] = 21'h1fff92;
      expv[1] = 21'h002792;
      expv[2] = 21'h083f84;
      expv[3] = 21'h037fa4;
      expv[4] = 21'h1fd204;
      expv[5] = 21'h093fa4;
      expv[6] = 21'h1fd20d;
      expv[7] = 21'h13ff84;
      expv[8] = 21'h1fffff;
      expv[9] = 21'h01bf86;
      expv[10] = 21'h1fffa0;
      expv[11] = 21'h1fffcc;
      expv[12] = 21'h1fc97f;
      expv[13] = 21'h1fffff;
      expv[14] = 21'h036620;
      expv[15] = 21'h1fe7a4;
      expv[16] = 21'h083f81;
      expv[17] = 21'h007f84;
      expv[18] = 21'h093fcf;
      expv[19] = 21'h1fff80;
      expv[20] = 21'h1fff81;
      expv[21] = 21'h1fff81;
      expv[22] = 21'h1fffff;
      expv[23] = 21'h1fd224;
      expv[24] = 21'h037fcc;
      expv[25] = 21'h1fffff;
      expv[26] = 21'h005220;
      expv[27] = 21'h005212;
      expv[28] = 21'h0800a0;
      expv[29] = 21'h1fffff;
      expv[30] = 21'h04927f;
      expv[31] = 21'h003fcc;
      expv[32] = 21'h1fff84;
      expv[33] = 21'h1fff86;
      expv[34] = 21'h1fc37f;
      expv[35] = 21'h13ffa4;
      expv[36] = 21'h1fff86;
      expv[37] = 21'h083fff;
      expv[38] = 21'h1fc0ff;
      expv[39] = 21'h0340a0;
      expv[40] = 21'h133fff;
      expv[41] = 21'h04897f;
      expv[42] = 21'h1fffff;
      expv[43] = 21'h007fff;
      expv[44] = 21'h133f80;
      expv[45] = 21'h1fffff;
      expv[46] = 21'h01920d;
      expv[47] = 21'h13e7ff;
      expv[48] = 21'h0827ff;
      expv[49] = 21'h1fc37f;
      expv[50] = 21'h01bf92;
      expv[51] = 21'h1fffcf;
      expv[52] = 21'h133fa4;
      expv[53] = 21'h093f86;
      expv[54] = 21'h1fffff;
      expv[55] = 21'h1fffff;
      expv[56] = 21'h133f86;
      expv[57] = 21'h1fc0ff;
      expv[58] = 21'h036606;
      expv[59] = 21'h1fffff;
      expv[60] = 21'h08037f;
      expv[61] = 21'h1fffff;
      expv[62] = 21'h1fffff;
      expv[63] = 21'h1fe7ff;
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
