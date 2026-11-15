// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 41;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02178 dut (
    .clk(clk),
    .rst(in_vec[40:40]),
    .x_input(in_vec[39:20]),
    .y_input(in_vec[19:0]),
    .z_res(out_vec[19:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 41'h1975455af78;
    stim[1] = 41'h13f9ac5a4f7;
    stim[2] = 41'h04adc6a4f94;
    stim[3] = 41'h1526b2885e5;
    stim[4] = 41'h0901c9c2cb9;
    stim[5] = 41'h0583dcaa00d;
    stim[6] = 41'h0d962f3a6c3;
    stim[7] = 41'h07c4c567ff3;
    stim[8] = 41'h0fed6a92fe4;
    stim[9] = 41'h0b5aea23c5e;
    stim[10] = 41'h0b62b7855c8;
    stim[11] = 41'h0236e64faf7;
    stim[12] = 41'h0584b805e42;
    stim[13] = 41'h0f391c550c0;
    stim[14] = 41'h063dbb523a8;
    stim[15] = 41'h08f0e431b3e;
    stim[16] = 41'h06cb9cd68f3;
    stim[17] = 41'h0f7fdb069fb;
    stim[18] = 41'h06b2ee743e7;
    stim[19] = 41'h0ad93dbc45e;
    stim[20] = 41'h00bf89ae084;
    stim[21] = 41'h0051bc707a2;
    stim[22] = 41'h0d9441afb01;
    stim[23] = 41'h0dd870ea28d;
    stim[24] = 41'h060ad337e5e;
    stim[25] = 41'h0b911d4dd5b;
    stim[26] = 41'h0fa165760a0;
    stim[27] = 41'h04eb2eb52a6;
    stim[28] = 41'h0b61592d537;
    stim[29] = 41'h02e4df56dd6;
    stim[30] = 41'h0f5eb4cc016;
    stim[31] = 41'h07593e6054f;
    stim[32] = 41'h054b8fe4581;
    stim[33] = 41'h016feabb237;
    stim[34] = 41'h044fa927068;
    stim[35] = 41'h073dcf73468;
    stim[36] = 41'h0f1b0036e63;
    stim[37] = 41'h0edc17b1524;
    stim[38] = 41'h0146428bfc5;
    stim[39] = 41'h0c5033bff20;
    stim[40] = 41'h015940111c4;
    stim[41] = 41'h009b069bd1a;
    stim[42] = 41'h0b2bd4955b6;
    stim[43] = 41'h00c33b1323d;
    stim[44] = 41'h0763bf71843;
    stim[45] = 41'h017b90afe01;
    stim[46] = 41'h0cde8995d9d;
    stim[47] = 41'h0d139985e74;
    stim[48] = 41'h05ca35df3a8;
    stim[49] = 41'h01c7691e9ff;
    stim[50] = 41'h075ef3d866c;
    stim[51] = 41'h05f794b81cc;
    stim[52] = 41'h03251bd404f;
    stim[53] = 41'h09cc752a2e2;
    stim[54] = 41'h0d1e11b13bb;
    stim[55] = 41'h073ee007bca;
    stim[56] = 41'h0ca9a079110;
    stim[57] = 41'h0494397ee9d;
    stim[58] = 41'h0006e433ccc;
    stim[59] = 41'h040090e05cc;
    stim[60] = 41'h09f3585a7dc;
    stim[61] = 41'h0ea92e1adbf;
    stim[62] = 41'h06a9caad93b;
    stim[63] = 41'h0f51c2fa32b;
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
      expv[0] = 20'hxxxxx;
      expv[1] = 20'hxxxxx;
      expv[2] = 20'hffc86;
      expv[3] = 20'h00000;
      expv[4] = 20'h007fe;
      expv[5] = 20'h00000;
      expv[6] = 20'h00000;
      expv[7] = 20'h00000;
      expv[8] = 20'h00000;
      expv[9] = 20'h00000;
      expv[10] = 20'h00000;
      expv[11] = 20'h00000;
      expv[12] = 20'h00000;
      expv[13] = 20'h00000;
      expv[14] = 20'h00000;
      expv[15] = 20'h00000;
      expv[16] = 20'h00000;
      expv[17] = 20'h00000;
      expv[18] = 20'h00000;
      expv[19] = 20'h00000;
      expv[20] = 20'h00000;
      expv[21] = 20'h00000;
      expv[22] = 20'h00000;
      expv[23] = 20'h00000;
      expv[24] = 20'h00000;
      expv[25] = 20'h00000;
      expv[26] = 20'h00000;
      expv[27] = 20'h00000;
      expv[28] = 20'h00000;
      expv[29] = 20'h00000;
      expv[30] = 20'h00000;
      expv[31] = 20'h00000;
      expv[32] = 20'h00000;
      expv[33] = 20'h00000;
      expv[34] = 20'h00000;
      expv[35] = 20'h00000;
      expv[36] = 20'h00000;
      expv[37] = 20'h00000;
      expv[38] = 20'h00000;
      expv[39] = 20'h00000;
      expv[40] = 20'h00000;
      expv[41] = 20'h00000;
      expv[42] = 20'h00000;
      expv[43] = 20'h00000;
      expv[44] = 20'h00000;
      expv[45] = 20'h00000;
      expv[46] = 20'h00000;
      expv[47] = 20'h00000;
      expv[48] = 20'h00000;
      expv[49] = 20'h00000;
      expv[50] = 20'h00000;
      expv[51] = 20'h00000;
      expv[52] = 20'h00000;
      expv[53] = 20'h00000;
      expv[54] = 20'h00000;
      expv[55] = 20'h00000;
      expv[56] = 20'h00000;
      expv[57] = 20'h00000;
      expv[58] = 20'h00000;
      expv[59] = 20'h00000;
      expv[60] = 20'h00000;
      expv[61] = 20'h00000;
      expv[62] = 20'h00000;
      expv[63] = 20'h00000;
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
