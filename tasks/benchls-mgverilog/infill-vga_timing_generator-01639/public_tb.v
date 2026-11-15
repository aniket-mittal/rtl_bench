// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 23;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01639 dut (
    .clk(clk),
    .gfx_clk(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .h_sync(out_vec[22:22]),
    .v_sync(out_vec[21:21]),
    .blank(out_vec[20:20]),
    .x(out_vec[19:10]),
    .y(out_vec[9:0])
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
    stim[1] = 2'h1;
    stim[2] = 2'h0;
    stim[3] = 2'h0;
    stim[4] = 2'h2;
    stim[5] = 2'h2;
    stim[6] = 2'h2;
    stim[7] = 2'h2;
    stim[8] = 2'h0;
    stim[9] = 2'h2;
    stim[10] = 2'h0;
    stim[11] = 2'h2;
    stim[12] = 2'h0;
    stim[13] = 2'h1;
    stim[14] = 2'h0;
    stim[15] = 2'h2;
    stim[16] = 2'h0;
    stim[17] = 2'h2;
    stim[18] = 2'h2;
    stim[19] = 2'h0;
    stim[20] = 2'h0;
    stim[21] = 2'h0;
    stim[22] = 2'h0;
    stim[23] = 2'h2;
    stim[24] = 2'h2;
    stim[25] = 2'h2;
    stim[26] = 2'h2;
    stim[27] = 2'h0;
    stim[28] = 2'h0;
    stim[29] = 2'h0;
    stim[30] = 2'h0;
    stim[31] = 2'h2;
    stim[32] = 2'h2;
    stim[33] = 2'h2;
    stim[34] = 2'h0;
    stim[35] = 2'h2;
    stim[36] = 2'h0;
    stim[37] = 2'h2;
    stim[38] = 2'h0;
    stim[39] = 2'h2;
    stim[40] = 2'h0;
    stim[41] = 2'h0;
    stim[42] = 2'h0;
    stim[43] = 2'h0;
    stim[44] = 2'h2;
    stim[45] = 2'h2;
    stim[46] = 2'h0;
    stim[47] = 2'h2;
    stim[48] = 2'h0;
    stim[49] = 2'h0;
    stim[50] = 2'h0;
    stim[51] = 2'h2;
    stim[52] = 2'h2;
    stim[53] = 2'h0;
    stim[54] = 2'h0;
    stim[55] = 2'h2;
    stim[56] = 2'h0;
    stim[57] = 2'h2;
    stim[58] = 2'h0;
    stim[59] = 2'h2;
    stim[60] = 2'h0;
    stim[61] = 2'h2;
    stim[62] = 2'h0;
    stim[63] = 2'h0;
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
      expv[0] = 23'h0dc3de;
      expv[1] = 23'h0dc3de;
      expv[2] = 23'h0dc3de;
      expv[3] = 23'h0dc3de;
      expv[4] = 23'h0dc7de;
      expv[5] = 23'h0dc7de;
      expv[6] = 23'h0dc7de;
      expv[7] = 23'h0dc7de;
      expv[8] = 23'h0dc7de;
      expv[9] = 23'h0dcbde;
      expv[10] = 23'h0dcbde;
      expv[11] = 23'h0dcfde;
      expv[12] = 23'h0dcfde;
      expv[13] = 23'h0dcfde;
      expv[14] = 23'h0dcfde;
      expv[15] = 23'h0dd3de;
      expv[16] = 23'h0dd3de;
      expv[17] = 23'h0dd7de;
      expv[18] = 23'h0dd7de;
      expv[19] = 23'h0dd7de;
      expv[20] = 23'h0dd7de;
      expv[21] = 23'h0dd7de;
      expv[22] = 23'h0dd7de;
      expv[23] = 23'h0ddbde;
      expv[24] = 23'h0ddbde;
      expv[25] = 23'h0ddbde;
      expv[26] = 23'h0ddbde;
      expv[27] = 23'h0ddbde;
      expv[28] = 23'h0ddbde;
      expv[29] = 23'h0ddbde;
      expv[30] = 23'h0ddbde;
      expv[31] = 23'h0ddfde;
      expv[32] = 23'h0ddfde;
      expv[33] = 23'h0ddfde;
      expv[34] = 23'h0ddfde;
      expv[35] = 23'h0de3de;
      expv[36] = 23'h0de3de;
      expv[37] = 23'h0de7de;
      expv[38] = 23'h0de7de;
      expv[39] = 23'h0debde;
      expv[40] = 23'h0debde;
      expv[41] = 23'h0debde;
      expv[42] = 23'h0debde;
      expv[43] = 23'h0debde;
      expv[44] = 23'h0defde;
      expv[45] = 23'h0defde;
      expv[46] = 23'h0defde;
      expv[47] = 23'h0df3de;
      expv[48] = 23'h0df3de;
      expv[49] = 23'h0df3de;
      expv[50] = 23'h0df3de;
      expv[51] = 23'h0df7de;
      expv[52] = 23'h0df7de;
      expv[53] = 23'h0df7de;
      expv[54] = 23'h0df7de;
      expv[55] = 23'h0dfbde;
      expv[56] = 23'h0dfbde;
      expv[57] = 23'h0dffde;
      expv[58] = 23'h0dffde;
      expv[59] = 23'h0e03de;
      expv[60] = 23'h0e03de;
      expv[61] = 23'h0e07de;
      expv[62] = 23'h0e07de;
      expv[63] = 23'h0e07de;
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
