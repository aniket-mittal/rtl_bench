// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00981 dut (
    .clk(clk),
    .i_nrst(in_vec[9:9]),
    .i_ctrl44Khz(in_vec[8:8]),
    .i_noiseShift(in_vec[7:4]),
    .i_noiseStep(in_vec[3:0]),
    .o_noiseOut(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h20a;
    stim[1] = 10'h2d7;
    stim[2] = 10'h181;
    stim[3] = 10'h062;
    stim[4] = 10'h100;
    stim[5] = 10'h00e;
    stim[6] = 10'h30a;
    stim[7] = 10'h1fa;
    stim[8] = 10'h0f8;
    stim[9] = 10'h132;
    stim[10] = 10'h15e;
    stim[11] = 10'h1c5;
    stim[12] = 10'h147;
    stim[13] = 10'h1e0;
    stim[14] = 10'h0bf;
    stim[15] = 10'h14e;
    stim[16] = 10'h1a2;
    stim[17] = 10'h0a2;
    stim[18] = 10'h106;
    stim[19] = 10'h11c;
    stim[20] = 10'h03a;
    stim[21] = 10'h10b;
    stim[22] = 10'h07e;
    stim[23] = 10'h0ec;
    stim[24] = 10'h17e;
    stim[25] = 10'h102;
    stim[26] = 10'h01f;
    stim[27] = 10'h015;
    stim[28] = 10'h0ac;
    stim[29] = 10'h1a6;
    stim[30] = 10'h137;
    stim[31] = 10'h123;
    stim[32] = 10'h000;
    stim[33] = 10'h038;
    stim[34] = 10'h16b;
    stim[35] = 10'h05a;
    stim[36] = 10'h188;
    stim[37] = 10'h02c;
    stim[38] = 10'h13a;
    stim[39] = 10'h196;
    stim[40] = 10'h185;
    stim[41] = 10'h0b0;
    stim[42] = 10'h06b;
    stim[43] = 10'h023;
    stim[44] = 10'h1b1;
    stim[45] = 10'h1fd;
    stim[46] = 10'h1f1;
    stim[47] = 10'h03c;
    stim[48] = 10'h0c4;
    stim[49] = 10'h18d;
    stim[50] = 10'h16e;
    stim[51] = 10'h1c1;
    stim[52] = 10'h0e0;
    stim[53] = 10'h18a;
    stim[54] = 10'h1ad;
    stim[55] = 10'h15f;
    stim[56] = 10'h173;
    stim[57] = 10'h029;
    stim[58] = 10'h05b;
    stim[59] = 10'h14c;
    stim[60] = 10'h047;
    stim[61] = 10'h169;
    stim[62] = 10'h1ce;
    stim[63] = 10'h1d7;
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
      expv[0] = 16'hxxxx;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'h0001;
      expv[4] = 16'h0001;
      expv[5] = 16'h0001;
      expv[6] = 16'h0001;
      expv[7] = 16'h0003;
      expv[8] = 16'h0001;
      expv[9] = 16'h0001;
      expv[10] = 16'h0001;
      expv[11] = 16'h0001;
      expv[12] = 16'h0001;
      expv[13] = 16'h0001;
      expv[14] = 16'h0001;
      expv[15] = 16'h0001;
      expv[16] = 16'h0001;
      expv[17] = 16'h0001;
      expv[18] = 16'h0001;
      expv[19] = 16'h0001;
      expv[20] = 16'h0001;
      expv[21] = 16'h0001;
      expv[22] = 16'h0001;
      expv[23] = 16'h0001;
      expv[24] = 16'h0001;
      expv[25] = 16'h0001;
      expv[26] = 16'h0001;
      expv[27] = 16'h0001;
      expv[28] = 16'h0001;
      expv[29] = 16'h0001;
      expv[30] = 16'h0001;
      expv[31] = 16'h0001;
      expv[32] = 16'h0001;
      expv[33] = 16'h0001;
      expv[34] = 16'h0001;
      expv[35] = 16'h0001;
      expv[36] = 16'h0001;
      expv[37] = 16'h0001;
      expv[38] = 16'h0001;
      expv[39] = 16'h0001;
      expv[40] = 16'h0001;
      expv[41] = 16'h0001;
      expv[42] = 16'h0001;
      expv[43] = 16'h0001;
      expv[44] = 16'h0001;
      expv[45] = 16'h0001;
      expv[46] = 16'h0001;
      expv[47] = 16'h0001;
      expv[48] = 16'h0001;
      expv[49] = 16'h0001;
      expv[50] = 16'h0001;
      expv[51] = 16'h0001;
      expv[52] = 16'h0001;
      expv[53] = 16'h0001;
      expv[54] = 16'h0001;
      expv[55] = 16'h0001;
      expv[56] = 16'h0001;
      expv[57] = 16'h0001;
      expv[58] = 16'h0001;
      expv[59] = 16'h0001;
      expv[60] = 16'h0001;
      expv[61] = 16'h0001;
      expv[62] = 16'h0001;
      expv[63] = 16'h0001;
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
