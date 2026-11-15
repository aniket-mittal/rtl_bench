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

  origen_033259 dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .txdin(in_vec[9:2]),
    .txgo(in_vec[1:1]),
    .MISO(in_vec[0:0]),
    .MOSI(out_vec[10:10]),
    .SCLK(out_vec[9:9]),
    .txrdy(out_vec[8:8]),
    .rxdout(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h536;
    stim[1] = 11'h6c4;
    stim[2] = 11'h1c0;
    stim[3] = 11'h27f;
    stim[4] = 11'h0d1;
    stim[5] = 11'h297;
    stim[6] = 11'h0bc;
    stim[7] = 11'h38d;
    stim[8] = 11'h365;
    stim[9] = 11'h35f;
    stim[10] = 11'h3e3;
    stim[11] = 11'h259;
    stim[12] = 11'h7ff;
    stim[13] = 11'h0e1;
    stim[14] = 11'h19c;
    stim[15] = 11'h230;
    stim[16] = 11'h1ce;
    stim[17] = 11'h25e;
    stim[18] = 11'h0ea;
    stim[19] = 11'h27a;
    stim[20] = 11'h240;
    stim[21] = 11'h39b;
    stim[22] = 11'h124;
    stim[23] = 11'h0e0;
    stim[24] = 11'h072;
    stim[25] = 11'h3b8;
    stim[26] = 11'h30c;
    stim[27] = 11'h2cf;
    stim[28] = 11'h28d;
    stim[29] = 11'h10f;
    stim[30] = 11'h048;
    stim[31] = 11'h2cc;
    stim[32] = 11'h383;
    stim[33] = 11'h1a6;
    stim[34] = 11'h240;
    stim[35] = 11'h157;
    stim[36] = 11'h3f8;
    stim[37] = 11'h167;
    stim[38] = 11'h092;
    stim[39] = 11'h1aa;
    stim[40] = 11'h12c;
    stim[41] = 11'h137;
    stim[42] = 11'h216;
    stim[43] = 11'h3dc;
    stim[44] = 11'h017;
    stim[45] = 11'h1ea;
    stim[46] = 11'h03e;
    stim[47] = 11'h32d;
    stim[48] = 11'h039;
    stim[49] = 11'h093;
    stim[50] = 11'h36b;
    stim[51] = 11'h287;
    stim[52] = 11'h24a;
    stim[53] = 11'h1ac;
    stim[54] = 11'h358;
    stim[55] = 11'h06a;
    stim[56] = 11'h30d;
    stim[57] = 11'h0bf;
    stim[58] = 11'h06d;
    stim[59] = 11'h09a;
    stim[60] = 11'h11e;
    stim[61] = 11'h3bb;
    stim[62] = 11'h014;
    stim[63] = 11'h28d;
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
      expv[0] = 11'h100;
      expv[1] = 11'h100;
      expv[2] = 11'h100;
      expv[3] = 11'h100;
      expv[4] = 11'h100;
      expv[5] = 11'h100;
      expv[6] = 11'h000;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h000;
      expv[10] = 11'h000;
      expv[11] = 11'h000;
      expv[12] = 11'h100;
      expv[13] = 11'h100;
      expv[14] = 11'h100;
      expv[15] = 11'h100;
      expv[16] = 11'h100;
      expv[17] = 11'h100;
      expv[18] = 11'h000;
      expv[19] = 11'h000;
      expv[20] = 11'h000;
      expv[21] = 11'h000;
      expv[22] = 11'h000;
      expv[23] = 11'h000;
      expv[24] = 11'h000;
      expv[25] = 11'h600;
      expv[26] = 11'h600;
      expv[27] = 11'h600;
      expv[28] = 11'h600;
      expv[29] = 11'h600;
      expv[30] = 11'h600;
      expv[31] = 11'h600;
      expv[32] = 11'h600;
      expv[33] = 11'h401;
      expv[34] = 11'h401;
      expv[35] = 11'h401;
      expv[36] = 11'h401;
      expv[37] = 11'h401;
      expv[38] = 11'h401;
      expv[39] = 11'h401;
      expv[40] = 11'h401;
      expv[41] = 11'h201;
      expv[42] = 11'h201;
      expv[43] = 11'h201;
      expv[44] = 11'h201;
      expv[45] = 11'h201;
      expv[46] = 11'h201;
      expv[47] = 11'h201;
      expv[48] = 11'h201;
      expv[49] = 11'h003;
      expv[50] = 11'h003;
      expv[51] = 11'h003;
      expv[52] = 11'h003;
      expv[53] = 11'h003;
      expv[54] = 11'h003;
      expv[55] = 11'h003;
      expv[56] = 11'h003;
      expv[57] = 11'h203;
      expv[58] = 11'h203;
      expv[59] = 11'h203;
      expv[60] = 11'h203;
      expv[61] = 11'h203;
      expv[62] = 11'h203;
      expv[63] = 11'h203;
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
