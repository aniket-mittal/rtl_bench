// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_172919 dut (
    .clk(clk),
    .reset(in_vec[10:10]),
    .tx_start(in_vec[9:9]),
    .s_tick(in_vec[8:8]),
    .din(in_vec[7:0]),
    .tx_done_tick(out_vec[1:1]),
    .tx(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h66b;
    stim[1] = 11'h73f;
    stim[2] = 11'h0dc;
    stim[3] = 11'h0f0;
    stim[4] = 11'h29e;
    stim[5] = 11'h2b1;
    stim[6] = 11'h036;
    stim[7] = 11'h254;
    stim[8] = 11'h2a2;
    stim[9] = 11'h36d;
    stim[10] = 11'h3a6;
    stim[11] = 11'h3bf;
    stim[12] = 11'h0aa;
    stim[13] = 11'h3c3;
    stim[14] = 11'h0be;
    stim[15] = 11'h2aa;
    stim[16] = 11'h257;
    stim[17] = 11'h142;
    stim[18] = 11'h374;
    stim[19] = 11'h010;
    stim[20] = 11'h0c0;
    stim[21] = 11'h0b3;
    stim[22] = 11'h367;
    stim[23] = 11'h0ba;
    stim[24] = 11'h0fe;
    stim[25] = 11'h08c;
    stim[26] = 11'h6c6;
    stim[27] = 11'h09e;
    stim[28] = 11'h28c;
    stim[29] = 11'h291;
    stim[30] = 11'h075;
    stim[31] = 11'h1ce;
    stim[32] = 11'h05c;
    stim[33] = 11'h24c;
    stim[34] = 11'h104;
    stim[35] = 11'h247;
    stim[36] = 11'h113;
    stim[37] = 11'h38b;
    stim[38] = 11'h2f9;
    stim[39] = 11'h28f;
    stim[40] = 11'h317;
    stim[41] = 11'h0af;
    stim[42] = 11'h3db;
    stim[43] = 11'h2b7;
    stim[44] = 11'h11c;
    stim[45] = 11'h331;
    stim[46] = 11'h261;
    stim[47] = 11'h2a9;
    stim[48] = 11'h0b0;
    stim[49] = 11'h2b5;
    stim[50] = 11'h37d;
    stim[51] = 11'h149;
    stim[52] = 11'h144;
    stim[53] = 11'h19d;
    stim[54] = 11'h3de;
    stim[55] = 11'h201;
    stim[56] = 11'h002;
    stim[57] = 11'h04a;
    stim[58] = 11'h3fd;
    stim[59] = 11'h2bb;
    stim[60] = 11'h35e;
    stim[61] = 11'h278;
    stim[62] = 11'h110;
    stim[63] = 11'h14e;
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
      expv[0] = 2'h1;
      expv[1] = 2'h1;
      expv[2] = 2'h1;
      expv[3] = 2'h1;
      expv[4] = 2'h1;
      expv[5] = 2'h0;
      expv[6] = 2'h0;
      expv[7] = 2'h0;
      expv[8] = 2'h0;
      expv[9] = 2'h0;
      expv[10] = 2'h0;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h0;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h0;
      expv[20] = 2'h0;
      expv[21] = 2'h0;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h1;
      expv[27] = 2'h1;
      expv[28] = 2'h1;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h0;
      expv[32] = 2'h0;
      expv[33] = 2'h0;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h0;
      expv[38] = 2'h0;
      expv[39] = 2'h0;
      expv[40] = 2'h0;
      expv[41] = 2'h0;
      expv[42] = 2'h0;
      expv[43] = 2'h0;
      expv[44] = 2'h0;
      expv[45] = 2'h0;
      expv[46] = 2'h0;
      expv[47] = 2'h0;
      expv[48] = 2'h0;
      expv[49] = 2'h0;
      expv[50] = 2'h0;
      expv[51] = 2'h0;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h0;
      expv[55] = 2'h0;
      expv[56] = 2'h0;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h0;
      expv[61] = 2'h0;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
