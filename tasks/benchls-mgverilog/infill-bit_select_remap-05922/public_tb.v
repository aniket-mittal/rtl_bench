// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_05922 dut (
    .in(in_vec[14:0]),
    .out(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h33f9;
    stim[1] = 15'h1511;
    stim[2] = 15'h484d;
    stim[3] = 15'h603b;
    stim[4] = 15'h17af;
    stim[5] = 15'h4b77;
    stim[6] = 15'h5499;
    stim[7] = 15'h7298;
    stim[8] = 15'h681a;
    stim[9] = 15'h27d2;
    stim[10] = 15'h27b9;
    stim[11] = 15'h55a0;
    stim[12] = 15'h0e00;
    stim[13] = 15'h4abf;
    stim[14] = 15'h692b;
    stim[15] = 15'h7117;
    stim[16] = 15'h04cb;
    stim[17] = 15'h3905;
    stim[18] = 15'h2538;
    stim[19] = 15'h5b2e;
    stim[20] = 15'h63de;
    stim[21] = 15'h1be7;
    stim[22] = 15'h1ea4;
    stim[23] = 15'h372c;
    stim[24] = 15'h5328;
    stim[25] = 15'h3147;
    stim[26] = 15'h281d;
    stim[27] = 15'h439d;
    stim[28] = 15'h6407;
    stim[29] = 15'h1472;
    stim[30] = 15'h673e;
    stim[31] = 15'h79ea;
    stim[32] = 15'h0d6b;
    stim[33] = 15'h44a0;
    stim[34] = 15'h0fef;
    stim[35] = 15'h71aa;
    stim[36] = 15'h4816;
    stim[37] = 15'h3907;
    stim[38] = 15'h6ec8;
    stim[39] = 15'h7e43;
    stim[40] = 15'h06a0;
    stim[41] = 15'h0197;
    stim[42] = 15'h2a4d;
    stim[43] = 15'h5188;
    stim[44] = 15'h7be5;
    stim[45] = 15'h4077;
    stim[46] = 15'h0ff4;
    stim[47] = 15'h796b;
    stim[48] = 15'h0c19;
    stim[49] = 15'h6b25;
    stim[50] = 15'h641c;
    stim[51] = 15'h045a;
    stim[52] = 15'h00cf;
    stim[53] = 15'h4ab8;
    stim[54] = 15'h7ce2;
    stim[55] = 15'h0ca9;
    stim[56] = 15'h3b7c;
    stim[57] = 15'h65e8;
    stim[58] = 15'h214c;
    stim[59] = 15'h007b;
    stim[60] = 15'h609c;
    stim[61] = 15'h7d72;
    stim[62] = 15'h0ce5;
    stim[63] = 15'h5f49;
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
      expv[0] = 11'h33e;
      expv[1] = 11'h152;
      expv[2] = 11'h489;
      expv[3] = 11'h606;
      expv[4] = 11'h175;
      expv[5] = 11'h4bf;
      expv[6] = 11'h542;
      expv[7] = 11'h722;
      expv[8] = 11'h682;
      expv[9] = 11'h27a;
      expv[10] = 11'h276;
      expv[11] = 11'h554;
      expv[12] = 11'h0e0;
      expv[13] = 11'h4a7;
      expv[14] = 11'h694;
      expv[15] = 11'h713;
      expv[16] = 11'h048;
      expv[17] = 11'h391;
      expv[18] = 11'h256;
      expv[19] = 11'h5b5;
      expv[20] = 11'h63b;
      expv[21] = 11'h1bd;
      expv[22] = 11'h1e5;
      expv[23] = 11'h375;
      expv[24] = 11'h534;
      expv[25] = 11'h319;
      expv[26] = 11'h283;
      expv[27] = 11'h433;
      expv[28] = 11'h641;
      expv[29] = 11'h14e;
      expv[30] = 11'h677;
      expv[31] = 11'h79c;
      expv[32] = 11'h0dc;
      expv[33] = 11'h444;
      expv[34] = 11'h0fd;
      expv[35] = 11'h714;
      expv[36] = 11'h483;
      expv[37] = 11'h391;
      expv[38] = 11'h6e8;
      expv[39] = 11'h7e8;
      expv[40] = 11'h064;
      expv[41] = 11'h013;
      expv[42] = 11'h2a9;
      expv[43] = 11'h510;
      expv[44] = 11'h7bd;
      expv[45] = 11'h40f;
      expv[46] = 11'h0ff;
      expv[47] = 11'h79c;
      expv[48] = 11'h0c2;
      expv[49] = 11'h6b5;
      expv[50] = 11'h643;
      expv[51] = 11'h04a;
      expv[52] = 11'h009;
      expv[53] = 11'h4a6;
      expv[54] = 11'h7cc;
      expv[55] = 11'h0c4;
      expv[56] = 11'h3bf;
      expv[57] = 11'h65c;
      expv[58] = 11'h219;
      expv[59] = 11'h00e;
      expv[60] = 11'h603;
      expv[61] = 11'h7de;
      expv[62] = 11'h0cd;
      expv[63] = 11'h5f8;
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
