// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01906 dut (
    .mclkout_i(clk),
    .reset_i(in_vec[1:1]),
    .mdata_i(in_vec[0:0]),
    .data_rdy_o(out_vec[16:16]),
    .data_o(out_vec[15:0])
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
    stim[2] = 2'h1;
    stim[3] = 2'h0;
    stim[4] = 2'h1;
    stim[5] = 2'h0;
    stim[6] = 2'h1;
    stim[7] = 2'h1;
    stim[8] = 2'h1;
    stim[9] = 2'h0;
    stim[10] = 2'h0;
    stim[11] = 2'h0;
    stim[12] = 2'h0;
    stim[13] = 2'h1;
    stim[14] = 2'h0;
    stim[15] = 2'h1;
    stim[16] = 2'h1;
    stim[17] = 2'h0;
    stim[18] = 2'h0;
    stim[19] = 2'h0;
    stim[20] = 2'h0;
    stim[21] = 2'h1;
    stim[22] = 2'h1;
    stim[23] = 2'h0;
    stim[24] = 2'h1;
    stim[25] = 2'h0;
    stim[26] = 2'h0;
    stim[27] = 2'h0;
    stim[28] = 2'h1;
    stim[29] = 2'h1;
    stim[30] = 2'h1;
    stim[31] = 2'h1;
    stim[32] = 2'h1;
    stim[33] = 2'h1;
    stim[34] = 2'h0;
    stim[35] = 2'h1;
    stim[36] = 2'h0;
    stim[37] = 2'h0;
    stim[38] = 2'h1;
    stim[39] = 2'h0;
    stim[40] = 2'h0;
    stim[41] = 2'h1;
    stim[42] = 2'h0;
    stim[43] = 2'h0;
    stim[44] = 2'h0;
    stim[45] = 2'h0;
    stim[46] = 2'h1;
    stim[47] = 2'h0;
    stim[48] = 2'h1;
    stim[49] = 2'h1;
    stim[50] = 2'h1;
    stim[51] = 2'h0;
    stim[52] = 2'h0;
    stim[53] = 2'h0;
    stim[54] = 2'h0;
    stim[55] = 2'h1;
    stim[56] = 2'h1;
    stim[57] = 2'h0;
    stim[58] = 2'h0;
    stim[59] = 2'h1;
    stim[60] = 2'h1;
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
      expv[0] = 17'h0xxxx;
      expv[1] = 17'h0xxxx;
      expv[2] = 17'h0xxxx;
      expv[3] = 17'h0xxxx;
      expv[4] = 17'h0xxxx;
      expv[5] = 17'h0xxxx;
      expv[6] = 17'h0xxxx;
      expv[7] = 17'h0xxxx;
      expv[8] = 17'h0xxxx;
      expv[9] = 17'h0xxxx;
      expv[10] = 17'h0xxxx;
      expv[11] = 17'h0xxxx;
      expv[12] = 17'h0xxxx;
      expv[13] = 17'h0xxxx;
      expv[14] = 17'h0xxxx;
      expv[15] = 17'h0xxxx;
      expv[16] = 17'h0xxxx;
      expv[17] = 17'h0xxxx;
      expv[18] = 17'h0xxxx;
      expv[19] = 17'h0xxxx;
      expv[20] = 17'h0xxxx;
      expv[21] = 17'h0xxxx;
      expv[22] = 17'h0xxxx;
      expv[23] = 17'h0xxxx;
      expv[24] = 17'h0xxxx;
      expv[25] = 17'h0xxxx;
      expv[26] = 17'h0xxxx;
      expv[27] = 17'h0xxxx;
      expv[28] = 17'h0xxxx;
      expv[29] = 17'h0xxxx;
      expv[30] = 17'h0xxxx;
      expv[31] = 17'h0xxxx;
      expv[32] = 17'h0xxxx;
      expv[33] = 17'h0xxxx;
      expv[34] = 17'h0xxxx;
      expv[35] = 17'h0xxxx;
      expv[36] = 17'h0xxxx;
      expv[37] = 17'h0xxxx;
      expv[38] = 17'h0xxxx;
      expv[39] = 17'h0xxxx;
      expv[40] = 17'h0xxxx;
      expv[41] = 17'h0xxxx;
      expv[42] = 17'h0xxxx;
      expv[43] = 17'h0xxxx;
      expv[44] = 17'h0xxxx;
      expv[45] = 17'h0xxxx;
      expv[46] = 17'h0xxxx;
      expv[47] = 17'h0xxxx;
      expv[48] = 17'h0xxxx;
      expv[49] = 17'h0xxxx;
      expv[50] = 17'h0xxxx;
      expv[51] = 17'h0xxxx;
      expv[52] = 17'h0xxxx;
      expv[53] = 17'h0xxxx;
      expv[54] = 17'h0xxxx;
      expv[55] = 17'h0xxxx;
      expv[56] = 17'h0xxxx;
      expv[57] = 17'h0xxxx;
      expv[58] = 17'h0xxxx;
      expv[59] = 17'h0xxxx;
      expv[60] = 17'h0xxxx;
      expv[61] = 17'h0xxxx;
      expv[62] = 17'h0xxxx;
      expv[63] = 17'h0xxxx;
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
