// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  ad_pnmon dut (
    .adc_clk(clk),
    .adc_valid_in(in_vec[33:33]),
    .adc_data_in(in_vec[32:17]),
    .adc_data_pn(in_vec[16:1]),
    .adc_pattern_has_zero(in_vec[0:0]),
    .adc_pn_oos(out_vec[1:1]),
    .adc_pn_err(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h15801847e;
    stim[1] = 34'h3689684b1;
    stim[2] = 34'h2d9cb8699;
    stim[3] = 34'h03129a62d;
    stim[4] = 34'h0f7201e97;
    stim[5] = 34'h16eb892e3;
    stim[6] = 34'h3c1114c03;
    stim[7] = 34'h31b4aa74a;
    stim[8] = 34'h2e93212c9;
    stim[9] = 34'h2fc53591b;
    stim[10] = 34'h32b914cb6;
    stim[11] = 34'h03436f5a1;
    stim[12] = 34'h00541d464;
    stim[13] = 34'h3ba4b4957;
    stim[14] = 34'h1e702cc5b;
    stim[15] = 34'h278a97ec0;
    stim[16] = 34'h35a5694a1;
    stim[17] = 34'h1549b9dd9;
    stim[18] = 34'h1bbff8aec;
    stim[19] = 34'h398fc6ccc;
    stim[20] = 34'h360dd692a;
    stim[21] = 34'h375a8faba;
    stim[22] = 34'h27ffbbb72;
    stim[23] = 34'h3567b4356;
    stim[24] = 34'h383e34486;
    stim[25] = 34'h09573f0e4;
    stim[26] = 34'h14eead54a;
    stim[27] = 34'h104c59d04;
    stim[28] = 34'h065eb5a1d;
    stim[29] = 34'h36136c553;
    stim[30] = 34'h29c63bbde;
    stim[31] = 34'h1e2f55448;
    stim[32] = 34'h3283addb7;
    stim[33] = 34'h2ae2d0e9f;
    stim[34] = 34'h37e65c59c;
    stim[35] = 34'h34ecd2e25;
    stim[36] = 34'h19462b710;
    stim[37] = 34'h193a4c7fc;
    stim[38] = 34'h089f0b662;
    stim[39] = 34'h1580e0809;
    stim[40] = 34'h30f7d9b48;
    stim[41] = 34'h14c0d330d;
    stim[42] = 34'h25ca197c2;
    stim[43] = 34'h327f4a822;
    stim[44] = 34'h2d250ab03;
    stim[45] = 34'h397ef3ba9;
    stim[46] = 34'h17456eefa;
    stim[47] = 34'h329800fa9;
    stim[48] = 34'h0920835f8;
    stim[49] = 34'h19bea6b18;
    stim[50] = 34'h165f13235;
    stim[51] = 34'h0fe5f1b14;
    stim[52] = 34'h351643ca7;
    stim[53] = 34'h2e911eb81;
    stim[54] = 34'h071d56b33;
    stim[55] = 34'h0a4e82dc7;
    stim[56] = 34'h3b6dbcc8b;
    stim[57] = 34'h3d62070b7;
    stim[58] = 34'h3c03547cd;
    stim[59] = 34'h009640d4d;
    stim[60] = 34'h28ab0d35e;
    stim[61] = 34'h006b3cf3d;
    stim[62] = 34'h05a96cd98;
    stim[63] = 34'h38c9d9de4;
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
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h0;
      expv[3] = 2'h1;
      expv[4] = 2'h1;
      expv[5] = 2'h1;
      expv[6] = 2'h1;
      expv[7] = 2'h1;
      expv[8] = 2'h1;
      expv[9] = 2'h1;
      expv[10] = 2'h1;
      expv[11] = 2'h1;
      expv[12] = 2'h1;
      expv[13] = 2'h1;
      expv[14] = 2'h1;
      expv[15] = 2'h1;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h1;
      expv[19] = 2'h1;
      expv[20] = 2'h1;
      expv[21] = 2'h1;
      expv[22] = 2'h1;
      expv[23] = 2'h1;
      expv[24] = 2'h1;
      expv[25] = 2'h1;
      expv[26] = 2'h3;
      expv[27] = 2'h3;
      expv[28] = 2'h3;
      expv[29] = 2'h3;
      expv[30] = 2'h3;
      expv[31] = 2'h2;
      expv[32] = 2'h2;
      expv[33] = 2'h2;
      expv[34] = 2'h2;
      expv[35] = 2'h2;
      expv[36] = 2'h2;
      expv[37] = 2'h2;
      expv[38] = 2'h2;
      expv[39] = 2'h2;
      expv[40] = 2'h2;
      expv[41] = 2'h2;
      expv[42] = 2'h2;
      expv[43] = 2'h2;
      expv[44] = 2'h2;
      expv[45] = 2'h2;
      expv[46] = 2'h2;
      expv[47] = 2'h2;
      expv[48] = 2'h2;
      expv[49] = 2'h2;
      expv[50] = 2'h2;
      expv[51] = 2'h2;
      expv[52] = 2'h2;
      expv[53] = 2'h2;
      expv[54] = 2'h2;
      expv[55] = 2'h2;
      expv[56] = 2'h2;
      expv[57] = 2'h2;
      expv[58] = 2'h2;
      expv[59] = 2'h2;
      expv[60] = 2'h2;
      expv[61] = 2'h2;
      expv[62] = 2'h2;
      expv[63] = 2'h2;
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
