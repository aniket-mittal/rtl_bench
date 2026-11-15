// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_071284 dut (
    .clk_50m(clk),
    .rst(in_vec[1:1]),
    .echo(in_vec[0:0]),
    .Led(out_vec[17:17]),
    .Distance(out_vec[16:1]),
    .trig(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h3;
    stim[1] = 2'h2;
    stim[2] = 2'h0;
    stim[3] = 2'h0;
    stim[4] = 2'h0;
    stim[5] = 2'h1;
    stim[6] = 2'h0;
    stim[7] = 2'h1;
    stim[8] = 2'h0;
    stim[9] = 2'h1;
    stim[10] = 2'h1;
    stim[11] = 2'h0;
    stim[12] = 2'h0;
    stim[13] = 2'h1;
    stim[14] = 2'h0;
    stim[15] = 2'h1;
    stim[16] = 2'h1;
    stim[17] = 2'h0;
    stim[18] = 2'h1;
    stim[19] = 2'h1;
    stim[20] = 2'h0;
    stim[21] = 2'h0;
    stim[22] = 2'h0;
    stim[23] = 2'h0;
    stim[24] = 2'h1;
    stim[25] = 2'h0;
    stim[26] = 2'h0;
    stim[27] = 2'h0;
    stim[28] = 2'h0;
    stim[29] = 2'h1;
    stim[30] = 2'h0;
    stim[31] = 2'h0;
    stim[32] = 2'h0;
    stim[33] = 2'h0;
    stim[34] = 2'h1;
    stim[35] = 2'h0;
    stim[36] = 2'h0;
    stim[37] = 2'h0;
    stim[38] = 2'h0;
    stim[39] = 2'h1;
    stim[40] = 2'h0;
    stim[41] = 2'h0;
    stim[42] = 2'h1;
    stim[43] = 2'h1;
    stim[44] = 2'h1;
    stim[45] = 2'h0;
    stim[46] = 2'h0;
    stim[47] = 2'h0;
    stim[48] = 2'h1;
    stim[49] = 2'h0;
    stim[50] = 2'h0;
    stim[51] = 2'h0;
    stim[52] = 2'h1;
    stim[53] = 2'h0;
    stim[54] = 2'h1;
    stim[55] = 2'h0;
    stim[56] = 2'h1;
    stim[57] = 2'h0;
    stim[58] = 2'h0;
    stim[59] = 2'h0;
    stim[60] = 2'h1;
    stim[61] = 2'h0;
    stim[62] = 2'h1;
    stim[63] = 2'h1;
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
      expv[0] = 18'h0000x;
      expv[1] = 18'h0000x;
      expv[2] = 18'h0000x;
      expv[3] = 18'h0000x;
      expv[4] = 18'h0000x;
      expv[5] = 18'h0000x;
      expv[6] = 18'h0000x;
      expv[7] = 18'h0000x;
      expv[8] = 18'h0000x;
      expv[9] = 18'h2000x;
      expv[10] = 18'h2000x;
      expv[11] = 18'h2000x;
      expv[12] = 18'h2000x;
      expv[13] = 18'h2000x;
      expv[14] = 18'h2000x;
      expv[15] = 18'h2000x;
      expv[16] = 18'h2000x;
      expv[17] = 18'h2000x;
      expv[18] = 18'h2000x;
      expv[19] = 18'h2000x;
      expv[20] = 18'h2000x;
      expv[21] = 18'h2000x;
      expv[22] = 18'h2000x;
      expv[23] = 18'h2000x;
      expv[24] = 18'h2000x;
      expv[25] = 18'h2000x;
      expv[26] = 18'h2000x;
      expv[27] = 18'h2000x;
      expv[28] = 18'h2000x;
      expv[29] = 18'h2000x;
      expv[30] = 18'h2000x;
      expv[31] = 18'h2000x;
      expv[32] = 18'h2000x;
      expv[33] = 18'h2000x;
      expv[34] = 18'h2000x;
      expv[35] = 18'h2000x;
      expv[36] = 18'h2000x;
      expv[37] = 18'h2000x;
      expv[38] = 18'h2000x;
      expv[39] = 18'h2000x;
      expv[40] = 18'h2000x;
      expv[41] = 18'h2000x;
      expv[42] = 18'h2000x;
      expv[43] = 18'h2000x;
      expv[44] = 18'h2000x;
      expv[45] = 18'h2000x;
      expv[46] = 18'h2000x;
      expv[47] = 18'h2000x;
      expv[48] = 18'h2000x;
      expv[49] = 18'h2000x;
      expv[50] = 18'h2000x;
      expv[51] = 18'h2000x;
      expv[52] = 18'h2000x;
      expv[53] = 18'h2000x;
      expv[54] = 18'h2000x;
      expv[55] = 18'h2000x;
      expv[56] = 18'h2000x;
      expv[57] = 18'h2000x;
      expv[58] = 18'h2000x;
      expv[59] = 18'h2000x;
      expv[60] = 18'h2000x;
      expv[61] = 18'h2000x;
      expv[62] = 18'h2000x;
      expv[63] = 18'h2000x;
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
