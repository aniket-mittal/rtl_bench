// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  icache_tag_ram dut (
    .clk_i(clk),
    .rst_i(in_vec[29:29]),
    .addr_i(in_vec[28:21]),
    .data_i(in_vec[20:1]),
    .wr_i(in_vec[0:0]),
    .data_o(out_vec[19:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h290c2f4b;
    stim[1] = 30'h390a5615;
    stim[2] = 30'h0b67669c;
    stim[3] = 30'h13e74f87;
    stim[4] = 30'h1894055d;
    stim[5] = 30'h1c870da5;
    stim[6] = 30'h041a4ef1;
    stim[7] = 30'h16dfb822;
    stim[8] = 30'h0749dd12;
    stim[9] = 30'h05556edb;
    stim[10] = 30'h0eeff832;
    stim[11] = 30'h1df5ba4a;
    stim[12] = 30'h17769106;
    stim[13] = 30'h0a78a37e;
    stim[14] = 30'h0d7ca014;
    stim[15] = 30'h0b7d7b70;
    stim[16] = 30'h01f23adc;
    stim[17] = 30'h1fa9cd72;
    stim[18] = 30'h194713fb;
    stim[19] = 30'h04835468;
    stim[20] = 30'h05ddbf41;
    stim[21] = 30'h08a5c739;
    stim[22] = 30'h138b267e;
    stim[23] = 30'h1fa76f3e;
    stim[24] = 30'h1b534e54;
    stim[25] = 30'h1ac1c0cb;
    stim[26] = 30'h0161f27b;
    stim[27] = 30'h1a6a8220;
    stim[28] = 30'h15c696fd;
    stim[29] = 30'h19802d1e;
    stim[30] = 30'h1d8c035c;
    stim[31] = 30'h0c31bf4e;
    stim[32] = 30'h03381928;
    stim[33] = 30'h06a60358;
    stim[34] = 30'h0de641ea;
    stim[35] = 30'h061c5deb;
    stim[36] = 30'h2e00f88e;
    stim[37] = 30'h1c5ddafe;
    stim[38] = 30'h0594f4ce;
    stim[39] = 30'h0da1b408;
    stim[40] = 30'h1ba55525;
    stim[41] = 30'h0074ff8a;
    stim[42] = 30'h15257a9d;
    stim[43] = 30'h01480fb6;
    stim[44] = 30'h09cc130d;
    stim[45] = 30'h12e5e3b7;
    stim[46] = 30'h27475079;
    stim[47] = 30'h05c8eb21;
    stim[48] = 30'h120f9b21;
    stim[49] = 30'h1b4e301a;
    stim[50] = 30'h0e89721f;
    stim[51] = 30'h04a8b493;
    stim[52] = 30'h1fc48a2a;
    stim[53] = 30'h1ba26031;
    stim[54] = 30'h0428388e;
    stim[55] = 30'h038c86df;
    stim[56] = 30'h1cd694c5;
    stim[57] = 30'h0b89b0b0;
    stim[58] = 30'h18021a2f;
    stim[59] = 30'h3ad056c9;
    stim[60] = 30'h0c63b9d5;
    stim[61] = 30'h0e02cf57;
    stim[62] = 30'h0b852282;
    stim[63] = 30'h125cb475;
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
      expv[2] = 20'hxxxxx;
      expv[3] = 20'hxxxxx;
      expv[4] = 20'hxxxxx;
      expv[5] = 20'hxxxxx;
      expv[6] = 20'hxxxxx;
      expv[7] = 20'hxxxxx;
      expv[8] = 20'hxxxxx;
      expv[9] = 20'hxxxxx;
      expv[10] = 20'hxxxxx;
      expv[11] = 20'hxxxxx;
      expv[12] = 20'hxxxxx;
      expv[13] = 20'hxxxxx;
      expv[14] = 20'hxxxxx;
      expv[15] = 20'hxxxxx;
      expv[16] = 20'hxxxxx;
      expv[17] = 20'hxxxxx;
      expv[18] = 20'hxxxxx;
      expv[19] = 20'hxxxxx;
      expv[20] = 20'hxxxxx;
      expv[21] = 20'hxxxxx;
      expv[22] = 20'hxxxxx;
      expv[23] = 20'hxxxxx;
      expv[24] = 20'hxxxxx;
      expv[25] = 20'hxxxxx;
      expv[26] = 20'hxxxxx;
      expv[27] = 20'hxxxxx;
      expv[28] = 20'hxxxxx;
      expv[29] = 20'hxxxxx;
      expv[30] = 20'hxxxxx;
      expv[31] = 20'hxxxxx;
      expv[32] = 20'hxxxxx;
      expv[33] = 20'hxxxxx;
      expv[34] = 20'hxxxxx;
      expv[35] = 20'hxxxxx;
      expv[36] = 20'hxxxxx;
      expv[37] = 20'hxxxxx;
      expv[38] = 20'hxxxxx;
      expv[39] = 20'hxxxxx;
      expv[40] = 20'hxxxxx;
      expv[41] = 20'hxxxxx;
      expv[42] = 20'hxxxxx;
      expv[43] = 20'hxxxxx;
      expv[44] = 20'hxxxxx;
      expv[45] = 20'hxxxxx;
      expv[46] = 20'hxxxxx;
      expv[47] = 20'hxxxxx;
      expv[48] = 20'hedfa0;
      expv[49] = 20'hxxxxx;
      expv[50] = 20'hxxxxx;
      expv[51] = 20'hxxxxx;
      expv[52] = 20'hxxxxx;
      expv[53] = 20'hxxxxx;
      expv[54] = 20'h2aa92;
      expv[55] = 20'hxxxxx;
      expv[56] = 20'hxxxxx;
      expv[57] = 20'hxxxxx;
      expv[58] = 20'hxxxxx;
      expv[59] = 20'hxxxxx;
      expv[60] = 20'h0e065;
      expv[61] = 20'hxxxxx;
      expv[62] = 20'hxxxxx;
      expv[63] = 20'hxxxxx;
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
