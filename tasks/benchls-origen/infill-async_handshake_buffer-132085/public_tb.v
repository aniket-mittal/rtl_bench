// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_132085 dut (
    .i_0r(in_vec[2:2]),
    .reset(in_vec[1:1]),
    .i_0a(in_vec[0:0]),
    .o_0r(out_vec[9:9]),
    .o_1r(out_vec[8:8]),
    .o_2r(out_vec[7:7]),
    .o_3r(out_vec[6:6]),
    .o_0a(out_vec[5:4]),
    .o_1a(out_vec[3:2]),
    .o_4r(out_vec[1:1]),
    .o_4a(out_vec[0:0])
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
    stim[1] = 3'h2;
    stim[2] = 3'h1;
    stim[3] = 3'h4;
    stim[4] = 3'h1;
    stim[5] = 3'h5;
    stim[6] = 3'h5;
    stim[7] = 3'h1;
    stim[8] = 3'h5;
    stim[9] = 3'h4;
    stim[10] = 3'h1;
    stim[11] = 3'h4;
    stim[12] = 3'h0;
    stim[13] = 3'h4;
    stim[14] = 3'h0;
    stim[15] = 3'h4;
    stim[16] = 3'h1;
    stim[17] = 3'h0;
    stim[18] = 3'h4;
    stim[19] = 3'h0;
    stim[20] = 3'h0;
    stim[21] = 3'h5;
    stim[22] = 3'h0;
    stim[23] = 3'h4;
    stim[24] = 3'h5;
    stim[25] = 3'h0;
    stim[26] = 3'h4;
    stim[27] = 3'h4;
    stim[28] = 3'h1;
    stim[29] = 3'h0;
    stim[30] = 3'h4;
    stim[31] = 3'h1;
    stim[32] = 3'h0;
    stim[33] = 3'h4;
    stim[34] = 3'h0;
    stim[35] = 3'h1;
    stim[36] = 3'h5;
    stim[37] = 3'h1;
    stim[38] = 3'h1;
    stim[39] = 3'h0;
    stim[40] = 3'h0;
    stim[41] = 3'h1;
    stim[42] = 3'h0;
    stim[43] = 3'h0;
    stim[44] = 3'h0;
    stim[45] = 3'h4;
    stim[46] = 3'h0;
    stim[47] = 3'h0;
    stim[48] = 3'h1;
    stim[49] = 3'h4;
    stim[50] = 3'h0;
    stim[51] = 3'h0;
    stim[52] = 3'h4;
    stim[53] = 3'h4;
    stim[54] = 3'h1;
    stim[55] = 3'h1;
    stim[56] = 3'h5;
    stim[57] = 3'h1;
    stim[58] = 3'h1;
    stim[59] = 3'h0;
    stim[60] = 3'h4;
    stim[61] = 3'h5;
    stim[62] = 3'h1;
    stim[63] = 3'h0;
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
      expv[0] = 10'h3xx;
      expv[1] = 10'h0xx;
      expv[2] = 10'h0xx;
      expv[3] = 10'h3xx;
      expv[4] = 10'h0xx;
      expv[5] = 10'h3xx;
      expv[6] = 10'h3xx;
      expv[7] = 10'h0xx;
      expv[8] = 10'h3xx;
      expv[9] = 10'h3xx;
      expv[10] = 10'h0xx;
      expv[11] = 10'h3xx;
      expv[12] = 10'h0xx;
      expv[13] = 10'h3xx;
      expv[14] = 10'h0xx;
      expv[15] = 10'h3xx;
      expv[16] = 10'h0xx;
      expv[17] = 10'h0xx;
      expv[18] = 10'h3xx;
      expv[19] = 10'h0xx;
      expv[20] = 10'h0xx;
      expv[21] = 10'h3xx;
      expv[22] = 10'h0xx;
      expv[23] = 10'h3xx;
      expv[24] = 10'h3xx;
      expv[25] = 10'h0xx;
      expv[26] = 10'h3xx;
      expv[27] = 10'h3xx;
      expv[28] = 10'h0xx;
      expv[29] = 10'h0xx;
      expv[30] = 10'h3xx;
      expv[31] = 10'h0xx;
      expv[32] = 10'h0xx;
      expv[33] = 10'h3xx;
      expv[34] = 10'h0xx;
      expv[35] = 10'h0xx;
      expv[36] = 10'h3xx;
      expv[37] = 10'h0xx;
      expv[38] = 10'h0xx;
      expv[39] = 10'h0xx;
      expv[40] = 10'h0xx;
      expv[41] = 10'h0xx;
      expv[42] = 10'h0xx;
      expv[43] = 10'h0xx;
      expv[44] = 10'h0xx;
      expv[45] = 10'h3xx;
      expv[46] = 10'h0xx;
      expv[47] = 10'h0xx;
      expv[48] = 10'h0xx;
      expv[49] = 10'h3xx;
      expv[50] = 10'h0xx;
      expv[51] = 10'h0xx;
      expv[52] = 10'h3xx;
      expv[53] = 10'h3xx;
      expv[54] = 10'h0xx;
      expv[55] = 10'h0xx;
      expv[56] = 10'h3xx;
      expv[57] = 10'h0xx;
      expv[58] = 10'h0xx;
      expv[59] = 10'h0xx;
      expv[60] = 10'h3xx;
      expv[61] = 10'h3xx;
      expv[62] = 10'h0xx;
      expv[63] = 10'h0xx;
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
