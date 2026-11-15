// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10926 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[16:16]),
    .readdata(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h39c0ca;
    stim[1] = 22'h1c115c;
    stim[2] = 22'h0f0f3c;
    stim[3] = 22'h0b7a06;
    stim[4] = 22'h1e067d;
    stim[5] = 22'h32d750;
    stim[6] = 22'h06e184;
    stim[7] = 22'h2aeeca;
    stim[8] = 22'h26f53a;
    stim[9] = 22'h28fc36;
    stim[10] = 22'h17c92d;
    stim[11] = 22'h3a3e63;
    stim[12] = 22'h32a443;
    stim[13] = 22'h2cc0ad;
    stim[14] = 22'h04f2be;
    stim[15] = 22'h0797f6;
    stim[16] = 22'h1ae777;
    stim[17] = 22'h122df1;
    stim[18] = 22'h2b5b49;
    stim[19] = 22'h168ae6;
    stim[20] = 22'h0fcb92;
    stim[21] = 22'h1fb60e;
    stim[22] = 22'h3384dc;
    stim[23] = 22'h3a61d3;
    stim[24] = 22'h06d924;
    stim[25] = 22'h3254b3;
    stim[26] = 22'h369a3b;
    stim[27] = 22'h2ad72b;
    stim[28] = 22'h0ed95a;
    stim[29] = 22'h06e31e;
    stim[30] = 22'h02e602;
    stim[31] = 22'h021463;
    stim[32] = 22'h2be382;
    stim[33] = 22'h3e4320;
    stim[34] = 22'h1bd007;
    stim[35] = 22'h255bd2;
    stim[36] = 22'h16b00e;
    stim[37] = 22'h1f2da1;
    stim[38] = 22'h136b90;
    stim[39] = 22'h36835e;
    stim[40] = 22'h13374b;
    stim[41] = 22'h129d4e;
    stim[42] = 22'h02e3c9;
    stim[43] = 22'h329a12;
    stim[44] = 22'h230d4f;
    stim[45] = 22'h1f6ca9;
    stim[46] = 22'h26c588;
    stim[47] = 22'h06ae41;
    stim[48] = 22'h0265c0;
    stim[49] = 22'h03fb86;
    stim[50] = 22'h0f250a;
    stim[51] = 22'h029013;
    stim[52] = 22'h1ff95e;
    stim[53] = 22'h1ee28c;
    stim[54] = 22'h23c6c3;
    stim[55] = 22'h2f5e9b;
    stim[56] = 22'h0e833b;
    stim[57] = 22'h22bfaf;
    stim[58] = 22'h163abb;
    stim[59] = 22'h169e62;
    stim[60] = 22'h2783ac;
    stim[61] = 22'h078f83;
    stim[62] = 22'h3ef7e5;
    stim[63] = 22'h2a18bf;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h0005f;
      expv[6] = 17'h00000;
      expv[7] = 17'h00000;
      expv[8] = 17'h00000;
      expv[9] = 17'h00000;
      expv[10] = 17'h00000;
      expv[11] = 17'h05e0f;
      expv[12] = 17'h00000;
      expv[13] = 17'h00000;
      expv[14] = 17'h00000;
      expv[15] = 17'h00000;
      expv[16] = 17'h00000;
      expv[17] = 17'h0005f;
      expv[18] = 17'h05e0f;
      expv[19] = 17'h00000;
      expv[20] = 17'h05e0f;
      expv[21] = 17'h00000;
      expv[22] = 17'h0005f;
      expv[23] = 17'h00000;
      expv[24] = 17'h00000;
      expv[25] = 17'h00000;
      expv[26] = 17'h00000;
      expv[27] = 17'h00000;
      expv[28] = 17'h00000;
      expv[29] = 17'h00000;
      expv[30] = 17'h00000;
      expv[31] = 17'h00000;
      expv[32] = 17'h00000;
      expv[33] = 17'h00000;
      expv[34] = 17'h00000;
      expv[35] = 17'h00000;
      expv[36] = 17'h00000;
      expv[37] = 17'h05e0f;
      expv[38] = 17'h0005f;
      expv[39] = 17'h0b00e;
      expv[40] = 17'h00000;
      expv[41] = 17'h0b00e;
      expv[42] = 17'h0b00e;
      expv[43] = 17'h00000;
      expv[44] = 17'h00000;
      expv[45] = 17'h00000;
      expv[46] = 17'h0005f;
      expv[47] = 17'h00000;
      expv[48] = 17'h00000;
      expv[49] = 17'h00000;
      expv[50] = 17'h00000;
      expv[51] = 17'h00000;
      expv[52] = 17'h00000;
      expv[53] = 17'h0005f;
      expv[54] = 17'h0005f;
      expv[55] = 17'h0b00e;
      expv[56] = 17'h0005f;
      expv[57] = 17'h00000;
      expv[58] = 17'h0b00e;
      expv[59] = 17'h0b00e;
      expv[60] = 17'h03abb;
      expv[61] = 17'h0b00e;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
