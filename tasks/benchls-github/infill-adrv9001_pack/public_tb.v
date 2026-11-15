// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  adrv9001_pack dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .sof(in_vec[9:9]),
    .idata(in_vec[8:1]),
    .ivalid(in_vec[0:0]),
    .odata(out_vec[17:2]),
    .ovalid(out_vec[1:1]),
    .osof(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h437;
    stim[1] = 11'h5e2;
    stim[2] = 11'h115;
    stim[3] = 11'h159;
    stim[4] = 11'h3f6;
    stim[5] = 11'h3b8;
    stim[6] = 11'h140;
    stim[7] = 11'h0ec;
    stim[8] = 11'h2f8;
    stim[9] = 11'h1a0;
    stim[10] = 11'h0bb;
    stim[11] = 11'h3f8;
    stim[12] = 11'h38c;
    stim[13] = 11'h1c5;
    stim[14] = 11'h09f;
    stim[15] = 11'h370;
    stim[16] = 11'h3bb;
    stim[17] = 11'h03b;
    stim[18] = 11'h08b;
    stim[19] = 11'h080;
    stim[20] = 11'h2b3;
    stim[21] = 11'h36d;
    stim[22] = 11'h0c1;
    stim[23] = 11'h05b;
    stim[24] = 11'h161;
    stim[25] = 11'h1be;
    stim[26] = 11'h05d;
    stim[27] = 11'h21f;
    stim[28] = 11'h253;
    stim[29] = 11'h3ff;
    stim[30] = 11'h336;
    stim[31] = 11'h299;
    stim[32] = 11'h182;
    stim[33] = 11'h2d1;
    stim[34] = 11'h3c1;
    stim[35] = 11'h7ef;
    stim[36] = 11'h072;
    stim[37] = 11'h2f8;
    stim[38] = 11'h048;
    stim[39] = 11'h2c3;
    stim[40] = 11'h173;
    stim[41] = 11'h3f9;
    stim[42] = 11'h031;
    stim[43] = 11'h22e;
    stim[44] = 11'h266;
    stim[45] = 11'h02c;
    stim[46] = 11'h309;
    stim[47] = 11'h26c;
    stim[48] = 11'h199;
    stim[49] = 11'h3ad;
    stim[50] = 11'h093;
    stim[51] = 11'h182;
    stim[52] = 11'h064;
    stim[53] = 11'h13c;
    stim[54] = 11'h229;
    stim[55] = 11'h3a6;
    stim[56] = 11'h0af;
    stim[57] = 11'h2f8;
    stim[58] = 11'h3f5;
    stim[59] = 11'h215;
    stim[60] = 11'h31b;
    stim[61] = 11'h2de;
    stim[62] = 11'h1d2;
    stim[63] = 11'h0b4;
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
      expv[0] = 18'hxxxxx;
      expv[1] = 18'hxxxxx;
      expv[2] = 18'hxxxxx;
      expv[3] = 18'hxxxxx;
      expv[4] = 18'hxxxxx;
      expv[5] = 18'hxxxxx;
      expv[6] = 18'hxxxxx;
      expv[7] = 18'hxxxxx;
      expv[8] = 18'hxxxxx;
      expv[9] = 18'hxxxxx;
      expv[10] = 18'hxxxxx;
      expv[11] = 18'hxxxxx;
      expv[12] = 18'hxxxxx;
      expv[13] = 18'hxxxxx;
      expv[14] = 18'hxxxxx;
      expv[15] = 18'hxxxxx;
      expv[16] = 18'hxxxxx;
      expv[17] = 18'hxxxxx;
      expv[18] = 18'h37477;
      expv[19] = 18'h37474;
      expv[20] = 18'h37474;
      expv[21] = 18'h11566;
      expv[22] = 18'h166db;
      expv[23] = 18'h2d983;
      expv[24] = 18'h180b6;
      expv[25] = 18'h0b6c2;
      expv[26] = 18'h0b6c0;
      expv[27] = 18'h2c0ba;
      expv[28] = 18'h0b83e;
      expv[29] = 18'h03ca7;
      expv[30] = 18'h0a7ff;
      expv[31] = 18'h0a7fc;
      expv[32] = 18'h3fd33;
      expv[33] = 18'h3fd30;
      expv[34] = 18'h131a3;
      expv[35] = 18'h1a383;
      expv[36] = 18'h383df;
      expv[37] = 18'h383dc;
      expv[38] = 18'h383dc;
      expv[39] = 18'h383dc;
      expv[40] = 18'h383dc;
      expv[41] = 18'h186e7;
      expv[42] = 18'h186e4;
      expv[43] = 18'h3f063;
      expv[44] = 18'h3f060;
      expv[45] = 18'h3f060;
      expv[46] = 18'h3f060;
      expv[47] = 18'h3f060;
      expv[48] = 18'h3f060;
      expv[49] = 18'h21333;
      expv[50] = 18'h21330;
      expv[51] = 18'h35927;
      expv[52] = 18'h35924;
      expv[53] = 18'h35924;
      expv[54] = 18'h35924;
      expv[55] = 18'h35924;
      expv[56] = 18'h35924;
      expv[57] = 18'h0515f;
      expv[58] = 18'h0515c;
      expv[59] = 18'h0515c;
      expv[60] = 18'h3e82b;
      expv[61] = 18'h02a37;
      expv[62] = 18'h02a34;
      expv[63] = 18'h02a34;
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
