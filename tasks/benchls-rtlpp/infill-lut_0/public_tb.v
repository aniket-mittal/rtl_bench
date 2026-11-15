// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  LUT_0 dut (
    .percent(in_vec[3:0]),
    .bits(out_vec[26:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'hc;
    stim[1] = 4'hc;
    stim[2] = 4'h6;
    stim[3] = 4'hc;
    stim[4] = 4'h2;
    stim[5] = 4'h4;
    stim[6] = 4'hf;
    stim[7] = 4'h4;
    stim[8] = 4'h0;
    stim[9] = 4'h7;
    stim[10] = 4'ha;
    stim[11] = 4'h4;
    stim[12] = 4'h2;
    stim[13] = 4'h3;
    stim[14] = 4'h2;
    stim[15] = 4'h6;
    stim[16] = 4'hf;
    stim[17] = 4'h4;
    stim[18] = 4'h7;
    stim[19] = 4'h3;
    stim[20] = 4'h0;
    stim[21] = 4'hc;
    stim[22] = 4'h7;
    stim[23] = 4'h5;
    stim[24] = 4'h6;
    stim[25] = 4'h1;
    stim[26] = 4'hf;
    stim[27] = 4'hd;
    stim[28] = 4'h0;
    stim[29] = 4'hf;
    stim[30] = 4'hb;
    stim[31] = 4'h1;
    stim[32] = 4'h2;
    stim[33] = 4'h9;
    stim[34] = 4'h3;
    stim[35] = 4'he;
    stim[36] = 4'h2;
    stim[37] = 4'h9;
    stim[38] = 4'h2;
    stim[39] = 4'h4;
    stim[40] = 4'hf;
    stim[41] = 4'hf;
    stim[42] = 4'hb;
    stim[43] = 4'h8;
    stim[44] = 4'hb;
    stim[45] = 4'h1;
    stim[46] = 4'hf;
    stim[47] = 4'hf;
    stim[48] = 4'he;
    stim[49] = 4'h8;
    stim[50] = 4'ha;
    stim[51] = 4'hc;
    stim[52] = 4'hf;
    stim[53] = 4'hf;
    stim[54] = 4'hb;
    stim[55] = 4'hb;
    stim[56] = 4'h0;
    stim[57] = 4'h9;
    stim[58] = 4'h5;
    stim[59] = 4'h5;
    stim[60] = 4'hb;
    stim[61] = 4'he;
    stim[62] = 4'hb;
    stim[63] = 4'ha;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 27'h0000000;
      expv[1] = 27'h0000000;
      expv[2] = 27'h0000000;
      expv[3] = 27'h0000000;
      expv[4] = 27'h0000004;
      expv[5] = 27'h0000000;
      expv[6] = 27'h0000000;
      expv[7] = 27'h0000000;
      expv[8] = 27'h0000001;
      expv[9] = 27'h0000000;
      expv[10] = 27'h0000000;
      expv[11] = 27'h0000000;
      expv[12] = 27'h0000004;
      expv[13] = 27'h0000008;
      expv[14] = 27'h0000004;
      expv[15] = 27'h0000000;
      expv[16] = 27'h0000000;
      expv[17] = 27'h0000000;
      expv[18] = 27'h0000000;
      expv[19] = 27'h0000008;
      expv[20] = 27'h0000001;
      expv[21] = 27'h0000000;
      expv[22] = 27'h0000000;
      expv[23] = 27'h0000000;
      expv[24] = 27'h0000000;
      expv[25] = 27'h0000002;
      expv[26] = 27'h0000000;
      expv[27] = 27'h0000000;
      expv[28] = 27'h0000001;
      expv[29] = 27'h0000000;
      expv[30] = 27'h0000000;
      expv[31] = 27'h0000002;
      expv[32] = 27'h0000004;
      expv[33] = 27'h0000000;
      expv[34] = 27'h0000008;
      expv[35] = 27'h0000000;
      expv[36] = 27'h0000004;
      expv[37] = 27'h0000000;
      expv[38] = 27'h0000004;
      expv[39] = 27'h0000000;
      expv[40] = 27'h0000000;
      expv[41] = 27'h0000000;
      expv[42] = 27'h0000000;
      expv[43] = 27'h0000000;
      expv[44] = 27'h0000000;
      expv[45] = 27'h0000002;
      expv[46] = 27'h0000000;
      expv[47] = 27'h0000000;
      expv[48] = 27'h0000000;
      expv[49] = 27'h0000000;
      expv[50] = 27'h0000000;
      expv[51] = 27'h0000000;
      expv[52] = 27'h0000000;
      expv[53] = 27'h0000000;
      expv[54] = 27'h0000000;
      expv[55] = 27'h0000000;
      expv[56] = 27'h0000001;
      expv[57] = 27'h0000000;
      expv[58] = 27'h0000000;
      expv[59] = 27'h0000000;
      expv[60] = 27'h0000000;
      expv[61] = 27'h0000000;
      expv[62] = 27'h0000000;
      expv[63] = 27'h0000000;
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
