// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_050708 dut (
    .clk(clk),
    .reset(in_vec[2:2]),
    .normal(in_vec[1:1]),
    .premium(in_vec[0:0]),
    .meter(out_vec[12:12]),
    .one_meter(out_vec[11:8]),
    .ten_meter(out_vec[7:4]),
    .baek_meter(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h7;
    stim[1] = 3'h6;
    stim[2] = 3'h1;
    stim[3] = 3'h2;
    stim[4] = 3'h2;
    stim[5] = 3'h2;
    stim[6] = 3'h0;
    stim[7] = 3'h3;
    stim[8] = 3'h3;
    stim[9] = 3'h3;
    stim[10] = 3'h1;
    stim[11] = 3'h2;
    stim[12] = 3'h2;
    stim[13] = 3'h1;
    stim[14] = 3'h3;
    stim[15] = 3'h3;
    stim[16] = 3'h2;
    stim[17] = 3'h1;
    stim[18] = 3'h7;
    stim[19] = 3'h3;
    stim[20] = 3'h3;
    stim[21] = 3'h2;
    stim[22] = 3'h1;
    stim[23] = 3'h2;
    stim[24] = 3'h0;
    stim[25] = 3'h2;
    stim[26] = 3'h0;
    stim[27] = 3'h1;
    stim[28] = 3'h3;
    stim[29] = 3'h2;
    stim[30] = 3'h3;
    stim[31] = 3'h3;
    stim[32] = 3'h3;
    stim[33] = 3'h2;
    stim[34] = 3'h0;
    stim[35] = 3'h0;
    stim[36] = 3'h1;
    stim[37] = 3'h5;
    stim[38] = 3'h1;
    stim[39] = 3'h1;
    stim[40] = 3'h0;
    stim[41] = 3'h2;
    stim[42] = 3'h0;
    stim[43] = 3'h0;
    stim[44] = 3'h3;
    stim[45] = 3'h2;
    stim[46] = 3'h3;
    stim[47] = 3'h1;
    stim[48] = 3'h1;
    stim[49] = 3'h0;
    stim[50] = 3'h2;
    stim[51] = 3'h3;
    stim[52] = 3'h2;
    stim[53] = 3'h0;
    stim[54] = 3'h2;
    stim[55] = 3'h0;
    stim[56] = 3'h2;
    stim[57] = 3'h1;
    stim[58] = 3'h1;
    stim[59] = 3'h1;
    stim[60] = 3'h1;
    stim[61] = 3'h3;
    stim[62] = 3'h1;
    stim[63] = 3'h3;
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
      expv[0] = 13'h1000;
      expv[1] = 13'h1000;
      expv[2] = 13'h1000;
      expv[3] = 13'h1000;
      expv[4] = 13'h1000;
      expv[5] = 13'h1000;
      expv[6] = 13'h1000;
      expv[7] = 13'h1000;
      expv[8] = 13'h1000;
      expv[9] = 13'h1000;
      expv[10] = 13'h1000;
      expv[11] = 13'h1000;
      expv[12] = 13'h0041;
      expv[13] = 13'h0041;
      expv[14] = 13'h0041;
      expv[15] = 13'h0041;
      expv[16] = 13'h0041;
      expv[17] = 13'h0041;
      expv[18] = 13'h1000;
      expv[19] = 13'h1000;
      expv[20] = 13'h1000;
      expv[21] = 13'h1000;
      expv[22] = 13'h1000;
      expv[23] = 13'h1000;
      expv[24] = 13'h1000;
      expv[25] = 13'h1000;
      expv[26] = 13'h1000;
      expv[27] = 13'h1000;
      expv[28] = 13'h1000;
      expv[29] = 13'h0041;
      expv[30] = 13'h0041;
      expv[31] = 13'h0041;
      expv[32] = 13'h0041;
      expv[33] = 13'h0041;
      expv[34] = 13'h0041;
      expv[35] = 13'h0041;
      expv[36] = 13'h0041;
      expv[37] = 13'h1000;
      expv[38] = 13'h1000;
      expv[39] = 13'h1000;
      expv[40] = 13'h1000;
      expv[41] = 13'h1000;
      expv[42] = 13'h1000;
      expv[43] = 13'h1000;
      expv[44] = 13'h1000;
      expv[45] = 13'h1000;
      expv[46] = 13'h1000;
      expv[47] = 13'h1000;
      expv[48] = 13'h0021;
      expv[49] = 13'h0021;
      expv[50] = 13'h0021;
      expv[51] = 13'h0021;
      expv[52] = 13'h0021;
      expv[53] = 13'h0021;
      expv[54] = 13'h0021;
      expv[55] = 13'h0021;
      expv[56] = 13'h0021;
      expv[57] = 13'h0021;
      expv[58] = 13'h0021;
      expv[59] = 13'h0021;
      expv[60] = 13'h0021;
      expv[61] = 13'h0021;
      expv[62] = 13'h0021;
      expv[63] = 13'h0021;
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
