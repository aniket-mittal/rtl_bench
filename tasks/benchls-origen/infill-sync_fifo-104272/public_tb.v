// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_104272 dut (
    .clock(clk),
    .reset_n(in_vec[10:10]),
    .wrreq(in_vec[9:9]),
    .data(in_vec[8:1]),
    .rdreq(in_vec[0:0]),
    .q(out_vec[9:2]),
    .empty(out_vec[1:1]),
    .full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h1cd;
    stim[1] = 11'h260;
    stim[2] = 11'h729;
    stim[3] = 11'h724;
    stim[4] = 11'h49d;
    stim[5] = 11'h4d1;
    stim[6] = 11'h6c8;
    stim[7] = 11'h6d0;
    stim[8] = 11'h602;
    stim[9] = 11'h5d5;
    stim[10] = 11'h424;
    stim[11] = 11'h671;
    stim[12] = 11'h7ef;
    stim[13] = 11'h6b9;
    stim[14] = 11'h7bd;
    stim[15] = 11'h74f;
    stim[16] = 11'h454;
    stim[17] = 11'h75b;
    stim[18] = 11'h5f0;
    stim[19] = 11'h52e;
    stim[20] = 11'h4a0;
    stim[21] = 11'h530;
    stim[22] = 11'h626;
    stim[23] = 11'h638;
    stim[24] = 11'h60f;
    stim[25] = 11'h796;
    stim[26] = 11'h5af;
    stim[27] = 11'h578;
    stim[28] = 11'h7e6;
    stim[29] = 11'h58e;
    stim[30] = 11'h6eb;
    stim[31] = 11'h7b1;
    stim[32] = 11'h6e6;
    stim[33] = 11'h47a;
    stim[34] = 11'h6ed;
    stim[35] = 11'h58b;
    stim[36] = 11'h56b;
    stim[37] = 11'h5b4;
    stim[38] = 11'h77d;
    stim[39] = 11'h5d7;
    stim[40] = 11'h644;
    stim[41] = 11'h5cf;
    stim[42] = 11'h6e5;
    stim[43] = 11'h2d4;
    stim[44] = 11'h682;
    stim[45] = 11'h7c8;
    stim[46] = 11'h7ad;
    stim[47] = 11'h56a;
    stim[48] = 11'h724;
    stim[49] = 11'h693;
    stim[50] = 11'h56c;
    stim[51] = 11'h61a;
    stim[52] = 11'h674;
    stim[53] = 11'h58a;
    stim[54] = 11'h7b5;
    stim[55] = 11'h797;
    stim[56] = 11'h264;
    stim[57] = 11'h4de;
    stim[58] = 11'h50f;
    stim[59] = 11'h784;
    stim[60] = 11'h4f6;
    stim[61] = 11'h6b9;
    stim[62] = 11'h71b;
    stim[63] = 11'h7d7;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'hxxx;
      expv[2] = 10'hxxx;
      expv[3] = 10'h250;
      expv[4] = 10'h250;
      expv[5] = 10'h248;
      expv[6] = 10'hxxx;
      expv[7] = 10'h190;
      expv[8] = 10'h190;
      expv[9] = 10'h190;
      expv[10] = 10'h1a0;
      expv[11] = 10'h1a0;
      expv[12] = 10'h004;
      expv[13] = 10'h0e0;
      expv[14] = 10'h3dc;
      expv[15] = 10'h170;
      expv[16] = 10'h378;
      expv[17] = 10'h378;
      expv[18] = 10'h29c;
      expv[19] = 10'h29c;
      expv[20] = 10'h29c;
      expv[21] = 10'h29c;
      expv[22] = 10'h29c;
      expv[23] = 10'h29c;
      expv[24] = 10'h29c;
      expv[25] = 10'h2b4;
      expv[26] = 10'h2b4;
      expv[27] = 10'h04c;
      expv[28] = 10'h04c;
      expv[29] = 10'h04c;
      expv[30] = 10'h04c;
      expv[31] = 10'h070;
      expv[32] = 10'h01c;
      expv[33] = 10'h01c;
      expv[34] = 10'h01c;
      expv[35] = 10'h32c;
      expv[36] = 10'h3cc;
      expv[37] = 10'h1d4;
      expv[38] = 10'h1d4;
      expv[39] = 10'h360;
      expv[40] = 10'h1cc;
      expv[41] = 10'h1cc;
      expv[42] = 10'h1d8;
      expv[43] = 10'h1d6;
      expv[44] = 10'h1d6;
      expv[45] = 10'h104;
      expv[46] = 10'h104;
      expv[47] = 10'h390;
      expv[48] = 10'h390;
      expv[49] = 10'h390;
      expv[50] = 10'h358;
      expv[51] = 10'h358;
      expv[52] = 10'h358;
      expv[53] = 10'h358;
      expv[54] = 10'h358;
      expv[55] = 10'h248;
      expv[56] = 10'h106;
      expv[57] = 10'h106;
      expv[58] = 10'h106;
      expv[59] = 10'h106;
      expv[60] = 10'h308;
      expv[61] = 10'h308;
      expv[62] = 10'h170;
      expv[63] = 10'h234;
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
