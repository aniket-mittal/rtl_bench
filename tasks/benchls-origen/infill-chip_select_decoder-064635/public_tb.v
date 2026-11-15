// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_064635 dut (
    .addr(in_vec[8:1]),
    .CS(in_vec[0:0]),
    .cs1(out_vec[3:3]),
    .cs2(out_vec[2:2]),
    .cs3(out_vec[1:1]),
    .cs4(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1f1;
    stim[1] = 9'h01d;
    stim[2] = 9'h0aa;
    stim[3] = 9'h0a6;
    stim[4] = 9'h080;
    stim[5] = 9'h123;
    stim[6] = 9'h1bd;
    stim[7] = 9'h08d;
    stim[8] = 9'h083;
    stim[9] = 9'h0a3;
    stim[10] = 9'h0ba;
    stim[11] = 9'h170;
    stim[12] = 9'h013;
    stim[13] = 9'h06b;
    stim[14] = 9'h119;
    stim[15] = 9'h1e3;
    stim[16] = 9'h186;
    stim[17] = 9'h185;
    stim[18] = 9'h045;
    stim[19] = 9'h093;
    stim[20] = 9'h019;
    stim[21] = 9'h141;
    stim[22] = 9'h0a2;
    stim[23] = 9'h1e1;
    stim[24] = 9'h0e4;
    stim[25] = 9'h161;
    stim[26] = 9'h1a6;
    stim[27] = 9'h18b;
    stim[28] = 9'h1de;
    stim[29] = 9'h13b;
    stim[30] = 9'h0d3;
    stim[31] = 9'h166;
    stim[32] = 9'h059;
    stim[33] = 9'h1e8;
    stim[34] = 9'h100;
    stim[35] = 9'h1c8;
    stim[36] = 9'h04e;
    stim[37] = 9'h0d3;
    stim[38] = 9'h087;
    stim[39] = 9'h048;
    stim[40] = 9'h097;
    stim[41] = 9'h137;
    stim[42] = 9'h086;
    stim[43] = 9'h04c;
    stim[44] = 9'h0f5;
    stim[45] = 9'h051;
    stim[46] = 9'h0f9;
    stim[47] = 9'h004;
    stim[48] = 9'h03f;
    stim[49] = 9'h1a6;
    stim[50] = 9'h068;
    stim[51] = 9'h0f3;
    stim[52] = 9'h154;
    stim[53] = 9'h199;
    stim[54] = 9'h195;
    stim[55] = 9'h189;
    stim[56] = 9'h167;
    stim[57] = 9'h126;
    stim[58] = 9'h0d9;
    stim[59] = 9'h17f;
    stim[60] = 9'h01e;
    stim[61] = 9'h047;
    stim[62] = 9'h069;
    stim[63] = 9'h0f1;
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
      expv[0] = 4'hf;
      expv[1] = 4'hf;
      expv[2] = 4'hb;
      expv[3] = 4'hb;
      expv[4] = 4'hb;
      expv[5] = 4'hf;
      expv[6] = 4'hf;
      expv[7] = 4'hf;
      expv[8] = 4'hf;
      expv[9] = 4'hf;
      expv[10] = 4'hb;
      expv[11] = 4'hd;
      expv[12] = 4'hf;
      expv[13] = 4'hf;
      expv[14] = 4'hf;
      expv[15] = 4'hf;
      expv[16] = 4'he;
      expv[17] = 4'hf;
      expv[18] = 4'hf;
      expv[19] = 4'hf;
      expv[20] = 4'hf;
      expv[21] = 4'hf;
      expv[22] = 4'hb;
      expv[23] = 4'hf;
      expv[24] = 4'hb;
      expv[25] = 4'hf;
      expv[26] = 4'he;
      expv[27] = 4'hf;
      expv[28] = 4'he;
      expv[29] = 4'hf;
      expv[30] = 4'hf;
      expv[31] = 4'hd;
      expv[32] = 4'hf;
      expv[33] = 4'he;
      expv[34] = 4'hd;
      expv[35] = 4'he;
      expv[36] = 4'h7;
      expv[37] = 4'hf;
      expv[38] = 4'hf;
      expv[39] = 4'h7;
      expv[40] = 4'hf;
      expv[41] = 4'hf;
      expv[42] = 4'hb;
      expv[43] = 4'h7;
      expv[44] = 4'hf;
      expv[45] = 4'hf;
      expv[46] = 4'hf;
      expv[47] = 4'h7;
      expv[48] = 4'hf;
      expv[49] = 4'he;
      expv[50] = 4'h7;
      expv[51] = 4'hf;
      expv[52] = 4'hd;
      expv[53] = 4'hf;
      expv[54] = 4'hf;
      expv[55] = 4'hf;
      expv[56] = 4'hf;
      expv[57] = 4'hd;
      expv[58] = 4'hf;
      expv[59] = 4'hf;
      expv[60] = 4'h7;
      expv[61] = 4'hf;
      expv[62] = 4'hf;
      expv[63] = 4'hf;
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
