// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_075768 dut (
    .Sa(in_vec[1:1]),
    .Sb(in_vec[0:0]),
    .LightA(out_vec[5:3]),
    .LightB(out_vec[2:0])
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
    stim[2] = 2'h2;
    stim[3] = 2'h3;
    stim[4] = 2'h3;
    stim[5] = 2'h2;
    stim[6] = 2'h1;
    stim[7] = 2'h3;
    stim[8] = 2'h2;
    stim[9] = 2'h2;
    stim[10] = 2'h3;
    stim[11] = 2'h2;
    stim[12] = 2'h1;
    stim[13] = 2'h2;
    stim[14] = 2'h3;
    stim[15] = 2'h1;
    stim[16] = 2'h0;
    stim[17] = 2'h0;
    stim[18] = 2'h0;
    stim[19] = 2'h2;
    stim[20] = 2'h2;
    stim[21] = 2'h0;
    stim[22] = 2'h3;
    stim[23] = 2'h0;
    stim[24] = 2'h3;
    stim[25] = 2'h2;
    stim[26] = 2'h3;
    stim[27] = 2'h0;
    stim[28] = 2'h2;
    stim[29] = 2'h2;
    stim[30] = 2'h3;
    stim[31] = 2'h0;
    stim[32] = 2'h0;
    stim[33] = 2'h0;
    stim[34] = 2'h3;
    stim[35] = 2'h1;
    stim[36] = 2'h2;
    stim[37] = 2'h0;
    stim[38] = 2'h1;
    stim[39] = 2'h0;
    stim[40] = 2'h1;
    stim[41] = 2'h2;
    stim[42] = 2'h0;
    stim[43] = 2'h1;
    stim[44] = 2'h2;
    stim[45] = 2'h1;
    stim[46] = 2'h2;
    stim[47] = 2'h2;
    stim[48] = 2'h1;
    stim[49] = 2'h2;
    stim[50] = 2'h2;
    stim[51] = 2'h0;
    stim[52] = 2'h1;
    stim[53] = 2'h3;
    stim[54] = 2'h2;
    stim[55] = 2'h3;
    stim[56] = 2'h0;
    stim[57] = 2'h1;
    stim[58] = 2'h1;
    stim[59] = 2'h1;
    stim[60] = 2'h1;
    stim[61] = 2'h0;
    stim[62] = 2'h3;
    stim[63] = 2'h0;
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
      expv[0] = 6'h0c;
      expv[1] = 6'h0c;
      expv[2] = 6'h0c;
      expv[3] = 6'h0c;
      expv[4] = 6'h0c;
      expv[5] = 6'h0c;
      expv[6] = 6'h0c;
      expv[7] = 6'h0c;
      expv[8] = 6'h0c;
      expv[9] = 6'h0c;
      expv[10] = 6'h0c;
      expv[11] = 6'h0c;
      expv[12] = 6'h0c;
      expv[13] = 6'h0c;
      expv[14] = 6'h0c;
      expv[15] = 6'h0c;
      expv[16] = 6'h0c;
      expv[17] = 6'h0c;
      expv[18] = 6'h0c;
      expv[19] = 6'h0c;
      expv[20] = 6'h0c;
      expv[21] = 6'h0c;
      expv[22] = 6'h0c;
      expv[23] = 6'h0c;
      expv[24] = 6'h0c;
      expv[25] = 6'h0c;
      expv[26] = 6'h0c;
      expv[27] = 6'h0c;
      expv[28] = 6'h0c;
      expv[29] = 6'h0c;
      expv[30] = 6'h0c;
      expv[31] = 6'h0c;
      expv[32] = 6'h0c;
      expv[33] = 6'h0c;
      expv[34] = 6'h0c;
      expv[35] = 6'h0c;
      expv[36] = 6'h0c;
      expv[37] = 6'h0c;
      expv[38] = 6'h0c;
      expv[39] = 6'h0c;
      expv[40] = 6'h0c;
      expv[41] = 6'h0c;
      expv[42] = 6'h0c;
      expv[43] = 6'h0c;
      expv[44] = 6'h0c;
      expv[45] = 6'h0c;
      expv[46] = 6'h0c;
      expv[47] = 6'h0c;
      expv[48] = 6'h0c;
      expv[49] = 6'h0c;
      expv[50] = 6'h0c;
      expv[51] = 6'h0c;
      expv[52] = 6'h0c;
      expv[53] = 6'h0c;
      expv[54] = 6'h0c;
      expv[55] = 6'h0c;
      expv[56] = 6'h0c;
      expv[57] = 6'h0c;
      expv[58] = 6'h0c;
      expv[59] = 6'h0c;
      expv[60] = 6'h0c;
      expv[61] = 6'h0c;
      expv[62] = 6'h0c;
      expv[63] = 6'h0c;
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
