// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_009291 dut (
    .SCLK(clk),
    .RESET(in_vec[10:10]),
    .RX(in_vec[9:9]),
    .TX_VALID(in_vec[8:8]),
    .TX_DATA(in_vec[7:0]),
    .RX_VALID(out_vec[10:10]),
    .RX_DATA(out_vec[9:2]),
    .TX(out_vec[1:1]),
    .TX_READY(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h4ca;
    stim[1] = 11'h422;
    stim[2] = 11'h396;
    stim[3] = 11'h2c5;
    stim[4] = 11'h0c1;
    stim[5] = 11'h04c;
    stim[6] = 11'h164;
    stim[7] = 11'h29e;
    stim[8] = 11'h328;
    stim[9] = 11'h20e;
    stim[10] = 11'h16c;
    stim[11] = 11'h27e;
    stim[12] = 11'h0f1;
    stim[13] = 11'h2ec;
    stim[14] = 11'h366;
    stim[15] = 11'h106;
    stim[16] = 11'h346;
    stim[17] = 11'h2c1;
    stim[18] = 11'h3d4;
    stim[19] = 11'h1f1;
    stim[20] = 11'h3da;
    stim[21] = 11'h0b3;
    stim[22] = 11'h154;
    stim[23] = 11'h224;
    stim[24] = 11'h16a;
    stim[25] = 11'h010;
    stim[26] = 11'h3ff;
    stim[27] = 11'h1dc;
    stim[28] = 11'h3a2;
    stim[29] = 11'h13a;
    stim[30] = 11'h32c;
    stim[31] = 11'h07b;
    stim[32] = 11'h323;
    stim[33] = 11'h065;
    stim[34] = 11'h1c8;
    stim[35] = 11'h116;
    stim[36] = 11'h1fa;
    stim[37] = 11'h39e;
    stim[38] = 11'h078;
    stim[39] = 11'h396;
    stim[40] = 11'h31c;
    stim[41] = 11'h2fd;
    stim[42] = 11'h156;
    stim[43] = 11'h2dd;
    stim[44] = 11'h3fd;
    stim[45] = 11'h0f7;
    stim[46] = 11'h189;
    stim[47] = 11'h04c;
    stim[48] = 11'h283;
    stim[49] = 11'h326;
    stim[50] = 11'h073;
    stim[51] = 11'h180;
    stim[52] = 11'h142;
    stim[53] = 11'h3a4;
    stim[54] = 11'h32d;
    stim[55] = 11'h1bf;
    stim[56] = 11'h0c9;
    stim[57] = 11'h291;
    stim[58] = 11'h109;
    stim[59] = 11'h194;
    stim[60] = 11'h296;
    stim[61] = 11'h37d;
    stim[62] = 11'h3a0;
    stim[63] = 11'h02a;
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
      expv[0] = 11'h003;
      expv[1] = 11'h003;
      expv[2] = 11'h003;
      expv[3] = 11'h003;
      expv[4] = 11'h003;
      expv[5] = 11'h003;
      expv[6] = 11'h003;
      expv[7] = 11'h003;
      expv[8] = 11'h003;
      expv[9] = 11'h003;
      expv[10] = 11'h003;
      expv[11] = 11'h003;
      expv[12] = 11'h003;
      expv[13] = 11'h003;
      expv[14] = 11'h003;
      expv[15] = 11'h003;
      expv[16] = 11'h003;
      expv[17] = 11'h003;
      expv[18] = 11'h003;
      expv[19] = 11'h003;
      expv[20] = 11'h003;
      expv[21] = 11'h003;
      expv[22] = 11'h003;
      expv[23] = 11'h003;
      expv[24] = 11'h003;
      expv[25] = 11'h003;
      expv[26] = 11'h003;
      expv[27] = 11'h003;
      expv[28] = 11'h003;
      expv[29] = 11'h003;
      expv[30] = 11'h003;
      expv[31] = 11'h003;
      expv[32] = 11'h003;
      expv[33] = 11'h003;
      expv[34] = 11'h003;
      expv[35] = 11'h003;
      expv[36] = 11'h003;
      expv[37] = 11'h003;
      expv[38] = 11'h003;
      expv[39] = 11'h003;
      expv[40] = 11'h003;
      expv[41] = 11'h003;
      expv[42] = 11'h003;
      expv[43] = 11'h003;
      expv[44] = 11'h003;
      expv[45] = 11'h003;
      expv[46] = 11'h003;
      expv[47] = 11'h003;
      expv[48] = 11'h003;
      expv[49] = 11'h003;
      expv[50] = 11'h003;
      expv[51] = 11'h003;
      expv[52] = 11'h003;
      expv[53] = 11'h003;
      expv[54] = 11'h003;
      expv[55] = 11'h003;
      expv[56] = 11'h003;
      expv[57] = 11'h003;
      expv[58] = 11'h003;
      expv[59] = 11'h003;
      expv[60] = 11'h003;
      expv[61] = 11'h003;
      expv[62] = 11'h003;
      expv[63] = 11'h003;
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
