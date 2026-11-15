// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00899 dut (
    .CLK_6MB(clk),
    .nBNKB(in_vec[17:17]),
    .SHADOW(in_vec[16:16]),
    .PC(in_vec[15:0]),
    .VIDEO_R(out_vec[20:14]),
    .VIDEO_G(out_vec[13:7]),
    .VIDEO_B(out_vec[6:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h1b262;
    stim[1] = 18'h28326;
    stim[2] = 18'h2a6b7;
    stim[3] = 18'h34f73;
    stim[4] = 18'h3309c;
    stim[5] = 18'h2701c;
    stim[6] = 18'h35b63;
    stim[7] = 18'h27d2d;
    stim[8] = 18'h0ef66;
    stim[9] = 18'h23308;
    stim[10] = 18'h3bdf5;
    stim[11] = 18'h27f5f;
    stim[12] = 18'h343a9;
    stim[13] = 18'h01f61;
    stim[14] = 18'h0884c;
    stim[15] = 18'h2a82e;
    stim[16] = 18'h27d58;
    stim[17] = 18'h340df;
    stim[18] = 18'h0f722;
    stim[19] = 18'h24dbb;
    stim[20] = 18'h2da56;
    stim[21] = 18'h28e19;
    stim[22] = 18'h1a384;
    stim[23] = 18'h230c2;
    stim[24] = 18'h31c77;
    stim[25] = 18'h21bfc;
    stim[26] = 18'h21775;
    stim[27] = 18'h1d8d4;
    stim[28] = 18'h34b72;
    stim[29] = 18'h147b7;
    stim[30] = 18'h2f29d;
    stim[31] = 18'h1a8cb;
    stim[32] = 18'h29ddc;
    stim[33] = 18'h3a447;
    stim[34] = 18'h24d1d;
    stim[35] = 18'h24749;
    stim[36] = 18'h3c729;
    stim[37] = 18'h0b4d6;
    stim[38] = 18'h12728;
    stim[39] = 18'h11538;
    stim[40] = 18'h102fb;
    stim[41] = 18'h3ba7a;
    stim[42] = 18'h35450;
    stim[43] = 18'h2719a;
    stim[44] = 18'h2ade7;
    stim[45] = 18'h0a591;
    stim[46] = 18'h285b0;
    stim[47] = 18'h3b42d;
    stim[48] = 18'h2cc5f;
    stim[49] = 18'h3da4b;
    stim[50] = 18'h2ee6a;
    stim[51] = 18'h28b9b;
    stim[52] = 18'h19fdd;
    stim[53] = 18'h1b5f1;
    stim[54] = 18'h033ce;
    stim[55] = 18'h24082;
    stim[56] = 18'h3b82d;
    stim[57] = 18'h10196;
    stim[58] = 18'h3588b;
    stim[59] = 18'h3c9a6;
    stim[60] = 18'h09165;
    stim[61] = 18'h07c0a;
    stim[62] = 18'h0a086;
    stim[63] = 18'h36720;
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
      expv[1] = 21'h000000;
      expv[2] = 21'h034499;
      expv[3] = 21'h06579d;
      expv[4] = 21'h1fae4c;
      expv[5] = 21'h103372;
      expv[6] = 21'h008332;
      expv[7] = 21'h1bac4e;
      expv[8] = 21'h0d8536;
      expv[9] = 21'h000000;
      expv[10] = 21'h030122;
      expv[11] = 21'h1d7fd7;
      expv[12] = 21'h0f8b3e;
      expv[13] = 21'h13b464;
      expv[14] = 21'h000000;
      expv[15] = 21'h000000;
      expv[16] = 21'h0845b9;
      expv[17] = 21'h0d8b22;
      expv[18] = 21'h10ba7c;
      expv[19] = 21'h000000;
      expv[20] = 21'h0d962c;
      expv[21] = 21'h0aca9b;
      expv[22] = 21'h0e42a5;
      expv[23] = 21'h000000;
      expv[24] = 21'h00190a;
      expv[25] = 21'h1c2e5e;
      expv[26] = 21'h0b1e32;
      expv[27] = 21'h070e16;
      expv[28] = 21'h000000;
      expv[29] = 21'h1bae48;
      expv[30] = 21'h000000;
      expv[31] = 21'h02d3b7;
      expv[32] = 21'h000000;
      expv[33] = 21'h0d5ab3;
      expv[34] = 21'h1469dd;
      expv[35] = 21'h0d8234;
      expv[36] = 21'h078824;
      expv[37] = 21'h17e4e5;
      expv[38] = 21'h000000;
      expv[39] = 21'h000000;
      expv[40] = 21'h000000;
      expv[41] = 21'h000000;
      expv[42] = 21'h1a6feb;
      expv[43] = 21'h14aa42;
      expv[44] = 21'h01932a;
      expv[45] = 21'h0d5d9d;
      expv[46] = 21'h000000;
      expv[47] = 21'h055681;
      expv[48] = 21'h1465f7;
      expv[49] = 21'h0ccabd;
      expv[50] = 21'h1ae8ef;
      expv[51] = 21'h0ecda9;
      expv[52] = 21'h0b52ad;
      expv[53] = 21'h000000;
      expv[54] = 21'h000000;
      expv[55] = 21'h000000;
      expv[56] = 21'h009008;
      expv[57] = 21'h1865f7;
      expv[58] = 21'h000000;
      expv[59] = 21'h18b06e;
      expv[60] = 21'h19f4d9;
      expv[61] = 21'h000000;
      expv[62] = 21'h000000;
      expv[63] = 21'h000000;
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
