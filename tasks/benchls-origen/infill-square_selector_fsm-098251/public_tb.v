// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_098251 dut (
    .clk(clk),
    .reset(in_vec[3:3]),
    .up(in_vec[2:2]),
    .down(in_vec[1:1]),
    .select(in_vec[0:0]),
    .count(out_vec[12:9]),
    .square(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h8;
    stim[1] = 4'ha;
    stim[2] = 4'h5;
    stim[3] = 4'h4;
    stim[4] = 4'h2;
    stim[5] = 4'h2;
    stim[6] = 4'h1;
    stim[7] = 4'h3;
    stim[8] = 4'h1;
    stim[9] = 4'h2;
    stim[10] = 4'h2;
    stim[11] = 4'h5;
    stim[12] = 4'h6;
    stim[13] = 4'h4;
    stim[14] = 4'h4;
    stim[15] = 4'h5;
    stim[16] = 4'h4;
    stim[17] = 4'h6;
    stim[18] = 4'h3;
    stim[19] = 4'h7;
    stim[20] = 4'h2;
    stim[21] = 4'h3;
    stim[22] = 4'h2;
    stim[23] = 4'h0;
    stim[24] = 4'h5;
    stim[25] = 4'h5;
    stim[26] = 4'h2;
    stim[27] = 4'h0;
    stim[28] = 4'h1;
    stim[29] = 4'h2;
    stim[30] = 4'h0;
    stim[31] = 4'h0;
    stim[32] = 4'h6;
    stim[33] = 4'h5;
    stim[34] = 4'h6;
    stim[35] = 4'h0;
    stim[36] = 4'h5;
    stim[37] = 4'h4;
    stim[38] = 4'h4;
    stim[39] = 4'h5;
    stim[40] = 4'h6;
    stim[41] = 4'h1;
    stim[42] = 4'h0;
    stim[43] = 4'h4;
    stim[44] = 4'h1;
    stim[45] = 4'h2;
    stim[46] = 4'h2;
    stim[47] = 4'h5;
    stim[48] = 4'h1;
    stim[49] = 4'h7;
    stim[50] = 4'h7;
    stim[51] = 4'h0;
    stim[52] = 4'h7;
    stim[53] = 4'h2;
    stim[54] = 4'h7;
    stim[55] = 4'h4;
    stim[56] = 4'h4;
    stim[57] = 4'h4;
    stim[58] = 4'h5;
    stim[59] = 4'h1;
    stim[60] = 4'h3;
    stim[61] = 4'h0;
    stim[62] = 4'h6;
    stim[63] = 4'h3;
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
      expv[0] = 13'h0a00;
      expv[1] = 13'h0a00;
      expv[2] = 13'h0a00;
      expv[3] = 13'h0a10;
      expv[4] = 13'h0a00;
      expv[5] = 13'h0a00;
      expv[6] = 13'h0a00;
      expv[7] = 13'h0a00;
      expv[8] = 13'h0a00;
      expv[9] = 13'h0a00;
      expv[10] = 13'h0a00;
      expv[11] = 13'h0a00;
      expv[12] = 13'h0a00;
      expv[13] = 13'h0a00;
      expv[14] = 13'h0a00;
      expv[15] = 13'h0a00;
      expv[16] = 13'h0a00;
      expv[17] = 13'h0a00;
      expv[18] = 13'h0a00;
      expv[19] = 13'h0a00;
      expv[20] = 13'h0a00;
      expv[21] = 13'h0a00;
      expv[22] = 13'h0a00;
      expv[23] = 13'h0a00;
      expv[24] = 13'h0a00;
      expv[25] = 13'h0a10;
      expv[26] = 13'h0a10;
      expv[27] = 13'h0a00;
      expv[28] = 13'h0a00;
      expv[29] = 13'h0a10;
      expv[30] = 13'h0a00;
      expv[31] = 13'h0a00;
      expv[32] = 13'h0a00;
      expv[33] = 13'h0c00;
      expv[34] = 13'h0a00;
      expv[35] = 13'h0a00;
      expv[36] = 13'h0a00;
      expv[37] = 13'h0a10;
      expv[38] = 13'h0a00;
      expv[39] = 13'h0a00;
      expv[40] = 13'h0a00;
      expv[41] = 13'h0a00;
      expv[42] = 13'h0a00;
      expv[43] = 13'h0a00;
      expv[44] = 13'h0c00;
      expv[45] = 13'h0a00;
      expv[46] = 13'h0a00;
      expv[47] = 13'h0a00;
      expv[48] = 13'h0a00;
      expv[49] = 13'h0a00;
      expv[50] = 13'h0a00;
      expv[51] = 13'h0a00;
      expv[52] = 13'h0a00;
      expv[53] = 13'h0a10;
      expv[54] = 13'h0a00;
      expv[55] = 13'h0a00;
      expv[56] = 13'h0a00;
      expv[57] = 13'h0a00;
      expv[58] = 13'h0a00;
      expv[59] = 13'h0a00;
      expv[60] = 13'h0a00;
      expv[61] = 13'h0a00;
      expv[62] = 13'h0a00;
      expv[63] = 13'h0c00;
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
