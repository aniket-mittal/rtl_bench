// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_071905 dut (
    .sclk(clk),
    .reset(in_vec[11:11]),
    .sclk_en(in_vec[10:10]),
    .rdreq(in_vec[9:9]),
    .wrreq(in_vec[8:8]),
    .data(in_vec[7:0]),
    .empty_n(out_vec[9:9]),
    .full_n(out_vec[8:8]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'he00;
    stim[1] = 12'he3e;
    stim[2] = 12'h666;
    stim[3] = 12'h54c;
    stim[4] = 12'h6ae;
    stim[5] = 12'hfb9;
    stim[6] = 12'h068;
    stim[7] = 12'h06c;
    stim[8] = 12'h233;
    stim[9] = 12'h57c;
    stim[10] = 12'h479;
    stim[11] = 12'h3d7;
    stim[12] = 12'h126;
    stim[13] = 12'h3ad;
    stim[14] = 12'h08b;
    stim[15] = 12'h042;
    stim[16] = 12'h33d;
    stim[17] = 12'h622;
    stim[18] = 12'h0b2;
    stim[19] = 12'h558;
    stim[20] = 12'h5d6;
    stim[21] = 12'h01e;
    stim[22] = 12'h021;
    stim[23] = 12'h4d4;
    stim[24] = 12'h355;
    stim[25] = 12'h0bb;
    stim[26] = 12'h684;
    stim[27] = 12'h071;
    stim[28] = 12'h73f;
    stim[29] = 12'h15f;
    stim[30] = 12'h4c7;
    stim[31] = 12'h4ff;
    stim[32] = 12'h724;
    stim[33] = 12'h312;
    stim[34] = 12'h4d5;
    stim[35] = 12'h7b3;
    stim[36] = 12'h748;
    stim[37] = 12'h5e2;
    stim[38] = 12'h15d;
    stim[39] = 12'h46b;
    stim[40] = 12'h787;
    stim[41] = 12'h318;
    stim[42] = 12'h167;
    stim[43] = 12'h0b9;
    stim[44] = 12'h4c0;
    stim[45] = 12'h283;
    stim[46] = 12'h44d;
    stim[47] = 12'h27b;
    stim[48] = 12'h73b;
    stim[49] = 12'h2f6;
    stim[50] = 12'h535;
    stim[51] = 12'h586;
    stim[52] = 12'h44f;
    stim[53] = 12'h523;
    stim[54] = 12'h138;
    stim[55] = 12'h449;
    stim[56] = 12'h0d5;
    stim[57] = 12'h527;
    stim[58] = 12'h37b;
    stim[59] = 12'h620;
    stim[60] = 12'h3f9;
    stim[61] = 12'h576;
    stim[62] = 12'h7bb;
    stim[63] = 12'h402;
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
      expv[1] = 10'h100;
      expv[2] = 10'h100;
      expv[3] = 10'h1xx;
      expv[4] = 10'h1xx;
      expv[5] = 10'h34c;
      expv[6] = 10'h100;
      expv[7] = 10'h100;
      expv[8] = 10'h100;
      expv[9] = 10'h100;
      expv[10] = 10'h1b9;
      expv[11] = 10'h37c;
      expv[12] = 10'h37c;
      expv[13] = 10'h37c;
      expv[14] = 10'h37c;
      expv[15] = 10'h37c;
      expv[16] = 10'h37c;
      expv[17] = 10'h37c;
      expv[18] = 10'h17c;
      expv[19] = 10'h17c;
      expv[20] = 10'h17c;
      expv[21] = 10'h358;
      expv[22] = 10'h358;
      expv[23] = 10'h358;
      expv[24] = 10'h358;
      expv[25] = 10'h358;
      expv[26] = 10'h358;
      expv[27] = 10'h3d6;
      expv[28] = 10'h3d6;
      expv[29] = 10'h1d6;
      expv[30] = 10'h1d6;
      expv[31] = 10'h33f;
      expv[32] = 10'h33f;
      expv[33] = 10'h13f;
      expv[34] = 10'h13f;
      expv[35] = 10'h324;
      expv[36] = 10'h124;
      expv[37] = 10'h3b3;
      expv[38] = 10'h3b3;
      expv[39] = 10'h3b3;
      expv[40] = 10'h3b3;
      expv[41] = 10'h348;
      expv[42] = 10'h348;
      expv[43] = 10'h348;
      expv[44] = 10'h348;
      expv[45] = 10'h348;
      expv[46] = 10'h348;
      expv[47] = 10'h348;
      expv[48] = 10'h348;
      expv[49] = 10'h3e2;
      expv[50] = 10'h3e2;
      expv[51] = 10'h3e2;
      expv[52] = 10'h3e2;
      expv[53] = 10'h3e2;
      expv[54] = 10'h3e2;
      expv[55] = 10'h3e2;
      expv[56] = 10'h3e2;
      expv[57] = 10'h3e2;
      expv[58] = 10'h3e2;
      expv[59] = 10'h3e2;
      expv[60] = 10'h387;
      expv[61] = 10'h387;
      expv[62] = 10'h387;
      expv[63] = 10'h33b;
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
