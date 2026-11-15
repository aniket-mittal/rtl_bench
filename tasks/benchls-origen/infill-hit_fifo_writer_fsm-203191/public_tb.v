// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_203191 dut (
    .clock(clk),
    .fifo_comb_empty(in_vec[9:9]),
    .fifo_comb_hitmap(in_vec[8:4]),
    .fifo_comb_ee(in_vec[3:3]),
    .fifo_comb_valid(in_vec[2:2]),
    .fifo_comb45_hfull(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .hitmux_sel(out_vec[6:4]),
    .fifo_comb45_we(out_vec[3:3]),
    .fifo_comb_re(out_vec[2:2]),
    .is_45(out_vec[1:1]),
    .invalid_data(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h1e3;
    stim[1] = 10'h0bb;
    stim[2] = 10'h1d8;
    stim[3] = 10'h1ac;
    stim[4] = 10'h304;
    stim[5] = 10'h0b2;
    stim[6] = 10'h1d2;
    stim[7] = 10'h2d4;
    stim[8] = 10'h204;
    stim[9] = 10'h1c4;
    stim[10] = 10'h0cc;
    stim[11] = 10'h1d6;
    stim[12] = 10'h07a;
    stim[13] = 10'h284;
    stim[14] = 10'h0d0;
    stim[15] = 10'h2c0;
    stim[16] = 10'h196;
    stim[17] = 10'h076;
    stim[18] = 10'h09e;
    stim[19] = 10'h278;
    stim[20] = 10'h3b4;
    stim[21] = 10'h3a2;
    stim[22] = 10'h0b4;
    stim[23] = 10'h1ca;
    stim[24] = 10'h118;
    stim[25] = 10'h112;
    stim[26] = 10'h3f2;
    stim[27] = 10'h106;
    stim[28] = 10'h380;
    stim[29] = 10'h176;
    stim[30] = 10'h2fe;
    stim[31] = 10'h1f2;
    stim[32] = 10'h08e;
    stim[33] = 10'h2a8;
    stim[34] = 10'h278;
    stim[35] = 10'h008;
    stim[36] = 10'h392;
    stim[37] = 10'h342;
    stim[38] = 10'h2c2;
    stim[39] = 10'h2ec;
    stim[40] = 10'h3fe;
    stim[41] = 10'h304;
    stim[42] = 10'h22c;
    stim[43] = 10'h2dc;
    stim[44] = 10'h18c;
    stim[45] = 10'h032;
    stim[46] = 10'h046;
    stim[47] = 10'h25e;
    stim[48] = 10'h38a;
    stim[49] = 10'h16e;
    stim[50] = 10'h238;
    stim[51] = 10'h35e;
    stim[52] = 10'h18c;
    stim[53] = 10'h096;
    stim[54] = 10'h244;
    stim[55] = 10'h1dc;
    stim[56] = 10'h33e;
    stim[57] = 10'h39c;
    stim[58] = 10'h048;
    stim[59] = 10'h1ca;
    stim[60] = 10'h23a;
    stim[61] = 10'h0c2;
    stim[62] = 10'h3fa;
    stim[63] = 10'h2ba;
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
      expv[0] = 7'hx0;
      expv[1] = 7'hx0;
      expv[2] = 7'hx0;
      expv[3] = 7'hx0;
      expv[4] = 7'h0e;
      expv[5] = 7'h1e;
      expv[6] = 7'h2e;
      expv[7] = 7'h3e;
      expv[8] = 7'h4e;
      expv[9] = 7'h40;
      expv[10] = 7'h40;
      expv[11] = 7'h0e;
      expv[12] = 7'h1e;
      expv[13] = 7'h2e;
      expv[14] = 7'h3e;
      expv[15] = 7'h4e;
      expv[16] = 7'h40;
      expv[17] = 7'h40;
      expv[18] = 7'h40;
      expv[19] = 7'h40;
      expv[20] = 7'h40;
      expv[21] = 7'h40;
      expv[22] = 7'h40;
      expv[23] = 7'h40;
      expv[24] = 7'h40;
      expv[25] = 7'h40;
      expv[26] = 7'h40;
      expv[27] = 7'h40;
      expv[28] = 7'h40;
      expv[29] = 7'h40;
      expv[30] = 7'h40;
      expv[31] = 7'h40;
      expv[32] = 7'h40;
      expv[33] = 7'h40;
      expv[34] = 7'h40;
      expv[35] = 7'h40;
      expv[36] = 7'h40;
      expv[37] = 7'h40;
      expv[38] = 7'h40;
      expv[39] = 7'h40;
      expv[40] = 7'h40;
      expv[41] = 7'h40;
      expv[42] = 7'h40;
      expv[43] = 7'h40;
      expv[44] = 7'h40;
      expv[45] = 7'h0e;
      expv[46] = 7'h1e;
      expv[47] = 7'h2e;
      expv[48] = 7'h3e;
      expv[49] = 7'h4e;
      expv[50] = 7'h40;
      expv[51] = 7'h40;
      expv[52] = 7'h40;
      expv[53] = 7'h0e;
      expv[54] = 7'h1e;
      expv[55] = 7'h2e;
      expv[56] = 7'h3e;
      expv[57] = 7'h4e;
      expv[58] = 7'h40;
      expv[59] = 7'h40;
      expv[60] = 7'h40;
      expv[61] = 7'h40;
      expv[62] = 7'h40;
      expv[63] = 7'h40;
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
