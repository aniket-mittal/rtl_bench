// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071710 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'he24;
    stim[1] = 12'hfb1;
    stim[2] = 12'h410;
    stim[3] = 12'h7cc;
    stim[4] = 12'h4d5;
    stim[5] = 12'h3f6;
    stim[6] = 12'h373;
    stim[7] = 12'hc5c;
    stim[8] = 12'h668;
    stim[9] = 12'h641;
    stim[10] = 12'h010;
    stim[11] = 12'h131;
    stim[12] = 12'h2fc;
    stim[13] = 12'h135;
    stim[14] = 12'h012;
    stim[15] = 12'h24a;
    stim[16] = 12'h3b3;
    stim[17] = 12'h2d3;
    stim[18] = 12'h1a0;
    stim[19] = 12'h606;
    stim[20] = 12'h2d1;
    stim[21] = 12'h3c1;
    stim[22] = 12'h3b6;
    stim[23] = 12'h535;
    stim[24] = 12'h72d;
    stim[25] = 12'h3b5;
    stim[26] = 12'h52e;
    stim[27] = 12'h28c;
    stim[28] = 12'h511;
    stim[29] = 12'h4bd;
    stim[30] = 12'h727;
    stim[31] = 12'h721;
    stim[32] = 12'h5b3;
    stim[33] = 12'h1f7;
    stim[34] = 12'h7b8;
    stim[35] = 12'h254;
    stim[36] = 12'h1e9;
    stim[37] = 12'h0ce;
    stim[38] = 12'h692;
    stim[39] = 12'h646;
    stim[40] = 12'h0f0;
    stim[41] = 12'h1a0;
    stim[42] = 12'h219;
    stim[43] = 12'h617;
    stim[44] = 12'h709;
    stim[45] = 12'h5e3;
    stim[46] = 12'h2f6;
    stim[47] = 12'h09e;
    stim[48] = 12'h729;
    stim[49] = 12'h342;
    stim[50] = 12'h381;
    stim[51] = 12'h0b8;
    stim[52] = 12'h1e3;
    stim[53] = 12'hd82;
    stim[54] = 12'h4fb;
    stim[55] = 12'h266;
    stim[56] = 12'h623;
    stim[57] = 12'h0fd;
    stim[58] = 12'h4f9;
    stim[59] = 12'h45d;
    stim[60] = 12'h3a7;
    stim[61] = 12'h00a;
    stim[62] = 12'h2ae;
    stim[63] = 12'h400;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h1b1;
      expv[4] = 10'h1b1;
      expv[5] = 10'h3cc;
      expv[6] = 10'h3cc;
      expv[7] = 10'h3cc;
      expv[8] = 10'h100;
      expv[9] = 10'h1cc;
      expv[10] = 10'h1cc;
      expv[11] = 10'h1cc;
      expv[12] = 10'h1cc;
      expv[13] = 10'h1cc;
      expv[14] = 10'h1cc;
      expv[15] = 10'h1cc;
      expv[16] = 10'h1cc;
      expv[17] = 10'h1cc;
      expv[18] = 10'h1cc;
      expv[19] = 10'h1cc;
      expv[20] = 10'h1cc;
      expv[21] = 10'h1cc;
      expv[22] = 10'h1cc;
      expv[23] = 10'h1cc;
      expv[24] = 10'h1cc;
      expv[25] = 10'h335;
      expv[26] = 10'h335;
      expv[27] = 10'h335;
      expv[28] = 10'h335;
      expv[29] = 10'h335;
      expv[30] = 10'h335;
      expv[31] = 10'h32d;
      expv[32] = 10'h32e;
      expv[33] = 10'h32e;
      expv[34] = 10'h32e;
      expv[35] = 10'h311;
      expv[36] = 10'h311;
      expv[37] = 10'h311;
      expv[38] = 10'h311;
      expv[39] = 10'h327;
      expv[40] = 10'h321;
      expv[41] = 10'h321;
      expv[42] = 10'h321;
      expv[43] = 10'h321;
      expv[44] = 10'h3b3;
      expv[45] = 10'h3b8;
      expv[46] = 10'h3b8;
      expv[47] = 10'h3b8;
      expv[48] = 10'h3b8;
      expv[49] = 10'h309;
      expv[50] = 10'h309;
      expv[51] = 10'h309;
      expv[52] = 10'h309;
      expv[53] = 10'h309;
      expv[54] = 10'h100;
      expv[55] = 10'h182;
      expv[56] = 10'h182;
      expv[57] = 10'h182;
      expv[58] = 10'h182;
      expv[59] = 10'h182;
      expv[60] = 10'h182;
      expv[61] = 10'h182;
      expv[62] = 10'h182;
      expv[63] = 10'h182;
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
