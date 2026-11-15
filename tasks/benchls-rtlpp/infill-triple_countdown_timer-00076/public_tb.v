// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 39;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00076 dut (
    .clk(clk),
    .rst(in_vec[38:38]),
    .clk0(in_vec[37:37]),
    .clk1(in_vec[36:36]),
    .clk2(in_vec[35:35]),
    .counter_we(in_vec[34:34]),
    .counter_val(in_vec[33:2]),
    .counter_ch(in_vec[1:0]),
    .counter0_OUT(out_vec[34:34]),
    .counter1_OUT(out_vec[33:33]),
    .counter2_OUT(out_vec[32:32]),
    .counter_out(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 39'h6bc6d00456;
    stim[1] = 39'h6d0941dece;
    stim[2] = 39'h30a16ffc16;
    stim[3] = 39'h30224a9465;
    stim[4] = 39'h3d4f7db2c7;
    stim[5] = 39'h14db7a4e0e;
    stim[6] = 39'h1686383dcc;
    stim[7] = 39'h0ed9e825f5;
    stim[8] = 39'h29b4341041;
    stim[9] = 39'h3e8070c04a;
    stim[10] = 39'h1ac54aaf25;
    stim[11] = 39'h2668e5cd5b;
    stim[12] = 39'h3326f29130;
    stim[13] = 39'h0a657919ae;
    stim[14] = 39'h12b3ab6861;
    stim[15] = 39'h0631f923d1;
    stim[16] = 39'h02742628e4;
    stim[17] = 39'h27dd1981f0;
    stim[18] = 39'h04454f349d;
    stim[19] = 39'h3adfe12ea7;
    stim[20] = 39'h24984891b0;
    stim[21] = 39'h1b553b6537;
    stim[22] = 39'h188a7179de;
    stim[23] = 39'h0d20455265;
    stim[24] = 39'h078a089882;
    stim[25] = 39'h2c661076aa;
    stim[26] = 39'h0baf515e22;
    stim[27] = 39'h0c1beda56f;
    stim[28] = 39'h217b0b06c7;
    stim[29] = 39'h16850bbbe4;
    stim[30] = 39'h2a1483067f;
    stim[31] = 39'h0541146b0e;
    stim[32] = 39'h0ae669b13b;
    stim[33] = 39'h3906058529;
    stim[34] = 39'h300f190491;
    stim[35] = 39'h37a25c6708;
    stim[36] = 39'h1ace7b4914;
    stim[37] = 39'h18b42efc90;
    stim[38] = 39'h7a3379a4c9;
    stim[39] = 39'h5cf9bcf829;
    stim[40] = 39'h6b556ad926;
    stim[41] = 39'h2399518952;
    stim[42] = 39'h22443eda46;
    stim[43] = 39'h23939d9949;
    stim[44] = 39'h196017acbd;
    stim[45] = 39'h2a9c167368;
    stim[46] = 39'h020d270b0b;
    stim[47] = 39'h328c5a7b54;
    stim[48] = 39'h24cd73e9c5;
    stim[49] = 39'h2d0e0cdb0d;
    stim[50] = 39'h06467211a4;
    stim[51] = 39'h3f25578d44;
    stim[52] = 39'h386509f6c2;
    stim[53] = 39'h1449150527;
    stim[54] = 39'h16d8766180;
    stim[55] = 39'h191f40433e;
    stim[56] = 39'h16ddd312fd;
    stim[57] = 39'h20891a3a73;
    stim[58] = 39'h2d2db51143;
    stim[59] = 39'h7c37b09703;
    stim[60] = 39'h032e7ad0ca;
    stim[61] = 39'h35189508ae;
    stim[62] = 39'h288affdd5a;
    stim[63] = 39'h26fa5aa740;
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
      expv[0] = 35'h000000000;
      expv[1] = 35'h000000000;
      expv[2] = 35'h000000000;
      expv[3] = 35'h600000000;
      expv[4] = 35'h600000000;
      expv[5] = 35'h700000000;
      expv[6] = 35'h700000000;
      expv[7] = 35'h700000000;
      expv[8] = 35'h7b67a097d;
      expv[9] = 35'h736de9381;
      expv[10] = 35'h7b67a097c;
      expv[11] = 35'h700000000;
      expv[12] = 35'h7a18e0f70;
      expv[13] = 35'h736de937f;
      expv[14] = 35'h7b67a097a;
      expv[15] = 35'h7b67a0979;
      expv[16] = 35'h7a18e0f6f;
      expv[17] = 35'h7a18e0f6f;
      expv[18] = 35'h78c7e48f4;
      expv[19] = 35'h700000000;
      expv[20] = 35'h7a18e0f6d;
      expv[21] = 35'h700000000;
      expv[22] = 35'h736de937c;
      expv[23] = 35'h71153cd24;
      expv[24] = 35'h736de937a;
      expv[25] = 35'h7e2822620;
      expv[26] = 35'h7e282261f;
      expv[27] = 35'h700000000;
      expv[28] = 35'h700000000;
      expv[29] = 35'h7a18e0f6a;
      expv[30] = 35'h700000000;
      expv[31] = 35'h7e282261c;
      expv[32] = 35'h700000000;
      expv[33] = 35'h748115498;
      expv[34] = 35'h748115497;
      expv[35] = 35'h7a142eef6;
      expv[36] = 35'h7a142eef5;
      expv[37] = 35'h7a142eef5;
      expv[38] = 35'h000000000;
      expv[39] = 35'h000000000;
      expv[40] = 35'h000000000;
      expv[41] = 35'h000000000;
      expv[42] = 35'h400000000;
      expv[43] = 35'h400000000;
      expv[44] = 35'h400000000;
      expv[45] = 35'h700000000;
      expv[46] = 35'h700000000;
      expv[47] = 35'h700000000;
      expv[48] = 35'h700000000;
      expv[49] = 35'h7335cfa71;
      expv[50] = 35'h700000000;
      expv[51] = 35'h7919c8469;
      expv[52] = 35'h700000000;
      expv[53] = 35'h700000000;
      expv[54] = 35'h7919c8467;
      expv[55] = 35'h700000000;
      expv[56] = 35'h7438336be;
      expv[57] = 35'h700000000;
      expv[58] = 35'h700000000;
      expv[59] = 35'h000000000;
      expv[60] = 35'h000000000;
      expv[61] = 35'h000000000;
      expv[62] = 35'h64625422b;
      expv[63] = 35'h600000000;
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
