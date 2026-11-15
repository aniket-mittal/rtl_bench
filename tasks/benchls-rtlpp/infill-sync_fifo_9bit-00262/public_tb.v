// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 12;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00262 dut (
    .clk(clk),
    .rst(in_vec[11:11]),
    .din(in_vec[10:2]),
    .wr_en(in_vec[1:1]),
    .rd_en(in_vec[0:0]),
    .dout(out_vec[11:3]),
    .full(out_vec[2:2]),
    .empty(out_vec[1:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 12'hb56;
    stim[1] = 12'hae9;
    stim[2] = 12'h040;
    stim[3] = 12'h26d;
    stim[4] = 12'h523;
    stim[5] = 12'h049;
    stim[6] = 12'h540;
    stim[7] = 12'h7d1;
    stim[8] = 12'h545;
    stim[9] = 12'h588;
    stim[10] = 12'h1b9;
    stim[11] = 12'h7b2;
    stim[12] = 12'h3e3;
    stim[13] = 12'h5ef;
    stim[14] = 12'h240;
    stim[15] = 12'h70a;
    stim[16] = 12'h0e2;
    stim[17] = 12'h573;
    stim[18] = 12'h607;
    stim[19] = 12'h3ab;
    stim[20] = 12'h065;
    stim[21] = 12'h753;
    stim[22] = 12'h015;
    stim[23] = 12'h7e9;
    stim[24] = 12'h139;
    stim[25] = 12'h172;
    stim[26] = 12'h4d5;
    stim[27] = 12'h180;
    stim[28] = 12'h3ff;
    stim[29] = 12'h3c1;
    stim[30] = 12'h453;
    stim[31] = 12'h230;
    stim[32] = 12'h3bb;
    stim[33] = 12'h2f1;
    stim[34] = 12'h235;
    stim[35] = 12'h030;
    stim[36] = 12'h024;
    stim[37] = 12'h161;
    stim[38] = 12'h6f8;
    stim[39] = 12'h6f2;
    stim[40] = 12'h2b4;
    stim[41] = 12'h139;
    stim[42] = 12'h780;
    stim[43] = 12'h434;
    stim[44] = 12'h341;
    stim[45] = 12'h3b8;
    stim[46] = 12'h2e7;
    stim[47] = 12'hbdf;
    stim[48] = 12'h5a6;
    stim[49] = 12'h68b;
    stim[50] = 12'h06e;
    stim[51] = 12'h9cf;
    stim[52] = 12'h041;
    stim[53] = 12'h71a;
    stim[54] = 12'h147;
    stim[55] = 12'h20d;
    stim[56] = 12'h7a7;
    stim[57] = 12'h18a;
    stim[58] = 12'h023;
    stim[59] = 12'h4a4;
    stim[60] = 12'h7d8;
    stim[61] = 12'h193;
    stim[62] = 12'h675;
    stim[63] = 12'hd19;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'hxxx;
      expv[4] = 12'h6aa;
      expv[5] = 12'h6aa;
      expv[6] = 12'hxxx;
      expv[7] = 12'hxxx;
      expv[8] = 12'hxxx;
      expv[9] = 12'hxxx;
      expv[10] = 12'hxxx;
      expv[11] = 12'hxxx;
      expv[12] = 12'hxxx;
      expv[13] = 12'hxxx;
      expv[14] = 12'hxxx;
      expv[15] = 12'hxxx;
      expv[16] = 12'hxxx;
      expv[17] = 12'hxxx;
      expv[18] = 12'hxxx;
      expv[19] = 12'hxxx;
      expv[20] = 12'hxxx;
      expv[21] = 12'hxxx;
      expv[22] = 12'hxxx;
      expv[23] = 12'hxxx;
      expv[24] = 12'hxxx;
      expv[25] = 12'hxxx;
      expv[26] = 12'hxxx;
      expv[27] = 12'hxxx;
      expv[28] = 12'hxxx;
      expv[29] = 12'hxxx;
      expv[30] = 12'hxxx;
      expv[31] = 12'hxxx;
      expv[32] = 12'hxxx;
      expv[33] = 12'hxxx;
      expv[34] = 12'hxxx;
      expv[35] = 12'hxxx;
      expv[36] = 12'hxxx;
      expv[37] = 12'hxxx;
      expv[38] = 12'hxxx;
      expv[39] = 12'hxxx;
      expv[40] = 12'hxxx;
      expv[41] = 12'hxxx;
      expv[42] = 12'hxxx;
      expv[43] = 12'hxxx;
      expv[44] = 12'hxxx;
      expv[45] = 12'hxxx;
      expv[46] = 12'hxxx;
      expv[47] = 12'hxxx;
      expv[48] = 12'hxxx;
      expv[49] = 12'hxxx;
      expv[50] = 12'h7b9;
      expv[51] = 12'h7ba;
      expv[52] = 12'hd12;
      expv[53] = 12'hb4a;
      expv[54] = 12'hb49;
      expv[55] = 12'hd11;
      expv[56] = 12'hd12;
      expv[57] = 12'h0da;
      expv[58] = 12'h0d9;
      expv[59] = 12'he11;
      expv[60] = 12'he11;
      expv[61] = 12'he11;
      expv[62] = 12'h1c1;
      expv[63] = 12'h1c2;
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
