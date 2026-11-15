// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_079000 dut (
    .CLOCK_50(clk),
    .RST(in_vec[0:0]),
    .VGA_R(out_vec[26:19]),
    .VGA_G(out_vec[18:11]),
    .VGA_B(out_vec[10:3]),
    .VGA_HS(out_vec[2:2]),
    .VGA_VS(out_vec[1:1]),
    .VGA_CLK(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h1;
    stim[1] = 1'h1;
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
    stim[40] = 1'h1;
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
      expv[0] = 27'h0000006;
      expv[1] = 27'h0000006;
      expv[2] = 27'h0000006;
      expv[3] = 27'h00007ff;
      expv[4] = 27'h00007fe;
      expv[5] = 27'h00007ff;
      expv[6] = 27'h00007fe;
      expv[7] = 27'h00007ff;
      expv[8] = 27'h00007fe;
      expv[9] = 27'h00007ff;
      expv[10] = 27'h00007fe;
      expv[11] = 27'h00007ff;
      expv[12] = 27'h00007fe;
      expv[13] = 27'h00007ff;
      expv[14] = 27'h00007fe;
      expv[15] = 27'h00007ff;
      expv[16] = 27'h00007fe;
      expv[17] = 27'h00007ff;
      expv[18] = 27'h00007fe;
      expv[19] = 27'h00007ff;
      expv[20] = 27'h00007fe;
      expv[21] = 27'h00007ff;
      expv[22] = 27'h00007fe;
      expv[23] = 27'h00007ff;
      expv[24] = 27'h00007fe;
      expv[25] = 27'h00007ff;
      expv[26] = 27'h00007fe;
      expv[27] = 27'h00007ff;
      expv[28] = 27'h00007fe;
      expv[29] = 27'h00007ff;
      expv[30] = 27'h00007fe;
      expv[31] = 27'h00007ff;
      expv[32] = 27'h00007fe;
      expv[33] = 27'h00007ff;
      expv[34] = 27'h00007fe;
      expv[35] = 27'h00007ff;
      expv[36] = 27'h00007fe;
      expv[37] = 27'h00007ff;
      expv[38] = 27'h00007fe;
      expv[39] = 27'h00007ff;
      expv[40] = 27'h0000006;
      expv[41] = 27'h0000006;
      expv[42] = 27'h00007ff;
      expv[43] = 27'h00007fe;
      expv[44] = 27'h00007ff;
      expv[45] = 27'h00007fe;
      expv[46] = 27'h00007ff;
      expv[47] = 27'h00007fe;
      expv[48] = 27'h00007ff;
      expv[49] = 27'h00007fe;
      expv[50] = 27'h00007ff;
      expv[51] = 27'h00007fe;
      expv[52] = 27'h00007ff;
      expv[53] = 27'h00007fe;
      expv[54] = 27'h00007ff;
      expv[55] = 27'h00007fe;
      expv[56] = 27'h00007ff;
      expv[57] = 27'h00007fe;
      expv[58] = 27'h00007ff;
      expv[59] = 27'h00007fe;
      expv[60] = 27'h00007ff;
      expv[61] = 27'h00007fe;
      expv[62] = 27'h00007ff;
      expv[63] = 27'h00007fe;
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
