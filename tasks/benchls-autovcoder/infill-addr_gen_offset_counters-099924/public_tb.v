// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_099924 dut (
    .clk(clk),
    .rst(in_vec[1:1]),
    .enable(in_vec[0:0]),
    .addr2(out_vec[39:36]),
    .addr3(out_vec[35:30]),
    .addr4(out_vec[29:22]),
    .addr5(out_vec[21:12]),
    .addr6(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h2;
    stim[1] = 2'h2;
    stim[2] = 2'h0;
    stim[3] = 2'h1;
    stim[4] = 2'h1;
    stim[5] = 2'h0;
    stim[6] = 2'h1;
    stim[7] = 2'h1;
    stim[8] = 2'h0;
    stim[9] = 2'h1;
    stim[10] = 2'h0;
    stim[11] = 2'h1;
    stim[12] = 2'h1;
    stim[13] = 2'h3;
    stim[14] = 2'h0;
    stim[15] = 2'h1;
    stim[16] = 2'h1;
    stim[17] = 2'h0;
    stim[18] = 2'h1;
    stim[19] = 2'h0;
    stim[20] = 2'h0;
    stim[21] = 2'h0;
    stim[22] = 2'h1;
    stim[23] = 2'h1;
    stim[24] = 2'h1;
    stim[25] = 2'h1;
    stim[26] = 2'h1;
    stim[27] = 2'h0;
    stim[28] = 2'h0;
    stim[29] = 2'h1;
    stim[30] = 2'h0;
    stim[31] = 2'h1;
    stim[32] = 2'h0;
    stim[33] = 2'h0;
    stim[34] = 2'h0;
    stim[35] = 2'h1;
    stim[36] = 2'h0;
    stim[37] = 2'h0;
    stim[38] = 2'h0;
    stim[39] = 2'h1;
    stim[40] = 2'h3;
    stim[41] = 2'h1;
    stim[42] = 2'h1;
    stim[43] = 2'h0;
    stim[44] = 2'h0;
    stim[45] = 2'h0;
    stim[46] = 2'h1;
    stim[47] = 2'h0;
    stim[48] = 2'h1;
    stim[49] = 2'h1;
    stim[50] = 2'h0;
    stim[51] = 2'h1;
    stim[52] = 2'h0;
    stim[53] = 2'h0;
    stim[54] = 2'h1;
    stim[55] = 2'h1;
    stim[56] = 2'h1;
    stim[57] = 2'h0;
    stim[58] = 2'h1;
    stim[59] = 2'h1;
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
      expv[0] = 40'hdfff7f7fcd;
      expv[1] = 40'hdfff7f7fcd;
      expv[2] = 40'hdfff7f7fcd;
      expv[3] = 40'hdfff7f7fcd;
      expv[4] = 40'hdfff7f7fcd;
      expv[5] = 40'hdfff7f7fcd;
      expv[6] = 40'hdfff7f7fcd;
      expv[7] = 40'hdfff7f7fcd;
      expv[8] = 40'hdfff7f7fcd;
      expv[9] = 40'hdfff7f7fcd;
      expv[10] = 40'hdfff7f7fcd;
      expv[11] = 40'hdfff7f7fcd;
      expv[12] = 40'hdfff7f7fcd;
      expv[13] = 40'hdfff7f7fcd;
      expv[14] = 40'hdfff7f7fcd;
      expv[15] = 40'hdfff7f7fcd;
      expv[16] = 40'hdfff7f7fcd;
      expv[17] = 40'hdfff7f7fcd;
      expv[18] = 40'hdfff7f7fcd;
      expv[19] = 40'hdfff7f7fcd;
      expv[20] = 40'hdfff7f7fcd;
      expv[21] = 40'hdfff7f7fcd;
      expv[22] = 40'hdfff7f7fcd;
      expv[23] = 40'hdfff7f7fcd;
      expv[24] = 40'hdfff7f7fcd;
      expv[25] = 40'hdfff7f7fcd;
      expv[26] = 40'hdfff7f7fcd;
      expv[27] = 40'hdfff7f7fcd;
      expv[28] = 40'hdfff7f7fcd;
      expv[29] = 40'hdfff7f7fcd;
      expv[30] = 40'hdfff7f7fcd;
      expv[31] = 40'hdfff7f7fcd;
      expv[32] = 40'hdfff7f7fcd;
      expv[33] = 40'hdfff7f7fcd;
      expv[34] = 40'hdfff7f7fcd;
      expv[35] = 40'hdfff7f7fcd;
      expv[36] = 40'hdfff7f7fcd;
      expv[37] = 40'hdfff7f7fcd;
      expv[38] = 40'hdfff7f7fcd;
      expv[39] = 40'hdfff7f7fcd;
      expv[40] = 40'hdfff7f7fcd;
      expv[41] = 40'hdfff7f7fcd;
      expv[42] = 40'hdfff7f7fcd;
      expv[43] = 40'hdfff7f7fcd;
      expv[44] = 40'hdfff7f7fcd;
      expv[45] = 40'hdfff7f7fcd;
      expv[46] = 40'hdfff7f7fcd;
      expv[47] = 40'hdfff7f7fcd;
      expv[48] = 40'hdfff7f7fcd;
      expv[49] = 40'hdfff7f7fcd;
      expv[50] = 40'hdfff7f7fcd;
      expv[51] = 40'hdfff7f7fcd;
      expv[52] = 40'hdfff7f7fcd;
      expv[53] = 40'hdfff7f7fcd;
      expv[54] = 40'hdfff7f7fcd;
      expv[55] = 40'hdfff7f7fcd;
      expv[56] = 40'hdfff7f7fcd;
      expv[57] = 40'hdfff7f7fcd;
      expv[58] = 40'hdfff7f7fcd;
      expv[59] = 40'hdfff7f7fcd;
      expv[60] = 40'hdfff7f7fcd;
      expv[61] = 40'hdfff7f7fcd;
      expv[62] = 40'hdfff7f7fcd;
      expv[63] = 40'hdfff7f7fcd;
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
