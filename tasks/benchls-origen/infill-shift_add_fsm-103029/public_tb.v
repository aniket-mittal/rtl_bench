// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_103029 dut (
    .Clk(clk),
    .Reset(in_vec[3:3]),
    .LoadA(in_vec[2:2]),
    .LoadB(in_vec[1:1]),
    .Execute(in_vec[0:0]),
    .Shift_En(out_vec[2:2]),
    .Ld_A(out_vec[1:1]),
    .Ld_B(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hf;
    stim[1] = 4'h9;
    stim[2] = 4'h7;
    stim[3] = 4'h1;
    stim[4] = 4'h4;
    stim[5] = 4'h2;
    stim[6] = 4'h5;
    stim[7] = 4'h5;
    stim[8] = 4'h5;
    stim[9] = 4'h0;
    stim[10] = 4'h5;
    stim[11] = 4'h3;
    stim[12] = 4'h6;
    stim[13] = 4'h1;
    stim[14] = 4'h1;
    stim[15] = 4'h2;
    stim[16] = 4'h7;
    stim[17] = 4'h5;
    stim[18] = 4'h3;
    stim[19] = 4'he;
    stim[20] = 4'h6;
    stim[21] = 4'h7;
    stim[22] = 4'h5;
    stim[23] = 4'h7;
    stim[24] = 4'h4;
    stim[25] = 4'h4;
    stim[26] = 4'h6;
    stim[27] = 4'h2;
    stim[28] = 4'h2;
    stim[29] = 4'h7;
    stim[30] = 4'h5;
    stim[31] = 4'h6;
    stim[32] = 4'h2;
    stim[33] = 4'h1;
    stim[34] = 4'h0;
    stim[35] = 4'h6;
    stim[36] = 4'h7;
    stim[37] = 4'h0;
    stim[38] = 4'h1;
    stim[39] = 4'h7;
    stim[40] = 4'h4;
    stim[41] = 4'h3;
    stim[42] = 4'h1;
    stim[43] = 4'h3;
    stim[44] = 4'h7;
    stim[45] = 4'h4;
    stim[46] = 4'h1;
    stim[47] = 4'h3;
    stim[48] = 4'h8;
    stim[49] = 4'h6;
    stim[50] = 4'h5;
    stim[51] = 4'h6;
    stim[52] = 4'h6;
    stim[53] = 4'h0;
    stim[54] = 4'h5;
    stim[55] = 4'h2;
    stim[56] = 4'h6;
    stim[57] = 4'h7;
    stim[58] = 4'h0;
    stim[59] = 4'h7;
    stim[60] = 4'h0;
    stim[61] = 4'h2;
    stim[62] = 4'h4;
    stim[63] = 4'h2;
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
      expv[0] = 3'h3;
      expv[1] = 3'h0;
      expv[2] = 3'h3;
      expv[3] = 3'h4;
      expv[4] = 3'h4;
      expv[5] = 3'h4;
      expv[6] = 3'h4;
      expv[7] = 3'h4;
      expv[8] = 3'h4;
      expv[9] = 3'h4;
      expv[10] = 3'h4;
      expv[11] = 3'h0;
      expv[12] = 3'h0;
      expv[13] = 3'h0;
      expv[14] = 3'h4;
      expv[15] = 3'h4;
      expv[16] = 3'h4;
      expv[17] = 3'h4;
      expv[18] = 3'h4;
      expv[19] = 3'h3;
      expv[20] = 3'h3;
      expv[21] = 3'h3;
      expv[22] = 3'h4;
      expv[23] = 3'h4;
      expv[24] = 3'h4;
      expv[25] = 3'h4;
      expv[26] = 3'h4;
      expv[27] = 3'h4;
      expv[28] = 3'h4;
      expv[29] = 3'h4;
      expv[30] = 3'h0;
      expv[31] = 3'h0;
      expv[32] = 3'h1;
      expv[33] = 3'h0;
      expv[34] = 3'h4;
      expv[35] = 3'h4;
      expv[36] = 3'h4;
      expv[37] = 3'h4;
      expv[38] = 3'h4;
      expv[39] = 3'h4;
      expv[40] = 3'h4;
      expv[41] = 3'h4;
      expv[42] = 3'h0;
      expv[43] = 3'h0;
      expv[44] = 3'h0;
      expv[45] = 3'h0;
      expv[46] = 3'h0;
      expv[47] = 3'h4;
      expv[48] = 3'h0;
      expv[49] = 3'h3;
      expv[50] = 3'h2;
      expv[51] = 3'h4;
      expv[52] = 3'h4;
      expv[53] = 3'h4;
      expv[54] = 3'h4;
      expv[55] = 3'h4;
      expv[56] = 3'h4;
      expv[57] = 3'h4;
      expv[58] = 3'h4;
      expv[59] = 3'h0;
      expv[60] = 3'h0;
      expv[61] = 3'h1;
      expv[62] = 3'h2;
      expv[63] = 3'h1;
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
