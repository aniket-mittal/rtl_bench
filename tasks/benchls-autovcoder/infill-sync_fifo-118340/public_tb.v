// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_118340 dut (
    .CLK(clk),
    .RST(in_vec[34:34]),
    .enq(in_vec[33:33]),
    .deq(in_vec[32:32]),
    .din(in_vec[31:0]),
    .dot(out_vec[36:5]),
    .emp(out_vec[4:4]),
    .full(out_vec[3:3]),
    .cnt(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h68e0d9964;
    stim[1] = 35'h4dcb7eafd;
    stim[2] = 35'h2948f6282;
    stim[3] = 35'h0cac8cc2f;
    stim[4] = 35'h2aee28da3;
    stim[5] = 35'h2e8a443a4;
    stim[6] = 35'h36bf3dcfe;
    stim[7] = 35'h17453f2e1;
    stim[8] = 35'h0810311f1;
    stim[9] = 35'h2014a61af;
    stim[10] = 35'h3af13b7d6;
    stim[11] = 35'h08e725c87;
    stim[12] = 35'h37f53cd96;
    stim[13] = 35'h36e082108;
    stim[14] = 35'h200d92192;
    stim[15] = 35'h2e6f85a35;
    stim[16] = 35'h11f871f18;
    stim[17] = 35'h0783b20ef;
    stim[18] = 35'h624889563;
    stim[19] = 35'h0085525fc;
    stim[20] = 35'h206a856fe;
    stim[21] = 35'h12b78548a;
    stim[22] = 35'h224b30fba;
    stim[23] = 35'h36aec8e03;
    stim[24] = 35'h14118a087;
    stim[25] = 35'h06f520427;
    stim[26] = 35'h2a9e8d5fc;
    stim[27] = 35'h1499f5f8a;
    stim[28] = 35'h35c613f7e;
    stim[29] = 35'h3eff37d5e;
    stim[30] = 35'h335c47229;
    stim[31] = 35'h108b021bb;
    stim[32] = 35'h0f0e75a6a;
    stim[33] = 35'h39e4fb0de;
    stim[34] = 35'h17c3089ee;
    stim[35] = 35'h3d3c74363;
    stim[36] = 35'h2ad2c94a4;
    stim[37] = 35'h0d3f67a8e;
    stim[38] = 35'h303a011fc;
    stim[39] = 35'h002cd9efb;
    stim[40] = 35'h15a56cbb9;
    stim[41] = 35'h26cbf1e35;
    stim[42] = 35'h2eb9f7aef;
    stim[43] = 35'h08aa939b4;
    stim[44] = 35'h3f5c51283;
    stim[45] = 35'h2df87ac11;
    stim[46] = 35'h099149898;
    stim[47] = 35'h3678ed63d;
    stim[48] = 35'h0f0543c87;
    stim[49] = 35'h1c785b05d;
    stim[50] = 35'h053da4547;
    stim[51] = 35'h1eb5eae94;
    stim[52] = 35'h2d4fef926;
    stim[53] = 35'h0e4523699;
    stim[54] = 35'h26755cc6b;
    stim[55] = 35'h32ffa9f56;
    stim[56] = 35'h7ec06d43d;
    stim[57] = 35'h3263e74b5;
    stim[58] = 35'h2f1110f3d;
    stim[59] = 35'h1b6260154;
    stim[60] = 35'h14eb923a0;
    stim[61] = 35'h2687da5d8;
    stim[62] = 35'h3c0111663;
    stim[63] = 35'h125467553;
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
      expv[0] = 37'hxxxxxxxxxx;
      expv[1] = 37'hxxxxxxxxx0;
      expv[2] = 37'hxxxxxxxxx0;
      expv[3] = 37'h1291ec5041;
      expv[4] = 37'h1291ec5041;
      expv[5] = 37'h1291ec5042;
      expv[6] = 37'h1291ec5043;
      expv[7] = 37'h15dc51b463;
      expv[8] = 37'h1d14887482;
      expv[9] = 37'h1d14887482;
      expv[10] = 37'h1d14887483;
      expv[11] = 37'h0d7e7b9fc3;
      expv[12] = 37'h0d7e7b9fc3;
      expv[13] = 37'h00294c35e3;
      expv[14] = 37'h15e276fac3;
      expv[15] = 37'h15e276facc;
      expv[16] = 37'h1cdf0b46a5;
      expv[17] = 37'h0fea79b2cc;
      expv[18] = 37'h0fea79b2cc;
      expv[19] = 37'h001b243250;
      expv[20] = 37'h001b243250;
      expv[21] = 37'h00d50adfc1;
      expv[22] = 37'h1cdf0b46b0;
      expv[23] = 37'h049661f741;
      expv[24] = 37'h0d5d91c061;
      expv[25] = 37'h0dc1042110;
      expv[26] = 37'h0dc1042110;
      expv[27] = 37'h153d1abf81;
      expv[28] = 37'h00d50adfd0;
      expv[29] = 37'h049661f750;
      expv[30] = 37'h0d5d91c070;
      expv[31] = 37'h153d1abf90;
      expv[32] = 37'h0b8c27efc7;
      expv[33] = 37'h0b8c27efc7;
      expv[34] = 37'h1dfe6fabc7;
      expv[35] = 37'h06b88e4526;
      expv[36] = 37'h13c9f61bc6;
      expv[37] = 37'h13c9f61bc7;
      expv[38] = 37'h13c9f61bc7;
      expv[39] = 37'h1a78e86c67;
      expv[40] = 37'h1a78e86c67;
      expv[41] = 37'h15a5929486;
      expv[42] = 37'h15a5929487;
      expv[43] = 37'h15a5929490;
      expv[44] = 37'h15a5929490;
      expv[45] = 37'h0074023f90;
      expv[46] = 37'h1bf0f58221;
      expv[47] = 37'h1bf0f58221;
      expv[48] = 37'h0cf1dac7a1;
      expv[49] = 37'h0cf1dac7a1;
      expv[50] = 37'h1d73ef5df0;
      expv[51] = 37'h1d73ef5df0;
      expv[52] = 37'h1eb8a25067;
      expv[53] = 37'h1eb8a25070;
      expv[54] = 37'h1eb8a25070;
      expv[55] = 37'h0ceab98d61;
      expv[56] = 37'h05ff53eac1;
      expv[57] = 37'h1a9fdf24d0;
      expv[58] = 37'h0ceab98d70;
      expv[59] = 37'h1e2221e7a1;
      expv[60] = 37'h05ff53ead0;
      expv[61] = 37'h0cf1dac7a7;
      expv[62] = 37'h0cf1dac7b0;
      expv[63] = 37'h04c7ce96b0;
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
