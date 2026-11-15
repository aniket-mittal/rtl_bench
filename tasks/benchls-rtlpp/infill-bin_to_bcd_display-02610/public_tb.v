// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02610 dut (
    .clk(clk),
    .dclk(in_vec[20:20]),
    .rst(in_vec[19:19]),
    .display_sel(in_vec[18:18]),
    .sel(in_vec[17:16]),
    .data(in_vec[15:0]),
    .D1(out_vec[15:12]),
    .D2(out_vec[11:8]),
    .D3(out_vec[7:4]),
    .D4(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h0c5f0f;
    stim[1] = 21'h1d5e6f;
    stim[2] = 21'h0663d1;
    stim[3] = 21'h14eb87;
    stim[4] = 21'h04a6aa;
    stim[5] = 21'h170021;
    stim[6] = 21'h061ca2;
    stim[7] = 21'h064eb5;
    stim[8] = 21'h173ce4;
    stim[9] = 21'h1205c4;
    stim[10] = 21'h020e0c;
    stim[11] = 21'h1539ed;
    stim[12] = 21'h16cbbe;
    stim[13] = 21'h0502d8;
    stim[14] = 21'h01a47d;
    stim[15] = 21'h009040;
    stim[16] = 21'h02c74f;
    stim[17] = 21'h15d094;
    stim[18] = 21'h019ab9;
    stim[19] = 21'h0285dc;
    stim[20] = 21'h1552d3;
    stim[21] = 21'h121eb4;
    stim[22] = 21'h02f89a;
    stim[23] = 21'h15a1ad;
    stim[24] = 21'h016d06;
    stim[25] = 21'h1381c1;
    stim[26] = 21'h142c92;
    stim[27] = 21'h147986;
    stim[28] = 21'h140b78;
    stim[29] = 21'h0443db;
    stim[30] = 21'h0399d9;
    stim[31] = 21'h05e49d;
    stim[32] = 21'h057f53;
    stim[33] = 21'h117bd6;
    stim[34] = 21'h16588a;
    stim[35] = 21'h1233dc;
    stim[36] = 21'h1184dc;
    stim[37] = 21'h16d594;
    stim[38] = 21'h0538fd;
    stim[39] = 21'h060f0f;
    stim[40] = 21'h06fee0;
    stim[41] = 21'h04f18d;
    stim[42] = 21'h06b9e2;
    stim[43] = 21'h10ac5d;
    stim[44] = 21'h17bdf6;
    stim[45] = 21'h07dfb3;
    stim[46] = 21'h15f61a;
    stim[47] = 21'h1be1bb;
    stim[48] = 21'h03e453;
    stim[49] = 21'h15fdef;
    stim[50] = 21'h06630b;
    stim[51] = 21'h1547cc;
    stim[52] = 21'h07bb88;
    stim[53] = 21'h1ed2f0;
    stim[54] = 21'h15462d;
    stim[55] = 21'h136317;
    stim[56] = 21'h04f1c7;
    stim[57] = 21'h06a7a0;
    stim[58] = 21'h117168;
    stim[59] = 21'h00c25e;
    stim[60] = 21'h0792db;
    stim[61] = 21'h040948;
    stim[62] = 21'h04fd46;
    stim[63] = 21'h042b6e;
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
      expv[0] = 16'ha000;
      expv[1] = 16'ha000;
      expv[2] = 16'ha000;
      expv[3] = 16'ha000;
      expv[4] = 16'ha000;
      expv[5] = 16'ha00b;
      expv[6] = 16'ha000;
      expv[7] = 16'ha000;
      expv[8] = 16'ha00b;
      expv[9] = 16'h005c;
      expv[10] = 16'h00e0;
      expv[11] = 16'ha000;
      expv[12] = 16'ha000;
      expv[13] = 16'ha000;
      expv[14] = 16'h0a47;
      expv[15] = 16'h0904;
      expv[16] = 16'h0c74;
      expv[17] = 16'hf002;
      expv[18] = 16'h09ab;
      expv[19] = 16'h085d;
      expv[20] = 16'ha01b;
      expv[21] = 16'h01eb;
      expv[22] = 16'h0f89;
      expv[23] = 16'hf0a2;
      expv[24] = 16'h06d0;
      expv[25] = 16'h081c;
      expv[26] = 16'ha61b;
      expv[27] = 16'ha93e;
      expv[28] = 16'hac71;
      expv[29] = 16'hafa2;
      expv[30] = 16'h099d;
      expv[31] = 16'hf508;
      expv[32] = 16'ha81b;
      expv[33] = 16'h07bd;
      expv[34] = 16'hae71;
      expv[35] = 16'h033d;
      expv[36] = 16'h084d;
      expv[37] = 16'hf708;
      expv[38] = 16'haa1b;
      expv[39] = 16'had3e;
      expv[40] = 16'hf071;
      expv[41] = 16'hf0a2;
      expv[42] = 16'hf1d4;
      expv[43] = 16'h0ac5;
      expv[44] = 16'hf1bb;
      expv[45] = 16'hf3eb;
      expv[46] = 16'hfc71;
      expv[47] = 16'h0e1b;
      expv[48] = 16'h0e45;
      expv[49] = 16'ha000;
      expv[50] = 16'ha000;
      expv[51] = 16'ha000;
      expv[52] = 16'hf00b;
      expv[53] = 16'ha000;
      expv[54] = 16'ha000;
      expv[55] = 16'h0631;
      expv[56] = 16'ha000;
      expv[57] = 16'ha000;
      expv[58] = 16'h0716;
      expv[59] = 16'h0c25;
      expv[60] = 16'hf00b;
      expv[61] = 16'ha000;
      expv[62] = 16'ha000;
      expv[63] = 16'ha000;
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
