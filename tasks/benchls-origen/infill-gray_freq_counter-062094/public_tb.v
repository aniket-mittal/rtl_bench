// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 51;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_062094 dut (
    .sysclk(clk),
    .f_in(in_vec[0:0]),
    .frequency(out_vec[50:19]),
    .freq_strobe(out_vec[18:18]),
    .diff_stream(out_vec[17:2]),
    .diff_stream_strobe(out_vec[1:1]),
    .glitch_catcher(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h1;
    stim[2] = 1'h0;
    stim[3] = 1'h1;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h1;
    stim[8] = 1'h0;
    stim[9] = 1'h0;
    stim[10] = 1'h1;
    stim[11] = 1'h0;
    stim[12] = 1'h1;
    stim[13] = 1'h0;
    stim[14] = 1'h1;
    stim[15] = 1'h1;
    stim[16] = 1'h1;
    stim[17] = 1'h1;
    stim[18] = 1'h1;
    stim[19] = 1'h0;
    stim[20] = 1'h1;
    stim[21] = 1'h1;
    stim[22] = 1'h0;
    stim[23] = 1'h0;
    stim[24] = 1'h1;
    stim[25] = 1'h0;
    stim[26] = 1'h0;
    stim[27] = 1'h1;
    stim[28] = 1'h0;
    stim[29] = 1'h0;
    stim[30] = 1'h1;
    stim[31] = 1'h1;
    stim[32] = 1'h0;
    stim[33] = 1'h1;
    stim[34] = 1'h0;
    stim[35] = 1'h1;
    stim[36] = 1'h0;
    stim[37] = 1'h1;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h1;
    stim[41] = 1'h0;
    stim[42] = 1'h0;
    stim[43] = 1'h1;
    stim[44] = 1'h0;
    stim[45] = 1'h1;
    stim[46] = 1'h0;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h1;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h1;
    stim[53] = 1'h1;
    stim[54] = 1'h1;
    stim[55] = 1'h1;
    stim[56] = 1'h0;
    stim[57] = 1'h1;
    stim[58] = 1'h0;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
    stim[61] = 1'h0;
    stim[62] = 1'h0;
    stim[63] = 1'h0;
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
      expv[0] = 51'h0007a12000000;
      expv[1] = 51'h0007a12000002;
      expv[2] = 51'h0007a12000002;
      expv[3] = 51'h0007a12000002;
      expv[4] = 51'h0007a12000002;
      expv[5] = 51'h0007a12000002;
      expv[6] = 51'h0007a12000002;
      expv[7] = 51'h0007a12000002;
      expv[8] = 51'h0007a12000002;
      expv[9] = 51'h0007a12000002;
      expv[10] = 51'h0007a12000002;
      expv[11] = 51'h0007a12000002;
      expv[12] = 51'h0007a12000003;
      expv[13] = 51'h0007a12000003;
      expv[14] = 51'h0007a12000003;
      expv[15] = 51'h0007a12000003;
      expv[16] = 51'h0007a12000003;
      expv[17] = 51'h0007a120xxxxx;
      expv[18] = 51'h0007a12000002;
      expv[19] = 51'h0007a12000003;
      expv[20] = 51'h0007a12000003;
      expv[21] = 51'h0007a12000003;
      expv[22] = 51'h0007a12000007;
      expv[23] = 51'h0007a12000003;
      expv[24] = 51'h0007a1200000b;
      expv[25] = 51'h0007a12000003;
      expv[26] = 51'h0007a12000003;
      expv[27] = 51'h0007a12000003;
      expv[28] = 51'h0007a1203ffff;
      expv[29] = 51'h0007a12000003;
      expv[30] = 51'h0007a12000003;
      expv[31] = 51'h0007a12000017;
      expv[32] = 51'h0007a12000002;
      expv[33] = 51'h0007a1203fffe;
      expv[34] = 51'h0007a12000002;
      expv[35] = 51'h0007a1203fffb;
      expv[36] = 51'h0007a12000003;
      expv[37] = 51'h0007a12000003;
      expv[38] = 51'h0007a12000003;
      expv[39] = 51'h0007a12000003;
      expv[40] = 51'h0007a12000002;
      expv[41] = 51'h0007a12000006;
      expv[42] = 51'h0007a12000002;
      expv[43] = 51'h0007a12000002;
      expv[44] = 51'h0007a12000002;
      expv[45] = 51'h0007a1200002a;
      expv[46] = 51'h0007a12000002;
      expv[47] = 51'h0007a12000002;
      expv[48] = 51'h0007a1203ffff;
      expv[49] = 51'h0007a12000003;
      expv[50] = 51'h0007a12000002;
      expv[51] = 51'h0007a1203fffa;
      expv[52] = 51'h0007a12000002;
      expv[53] = 51'h0007a12000002;
      expv[54] = 51'h0007a12000007;
      expv[55] = 51'h0007a12000003;
      expv[56] = 51'h0007a1203ffef;
      expv[57] = 51'h0007a12000002;
      expv[58] = 51'h0007a12000006;
      expv[59] = 51'h0007a12000002;
      expv[60] = 51'h0007a12000002;
      expv[61] = 51'h0007a1200000a;
      expv[62] = 51'h0007a12000002;
      expv[63] = 51'h0007a12000002;
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
