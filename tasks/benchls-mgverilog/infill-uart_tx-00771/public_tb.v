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

  mg_00771 dut (
    .clk(clk),
    .tx_clk(in_vec[10:10]),
    .reset(in_vec[9:9]),
    .load(in_vec[8:8]),
    .data(in_vec[7:0]),
    .load_request(out_vec[1:1]),
    .txd(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h659;
    stim[1] = 11'h3d1;
    stim[2] = 11'h565;
    stim[3] = 11'h45b;
    stim[4] = 11'h510;
    stim[5] = 11'h0f1;
    stim[6] = 11'h5e0;
    stim[7] = 11'h505;
    stim[8] = 11'h0ab;
    stim[9] = 11'h109;
    stim[10] = 11'h0ec;
    stim[11] = 11'h0f8;
    stim[12] = 11'h4e0;
    stim[13] = 11'h0be;
    stim[14] = 11'h490;
    stim[15] = 11'h5cc;
    stim[16] = 11'h1bf;
    stim[17] = 11'h1d0;
    stim[18] = 11'h46f;
    stim[19] = 11'h449;
    stim[20] = 11'h5b2;
    stim[21] = 11'h4a5;
    stim[22] = 11'h4cf;
    stim[23] = 11'h470;
    stim[24] = 11'h19f;
    stim[25] = 11'h4a2;
    stim[26] = 11'h4f5;
    stim[27] = 11'h5d7;
    stim[28] = 11'h174;
    stim[29] = 11'h0c0;
    stim[30] = 11'h111;
    stim[31] = 11'h10a;
    stim[32] = 11'h535;
    stim[33] = 11'h5af;
    stim[34] = 11'h002;
    stim[35] = 11'h467;
    stim[36] = 11'h58d;
    stim[37] = 11'h029;
    stim[38] = 11'h005;
    stim[39] = 11'h10e;
    stim[40] = 11'h4d2;
    stim[41] = 11'h022;
    stim[42] = 11'h0bb;
    stim[43] = 11'h4e5;
    stim[44] = 11'h0a1;
    stim[45] = 11'h11b;
    stim[46] = 11'h158;
    stim[47] = 11'h12d;
    stim[48] = 11'h51b;
    stim[49] = 11'h021;
    stim[50] = 11'h541;
    stim[51] = 11'h02b;
    stim[52] = 11'h0df;
    stim[53] = 11'h439;
    stim[54] = 11'h07f;
    stim[55] = 11'h522;
    stim[56] = 11'h4ca;
    stim[57] = 11'h0cd;
    stim[58] = 11'h11b;
    stim[59] = 11'h477;
    stim[60] = 11'h0ba;
    stim[61] = 11'h147;
    stim[62] = 11'h186;
    stim[63] = 11'h172;
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
      expv[0] = 2'hx;
      expv[1] = 2'h1;
      expv[2] = 2'h1;
      expv[3] = 2'h1;
      expv[4] = 2'h1;
      expv[5] = 2'h1;
      expv[6] = 2'h1;
      expv[7] = 2'h1;
      expv[8] = 2'h1;
      expv[9] = 2'h1;
      expv[10] = 2'h1;
      expv[11] = 2'h1;
      expv[12] = 2'h1;
      expv[13] = 2'h1;
      expv[14] = 2'h1;
      expv[15] = 2'h1;
      expv[16] = 2'h1;
      expv[17] = 2'h1;
      expv[18] = 2'h1;
      expv[19] = 2'h1;
      expv[20] = 2'h1;
      expv[21] = 2'h1;
      expv[22] = 2'h1;
      expv[23] = 2'h1;
      expv[24] = 2'h1;
      expv[25] = 2'h1;
      expv[26] = 2'h3;
      expv[27] = 2'h1;
      expv[28] = 2'h1;
      expv[29] = 2'h1;
      expv[30] = 2'h1;
      expv[31] = 2'h1;
      expv[32] = 2'h1;
      expv[33] = 2'h1;
      expv[34] = 2'h1;
      expv[35] = 2'h1;
      expv[36] = 2'h1;
      expv[37] = 2'h1;
      expv[38] = 2'h1;
      expv[39] = 2'h1;
      expv[40] = 2'h1;
      expv[41] = 2'h1;
      expv[42] = 2'h1;
      expv[43] = 2'h1;
      expv[44] = 2'h1;
      expv[45] = 2'h1;
      expv[46] = 2'h1;
      expv[47] = 2'h1;
      expv[48] = 2'h1;
      expv[49] = 2'h1;
      expv[50] = 2'h1;
      expv[51] = 2'h1;
      expv[52] = 2'h1;
      expv[53] = 2'h1;
      expv[54] = 2'h1;
      expv[55] = 2'h1;
      expv[56] = 2'h1;
      expv[57] = 2'h1;
      expv[58] = 2'h1;
      expv[59] = 2'h1;
      expv[60] = 2'h1;
      expv[61] = 2'h1;
      expv[62] = 2'h1;
      expv[63] = 2'h1;
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
