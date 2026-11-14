// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  JC_counter dut (
    .clk(clk),
    .rst_n(in_vec[0:0]),
    .Q(out_vec[63:0])
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
    stim[2] = 1'h1;
    stim[3] = 1'h1;
    stim[4] = 1'h1;
    stim[5] = 1'h1;
    stim[6] = 1'h1;
    stim[7] = 1'h1;
    stim[8] = 1'h1;
    stim[9] = 1'h1;
    stim[10] = 1'h1;
    stim[11] = 1'h1;
    stim[12] = 1'h1;
    stim[13] = 1'h1;
    stim[14] = 1'h1;
    stim[15] = 1'h1;
    stim[16] = 1'h1;
    stim[17] = 1'h1;
    stim[18] = 1'h1;
    stim[19] = 1'h1;
    stim[20] = 1'h1;
    stim[21] = 1'h1;
    stim[22] = 1'h1;
    stim[23] = 1'h1;
    stim[24] = 1'h1;
    stim[25] = 1'h1;
    stim[26] = 1'h1;
    stim[27] = 1'h1;
    stim[28] = 1'h1;
    stim[29] = 1'h1;
    stim[30] = 1'h1;
    stim[31] = 1'h1;
    stim[32] = 1'h1;
    stim[33] = 1'h1;
    stim[34] = 1'h1;
    stim[35] = 1'h1;
    stim[36] = 1'h1;
    stim[37] = 1'h1;
    stim[38] = 1'h1;
    stim[39] = 1'h1;
    stim[40] = 1'h1;
    stim[41] = 1'h1;
    stim[42] = 1'h1;
    stim[43] = 1'h0;
    stim[44] = 1'h1;
    stim[45] = 1'h1;
    stim[46] = 1'h1;
    stim[47] = 1'h1;
    stim[48] = 1'h1;
    stim[49] = 1'h1;
    stim[50] = 1'h1;
    stim[51] = 1'h1;
    stim[52] = 1'h1;
    stim[53] = 1'h1;
    stim[54] = 1'h1;
    stim[55] = 1'h1;
    stim[56] = 1'h1;
    stim[57] = 1'h1;
    stim[58] = 1'h1;
    stim[59] = 1'h1;
    stim[60] = 1'h1;
    stim[61] = 1'h1;
    stim[62] = 1'h1;
    stim[63] = 1'h1;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h8000000000000000;
      expv[4] = 64'hc000000000000000;
      expv[5] = 64'he000000000000000;
      expv[6] = 64'hf000000000000000;
      expv[7] = 64'hf800000000000000;
      expv[8] = 64'hfc00000000000000;
      expv[9] = 64'hfe00000000000000;
      expv[10] = 64'hff00000000000000;
      expv[11] = 64'hff80000000000000;
      expv[12] = 64'hffc0000000000000;
      expv[13] = 64'hffe0000000000000;
      expv[14] = 64'hfff0000000000000;
      expv[15] = 64'hfff8000000000000;
      expv[16] = 64'hfffc000000000000;
      expv[17] = 64'hfffe000000000000;
      expv[18] = 64'hffff000000000000;
      expv[19] = 64'hffff800000000000;
      expv[20] = 64'hffffc00000000000;
      expv[21] = 64'hffffe00000000000;
      expv[22] = 64'hfffff00000000000;
      expv[23] = 64'hfffff80000000000;
      expv[24] = 64'hfffffc0000000000;
      expv[25] = 64'hfffffe0000000000;
      expv[26] = 64'hffffff0000000000;
      expv[27] = 64'hffffff8000000000;
      expv[28] = 64'hffffffc000000000;
      expv[29] = 64'hffffffe000000000;
      expv[30] = 64'hfffffff000000000;
      expv[31] = 64'hfffffff800000000;
      expv[32] = 64'hfffffffc00000000;
      expv[33] = 64'hfffffffe00000000;
      expv[34] = 64'hffffffff00000000;
      expv[35] = 64'hffffffff80000000;
      expv[36] = 64'hffffffffc0000000;
      expv[37] = 64'hffffffffe0000000;
      expv[38] = 64'hfffffffff0000000;
      expv[39] = 64'hfffffffff8000000;
      expv[40] = 64'hfffffffffc000000;
      expv[41] = 64'hfffffffffe000000;
      expv[42] = 64'hffffffffff000000;
      expv[43] = 64'h0000000000000000;
      expv[44] = 64'h0000000000000000;
      expv[45] = 64'h8000000000000000;
      expv[46] = 64'hc000000000000000;
      expv[47] = 64'he000000000000000;
      expv[48] = 64'hf000000000000000;
      expv[49] = 64'hf800000000000000;
      expv[50] = 64'hfc00000000000000;
      expv[51] = 64'hfe00000000000000;
      expv[52] = 64'hff00000000000000;
      expv[53] = 64'hff80000000000000;
      expv[54] = 64'hffc0000000000000;
      expv[55] = 64'hffe0000000000000;
      expv[56] = 64'hfff0000000000000;
      expv[57] = 64'hfff8000000000000;
      expv[58] = 64'hfffc000000000000;
      expv[59] = 64'hfffe000000000000;
      expv[60] = 64'hffff000000000000;
      expv[61] = 64'hffff800000000000;
      expv[62] = 64'hffffc00000000000;
      expv[63] = 64'hffffe00000000000;
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
