// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09775 dut (
    .clock(clk),
    .address(in_vec[1:1]),
    .reset_n(in_vec[0:0]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h0;
    stim[1] = 2'h0;
    stim[2] = 2'h1;
    stim[3] = 2'h3;
    stim[4] = 2'h3;
    stim[5] = 2'h3;
    stim[6] = 2'h1;
    stim[7] = 2'h1;
    stim[8] = 2'h3;
    stim[9] = 2'h1;
    stim[10] = 2'h1;
    stim[11] = 2'h3;
    stim[12] = 2'h3;
    stim[13] = 2'h3;
    stim[14] = 2'h1;
    stim[15] = 2'h1;
    stim[16] = 2'h3;
    stim[17] = 2'h1;
    stim[18] = 2'h1;
    stim[19] = 2'h1;
    stim[20] = 2'h1;
    stim[21] = 2'h1;
    stim[22] = 2'h1;
    stim[23] = 2'h1;
    stim[24] = 2'h3;
    stim[25] = 2'h3;
    stim[26] = 2'h3;
    stim[27] = 2'h1;
    stim[28] = 2'h0;
    stim[29] = 2'h3;
    stim[30] = 2'h1;
    stim[31] = 2'h1;
    stim[32] = 2'h3;
    stim[33] = 2'h3;
    stim[34] = 2'h3;
    stim[35] = 2'h1;
    stim[36] = 2'h3;
    stim[37] = 2'h3;
    stim[38] = 2'h3;
    stim[39] = 2'h3;
    stim[40] = 2'h1;
    stim[41] = 2'h3;
    stim[42] = 2'h1;
    stim[43] = 2'h1;
    stim[44] = 2'h2;
    stim[45] = 2'h3;
    stim[46] = 2'h3;
    stim[47] = 2'h1;
    stim[48] = 2'h1;
    stim[49] = 2'h1;
    stim[50] = 2'h3;
    stim[51] = 2'h3;
    stim[52] = 2'h1;
    stim[53] = 2'h1;
    stim[54] = 2'h3;
    stim[55] = 2'h3;
    stim[56] = 2'h1;
    stim[57] = 2'h1;
    stim[58] = 2'h1;
    stim[59] = 2'h1;
    stim[60] = 2'h3;
    stim[61] = 2'h1;
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
      expv[0] = 32'hacd51302;
      expv[1] = 32'hacd51302;
      expv[2] = 32'hacd51302;
      expv[3] = 32'h54be9bae;
      expv[4] = 32'h54be9bae;
      expv[5] = 32'h54be9bae;
      expv[6] = 32'hacd51302;
      expv[7] = 32'hacd51302;
      expv[8] = 32'h54be9bae;
      expv[9] = 32'hacd51302;
      expv[10] = 32'hacd51302;
      expv[11] = 32'h54be9bae;
      expv[12] = 32'h54be9bae;
      expv[13] = 32'h54be9bae;
      expv[14] = 32'hacd51302;
      expv[15] = 32'hacd51302;
      expv[16] = 32'h54be9bae;
      expv[17] = 32'hacd51302;
      expv[18] = 32'hacd51302;
      expv[19] = 32'hacd51302;
      expv[20] = 32'hacd51302;
      expv[21] = 32'hacd51302;
      expv[22] = 32'hacd51302;
      expv[23] = 32'hacd51302;
      expv[24] = 32'h54be9bae;
      expv[25] = 32'h54be9bae;
      expv[26] = 32'h54be9bae;
      expv[27] = 32'hacd51302;
      expv[28] = 32'hacd51302;
      expv[29] = 32'h54be9bae;
      expv[30] = 32'hacd51302;
      expv[31] = 32'hacd51302;
      expv[32] = 32'h54be9bae;
      expv[33] = 32'h54be9bae;
      expv[34] = 32'h54be9bae;
      expv[35] = 32'hacd51302;
      expv[36] = 32'h54be9bae;
      expv[37] = 32'h54be9bae;
      expv[38] = 32'h54be9bae;
      expv[39] = 32'h54be9bae;
      expv[40] = 32'hacd51302;
      expv[41] = 32'h54be9bae;
      expv[42] = 32'hacd51302;
      expv[43] = 32'hacd51302;
      expv[44] = 32'h54be9bae;
      expv[45] = 32'h54be9bae;
      expv[46] = 32'h54be9bae;
      expv[47] = 32'hacd51302;
      expv[48] = 32'hacd51302;
      expv[49] = 32'hacd51302;
      expv[50] = 32'h54be9bae;
      expv[51] = 32'h54be9bae;
      expv[52] = 32'hacd51302;
      expv[53] = 32'hacd51302;
      expv[54] = 32'h54be9bae;
      expv[55] = 32'h54be9bae;
      expv[56] = 32'hacd51302;
      expv[57] = 32'hacd51302;
      expv[58] = 32'hacd51302;
      expv[59] = 32'hacd51302;
      expv[60] = 32'h54be9bae;
      expv[61] = 32'hacd51302;
      expv[62] = 32'hacd51302;
      expv[63] = 32'hacd51302;
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
