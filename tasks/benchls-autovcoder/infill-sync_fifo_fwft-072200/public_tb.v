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

  autovcoder_072200 dut (
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
    stim[0] = 12'ha84;
    stim[1] = 12'hb2e;
    stim[2] = 12'h098;
    stim[3] = 12'h22d;
    stim[4] = 12'h795;
    stim[5] = 12'h61f;
    stim[6] = 12'h7af;
    stim[7] = 12'h510;
    stim[8] = 12'h0c2;
    stim[9] = 12'h78c;
    stim[10] = 12'h520;
    stim[11] = 12'h0fc;
    stim[12] = 12'h498;
    stim[13] = 12'h5a6;
    stim[14] = 12'h1f2;
    stim[15] = 12'h0e7;
    stim[16] = 12'h1b1;
    stim[17] = 12'h0df;
    stim[18] = 12'h710;
    stim[19] = 12'h5a9;
    stim[20] = 12'h7aa;
    stim[21] = 12'h70f;
    stim[22] = 12'h7dd;
    stim[23] = 12'h3e7;
    stim[24] = 12'h59b;
    stim[25] = 12'h534;
    stim[26] = 12'h625;
    stim[27] = 12'h118;
    stim[28] = 12'h5ed;
    stim[29] = 12'h2ac;
    stim[30] = 12'h4d6;
    stim[31] = 12'h34a;
    stim[32] = 12'h045;
    stim[33] = 12'h32e;
    stim[34] = 12'h0f1;
    stim[35] = 12'h6a4;
    stim[36] = 12'h746;
    stim[37] = 12'h46a;
    stim[38] = 12'h12e;
    stim[39] = 12'h2c9;
    stim[40] = 12'h38c;
    stim[41] = 12'h5ce;
    stim[42] = 12'h0f3;
    stim[43] = 12'h181;
    stim[44] = 12'h30a;
    stim[45] = 12'h298;
    stim[46] = 12'h091;
    stim[47] = 12'h7ca;
    stim[48] = 12'h4df;
    stim[49] = 12'h654;
    stim[50] = 12'h1e6;
    stim[51] = 12'h4d9;
    stim[52] = 12'h309;
    stim[53] = 12'h75f;
    stim[54] = 12'h598;
    stim[55] = 12'h31e;
    stim[56] = 12'h6f2;
    stim[57] = 12'h77a;
    stim[58] = 12'h1df;
    stim[59] = 12'h28f;
    stim[60] = 12'h288;
    stim[61] = 12'h467;
    stim[62] = 12'h18d;
    stim[63] = 12'h247;
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
      expv[3] = 10'h100;
      expv[4] = 10'h100;
      expv[5] = 10'h1xx;
      expv[6] = 10'h395;
      expv[7] = 10'h195;
      expv[8] = 10'h3af;
      expv[9] = 10'h3af;
      expv[10] = 10'h310;
      expv[11] = 10'h310;
      expv[12] = 10'h310;
      expv[13] = 10'h310;
      expv[14] = 10'h310;
      expv[15] = 10'h310;
      expv[16] = 10'h310;
      expv[17] = 10'h310;
      expv[18] = 10'h310;
      expv[19] = 10'h38c;
      expv[20] = 10'h38c;
      expv[21] = 10'h320;
      expv[22] = 10'h3a6;
      expv[23] = 10'h310;
      expv[24] = 10'h310;
      expv[25] = 10'h310;
      expv[26] = 10'h310;
      expv[27] = 10'h3a9;
      expv[28] = 10'h3a9;
      expv[29] = 10'h3a9;
      expv[30] = 10'h3a9;
      expv[31] = 10'h3a9;
      expv[32] = 10'h3a9;
      expv[33] = 10'h3a9;
      expv[34] = 10'h3a9;
      expv[35] = 10'h3a9;
      expv[36] = 10'h3aa;
      expv[37] = 10'h30f;
      expv[38] = 10'h30f;
      expv[39] = 10'h30f;
      expv[40] = 10'h30f;
      expv[41] = 10'h30f;
      expv[42] = 10'h30f;
      expv[43] = 10'h30f;
      expv[44] = 10'h30f;
      expv[45] = 10'h30f;
      expv[46] = 10'h30f;
      expv[47] = 10'h30f;
      expv[48] = 10'h3dd;
      expv[49] = 10'h3dd;
      expv[50] = 10'h39b;
      expv[51] = 10'h39b;
      expv[52] = 10'h39b;
      expv[53] = 10'h39b;
      expv[54] = 10'h334;
      expv[55] = 10'h334;
      expv[56] = 10'h334;
      expv[57] = 10'h3ed;
      expv[58] = 10'h346;
      expv[59] = 10'h346;
      expv[60] = 10'h346;
      expv[61] = 10'h346;
      expv[62] = 10'h346;
      expv[63] = 10'h346;
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
