// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  or1200_spram_64x14 dut (
    .clk(clk),
    .rst(in_vec[30:30]),
    .ce(in_vec[29:29]),
    .we(in_vec[28:28]),
    .oe(in_vec[27:27]),
    .addr(in_vec[26:21]),
    .di(in_vec[20:0]),
    .doq(out_vec[20:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h6d0df24d;
    stim[1] = 31'h56881489;
    stim[2] = 31'h285b083f;
    stim[3] = 31'h03a537a5;
    stim[4] = 31'h37d308ed;
    stim[5] = 31'h3b64f5ac;
    stim[6] = 31'h34ff54ad;
    stim[7] = 31'h034b076d;
    stim[8] = 31'h52cab61f;
    stim[9] = 31'h171eec67;
    stim[10] = 31'h0b1dac0f;
    stim[11] = 31'h05ae91de;
    stim[12] = 31'h05489efc;
    stim[13] = 31'h2de0d7e7;
    stim[14] = 31'h20018654;
    stim[15] = 31'h2f9bb124;
    stim[16] = 31'h1bc48b16;
    stim[17] = 31'h36f70792;
    stim[18] = 31'h2fafbb6a;
    stim[19] = 31'h3ef550b8;
    stim[20] = 31'h11d97f94;
    stim[21] = 31'h251923a2;
    stim[22] = 31'h2de509a0;
    stim[23] = 31'h1f110dfe;
    stim[24] = 31'h2db482c9;
    stim[25] = 31'h3439a096;
    stim[26] = 31'h1e590729;
    stim[27] = 31'h326a3a9d;
    stim[28] = 31'h23528b08;
    stim[29] = 31'h2684d948;
    stim[30] = 31'h17624895;
    stim[31] = 31'h37cbd989;
    stim[32] = 31'h3e1417c8;
    stim[33] = 31'h3b0a9e3f;
    stim[34] = 31'h22069600;
    stim[35] = 31'h35c2e1f3;
    stim[36] = 31'h224812f7;
    stim[37] = 31'h2689e3f1;
    stim[38] = 31'h136912cb;
    stim[39] = 31'h1aaeec51;
    stim[40] = 31'h0962d265;
    stim[41] = 31'h19ef19a2;
    stim[42] = 31'h2459d97f;
    stim[43] = 31'h04abbb0f;
    stim[44] = 31'h3c8ef745;
    stim[45] = 31'h25775989;
    stim[46] = 31'h18e0eaf7;
    stim[47] = 31'h3ddb1d34;
    stim[48] = 31'h228f040b;
    stim[49] = 31'h1f5d7a43;
    stim[50] = 31'h2f4c5029;
    stim[51] = 31'h209e0ec8;
    stim[52] = 31'h279f75b2;
    stim[53] = 31'h39556d45;
    stim[54] = 31'h1e0bc6f2;
    stim[55] = 31'h2e42ace1;
    stim[56] = 31'h2d1f8666;
    stim[57] = 31'h031a5a6c;
    stim[58] = 31'h7a5637ee;
    stim[59] = 31'h16f0adcb;
    stim[60] = 31'h2da18373;
    stim[61] = 31'h26ee6705;
    stim[62] = 31'h33df0ae6;
    stim[63] = 31'h234e51f4;
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
      expv[0] = 21'hxxxxxx;
      expv[1] = 21'hxxxxxx;
      expv[2] = 21'hxxxxxx;
      expv[3] = 21'hxxxxxx;
      expv[4] = 21'hxxxxxx;
      expv[5] = 21'h1308ed;
      expv[6] = 21'h04f5ac;
      expv[7] = 21'h1f54ad;
      expv[8] = 21'h1f54ad;
      expv[9] = 21'hxxxxxx;
      expv[10] = 21'hxxxxxx;
      expv[11] = 21'hxxxxxx;
      expv[12] = 21'hxxxxxx;
      expv[13] = 21'hxxxxxx;
      expv[14] = 21'hxxxxxx;
      expv[15] = 21'hxxxxxx;
      expv[16] = 21'hxxxxxx;
      expv[17] = 21'hxxxxxx;
      expv[18] = 21'h170792;
      expv[19] = 21'hxxxxxx;
      expv[20] = 21'h1550b8;
      expv[21] = 21'h1550b8;
      expv[22] = 21'hxxxxxx;
      expv[23] = 21'hxxxxxx;
      expv[24] = 21'hxxxxxx;
      expv[25] = 21'hxxxxxx;
      expv[26] = 21'h19a096;
      expv[27] = 21'h19a096;
      expv[28] = 21'h0a3a9d;
      expv[29] = 21'hxxxxxx;
      expv[30] = 21'hxxxxxx;
      expv[31] = 21'hxxxxxx;
      expv[32] = 21'h0bd989;
      expv[33] = 21'h1417c8;
      expv[34] = 21'h0a9e3f;
      expv[35] = 21'hxxxxxx;
      expv[36] = 21'h02e1f3;
      expv[37] = 21'hxxxxxx;
      expv[38] = 21'hxxxxxx;
      expv[39] = 21'hxxxxxx;
      expv[40] = 21'hxxxxxx;
      expv[41] = 21'hxxxxxx;
      expv[42] = 21'hxxxxxx;
      expv[43] = 21'hxxxxxx;
      expv[44] = 21'hxxxxxx;
      expv[45] = 21'h0ef745;
      expv[46] = 21'hxxxxxx;
      expv[47] = 21'hxxxxxx;
      expv[48] = 21'h1b1d34;
      expv[49] = 21'hxxxxxx;
      expv[50] = 21'hxxxxxx;
      expv[51] = 21'hxxxxxx;
      expv[52] = 21'hxxxxxx;
      expv[53] = 21'hxxxxxx;
      expv[54] = 21'h156d45;
      expv[55] = 21'h156d45;
      expv[56] = 21'hxxxxxx;
      expv[57] = 21'hxxxxxx;
      expv[58] = 21'hxxxxxx;
      expv[59] = 21'hxxxxxx;
      expv[60] = 21'hxxxxxx;
      expv[61] = 21'hxxxxxx;
      expv[62] = 21'h1550b8;
      expv[63] = 21'h1f0ae6;
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
