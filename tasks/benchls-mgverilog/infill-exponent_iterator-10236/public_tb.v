// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 18;
  localparam OW = 101;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10236 dut (
    .clk(clk),
    .base(in_vec[17:9]),
    .exponent(in_vec[8:1]),
    .reset(in_vec[0:0]),
    .result(out_vec[100:1]),
    .isDone(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 18'h3d97b;
    stim[1] = 18'h3f149;
    stim[2] = 18'h05ca2;
    stim[3] = 18'h3d466;
    stim[4] = 18'h0d4b8;
    stim[5] = 18'h1a2d8;
    stim[6] = 18'h1585f;
    stim[7] = 18'h05dec;
    stim[8] = 18'h14bf6;
    stim[9] = 18'h1fa64;
    stim[10] = 18'h0d69c;
    stim[11] = 18'h2b9c6;
    stim[12] = 18'h19624;
    stim[13] = 18'h3cb26;
    stim[14] = 18'h155b0;
    stim[15] = 18'h172c0;
    stim[16] = 18'h1cae2;
    stim[17] = 18'h222fe;
    stim[18] = 18'h15bc0;
    stim[19] = 18'h2dbce;
    stim[20] = 18'h11bee;
    stim[21] = 18'h06b1a;
    stim[22] = 18'h08c9a;
    stim[23] = 18'h09c21;
    stim[24] = 18'h25eea;
    stim[25] = 18'h2747e;
    stim[26] = 18'h27fca;
    stim[27] = 18'h13874;
    stim[28] = 18'h0eed0;
    stim[29] = 18'h373f2;
    stim[30] = 18'h134e8;
    stim[31] = 18'h0f54c;
    stim[32] = 18'h12286;
    stim[33] = 18'h105ee;
    stim[34] = 18'h14bfc;
    stim[35] = 18'h3af66;
    stim[36] = 18'h2e3da;
    stim[37] = 18'h0b5dc;
    stim[38] = 18'h2e29e;
    stim[39] = 18'h0f340;
    stim[40] = 18'h19f62;
    stim[41] = 18'h17c84;
    stim[42] = 18'h006a9;
    stim[43] = 18'h1f0f6;
    stim[44] = 18'h0427c;
    stim[45] = 18'h37d46;
    stim[46] = 18'h34268;
    stim[47] = 18'h231da;
    stim[48] = 18'h02d96;
    stim[49] = 18'h03818;
    stim[50] = 18'h2403c;
    stim[51] = 18'h129ba;
    stim[52] = 18'h1c03a;
    stim[53] = 18'h21344;
    stim[54] = 18'h19b04;
    stim[55] = 18'h10066;
    stim[56] = 18'h1bffc;
    stim[57] = 18'h0b7f4;
    stim[58] = 18'h12276;
    stim[59] = 18'h387de;
    stim[60] = 18'h133a2;
    stim[61] = 18'h1cb30;
    stim[62] = 18'h068ce;
    stim[63] = 18'h05858;
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
      expv[0] = 101'h00000000000000000000000000;
      expv[1] = 101'h000000000000000000000003d8;
      expv[2] = 101'h000000000000000000000003d8;
      expv[3] = 101'h0000000000000000000153cfc0;
      expv[4] = 101'h000000000001afae3082075000;
      expv[5] = 101'h1b8e81c44bb573a9520d000000;
      expv[6] = 101'h02c36f86cd8efc800000000000;
      expv[7] = 101'h1d800000000000000000000000;
      expv[8] = 101'h00000000000000000000000000;
      expv[9] = 101'h0000000000000000000000014a;
      expv[10] = 101'h0000000000000000000000d4b3;
      expv[11] = 101'h0000000000000000000000d4b3;
      expv[12] = 101'h0000000000000000000000d4b3;
      expv[13] = 101'h0000000000000000000000d4b3;
      expv[14] = 101'h0000000000000000000000d4b3;
      expv[15] = 101'h0000000000000000000000d4b3;
      expv[16] = 101'h0000000000000000000000d4b3;
      expv[17] = 101'h0000000000000000000000d4b3;
      expv[18] = 101'h0000000000000000000000d4b3;
      expv[19] = 101'h0000000000000000000000d4b3;
      expv[20] = 101'h0000000000000000000000d4b3;
      expv[21] = 101'h0000000000000000000000d4b3;
      expv[22] = 101'h0000000000000000000000d4b3;
      expv[23] = 101'h0000000000000000000000d4b3;
      expv[24] = 101'h00000000000000000000000000;
      expv[25] = 101'h0000000000000000000000025e;
      expv[26] = 101'h0000000000000000000000025e;
      expv[27] = 101'h0000000000000000000000025e;
      expv[28] = 101'h00000000000000000001b51438;
      expv[29] = 101'h00000000000001751f04646620;
      expv[30] = 101'h146995d5da86a710b837bc3200;
      expv[31] = 101'h09723b828f42779b359ff40000;
      expv[32] = 101'h1b488c71f67955225000000000;
      expv[33] = 101'h1692fdb4800000000000000001;
      expv[34] = 101'h1692fdb4800000000000000001;
      expv[35] = 101'h1692fdb4800000000000000001;
      expv[36] = 101'h1692fdb4800000000000000001;
      expv[37] = 101'h1692fdb4800000000000000001;
      expv[38] = 101'h1692fdb4800000000000000001;
      expv[39] = 101'h1692fdb4800000000000000001;
      expv[40] = 101'h1692fdb4800000000000000001;
      expv[41] = 101'h1692fdb4800000000000000001;
      expv[42] = 101'h1692fdb4800000000000000001;
      expv[43] = 101'h00000000000000000000000000;
      expv[44] = 101'h000000000000000000000001f0;
      expv[45] = 101'h000000000000000000000001f0;
      expv[46] = 101'h000000000000000000000001f0;
      expv[47] = 101'h000000000000000000000001f0;
      expv[48] = 101'h0000000000000000000001e080;
      expv[49] = 101'h000000000000000026c0a2c000;
      expv[50] = 101'h000000522091cd6889e0000000;
      expv[51] = 101'h10149924da4000000000000000;
      expv[52] = 101'h00000000000000000000000001;
      expv[53] = 101'h000000000000000000000001c0;
      expv[54] = 101'h00000000000000000000018801;
      expv[55] = 101'h00000000000000000000018801;
      expv[56] = 101'h00000000000000000000018801;
      expv[57] = 101'h00000000000000000000018801;
      expv[58] = 101'h00000000000000000000018801;
      expv[59] = 101'h00000000000000000000018801;
      expv[60] = 101'h00000000000000000000018801;
      expv[61] = 101'h00000000000000000000018801;
      expv[62] = 101'h00000000000000000000018801;
      expv[63] = 101'h00000000000000000000018801;
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
