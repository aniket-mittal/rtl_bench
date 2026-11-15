// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 36;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_123662 dut (
    .write_data(in_vec[35:4]),
    .d_address(in_vec[3:2]),
    .store_size(in_vec[1:0]),
    .d_byteena(out_vec[35:32]),
    .d_writedataout(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 36'hc07c0243d;
    stim[1] = 36'hf995860ad;
    stim[2] = 36'hffb3d8647;
    stim[3] = 36'h66ac485dd;
    stim[4] = 36'he82f022a5;
    stim[5] = 36'h9bdb89782;
    stim[6] = 36'h19e61a7de;
    stim[7] = 36'hce95fc1e8;
    stim[8] = 36'h97262f515;
    stim[9] = 36'h88af1577e;
    stim[10] = 36'h1bf86df43;
    stim[11] = 36'hba0eb3940;
    stim[12] = 36'h224b76ebf;
    stim[13] = 36'hc954aa1ee;
    stim[14] = 36'h6081b6c43;
    stim[15] = 36'h92dc1c45e;
    stim[16] = 36'h1fa15a965;
    stim[17] = 36'h1daec2036;
    stim[18] = 36'h8d2bd272d;
    stim[19] = 36'ha206a2db6;
    stim[20] = 36'h6d4f174fd;
    stim[21] = 36'haca28616e;
    stim[22] = 36'h2365e5cbc;
    stim[23] = 36'h8fdbc8dad;
    stim[24] = 36'h641423c35;
    stim[25] = 36'hb97fd67a0;
    stim[26] = 36'ha64d70fbc;
    stim[27] = 36'hf6fc4bc5c;
    stim[28] = 36'h1a4836605;
    stim[29] = 36'h5b21e3035;
    stim[30] = 36'h83dc80bf4;
    stim[31] = 36'h18c8b12e0;
    stim[32] = 36'h85f84b3e0;
    stim[33] = 36'h7f4edd3fc;
    stim[34] = 36'h817553e01;
    stim[35] = 36'hb07849b63;
    stim[36] = 36'heb1c27a27;
    stim[37] = 36'h1fb0a5b50;
    stim[38] = 36'h72054cb76;
    stim[39] = 36'h2b83c4380;
    stim[40] = 36'he3fdc0344;
    stim[41] = 36'hbbe36e160;
    stim[42] = 36'h407662ee4;
    stim[43] = 36'h2d612dfb1;
    stim[44] = 36'h10c22ef04;
    stim[45] = 36'h04306841d;
    stim[46] = 36'h8794c7186;
    stim[47] = 36'h444167b72;
    stim[48] = 36'hd0fc22d7a;
    stim[49] = 36'hc0459f3e3;
    stim[50] = 36'hfdc5d7c98;
    stim[51] = 36'hb8a3ebf1c;
    stim[52] = 36'ha023c69c6;
    stim[53] = 36'h374e5ced8;
    stim[54] = 36'hdaf6f614d;
    stim[55] = 36'h0afac7a55;
    stim[56] = 36'h106a66f53;
    stim[57] = 36'h7a1d24d9f;
    stim[58] = 36'h1408bf82f;
    stim[59] = 36'h458c621ff;
    stim[60] = 36'h610629a5d;
    stim[61] = 36'h775778277;
    stim[62] = 36'h9381089fb;
    stim[63] = 36'h905e4b86b;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 36'h30243c07c;
      expv[1] = 36'h3860af995;
      expv[2] = 36'h4b3d864ff;
      expv[3] = 36'h3485d66ac;
      expv[4] = 36'hce82f022a;
      expv[5] = 36'hf9bdb8978;
      expv[6] = 36'hf19e61a7d;
      expv[7] = 36'hfce95fc1e;
      expv[8] = 36'hc97262f51;
      expv[9] = 36'hf88af1577;
      expv[10] = 36'h81bf86df4;
      expv[11] = 36'hfba0eb394;
      expv[12] = 36'h1eb224b76;
      expv[13] = 36'hfc954aa1e;
      expv[14] = 36'h86081b6c4;
      expv[15] = 36'hf92dc1c45;
      expv[16] = 36'hc1fa15a96;
      expv[17] = 36'hf1daec203;
      expv[18] = 36'h3d2728d2b;
      expv[19] = 36'hfa206a2db;
      expv[20] = 36'h3174f6d4f;
      expv[21] = 36'hfaca28616;
      expv[22] = 36'hf2365e5cb;
      expv[23] = 36'h3c8da8fdb;
      expv[24] = 36'hc641423c3;
      expv[25] = 36'hfb97fd67a;
      expv[26] = 36'hfa64d70fb;
      expv[27] = 36'hff6fc4bc5;
      expv[28] = 36'hc1a483660;
      expv[29] = 36'hc5b21e303;
      expv[30] = 36'hf83dc80bf;
      expv[31] = 36'hf18c8b12e;
      expv[32] = 36'hf85f84b3e;
      expv[33] = 36'hf7f4edd3f;
      expv[34] = 36'hc817553e0;
      expv[35] = 36'h8b07849b6;
      expv[36] = 36'h41c27a2eb;
      expv[37] = 36'hf1fb0a5b5;
      expv[38] = 36'hf72054cb7;
      expv[39] = 36'hf2b83c438;
      expv[40] = 36'hfe3fdc034;
      expv[41] = 36'hfbbe36e16;
      expv[42] = 36'hf407662ee;
      expv[43] = 36'hc2d612dfb;
      expv[44] = 36'hf10c22ef0;
      expv[45] = 36'h368410430;
      expv[46] = 36'hf8794c718;
      expv[47] = 36'hf444167b7;
      expv[48] = 36'hfd0fc22d7;
      expv[49] = 36'h8c0459f3e;
      expv[50] = 36'hffdc5d7c9;
      expv[51] = 36'hfb8a3ebf1;
      expv[52] = 36'hfa023c69c;
      expv[53] = 36'hf374e5ced;
      expv[54] = 36'h3f614daf6;
      expv[55] = 36'hc0afac7a5;
      expv[56] = 36'h8106a66f5;
      expv[57] = 36'h1d97a1d24;
      expv[58] = 36'h1821408bf;
      expv[59] = 36'h11f458c62;
      expv[60] = 36'h329a56106;
      expv[61] = 36'h457782777;
      expv[62] = 36'h2089f9381;
      expv[63] = 36'h24b86905e;
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
