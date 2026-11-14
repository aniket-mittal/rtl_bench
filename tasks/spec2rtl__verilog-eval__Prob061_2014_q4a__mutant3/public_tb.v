// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .w(in_vec[3:3]),
    .R(in_vec[2:2]),
    .E(in_vec[1:1]),
    .L(in_vec[0:0]),
    .Q(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h1;
    stim[1] = 4'hc;
    stim[2] = 4'h1;
    stim[3] = 4'h6;
    stim[4] = 4'ha;
    stim[5] = 4'h7;
    stim[6] = 4'he;
    stim[7] = 4'h2;
    stim[8] = 4'h0;
    stim[9] = 4'h9;
    stim[10] = 4'ha;
    stim[11] = 4'h1;
    stim[12] = 4'he;
    stim[13] = 4'h0;
    stim[14] = 4'h3;
    stim[15] = 4'h7;
    stim[16] = 4'hf;
    stim[17] = 4'he;
    stim[18] = 4'ha;
    stim[19] = 4'h9;
    stim[20] = 4'h1;
    stim[21] = 4'h1;
    stim[22] = 4'hc;
    stim[23] = 4'hf;
    stim[24] = 4'hf;
    stim[25] = 4'h4;
    stim[26] = 4'hc;
    stim[27] = 4'h5;
    stim[28] = 4'hc;
    stim[29] = 4'h0;
    stim[30] = 4'h2;
    stim[31] = 4'h8;
    stim[32] = 4'h2;
    stim[33] = 4'hd;
    stim[34] = 4'hc;
    stim[35] = 4'hb;
    stim[36] = 4'h3;
    stim[37] = 4'h2;
    stim[38] = 4'hb;
    stim[39] = 4'hf;
    stim[40] = 4'h0;
    stim[41] = 4'hc;
    stim[42] = 4'h4;
    stim[43] = 4'hd;
    stim[44] = 4'ha;
    stim[45] = 4'h9;
    stim[46] = 4'h1;
    stim[47] = 4'h4;
    stim[48] = 4'hf;
    stim[49] = 4'h9;
    stim[50] = 4'he;
    stim[51] = 4'h0;
    stim[52] = 4'hb;
    stim[53] = 4'h4;
    stim[54] = 4'hc;
    stim[55] = 4'hb;
    stim[56] = 4'h1;
    stim[57] = 4'he;
    stim[58] = 4'hf;
    stim[59] = 4'h7;
    stim[60] = 4'h6;
    stim[61] = 4'h2;
    stim[62] = 4'hd;
    stim[63] = 4'h6;
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
      expv[0] = 1'hx;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h0;
      expv[5] = 1'h1;
      expv[6] = 1'h0;
      expv[7] = 1'h1;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h1;
      expv[12] = 1'h0;
      expv[13] = 1'h1;
      expv[14] = 1'h1;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h1;
      expv[18] = 1'h1;
      expv[19] = 1'h1;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h0;
      expv[23] = 1'h0;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h1;
      expv[50] = 1'h0;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h1;
      expv[59] = 1'h1;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h1;
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
