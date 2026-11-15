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

  mg_01598 dut (
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
    stim[6] = 2'h3;
    stim[7] = 2'h1;
    stim[8] = 2'h1;
    stim[9] = 2'h3;
    stim[10] = 2'h3;
    stim[11] = 2'h3;
    stim[12] = 2'h1;
    stim[13] = 2'h2;
    stim[14] = 2'h1;
    stim[15] = 2'h1;
    stim[16] = 2'h3;
    stim[17] = 2'h1;
    stim[18] = 2'h1;
    stim[19] = 2'h1;
    stim[20] = 2'h3;
    stim[21] = 2'h3;
    stim[22] = 2'h1;
    stim[23] = 2'h1;
    stim[24] = 2'h1;
    stim[25] = 2'h3;
    stim[26] = 2'h3;
    stim[27] = 2'h3;
    stim[28] = 2'h1;
    stim[29] = 2'h3;
    stim[30] = 2'h1;
    stim[31] = 2'h1;
    stim[32] = 2'h1;
    stim[33] = 2'h1;
    stim[34] = 2'h3;
    stim[35] = 2'h1;
    stim[36] = 2'h1;
    stim[37] = 2'h1;
    stim[38] = 2'h1;
    stim[39] = 2'h3;
    stim[40] = 2'h0;
    stim[41] = 2'h1;
    stim[42] = 2'h3;
    stim[43] = 2'h3;
    stim[44] = 2'h3;
    stim[45] = 2'h3;
    stim[46] = 2'h3;
    stim[47] = 2'h1;
    stim[48] = 2'h1;
    stim[49] = 2'h3;
    stim[50] = 2'h3;
    stim[51] = 2'h3;
    stim[52] = 2'h1;
    stim[53] = 2'h3;
    stim[54] = 2'h1;
    stim[55] = 2'h1;
    stim[56] = 2'h1;
    stim[57] = 2'h1;
    stim[58] = 2'h1;
    stim[59] = 2'h1;
    stim[60] = 2'h3;
    stim[61] = 2'h3;
    stim[62] = 2'h3;
    stim[63] = 2'h3;
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
      expv[0] = 32'h00000000;
      expv[1] = 32'h00000000;
      expv[2] = 32'h00000000;
      expv[3] = 32'h54f0f5ab;
      expv[4] = 32'h54f0f5ab;
      expv[5] = 32'h54f0f5ab;
      expv[6] = 32'h54f0f5ab;
      expv[7] = 32'h00000000;
      expv[8] = 32'h00000000;
      expv[9] = 32'h54f0f5ab;
      expv[10] = 32'h54f0f5ab;
      expv[11] = 32'h54f0f5ab;
      expv[12] = 32'h00000000;
      expv[13] = 32'h54f0f5ab;
      expv[14] = 32'h00000000;
      expv[15] = 32'h00000000;
      expv[16] = 32'h54f0f5ab;
      expv[17] = 32'h00000000;
      expv[18] = 32'h00000000;
      expv[19] = 32'h00000000;
      expv[20] = 32'h54f0f5ab;
      expv[21] = 32'h54f0f5ab;
      expv[22] = 32'h00000000;
      expv[23] = 32'h00000000;
      expv[24] = 32'h00000000;
      expv[25] = 32'h54f0f5ab;
      expv[26] = 32'h54f0f5ab;
      expv[27] = 32'h54f0f5ab;
      expv[28] = 32'h00000000;
      expv[29] = 32'h54f0f5ab;
      expv[30] = 32'h00000000;
      expv[31] = 32'h00000000;
      expv[32] = 32'h00000000;
      expv[33] = 32'h00000000;
      expv[34] = 32'h54f0f5ab;
      expv[35] = 32'h00000000;
      expv[36] = 32'h00000000;
      expv[37] = 32'h00000000;
      expv[38] = 32'h00000000;
      expv[39] = 32'h54f0f5ab;
      expv[40] = 32'h00000000;
      expv[41] = 32'h00000000;
      expv[42] = 32'h54f0f5ab;
      expv[43] = 32'h54f0f5ab;
      expv[44] = 32'h54f0f5ab;
      expv[45] = 32'h54f0f5ab;
      expv[46] = 32'h54f0f5ab;
      expv[47] = 32'h00000000;
      expv[48] = 32'h00000000;
      expv[49] = 32'h54f0f5ab;
      expv[50] = 32'h54f0f5ab;
      expv[51] = 32'h54f0f5ab;
      expv[52] = 32'h00000000;
      expv[53] = 32'h54f0f5ab;
      expv[54] = 32'h00000000;
      expv[55] = 32'h00000000;
      expv[56] = 32'h00000000;
      expv[57] = 32'h00000000;
      expv[58] = 32'h00000000;
      expv[59] = 32'h00000000;
      expv[60] = 32'h54f0f5ab;
      expv[61] = 32'h54f0f5ab;
      expv[62] = 32'h54f0f5ab;
      expv[63] = 32'h54f0f5ab;
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
