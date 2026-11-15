// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_059129 dut (
    .clk(clk),
    .rst(in_vec[25:25]),
    .a_data(in_vec[24:3]),
    .a_valid(in_vec[2:2]),
    .b_short(in_vec[1:1]),
    .b_ready(in_vec[0:0]),
    .a_ready(out_vec[65:65]),
    .b_data(out_vec[64:1]),
    .b_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h2e43669;
    stim[1] = 26'h3f7c633;
    stim[2] = 26'h18f72a4;
    stim[3] = 26'h1b54bb1;
    stim[4] = 26'h18725a0;
    stim[5] = 26'h0457d70;
    stim[6] = 26'h189a93f;
    stim[7] = 26'h195ce6d;
    stim[8] = 26'h1c19507;
    stim[9] = 26'h2312c9d;
    stim[10] = 26'h15257ca;
    stim[11] = 26'h0b2b263;
    stim[12] = 26'h065e26f;
    stim[13] = 26'h35ce2ed;
    stim[14] = 26'h1d5b3ef;
    stim[15] = 26'h19f054b;
    stim[16] = 26'h09946a5;
    stim[17] = 26'h00a2dde;
    stim[18] = 26'h1f7ab26;
    stim[19] = 26'h15fe8a2;
    stim[20] = 26'h1cd8d38;
    stim[21] = 26'h1f64ace;
    stim[22] = 26'h06a68a7;
    stim[23] = 26'h0c5db54;
    stim[24] = 26'h1c5bffd;
    stim[25] = 26'h00c9a31;
    stim[26] = 26'h0f4e008;
    stim[27] = 26'h0a7d2fc;
    stim[28] = 26'h02fa63d;
    stim[29] = 26'h1f1fdef;
    stim[30] = 26'h03fa6ae;
    stim[31] = 26'h054ee28;
    stim[32] = 26'h08ff613;
    stim[33] = 26'h17ec806;
    stim[34] = 26'h116e8d0;
    stim[35] = 26'h1adc2a5;
    stim[36] = 26'h1df6442;
    stim[37] = 26'h0ddae65;
    stim[38] = 26'h0f181e5;
    stim[39] = 26'h0cb14b8;
    stim[40] = 26'h0402a21;
    stim[41] = 26'h1fdcc54;
    stim[42] = 26'h157602d;
    stim[43] = 26'h0879aad;
    stim[44] = 26'h15d1bf2;
    stim[45] = 26'h116920c;
    stim[46] = 26'h1a7072a;
    stim[47] = 26'h1b046c7;
    stim[48] = 26'h10c97b8;
    stim[49] = 26'h0573b01;
    stim[50] = 26'h0ea31a3;
    stim[51] = 26'h12d7341;
    stim[52] = 26'h13232b4;
    stim[53] = 26'h1b3af90;
    stim[54] = 26'h1df81a0;
    stim[55] = 26'h1b63595;
    stim[56] = 26'h1c3b4cc;
    stim[57] = 26'h04edc4b;
    stim[58] = 26'h0cf2757;
    stim[59] = 26'h13f9419;
    stim[60] = 26'h1ef05e5;
    stim[61] = 26'h02bdf0e;
    stim[62] = 26'h1391414;
    stim[63] = 26'h19d701e;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'hxxxxxxxxxxxxxxxxx;
      expv[2] = 66'hxxxxxxxxxxxxxxxxx;
      expv[3] = 66'h23dca800000000000;
      expv[4] = 66'h23dca800000000000;
      expv[5] = 66'h23dca800000000000;
      expv[6] = 66'h23dca800000000000;
      expv[7] = 66'h23dca989a93800000;
      expv[8] = 66'h23dca989a93e5739a;
      expv[9] = 66'h30654000000000000;
      expv[10] = 66'h2c4b2600000000000;
      expv[11] = 66'h2c4b2600000000000;
      expv[12] = 66'h2c4b2600000000000;
      expv[13] = 66'h39789a00000000000;
      expv[14] = 66'h39789b5ce2e800000;
      expv[15] = 66'h356cfa00000000000;
      expv[16] = 66'h356cfa00000000000;
      expv[17] = 66'h156cfa9946a000001;
      expv[18] = 66'h156cfa9946a000001;
      expv[19] = 66'h156cfa9946a000001;
      expv[20] = 66'h356cfa9946a000000;
      expv[21] = 66'h156cfa9946a000001;
      expv[22] = 66'h356cfa9946a000001;
      expv[23] = 66'h3a9a2800000000000;
      expv[24] = 66'h3a9a28c5db5000000;
      expv[25] = 66'h3a9a28c5db5716fff;
      expv[26] = 66'h3a9a28c5db5716ffe;
      expv[27] = 66'h3a9a28c5db5716ffe;
      expv[28] = 66'h29f4be00000000000;
      expv[29] = 66'h29f4be2fa63800001;
      expv[30] = 66'h3c7f7a00000000000;
      expv[31] = 66'h3c7f7a3fa6a800000;
      expv[32] = 66'h3c7f7a3fa6a800001;
      expv[33] = 66'h3c7f7a3fa6a800000;
      expv[34] = 66'h3fb20000000000000;
      expv[35] = 66'h3fb20000000000000;
      expv[36] = 66'h1fb201adc2a000001;
      expv[37] = 66'h3fb201adc2a000000;
      expv[38] = 66'h3fb201adc2a376b99;
      expv[39] = 66'h3c607800000000000;
      expv[40] = 66'h3c607800000000000;
      expv[41] = 66'h3c607800000000000;
      expv[42] = 66'h3c6079fdcc5000000;
      expv[43] = 66'h3c6079fdcc555d80b;
      expv[44] = 66'h21e6aa00000000000;
      expv[45] = 66'h21e6aa00000000000;
      expv[46] = 66'h01e6ab16920800001;
      expv[47] = 66'h21e6ab16920800001;
      expv[48] = 66'h2c11b000000000000;
      expv[49] = 66'h2c11b000000000000;
      expv[50] = 66'h2c11b000000000000;
      expv[51] = 66'h2c11b000000000000;
      expv[52] = 66'h2c11b000000000000;
      expv[53] = 66'h2c11b13232b000000;
      expv[54] = 66'h2c11b13232b000000;
      expv[55] = 66'h2c11b13232b000000;
      expv[56] = 66'h0c11b13232b6d8d65;
      expv[57] = 66'h2c11b13232b6d8d64;
      expv[58] = 66'h2c11b13232b6d8d64;
      expv[59] = 66'h33c9d400000000000;
      expv[60] = 66'h33c9d400000000000;
      expv[61] = 66'h3bc17800000000000;
      expv[62] = 66'h3bc1782bdf0800000;
      expv[63] = 66'h3bc1782bdf0ce4504;
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
