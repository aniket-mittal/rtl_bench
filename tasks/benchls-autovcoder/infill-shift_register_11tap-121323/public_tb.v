// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_121323 dut (
    .clk(clk),
    .data(in_vec[16:5]),
    .ce(in_vec[4:4]),
    .a(in_vec[3:0]),
    .q(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h1477f;
    stim[1] = 17'h0080c;
    stim[2] = 17'h1d5c7;
    stim[3] = 17'h10540;
    stim[4] = 17'h179e7;
    stim[5] = 17'h0e13e;
    stim[6] = 17'h121a1;
    stim[7] = 17'h0b372;
    stim[8] = 17'h151ed;
    stim[9] = 17'h1a7f7;
    stim[10] = 17'h17279;
    stim[11] = 17'h0084f;
    stim[12] = 17'h1eeb7;
    stim[13] = 17'h1c15a;
    stim[14] = 17'h06557;
    stim[15] = 17'h19f53;
    stim[16] = 17'h12f60;
    stim[17] = 17'h0145d;
    stim[18] = 17'h139c1;
    stim[19] = 17'h1d0cb;
    stim[20] = 17'h0b775;
    stim[21] = 17'h18a9e;
    stim[22] = 17'h0b792;
    stim[23] = 17'h1ff97;
    stim[24] = 17'h18691;
    stim[25] = 17'h052cd;
    stim[26] = 17'h1a85c;
    stim[27] = 17'h02623;
    stim[28] = 17'h141d0;
    stim[29] = 17'h1ebb8;
    stim[30] = 17'h13dd3;
    stim[31] = 17'h1990d;
    stim[32] = 17'h13809;
    stim[33] = 17'h0ab98;
    stim[34] = 17'h012c5;
    stim[35] = 17'h1659b;
    stim[36] = 17'h119c4;
    stim[37] = 17'h0314c;
    stim[38] = 17'h066d5;
    stim[39] = 17'h1a2ac;
    stim[40] = 17'h03386;
    stim[41] = 17'h1af41;
    stim[42] = 17'h1c863;
    stim[43] = 17'h1f548;
    stim[44] = 17'h066c8;
    stim[45] = 17'h1eb64;
    stim[46] = 17'h15da3;
    stim[47] = 17'h075e5;
    stim[48] = 17'h18b5b;
    stim[49] = 17'h0c420;
    stim[50] = 17'h1b336;
    stim[51] = 17'h0cc44;
    stim[52] = 17'h10048;
    stim[53] = 17'h07911;
    stim[54] = 17'h031fa;
    stim[55] = 17'h13a94;
    stim[56] = 17'h0732d;
    stim[57] = 17'h1adec;
    stim[58] = 17'h1135a;
    stim[59] = 17'h131b7;
    stim[60] = 17'h1d9a8;
    stim[61] = 17'h12f86;
    stim[62] = 17'h1e55e;
    stim[63] = 17'h1a1fa;
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
      expv[3] = 12'ha3b;
      expv[4] = 12'hxxx;
      expv[5] = 12'hxxx;
      expv[6] = 12'ha3b;
      expv[7] = 12'hxxx;
      expv[8] = 12'hxxx;
      expv[9] = 12'hxxx;
      expv[10] = 12'hxxx;
      expv[11] = 12'hxxx;
      expv[12] = 12'hxxx;
      expv[13] = 12'hxxx;
      expv[14] = 12'hxxx;
      expv[15] = 12'hb93;
      expv[16] = 12'hcfa;
      expv[17] = 12'hxxx;
      expv[18] = 12'hcfa;
      expv[19] = 12'hxxx;
      expv[20] = 12'hb93;
      expv[21] = 12'ha3b;
      expv[22] = 12'h0a2;
      expv[23] = 12'hf75;
      expv[24] = 12'h5bc;
      expv[25] = 12'hb93;
      expv[26] = 12'hb93;
      expv[27] = 12'h5bc;
      expv[28] = 12'hd42;
      expv[29] = 12'hcfa;
      expv[30] = 12'hc34;
      expv[31] = 12'hcfa;
      expv[32] = 12'h0a2;
      expv[33] = 12'h5bb;
      expv[34] = 12'hc34;
      expv[35] = 12'h0a2;
      expv[36] = 12'ha0e;
      expv[37] = 12'h5bb;
      expv[38] = 12'hd42;
      expv[39] = 12'hc54;
      expv[40] = 12'hd42;
      expv[41] = 12'hb2c;
      expv[42] = 12'h9ee;
      expv[43] = 12'hffc;
      expv[44] = 12'hffc;
      expv[45] = 12'hf5d;
      expv[46] = 12'h9ee;
      expv[47] = 12'ha0e;
      expv[48] = 12'hc54;
      expv[49] = 12'hc5a;
      expv[50] = 12'ha0e;
      expv[51] = 12'h55c;
      expv[52] = 12'hd42;
      expv[53] = 12'hc5a;
      expv[54] = 12'hc34;
      expv[55] = 12'h336;
      expv[56] = 12'ha0e;
      expv[57] = 12'ha0e;
      expv[58] = 12'ha0e;
      expv[59] = 12'hb2c;
      expv[60] = 12'hb2c;
      expv[61] = 12'hc5a;
      expv[62] = 12'h9ee;
      expv[63] = 12'h55c;
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
