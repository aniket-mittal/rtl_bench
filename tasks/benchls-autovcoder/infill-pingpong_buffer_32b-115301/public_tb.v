// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 35;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_115301 dut (
    .ap_clk(clk),
    .ap_rst(in_vec[34:34]),
    .data_in(in_vec[33:2]),
    .vld_in(in_vec[1:1]),
    .ack_out(in_vec[0:0]),
    .ack_in(out_vec[34:34]),
    .data_out(out_vec[33:2]),
    .vld_out(out_vec[1:1]),
    .apdone_blk(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h48ecddac1;
    stim[1] = 35'h410a6225a;
    stim[2] = 35'h06350c8ab;
    stim[3] = 35'h27ee2a95f;
    stim[4] = 35'h27839855b;
    stim[5] = 35'h0dd4ac6ca;
    stim[6] = 35'h15aaa12d7;
    stim[7] = 35'h31325a849;
    stim[8] = 35'h288bfad77;
    stim[9] = 35'h11c4af9db;
    stim[10] = 35'h027f8c025;
    stim[11] = 35'h04add38bf;
    stim[12] = 35'h27325da3d;
    stim[13] = 35'h184c09011;
    stim[14] = 35'h13304e227;
    stim[15] = 35'h066ded4a7;
    stim[16] = 35'h0585f8780;
    stim[17] = 35'h1c05ea457;
    stim[18] = 35'h0e8e0de27;
    stim[19] = 35'h0af19769a;
    stim[20] = 35'h2b412bab9;
    stim[21] = 35'h3d64944bc;
    stim[22] = 35'h2698c1cf8;
    stim[23] = 35'h2e41d8674;
    stim[24] = 35'h24b09a809;
    stim[25] = 35'h0f0d11891;
    stim[26] = 35'h0863de650;
    stim[27] = 35'h0d2c042ec;
    stim[28] = 35'h078adc079;
    stim[29] = 35'h1a61f2695;
    stim[30] = 35'h349804cb4;
    stim[31] = 35'h3b9924bba;
    stim[32] = 35'h3a4d80ed1;
    stim[33] = 35'h10ebc2c74;
    stim[34] = 35'h14d9a8c3b;
    stim[35] = 35'h1ab67641b;
    stim[36] = 35'h088083f8e;
    stim[37] = 35'h1993c4291;
    stim[38] = 35'h06ff8f3c4;
    stim[39] = 35'h0493d7576;
    stim[40] = 35'h05b266531;
    stim[41] = 35'h3ec3a5fcb;
    stim[42] = 35'h25bc0015a;
    stim[43] = 35'h2e118e20a;
    stim[44] = 35'h0ca8a5b91;
    stim[45] = 35'h0896b752c;
    stim[46] = 35'h30da9bcae;
    stim[47] = 35'h11a1973a4;
    stim[48] = 35'h1f8c436b8;
    stim[49] = 35'h0b0d75ba1;
    stim[50] = 35'h1ba0c98fe;
    stim[51] = 35'h30e4e116a;
    stim[52] = 35'h1bd388b02;
    stim[53] = 35'h3779138ca;
    stim[54] = 35'h141a17453;
    stim[55] = 35'h0d1eeb560;
    stim[56] = 35'h3aa9dae87;
    stim[57] = 35'h15cf4c6b9;
    stim[58] = 35'h0c8beaf3b;
    stim[59] = 35'h05d34abd5;
    stim[60] = 35'h0d9ca214e;
    stim[61] = 35'h107ddfd95;
    stim[62] = 35'h0e379feb6;
    stim[63] = 35'h28d9eda3f;
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
      expv[0] = 35'hxxxxxxxxx;
      expv[1] = 35'hxxxxxxxxx;
      expv[2] = 35'h010a62258;
      expv[3] = 35'h46350c8a8;
      expv[4] = 35'h67ee2a95e;
      expv[5] = 35'h67839855b;
      expv[6] = 35'h27839855b;
      expv[7] = 35'h4dd4ac6ca;
      expv[8] = 35'h71325a848;
      expv[9] = 35'h688bfad76;
      expv[10] = 35'h51c4af9da;
      expv[11] = 35'h427f8c024;
      expv[12] = 35'h44add38be;
      expv[13] = 35'h67325da3c;
      expv[14] = 35'h584c09010;
      expv[15] = 35'h53304e226;
      expv[16] = 35'h466ded4a7;
      expv[17] = 35'h466ded4a6;
      expv[18] = 35'h5c05ea456;
      expv[19] = 35'h4e8e0de27;
      expv[20] = 35'h0e8e0de27;
      expv[21] = 35'h4af19769b;
      expv[22] = 35'h4af19769b;
      expv[23] = 35'h4af19769b;
      expv[24] = 35'h4af19769a;
      expv[25] = 35'h64b09a808;
      expv[26] = 35'h4f0d11890;
      expv[27] = 35'h4863de650;
      expv[28] = 35'h4d2c042ec;
      expv[29] = 35'h478adc078;
      expv[30] = 35'h5a61f2694;
      expv[31] = 35'h749804cb4;
      expv[32] = 35'h7b9924bba;
      expv[33] = 35'h7a4d80ed0;
      expv[34] = 35'h50ebc2c74;
      expv[35] = 35'h54d9a8c3a;
      expv[36] = 35'h5ab67641b;
      expv[37] = 35'h1ab67641b;
      expv[38] = 35'h488083f8f;
      expv[39] = 35'h488083f8f;
      expv[40] = 35'h088083f8f;
      expv[41] = 35'h4493d7576;
      expv[42] = 35'h7ec3a5fcb;
      expv[43] = 35'h3ec3a5fcb;
      expv[44] = 35'h3ec3a5fcb;
      expv[45] = 35'h65bc0015b;
      expv[46] = 35'h65bc0015b;
      expv[47] = 35'h25bc0015b;
      expv[48] = 35'h25bc0015b;
      expv[49] = 35'h25bc0015b;
      expv[50] = 35'h70da9bcaf;
      expv[51] = 35'h30da9bcaf;
      expv[52] = 35'h30da9bcaf;
      expv[53] = 35'h30da9bcaf;
      expv[54] = 35'h30da9bcaf;
      expv[55] = 35'h5ba0c98ff;
      expv[56] = 35'h5ba0c98fe;
      expv[57] = 35'h7aa9dae86;
      expv[58] = 35'h55cf4c6b8;
      expv[59] = 35'h4c8beaf3a;
      expv[60] = 35'h45d34abd4;
      expv[61] = 35'h4d9ca214e;
      expv[62] = 35'h507ddfd94;
      expv[63] = 35'h4e379feb6;
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
