// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 160;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_172618 dut (
    .clk(clk),
    .theme(in_vec[1:0]),
    .borderColor(out_vec[159:128]),
    .bgColor(out_vec[127:96]),
    .lowColor(out_vec[95:64]),
    .midColor(out_vec[63:32]),
    .highColor(out_vec[31:0])
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
    stim[3] = 2'h3;
    stim[4] = 2'h1;
    stim[5] = 2'h1;
    stim[6] = 2'h3;
    stim[7] = 2'h1;
    stim[8] = 2'h3;
    stim[9] = 2'h1;
    stim[10] = 2'h2;
    stim[11] = 2'h2;
    stim[12] = 2'h2;
    stim[13] = 2'h3;
    stim[14] = 2'h0;
    stim[15] = 2'h1;
    stim[16] = 2'h0;
    stim[17] = 2'h0;
    stim[18] = 2'h1;
    stim[19] = 2'h2;
    stim[20] = 2'h1;
    stim[21] = 2'h2;
    stim[22] = 2'h2;
    stim[23] = 2'h3;
    stim[24] = 2'h2;
    stim[25] = 2'h0;
    stim[26] = 2'h0;
    stim[27] = 2'h2;
    stim[28] = 2'h3;
    stim[29] = 2'h0;
    stim[30] = 2'h1;
    stim[31] = 2'h1;
    stim[32] = 2'h3;
    stim[33] = 2'h0;
    stim[34] = 2'h0;
    stim[35] = 2'h1;
    stim[36] = 2'h2;
    stim[37] = 2'h2;
    stim[38] = 2'h2;
    stim[39] = 2'h0;
    stim[40] = 2'h3;
    stim[41] = 2'h0;
    stim[42] = 2'h3;
    stim[43] = 2'h0;
    stim[44] = 2'h0;
    stim[45] = 2'h3;
    stim[46] = 2'h2;
    stim[47] = 2'h0;
    stim[48] = 2'h0;
    stim[49] = 2'h0;
    stim[50] = 2'h2;
    stim[51] = 2'h0;
    stim[52] = 2'h1;
    stim[53] = 2'h2;
    stim[54] = 2'h1;
    stim[55] = 2'h3;
    stim[56] = 2'h2;
    stim[57] = 2'h2;
    stim[58] = 2'h2;
    stim[59] = 2'h3;
    stim[60] = 2'h0;
    stim[61] = 2'h0;
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
      expv[0] = 160'hxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
      expv[1] = 160'hff0000ff00ffffff00ff00ffffff00ffff00ffff;
      expv[2] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[3] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[4] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[5] = 160'hff0000ff00ffffff00ff00ffffff00ffff00ffff;
      expv[6] = 160'hff0000ff00ffffff00ff00ffffff00ffff00ffff;
      expv[7] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[8] = 160'hff0000ff00ffffff00ff00ffffff00ffff00ffff;
      expv[9] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[10] = 160'hff0000ff00ffffff00ff00ffffff00ffff00ffff;
      expv[11] = 160'hffff00ff0000ffff00ffffffff00ffffffffffff;
      expv[12] = 160'hffff00ff0000ffff00ffffffff00ffffffffffff;
      expv[13] = 160'hffff00ff0000ffff00ffffffff00ffffffffffff;
      expv[14] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[15] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[16] = 160'hff0000ff00ffffff00ff00ffffff00ffff00ffff;
      expv[17] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[18] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[19] = 160'hff0000ff00ffffff00ff00ffffff00ffff00ffff;
      expv[20] = 160'hffff00ff0000ffff00ffffffff00ffffffffffff;
      expv[21] = 160'hff0000ff00ffffff00ff00ffffff00ffff00ffff;
      expv[22] = 160'hffff00ff0000ffff00ffffffff00ffffffffffff;
      expv[23] = 160'hffff00ff0000ffff00ffffffff00ffffffffffff;
      expv[24] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[25] = 160'hffff00ff0000ffff00ffffffff00ffffffffffff;
      expv[26] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[27] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[28] = 160'hffff00ff0000ffff00ffffffff00ffffffffffff;
      expv[29] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[30] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[31] = 160'hff0000ff00ffffff00ff00ffffff00ffff00ffff;
      expv[32] = 160'hff0000ff00ffffff00ff00ffffff00ffff00ffff;
      expv[33] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[34] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[35] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[36] = 160'hff0000ff00ffffff00ff00ffffff00ffff00ffff;
      expv[37] = 160'hffff00ff0000ffff00ffffffff00ffffffffffff;
      expv[38] = 160'hffff00ff0000ffff00ffffffff00ffffffffffff;
      expv[39] = 160'hffff00ff0000ffff00ffffffff00ffffffffffff;
      expv[40] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[41] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[42] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[43] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[44] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[45] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[46] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[47] = 160'hffff00ff0000ffff00ffffffff00ffffffffffff;
      expv[48] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[49] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[50] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[51] = 160'hffff00ff0000ffff00ffffffff00ffffffffffff;
      expv[52] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[53] = 160'hff0000ff00ffffff00ff00ffffff00ffff00ffff;
      expv[54] = 160'hffff00ff0000ffff00ffffffff00ffffffffffff;
      expv[55] = 160'hff0000ff00ffffff00ff00ffffff00ffff00ffff;
      expv[56] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[57] = 160'hffff00ff0000ffff00ffffffff00ffffffffffff;
      expv[58] = 160'hffff00ff0000ffff00ffffffff00ffffffffffff;
      expv[59] = 160'hffff00ff0000ffff00ffffffff00ffffffffffff;
      expv[60] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[61] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[62] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
      expv[63] = 160'hffffffff0000000000ff00ffffff00ffff0000ff;
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
