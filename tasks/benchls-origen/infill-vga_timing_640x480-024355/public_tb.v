// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_024355 dut (
    .i_clk(clk),
    .i_pix_stb(in_vec[1:1]),
    .i_rst(in_vec[0:0]),
    .o_hs(out_vec[21:21]),
    .o_vs(out_vec[20:20]),
    .o_animate(out_vec[19:19]),
    .o_x(out_vec[18:9]),
    .o_y(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h1;
    stim[1] = 2'h3;
    stim[2] = 2'h0;
    stim[3] = 2'h0;
    stim[4] = 2'h0;
    stim[5] = 2'h2;
    stim[6] = 2'h0;
    stim[7] = 2'h2;
    stim[8] = 2'h0;
    stim[9] = 2'h0;
    stim[10] = 2'h0;
    stim[11] = 2'h2;
    stim[12] = 2'h0;
    stim[13] = 2'h2;
    stim[14] = 2'h2;
    stim[15] = 2'h0;
    stim[16] = 2'h0;
    stim[17] = 2'h0;
    stim[18] = 2'h2;
    stim[19] = 2'h2;
    stim[20] = 2'h2;
    stim[21] = 2'h0;
    stim[22] = 2'h0;
    stim[23] = 2'h2;
    stim[24] = 2'h0;
    stim[25] = 2'h3;
    stim[26] = 2'h2;
    stim[27] = 2'h2;
    stim[28] = 2'h2;
    stim[29] = 2'h2;
    stim[30] = 2'h0;
    stim[31] = 2'h0;
    stim[32] = 2'h2;
    stim[33] = 2'h0;
    stim[34] = 2'h1;
    stim[35] = 2'h0;
    stim[36] = 2'h0;
    stim[37] = 2'h0;
    stim[38] = 2'h2;
    stim[39] = 2'h0;
    stim[40] = 2'h2;
    stim[41] = 2'h2;
    stim[42] = 2'h2;
    stim[43] = 2'h2;
    stim[44] = 2'h2;
    stim[45] = 2'h2;
    stim[46] = 2'h0;
    stim[47] = 2'h0;
    stim[48] = 2'h2;
    stim[49] = 2'h2;
    stim[50] = 2'h0;
    stim[51] = 2'h2;
    stim[52] = 2'h2;
    stim[53] = 2'h2;
    stim[54] = 2'h0;
    stim[55] = 2'h2;
    stim[56] = 2'h2;
    stim[57] = 2'h0;
    stim[58] = 2'h2;
    stim[59] = 2'h2;
    stim[60] = 2'h0;
    stim[61] = 2'h0;
    stim[62] = 2'h2;
    stim[63] = 2'h2;
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
      expv[0] = 22'hxxxxxx;
      expv[1] = 22'h300000;
      expv[2] = 22'h300000;
      expv[3] = 22'h300000;
      expv[4] = 22'h300000;
      expv[5] = 22'h300000;
      expv[6] = 22'h300000;
      expv[7] = 22'h300000;
      expv[8] = 22'h300000;
      expv[9] = 22'h300000;
      expv[10] = 22'h300000;
      expv[11] = 22'h300000;
      expv[12] = 22'h300000;
      expv[13] = 22'h300000;
      expv[14] = 22'h300000;
      expv[15] = 22'h300000;
      expv[16] = 22'h300000;
      expv[17] = 22'h300000;
      expv[18] = 22'h300000;
      expv[19] = 22'h300000;
      expv[20] = 22'h300000;
      expv[21] = 22'h300000;
      expv[22] = 22'h300000;
      expv[23] = 22'h300000;
      expv[24] = 22'h300000;
      expv[25] = 22'h300000;
      expv[26] = 22'h300000;
      expv[27] = 22'h300000;
      expv[28] = 22'h300000;
      expv[29] = 22'h300000;
      expv[30] = 22'h300000;
      expv[31] = 22'h300000;
      expv[32] = 22'h300000;
      expv[33] = 22'h300000;
      expv[34] = 22'h300000;
      expv[35] = 22'h300000;
      expv[36] = 22'h300000;
      expv[37] = 22'h300000;
      expv[38] = 22'h300000;
      expv[39] = 22'h300000;
      expv[40] = 22'h300000;
      expv[41] = 22'h300000;
      expv[42] = 22'h300000;
      expv[43] = 22'h300000;
      expv[44] = 22'h300000;
      expv[45] = 22'h300000;
      expv[46] = 22'h300000;
      expv[47] = 22'h300000;
      expv[48] = 22'h300000;
      expv[49] = 22'h300000;
      expv[50] = 22'h300000;
      expv[51] = 22'h300000;
      expv[52] = 22'h300000;
      expv[53] = 22'h300000;
      expv[54] = 22'h300000;
      expv[55] = 22'h300000;
      expv[56] = 22'h300000;
      expv[57] = 22'h300000;
      expv[58] = 22'h300000;
      expv[59] = 22'h300000;
      expv[60] = 22'h100000;
      expv[61] = 22'h100000;
      expv[62] = 22'h100000;
      expv[63] = 22'h100000;
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
