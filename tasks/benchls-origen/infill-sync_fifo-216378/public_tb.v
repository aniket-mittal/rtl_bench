// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_216378 dut (
    .i_clk(clk),
    .i_rts_n(in_vec[10:10]),
    .i_data(in_vec[9:2]),
    .i_push(in_vec[1:1]),
    .i_pop(in_vec[0:0]),
    .o_data(out_vec[9:2]),
    .o_empty(out_vec[1:1]),
    .o_full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h3c0;
    stim[1] = 11'h2a2;
    stim[2] = 11'h6d3;
    stim[3] = 11'h6e7;
    stim[4] = 11'h768;
    stim[5] = 11'h7aa;
    stim[6] = 11'h748;
    stim[7] = 11'h405;
    stim[8] = 11'h4c5;
    stim[9] = 11'h642;
    stim[10] = 11'h61b;
    stim[11] = 11'h6cd;
    stim[12] = 11'h465;
    stim[13] = 11'h6f9;
    stim[14] = 11'h687;
    stim[15] = 11'h557;
    stim[16] = 11'h64b;
    stim[17] = 11'h763;
    stim[18] = 11'h7d8;
    stim[19] = 11'h6b2;
    stim[20] = 11'h524;
    stim[21] = 11'h774;
    stim[22] = 11'h071;
    stim[23] = 11'h63a;
    stim[24] = 11'h7bc;
    stim[25] = 11'h62e;
    stim[26] = 11'h523;
    stim[27] = 11'h5ef;
    stim[28] = 11'h525;
    stim[29] = 11'h6c0;
    stim[30] = 11'h5f6;
    stim[31] = 11'h791;
    stim[32] = 11'h4cd;
    stim[33] = 11'h751;
    stim[34] = 11'h780;
    stim[35] = 11'h4e7;
    stim[36] = 11'h581;
    stim[37] = 11'h472;
    stim[38] = 11'h768;
    stim[39] = 11'h6e3;
    stim[40] = 11'h4e4;
    stim[41] = 11'h418;
    stim[42] = 11'h6c8;
    stim[43] = 11'h582;
    stim[44] = 11'h79a;
    stim[45] = 11'h65a;
    stim[46] = 11'h035;
    stim[47] = 11'h694;
    stim[48] = 11'h5f9;
    stim[49] = 11'h7e9;
    stim[50] = 11'h75c;
    stim[51] = 11'h72a;
    stim[52] = 11'h3d1;
    stim[53] = 11'h4eb;
    stim[54] = 11'h4c7;
    stim[55] = 11'h570;
    stim[56] = 11'h719;
    stim[57] = 11'h7d9;
    stim[58] = 11'h50b;
    stim[59] = 11'h723;
    stim[60] = 11'h695;
    stim[61] = 11'h760;
    stim[62] = 11'h7e0;
    stim[63] = 11'h72c;
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
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'h2d0;
      expv[4] = 10'h2e6;
      expv[5] = 10'h2e6;
      expv[6] = 10'h2e4;
      expv[7] = 10'h2e4;
      expv[8] = 10'h3aa;
      expv[9] = 10'h3aa;
      expv[10] = 10'h3a8;
      expv[11] = 10'h242;
      expv[12] = 10'h242;
      expv[13] = 10'h242;
      expv[14] = 10'h242;
      expv[15] = 10'h240;
      expv[16] = 10'h21a;
      expv[17] = 10'h218;
      expv[18] = 10'h286;
      expv[19] = 10'h286;
      expv[20] = 10'h284;
      expv[21] = 10'h284;
      expv[22] = 10'h362;
      expv[23] = 10'h362;
      expv[24] = 10'h238;
      expv[25] = 10'h238;
      expv[26] = 10'h238;
      expv[27] = 10'h22c;
      expv[28] = 10'h122;
      expv[29] = 10'h122;
      expv[30] = 10'h122;
      expv[31] = 10'h120;
      expv[32] = 10'h1ee;
      expv[33] = 10'h1ee;
      expv[34] = 10'h1ee;
      expv[35] = 10'h1ee;
      expv[36] = 10'h1ec;
      expv[37] = 10'h1f6;
      expv[38] = 10'h1f4;
      expv[39] = 10'h1f4;
      expv[40] = 10'h0e6;
      expv[41] = 10'h0e6;
      expv[42] = 10'h0e6;
      expv[43] = 10'h0e6;
      expv[44] = 10'h0e4;
      expv[45] = 10'h0e4;
      expv[46] = 10'h182;
      expv[47] = 10'h182;
      expv[48] = 10'h182;
      expv[49] = 10'h182;
      expv[50] = 10'h182;
      expv[51] = 10'h182;
      expv[52] = 10'h32a;
      expv[53] = 10'h32a;
      expv[54] = 10'h0e8;
      expv[55] = 10'h0c6;
      expv[56] = 10'h0c6;
      expv[57] = 10'h0c6;
      expv[58] = 10'h0c6;
      expv[59] = 10'h0c4;
      expv[60] = 10'h10a;
      expv[61] = 10'h10a;
      expv[62] = 10'h10a;
      expv[63] = 10'h10a;
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
