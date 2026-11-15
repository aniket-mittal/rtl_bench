// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_121350 dut (
    .clk(clk),
    .data(in_vec[8:5]),
    .ce(in_vec[4:4]),
    .a(in_vec[3:0]),
    .q(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h09e;
    stim[1] = 9'h05a;
    stim[2] = 9'h02b;
    stim[3] = 9'h1f1;
    stim[4] = 9'h069;
    stim[5] = 9'h126;
    stim[6] = 9'h1ce;
    stim[7] = 9'h143;
    stim[8] = 9'h084;
    stim[9] = 9'h1b1;
    stim[10] = 9'h0e7;
    stim[11] = 9'h1c2;
    stim[12] = 9'h196;
    stim[13] = 9'h0b9;
    stim[14] = 9'h1bb;
    stim[15] = 9'h030;
    stim[16] = 9'h11f;
    stim[17] = 9'h197;
    stim[18] = 9'h038;
    stim[19] = 9'h09e;
    stim[20] = 9'h1da;
    stim[21] = 9'h16b;
    stim[22] = 9'h029;
    stim[23] = 9'h117;
    stim[24] = 9'h148;
    stim[25] = 9'h083;
    stim[26] = 9'h126;
    stim[27] = 9'h022;
    stim[28] = 9'h089;
    stim[29] = 9'h028;
    stim[30] = 9'h164;
    stim[31] = 9'h12f;
    stim[32] = 9'h0e6;
    stim[33] = 9'h088;
    stim[34] = 9'h0a1;
    stim[35] = 9'h168;
    stim[36] = 9'h14d;
    stim[37] = 9'h028;
    stim[38] = 9'h12b;
    stim[39] = 9'h074;
    stim[40] = 9'h0b9;
    stim[41] = 9'h0a2;
    stim[42] = 9'h141;
    stim[43] = 9'h0c1;
    stim[44] = 9'h185;
    stim[45] = 9'h13d;
    stim[46] = 9'h186;
    stim[47] = 9'h18a;
    stim[48] = 9'h047;
    stim[49] = 9'h199;
    stim[50] = 9'h071;
    stim[51] = 9'h11e;
    stim[52] = 9'h154;
    stim[53] = 9'h021;
    stim[54] = 9'h1cf;
    stim[55] = 9'h011;
    stim[56] = 9'h0de;
    stim[57] = 9'h0fe;
    stim[58] = 9'h048;
    stim[59] = 9'h0b6;
    stim[60] = 9'h1fc;
    stim[61] = 9'h0b3;
    stim[62] = 9'h13a;
    stim[63] = 9'h1a0;
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
      expv[0] = 4'hx;
      expv[1] = 4'hx;
      expv[2] = 4'hx;
      expv[3] = 4'h4;
      expv[4] = 4'hx;
      expv[5] = 4'hx;
      expv[6] = 4'hx;
      expv[7] = 4'hx;
      expv[8] = 4'hx;
      expv[9] = 4'h2;
      expv[10] = 4'hx;
      expv[11] = 4'h2;
      expv[12] = 4'hx;
      expv[13] = 4'hx;
      expv[14] = 4'hx;
      expv[15] = 4'hd;
      expv[16] = 4'hx;
      expv[17] = 4'h2;
      expv[18] = 4'h2;
      expv[19] = 4'h2;
      expv[20] = 4'hf;
      expv[21] = 4'hd;
      expv[22] = 4'hd;
      expv[23] = 4'h5;
      expv[24] = 4'h5;
      expv[25] = 4'h1;
      expv[26] = 4'h1;
      expv[27] = 4'h4;
      expv[28] = 4'hc;
      expv[29] = 4'h5;
      expv[30] = 4'hc;
      expv[31] = 4'hc;
      expv[32] = 4'h1;
      expv[33] = 4'h5;
      expv[34] = 4'he;
      expv[35] = 4'h5;
      expv[36] = 4'hc;
      expv[37] = 4'h5;
      expv[38] = 4'hc;
      expv[39] = 4'hc;
      expv[40] = 4'h5;
      expv[41] = 4'h8;
      expv[42] = 4'h3;
      expv[43] = 4'h3;
      expv[44] = 4'h1;
      expv[45] = 4'hd;
      expv[46] = 4'h1;
      expv[47] = 4'h1;
      expv[48] = 4'hc;
      expv[49] = 4'h1;
      expv[50] = 4'h9;
      expv[51] = 4'hc;
      expv[52] = 4'h5;
      expv[53] = 4'h8;
      expv[54] = 4'h4;
      expv[55] = 4'h8;
      expv[56] = 4'he;
      expv[57] = 4'h8;
      expv[58] = 4'h5;
      expv[59] = 4'hc;
      expv[60] = 4'h5;
      expv[61] = 4'h6;
      expv[62] = 4'hc;
      expv[63] = 4'h9;
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
