// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01406 dut (
    .clk(clk),
    .key_code(in_vec[4:0]),
    .slow_rate(out_vec[12:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h10;
    stim[1] = 5'h09;
    stim[2] = 5'h0c;
    stim[3] = 5'h03;
    stim[4] = 5'h11;
    stim[5] = 5'h1f;
    stim[6] = 5'h06;
    stim[7] = 5'h08;
    stim[8] = 5'h19;
    stim[9] = 5'h1c;
    stim[10] = 5'h12;
    stim[11] = 5'h15;
    stim[12] = 5'h1c;
    stim[13] = 5'h1d;
    stim[14] = 5'h10;
    stim[15] = 5'h19;
    stim[16] = 5'h1e;
    stim[17] = 5'h09;
    stim[18] = 5'h10;
    stim[19] = 5'h08;
    stim[20] = 5'h08;
    stim[21] = 5'h0f;
    stim[22] = 5'h10;
    stim[23] = 5'h05;
    stim[24] = 5'h16;
    stim[25] = 5'h1f;
    stim[26] = 5'h18;
    stim[27] = 5'h06;
    stim[28] = 5'h08;
    stim[29] = 5'h0c;
    stim[30] = 5'h1a;
    stim[31] = 5'h13;
    stim[32] = 5'h01;
    stim[33] = 5'h1a;
    stim[34] = 5'h15;
    stim[35] = 5'h0b;
    stim[36] = 5'h00;
    stim[37] = 5'h17;
    stim[38] = 5'h1b;
    stim[39] = 5'h1b;
    stim[40] = 5'h0b;
    stim[41] = 5'h17;
    stim[42] = 5'h09;
    stim[43] = 5'h18;
    stim[44] = 5'h15;
    stim[45] = 5'h0d;
    stim[46] = 5'h07;
    stim[47] = 5'h11;
    stim[48] = 5'h0d;
    stim[49] = 5'h05;
    stim[50] = 5'h07;
    stim[51] = 5'h00;
    stim[52] = 5'h11;
    stim[53] = 5'h0c;
    stim[54] = 5'h1c;
    stim[55] = 5'h0d;
    stim[56] = 5'h17;
    stim[57] = 5'h12;
    stim[58] = 5'h0b;
    stim[59] = 5'h13;
    stim[60] = 5'h08;
    stim[61] = 5'h07;
    stim[62] = 5'h14;
    stim[63] = 5'h02;
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
      expv[0] = 13'hxxxx;
      expv[1] = 13'h01aa;
      expv[2] = 13'h0354;
      expv[3] = 13'h027e;
      expv[4] = 13'h05eb;
      expv[5] = 13'h017b;
      expv[6] = 13'h017b;
      expv[7] = 13'h0471;
      expv[8] = 13'h03c6;
      expv[9] = 13'h03c6;
      expv[10] = 13'h03c6;
      expv[11] = 13'h0166;
      expv[12] = 13'h00fd;
      expv[13] = 13'h00fd;
      expv[14] = 13'h00fd;
      expv[15] = 13'h01aa;
      expv[16] = 13'h01aa;
      expv[17] = 13'h01aa;
      expv[18] = 13'h0354;
      expv[19] = 13'h01aa;
      expv[20] = 13'h03c6;
      expv[21] = 13'h03c6;
      expv[22] = 13'h01de;
      expv[23] = 13'h01aa;
      expv[24] = 13'h04fc;
      expv[25] = 13'h04fc;
      expv[26] = 13'h04fc;
      expv[27] = 13'h04fc;
      expv[28] = 13'h0471;
      expv[29] = 13'h03c6;
      expv[30] = 13'h027e;
      expv[31] = 13'h027e;
      expv[32] = 13'h013f;
      expv[33] = 13'h0775;
      expv[34] = 13'h0775;
      expv[35] = 13'h00fd;
      expv[36] = 13'h02cd;
      expv[37] = 13'h0000;
      expv[38] = 13'h0000;
      expv[39] = 13'h0000;
      expv[40] = 13'h0000;
      expv[41] = 13'h02cd;
      expv[42] = 13'h02cd;
      expv[43] = 13'h0354;
      expv[44] = 13'h0354;
      expv[45] = 13'h00fd;
      expv[46] = 13'h0238;
      expv[47] = 13'h03f4;
      expv[48] = 13'h017b;
      expv[49] = 13'h0238;
      expv[50] = 13'h04fc;
      expv[51] = 13'h03f4;
      expv[52] = 13'h0000;
      expv[53] = 13'h017b;
      expv[54] = 13'h027e;
      expv[55] = 13'h027e;
      expv[56] = 13'h0238;
      expv[57] = 13'h0238;
      expv[58] = 13'h0166;
      expv[59] = 13'h02cd;
      expv[60] = 13'h013f;
      expv[61] = 13'h03c6;
      expv[62] = 13'h03f4;
      expv[63] = 13'h011c;
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
