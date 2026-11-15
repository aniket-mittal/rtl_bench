// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 25;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_066502 dut (
    .xclk(clk),
    .hsync(out_vec[24:24]),
    .vsync(out_vec[23:23]),
    .de(out_vec[22:22]),
    .cnt_x(out_vec[21:11]),
    .cnt_y(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h0;
    stim[2] = 1'h0;
    stim[3] = 1'h0;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h0;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h0;
    stim[12] = 1'h0;
    stim[13] = 1'h0;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h0;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h0;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h0;
    stim[24] = 1'h0;
    stim[25] = 1'h0;
    stim[26] = 1'h0;
    stim[27] = 1'h0;
    stim[28] = 1'h0;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h0;
    stim[35] = 1'h0;
    stim[36] = 1'h0;
    stim[37] = 1'h0;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h0;
    stim[43] = 1'h0;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h0;
    stim[54] = 1'h0;
    stim[55] = 1'h0;
    stim[56] = 1'h0;
    stim[57] = 1'h0;
    stim[58] = 1'h0;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
    stim[61] = 1'h0;
    stim[62] = 1'h0;
    stim[63] = 1'h0;
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
      expv[0] = 25'hxxxxxxx;
      expv[1] = 25'h1xxxxxx;
      expv[2] = 25'h1xxxxxx;
      expv[3] = 25'h1xxxxxx;
      expv[4] = 25'h1xxxxxx;
      expv[5] = 25'h1xxxxxx;
      expv[6] = 25'h1xxxxxx;
      expv[7] = 25'h1xxxxxx;
      expv[8] = 25'h1xxxxxx;
      expv[9] = 25'h1xxxxxx;
      expv[10] = 25'h1xxxxxx;
      expv[11] = 25'h1xxxxxx;
      expv[12] = 25'h1xxxxxx;
      expv[13] = 25'h1xxxxxx;
      expv[14] = 25'h1xxxxxx;
      expv[15] = 25'h1xxxxxx;
      expv[16] = 25'h1xxxxxx;
      expv[17] = 25'h1xxxxxx;
      expv[18] = 25'h1xxxxxx;
      expv[19] = 25'h1xxxxxx;
      expv[20] = 25'h1xxxxxx;
      expv[21] = 25'h1xxxxxx;
      expv[22] = 25'h1xxxxxx;
      expv[23] = 25'h1xxxxxx;
      expv[24] = 25'h1xxxxxx;
      expv[25] = 25'h1xxxxxx;
      expv[26] = 25'h1xxxxxx;
      expv[27] = 25'h1xxxxxx;
      expv[28] = 25'h1xxxxxx;
      expv[29] = 25'h1xxxxxx;
      expv[30] = 25'h1xxxxxx;
      expv[31] = 25'h1xxxxxx;
      expv[32] = 25'h1xxxxxx;
      expv[33] = 25'h1xxxxxx;
      expv[34] = 25'h1xxxxxx;
      expv[35] = 25'h1xxxxxx;
      expv[36] = 25'h1xxxxxx;
      expv[37] = 25'h1xxxxxx;
      expv[38] = 25'h1xxxxxx;
      expv[39] = 25'h1xxxxxx;
      expv[40] = 25'h1xxxxxx;
      expv[41] = 25'h1xxxxxx;
      expv[42] = 25'h1xxxxxx;
      expv[43] = 25'h1xxxxxx;
      expv[44] = 25'h1xxxxxx;
      expv[45] = 25'h1xxxxxx;
      expv[46] = 25'h1xxxxxx;
      expv[47] = 25'h1xxxxxx;
      expv[48] = 25'h1xxxxxx;
      expv[49] = 25'h1xxxxxx;
      expv[50] = 25'h1xxxxxx;
      expv[51] = 25'h1xxxxxx;
      expv[52] = 25'h1xxxxxx;
      expv[53] = 25'h1xxxxxx;
      expv[54] = 25'h1xxxxxx;
      expv[55] = 25'h1xxxxxx;
      expv[56] = 25'h1xxxxxx;
      expv[57] = 25'h1xxxxxx;
      expv[58] = 25'h1xxxxxx;
      expv[59] = 25'h1xxxxxx;
      expv[60] = 25'h1xxxxxx;
      expv[61] = 25'h1xxxxxx;
      expv[62] = 25'h1xxxxxx;
      expv[63] = 25'h1xxxxxx;
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
