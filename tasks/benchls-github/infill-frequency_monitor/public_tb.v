// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 80;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  frequency_monitor dut (
    .ref_clk(clk),
    .signal(in_vec[3:0]),
    .khz_counters(out_vec[79:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h3;
    stim[1] = 4'h0;
    stim[2] = 4'hb;
    stim[3] = 4'h6;
    stim[4] = 4'h9;
    stim[5] = 4'ha;
    stim[6] = 4'h8;
    stim[7] = 4'hf;
    stim[8] = 4'h1;
    stim[9] = 4'hc;
    stim[10] = 4'hc;
    stim[11] = 4'hc;
    stim[12] = 4'h0;
    stim[13] = 4'h8;
    stim[14] = 4'h4;
    stim[15] = 4'h7;
    stim[16] = 4'he;
    stim[17] = 4'h5;
    stim[18] = 4'h1;
    stim[19] = 4'h2;
    stim[20] = 4'h1;
    stim[21] = 4'he;
    stim[22] = 4'h3;
    stim[23] = 4'hb;
    stim[24] = 4'hc;
    stim[25] = 4'h9;
    stim[26] = 4'h3;
    stim[27] = 4'h5;
    stim[28] = 4'hf;
    stim[29] = 4'h1;
    stim[30] = 4'hc;
    stim[31] = 4'h8;
    stim[32] = 4'hb;
    stim[33] = 4'h9;
    stim[34] = 4'h6;
    stim[35] = 4'h5;
    stim[36] = 4'h9;
    stim[37] = 4'h2;
    stim[38] = 4'hb;
    stim[39] = 4'hd;
    stim[40] = 4'hc;
    stim[41] = 4'h6;
    stim[42] = 4'h9;
    stim[43] = 4'h5;
    stim[44] = 4'hf;
    stim[45] = 4'h7;
    stim[46] = 4'hd;
    stim[47] = 4'hd;
    stim[48] = 4'ha;
    stim[49] = 4'hb;
    stim[50] = 4'hb;
    stim[51] = 4'hf;
    stim[52] = 4'h3;
    stim[53] = 4'hb;
    stim[54] = 4'hf;
    stim[55] = 4'he;
    stim[56] = 4'ha;
    stim[57] = 4'hc;
    stim[58] = 4'hb;
    stim[59] = 4'hb;
    stim[60] = 4'hc;
    stim[61] = 4'hf;
    stim[62] = 4'h0;
    stim[63] = 4'he;
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
      expv[0] = 80'h00000000000000000000;
      expv[1] = 80'h00000000000000000000;
      expv[2] = 80'h00000000000000000000;
      expv[3] = 80'h00000000000000000000;
      expv[4] = 80'h00000000000000000000;
      expv[5] = 80'h00000000000000000000;
      expv[6] = 80'h00000000000000000000;
      expv[7] = 80'h00000000000000000000;
      expv[8] = 80'h00000000000000000000;
      expv[9] = 80'h00000000000000000000;
      expv[10] = 80'h00000000000000000000;
      expv[11] = 80'h00000000000000000000;
      expv[12] = 80'h00000000000000000000;
      expv[13] = 80'h00000000000000000000;
      expv[14] = 80'h00000000000000000000;
      expv[15] = 80'h00000000000000000000;
      expv[16] = 80'h00000000000000000000;
      expv[17] = 80'h00000000000000000000;
      expv[18] = 80'h00000000000000000000;
      expv[19] = 80'h00000000000000000000;
      expv[20] = 80'h00000000000000000000;
      expv[21] = 80'h00000000000000000000;
      expv[22] = 80'h00000000000000000000;
      expv[23] = 80'h00000000000000000000;
      expv[24] = 80'h00000000000000000000;
      expv[25] = 80'h00000000000000000000;
      expv[26] = 80'h00000000000000000000;
      expv[27] = 80'h00000000000000000000;
      expv[28] = 80'h00000000000000000000;
      expv[29] = 80'h00000000000000000000;
      expv[30] = 80'h00000000000000000000;
      expv[31] = 80'h00000000000000000000;
      expv[32] = 80'h00000000000000000000;
      expv[33] = 80'h00000000000000000000;
      expv[34] = 80'h00000000000000000000;
      expv[35] = 80'h00000000000000000000;
      expv[36] = 80'h00000000000000000000;
      expv[37] = 80'h00000000000000000000;
      expv[38] = 80'h00000000000000000000;
      expv[39] = 80'h00000000000000000000;
      expv[40] = 80'h00000000000000000000;
      expv[41] = 80'h00000000000000000000;
      expv[42] = 80'h00000000000000000000;
      expv[43] = 80'h00000000000000000000;
      expv[44] = 80'h00000000000000000000;
      expv[45] = 80'h00000000000000000000;
      expv[46] = 80'h00000000000000000000;
      expv[47] = 80'h00000000000000000000;
      expv[48] = 80'h00000000000000000000;
      expv[49] = 80'h00000000000000000000;
      expv[50] = 80'h00000000000000000000;
      expv[51] = 80'h00000000000000000000;
      expv[52] = 80'h00000000000000000000;
      expv[53] = 80'h00000000000000000000;
      expv[54] = 80'h00000000000000000000;
      expv[55] = 80'h00000000000000000000;
      expv[56] = 80'h00000000000000000000;
      expv[57] = 80'h00000000000000000000;
      expv[58] = 80'h00000000000000000000;
      expv[59] = 80'h00000000000000000000;
      expv[60] = 80'h00000000000000000000;
      expv[61] = 80'h00000000000000000000;
      expv[62] = 80'h00000000000000000000;
      expv[63] = 80'h00000000000000000000;
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
