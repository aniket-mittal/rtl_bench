// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08179 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h09845ddf39;
    stim[1] = 37'h0d1f50a647;
    stim[2] = 37'h16cb6b5c9a;
    stim[3] = 37'h0a843e05cb;
    stim[4] = 37'h1f7b7c5c31;
    stim[5] = 37'h0ab95235d3;
    stim[6] = 37'h0f90f7e3d5;
    stim[7] = 37'h03894c57b7;
    stim[8] = 37'h1e9e1c88c1;
    stim[9] = 37'h1e6c0ed3fc;
    stim[10] = 37'h03448902d2;
    stim[11] = 37'h0695dccffa;
    stim[12] = 37'h12dd08ce3e;
    stim[13] = 37'h104c145582;
    stim[14] = 37'h1ea2c8b03c;
    stim[15] = 37'h12ae553813;
    stim[16] = 37'h066e76dca9;
    stim[17] = 37'h1661dadf28;
    stim[18] = 37'h1b9272dd30;
    stim[19] = 37'h1b31257221;
    stim[20] = 37'h0f124d9c48;
    stim[21] = 37'h0f2312240e;
    stim[22] = 37'h02d4b160d5;
    stim[23] = 37'h1aa05ab5ca;
    stim[24] = 37'h0ed9025cca;
    stim[25] = 37'h0e3b169765;
    stim[26] = 37'h170c3752ad;
    stim[27] = 37'h0af5f64189;
    stim[28] = 37'h0e8a9c9e13;
    stim[29] = 37'h06be68ffdd;
    stim[30] = 37'h1e9b2ec894;
    stim[31] = 37'h03f92e7d59;
    stim[32] = 37'h0bda93b0c4;
    stim[33] = 37'h07a829c1af;
    stim[34] = 37'h1b8a7a6ca3;
    stim[35] = 37'h121b39c5cd;
    stim[36] = 37'h0f1f52e941;
    stim[37] = 37'h1252ac08cf;
    stim[38] = 37'h1a99e7aa1b;
    stim[39] = 37'h1f9c6ac279;
    stim[40] = 37'h1794203164;
    stim[41] = 37'h0e4c16a428;
    stim[42] = 37'h1622cfbba3;
    stim[43] = 37'h1324a072b2;
    stim[44] = 37'h1b652cc931;
    stim[45] = 37'h074fd8e979;
    stim[46] = 37'h029fef8825;
    stim[47] = 37'h1a4351bb04;
    stim[48] = 37'h171a5ed459;
    stim[49] = 37'h0e2122cd5e;
    stim[50] = 37'h16f75fb94f;
    stim[51] = 37'h0f56113329;
    stim[52] = 37'h1ea2f3b249;
    stim[53] = 37'h1b87c7e358;
    stim[54] = 37'h0f5f1afcd0;
    stim[55] = 37'h1b28d2965c;
    stim[56] = 37'h12d10ca4a2;
    stim[57] = 37'h0f93a70c4d;
    stim[58] = 37'h128abcbebe;
    stim[59] = 37'h178c19e6d2;
    stim[60] = 37'h05830f29a1;
    stim[61] = 37'h123ce4f04d;
    stim[62] = 37'h1e94036bf5;
    stim[63] = 37'h07f182429f;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h000000000;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h100000000;
      expv[18] = 33'h100000000;
      expv[19] = 33'h100000000;
      expv[20] = 33'h100000000;
      expv[21] = 33'h100000000;
      expv[22] = 33'h100000001;
      expv[23] = 33'h100000000;
      expv[24] = 33'h100000000;
      expv[25] = 33'h100000000;
      expv[26] = 33'h100000000;
      expv[27] = 33'h100000000;
      expv[28] = 33'h100000000;
      expv[29] = 33'h100000001;
      expv[30] = 33'h100000000;
      expv[31] = 33'h100000001;
      expv[32] = 33'h100000000;
      expv[33] = 33'h100000001;
      expv[34] = 33'h100000000;
      expv[35] = 33'h100000000;
      expv[36] = 33'h100000000;
      expv[37] = 33'h100000000;
      expv[38] = 33'h100000000;
      expv[39] = 33'h100000000;
      expv[40] = 33'h100000000;
      expv[41] = 33'h100000000;
      expv[42] = 33'h100000000;
      expv[43] = 33'h100000000;
      expv[44] = 33'h100000000;
      expv[45] = 33'h100000001;
      expv[46] = 33'h100000001;
      expv[47] = 33'h100000000;
      expv[48] = 33'h100000000;
      expv[49] = 33'h100000000;
      expv[50] = 33'h100000000;
      expv[51] = 33'h100000000;
      expv[52] = 33'h100000000;
      expv[53] = 33'h100000000;
      expv[54] = 33'h100000000;
      expv[55] = 33'h100000000;
      expv[56] = 33'h100000000;
      expv[57] = 33'h100000000;
      expv[58] = 33'h100000000;
      expv[59] = 33'h100000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
