// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_104371 dut (
    .switch(in_vec[8:8]),
    .med(in_vec[7:4]),
    .low(in_vec[3:0]),
    .sel(out_vec[11:8]),
    .data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h135;
    stim[1] = 9'h1b9;
    stim[2] = 9'h175;
    stim[3] = 9'h1cd;
    stim[4] = 9'h1a1;
    stim[5] = 9'h083;
    stim[6] = 9'h1af;
    stim[7] = 9'h14e;
    stim[8] = 9'h1ec;
    stim[9] = 9'h168;
    stim[10] = 9'h19d;
    stim[11] = 9'h0e0;
    stim[12] = 9'h165;
    stim[13] = 9'h01f;
    stim[14] = 9'h19d;
    stim[15] = 9'h0f3;
    stim[16] = 9'h156;
    stim[17] = 9'h13a;
    stim[18] = 9'h162;
    stim[19] = 9'h06f;
    stim[20] = 9'h178;
    stim[21] = 9'h1c3;
    stim[22] = 9'h0d7;
    stim[23] = 9'h128;
    stim[24] = 9'h16f;
    stim[25] = 9'h174;
    stim[26] = 9'h1bf;
    stim[27] = 9'h1a4;
    stim[28] = 9'h03e;
    stim[29] = 9'h0ea;
    stim[30] = 9'h0c8;
    stim[31] = 9'h141;
    stim[32] = 9'h0be;
    stim[33] = 9'h132;
    stim[34] = 9'h0fd;
    stim[35] = 9'h1a0;
    stim[36] = 9'h199;
    stim[37] = 9'h060;
    stim[38] = 9'h1a1;
    stim[39] = 9'h157;
    stim[40] = 9'h144;
    stim[41] = 9'h0ed;
    stim[42] = 9'h1b3;
    stim[43] = 9'h1bd;
    stim[44] = 9'h088;
    stim[45] = 9'h0d0;
    stim[46] = 9'h07a;
    stim[47] = 9'h009;
    stim[48] = 9'h13e;
    stim[49] = 9'h0d2;
    stim[50] = 9'h1f6;
    stim[51] = 9'h0d5;
    stim[52] = 9'h109;
    stim[53] = 9'h04c;
    stim[54] = 9'h0cf;
    stim[55] = 9'h026;
    stim[56] = 9'h0fb;
    stim[57] = 9'h1d2;
    stim[58] = 9'h169;
    stim[59] = 9'h0b1;
    stim[60] = 9'h11a;
    stim[61] = 9'h068;
    stim[62] = 9'h0ea;
    stim[63] = 9'h0b6;
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
      expv[0] = 12'hd91;
      expv[1] = 12'hd91;
      expv[2] = 12'hd91;
      expv[3] = 12'hd91;
      expv[4] = 12'hd91;
      expv[5] = 12'he91;
      expv[6] = 12'hdff;
      expv[7] = 12'hd91;
      expv[8] = 12'hd91;
      expv[9] = 12'hd91;
      expv[10] = 12'hd91;
      expv[11] = 12'he91;
      expv[12] = 12'hd41;
      expv[13] = 12'he91;
      expv[14] = 12'hdff;
      expv[15] = 12'he91;
      expv[16] = 12'hd49;
      expv[17] = 12'hd91;
      expv[18] = 12'hd91;
      expv[19] = 12'he91;
      expv[20] = 12'hd1f;
      expv[21] = 12'hd91;
      expv[22] = 12'he91;
      expv[23] = 12'hd25;
      expv[24] = 12'hd91;
      expv[25] = 12'hd91;
      expv[26] = 12'hd91;
      expv[27] = 12'hd91;
      expv[28] = 12'he91;
      expv[29] = 12'heff;
      expv[30] = 12'heff;
      expv[31] = 12'hd99;
      expv[32] = 12'he91;
      expv[33] = 12'hd0d;
      expv[34] = 12'he91;
      expv[35] = 12'hdff;
      expv[36] = 12'hd91;
      expv[37] = 12'he91;
      expv[38] = 12'hdff;
      expv[39] = 12'hd91;
      expv[40] = 12'hd91;
      expv[41] = 12'he91;
      expv[42] = 12'hdff;
      expv[43] = 12'hd91;
      expv[44] = 12'he91;
      expv[45] = 12'heff;
      expv[46] = 12'he1f;
      expv[47] = 12'heff;
      expv[48] = 12'hd0d;
      expv[49] = 12'he91;
      expv[50] = 12'hdff;
      expv[51] = 12'he91;
      expv[52] = 12'hdff;
      expv[53] = 12'he91;
      expv[54] = 12'heff;
      expv[55] = 12'he25;
      expv[56] = 12'heff;
      expv[57] = 12'hdff;
      expv[58] = 12'hd91;
      expv[59] = 12'he91;
      expv[60] = 12'hd9f;
      expv[61] = 12'he91;
      expv[62] = 12'heff;
      expv[63] = 12'heff;
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
