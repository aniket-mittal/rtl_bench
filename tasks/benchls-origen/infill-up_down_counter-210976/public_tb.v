// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_210976 dut (
    .inter_clk(clk),
    .clr(in_vec[3:3]),
    .cnt(in_vec[2:2]),
    .ld(in_vec[1:1]),
    .up(in_vec[0:0]),
    .tc(out_vec[4:4]),
    .c(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h0;
    stim[1] = 4'h6;
    stim[2] = 4'hf;
    stim[3] = 4'he;
    stim[4] = 4'hf;
    stim[5] = 4'hb;
    stim[6] = 4'ha;
    stim[7] = 4'hc;
    stim[8] = 4'hc;
    stim[9] = 4'ha;
    stim[10] = 4'he;
    stim[11] = 4'hd;
    stim[12] = 4'hc;
    stim[13] = 4'hb;
    stim[14] = 4'h9;
    stim[15] = 4'hd;
    stim[16] = 4'h8;
    stim[17] = 4'ha;
    stim[18] = 4'hb;
    stim[19] = 4'ha;
    stim[20] = 4'hb;
    stim[21] = 4'ha;
    stim[22] = 4'he;
    stim[23] = 4'ha;
    stim[24] = 4'h8;
    stim[25] = 4'hf;
    stim[26] = 4'hc;
    stim[27] = 4'he;
    stim[28] = 4'he;
    stim[29] = 4'h0;
    stim[30] = 4'h8;
    stim[31] = 4'h8;
    stim[32] = 4'hc;
    stim[33] = 4'hd;
    stim[34] = 4'he;
    stim[35] = 4'hf;
    stim[36] = 4'h8;
    stim[37] = 4'h2;
    stim[38] = 4'h9;
    stim[39] = 4'hb;
    stim[40] = 4'hf;
    stim[41] = 4'hf;
    stim[42] = 4'hb;
    stim[43] = 4'hb;
    stim[44] = 4'he;
    stim[45] = 4'he;
    stim[46] = 4'hc;
    stim[47] = 4'hd;
    stim[48] = 4'ha;
    stim[49] = 4'hb;
    stim[50] = 4'h9;
    stim[51] = 4'hc;
    stim[52] = 4'hc;
    stim[53] = 4'hb;
    stim[54] = 4'hf;
    stim[55] = 4'ha;
    stim[56] = 4'hf;
    stim[57] = 4'h8;
    stim[58] = 4'he;
    stim[59] = 4'h8;
    stim[60] = 4'ha;
    stim[61] = 4'h8;
    stim[62] = 4'ha;
    stim[63] = 4'ha;
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
      expv[0] = 5'h00;
      expv[1] = 5'h00;
      expv[2] = 5'h00;
      expv[3] = 5'h00;
      expv[4] = 5'h00;
      expv[5] = 5'h00;
      expv[6] = 5'h00;
      expv[7] = 5'h00;
      expv[8] = 5'h1f;
      expv[9] = 5'h0e;
      expv[10] = 5'h00;
      expv[11] = 5'h00;
      expv[12] = 5'h01;
      expv[13] = 5'h00;
      expv[14] = 5'h00;
      expv[15] = 5'h00;
      expv[16] = 5'h01;
      expv[17] = 5'h01;
      expv[18] = 5'h00;
      expv[19] = 5'h00;
      expv[20] = 5'h00;
      expv[21] = 5'h00;
      expv[22] = 5'h00;
      expv[23] = 5'h00;
      expv[24] = 5'h00;
      expv[25] = 5'h00;
      expv[26] = 5'h00;
      expv[27] = 5'h1f;
      expv[28] = 5'h00;
      expv[29] = 5'h00;
      expv[30] = 5'h00;
      expv[31] = 5'h00;
      expv[32] = 5'h00;
      expv[33] = 5'h1f;
      expv[34] = 5'h10;
      expv[35] = 5'h00;
      expv[36] = 5'h00;
      expv[37] = 5'h00;
      expv[38] = 5'h00;
      expv[39] = 5'h00;
      expv[40] = 5'h00;
      expv[41] = 5'h00;
      expv[42] = 5'h00;
      expv[43] = 5'h00;
      expv[44] = 5'h00;
      expv[45] = 5'h00;
      expv[46] = 5'h00;
      expv[47] = 5'h1f;
      expv[48] = 5'h10;
      expv[49] = 5'h00;
      expv[50] = 5'h00;
      expv[51] = 5'h00;
      expv[52] = 5'h1f;
      expv[53] = 5'h0e;
      expv[54] = 5'h00;
      expv[55] = 5'h00;
      expv[56] = 5'h00;
      expv[57] = 5'h00;
      expv[58] = 5'h00;
      expv[59] = 5'h00;
      expv[60] = 5'h00;
      expv[61] = 5'h00;
      expv[62] = 5'h00;
      expv[63] = 5'h00;
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
