// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_072522 dut (
    .sclk(clk),
    .reset(in_vec[10:10]),
    .s_data(in_vec[9:2]),
    .s_valid(in_vec[1:1]),
    .m_ready(in_vec[0:0]),
    .s_ready(out_vec[11:11]),
    .m_data(out_vec[10:3]),
    .m_valid(out_vec[2:2]),
    .num_data_valid(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h54c;
    stim[1] = 11'h688;
    stim[2] = 11'h1f5;
    stim[3] = 11'h26c;
    stim[4] = 11'h0e4;
    stim[5] = 11'h1f7;
    stim[6] = 11'h22b;
    stim[7] = 11'h396;
    stim[8] = 11'h0a2;
    stim[9] = 11'h350;
    stim[10] = 11'h09f;
    stim[11] = 11'h20d;
    stim[12] = 11'h23a;
    stim[13] = 11'h396;
    stim[14] = 11'h1c2;
    stim[15] = 11'h0a9;
    stim[16] = 11'h138;
    stim[17] = 11'h1a9;
    stim[18] = 11'h3f3;
    stim[19] = 11'h29e;
    stim[20] = 11'h09f;
    stim[21] = 11'h115;
    stim[22] = 11'h3b4;
    stim[23] = 11'h10c;
    stim[24] = 11'h19d;
    stim[25] = 11'h330;
    stim[26] = 11'h0e0;
    stim[27] = 11'h302;
    stim[28] = 11'h033;
    stim[29] = 11'h0f9;
    stim[30] = 11'h1d8;
    stim[31] = 11'h36b;
    stim[32] = 11'h2c5;
    stim[33] = 11'h0ae;
    stim[34] = 11'h247;
    stim[35] = 11'h062;
    stim[36] = 11'h19a;
    stim[37] = 11'h042;
    stim[38] = 11'h3cb;
    stim[39] = 11'h10f;
    stim[40] = 11'h38b;
    stim[41] = 11'h312;
    stim[42] = 11'h326;
    stim[43] = 11'h348;
    stim[44] = 11'h08c;
    stim[45] = 11'h302;
    stim[46] = 11'h271;
    stim[47] = 11'h272;
    stim[48] = 11'h11f;
    stim[49] = 11'h217;
    stim[50] = 11'h1aa;
    stim[51] = 11'h34e;
    stim[52] = 11'h04d;
    stim[53] = 11'h1aa;
    stim[54] = 11'h04e;
    stim[55] = 11'h2a6;
    stim[56] = 11'h2ed;
    stim[57] = 11'h0e6;
    stim[58] = 11'h031;
    stim[59] = 11'h014;
    stim[60] = 11'h07c;
    stim[61] = 11'h25d;
    stim[62] = 11'h188;
    stim[63] = 11'h2e8;
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
      expv[0] = 12'hxxx;
      expv[1] = 12'hxxx;
      expv[2] = 12'hxxx;
      expv[3] = 12'hxxx;
      expv[4] = 12'hxxx;
      expv[5] = 12'hxxx;
      expv[6] = 12'hbed;
      expv[7] = 12'hc55;
      expv[8] = 12'h456;
      expv[9] = 12'h456;
      expv[10] = 12'h456;
      expv[11] = 12'hf2d;
      expv[12] = 12'hf28;
      expv[13] = 12'hc75;
      expv[14] = 12'h476;
      expv[15] = 12'h476;
      expv[16] = 12'hf2d;
      expv[17] = 12'hf2d;
      expv[18] = 12'hf28;
      expv[19] = 12'hfe5;
      expv[20] = 12'h7e6;
      expv[21] = 12'hd3d;
      expv[22] = 12'hd38;
      expv[23] = 12'hd38;
      expv[24] = 12'hd38;
      expv[25] = 12'hd38;
      expv[26] = 12'hd38;
      expv[27] = 12'hd38;
      expv[28] = 12'he05;
      expv[29] = 12'h865;
      expv[30] = 12'h860;
      expv[31] = 12'h860;
      expv[32] = 12'hed5;
      expv[33] = 12'hed0;
      expv[34] = 12'h95d;
      expv[35] = 12'hc8d;
      expv[36] = 12'h48e;
      expv[37] = 12'h48e;
      expv[38] = 12'h48e;
      expv[39] = 12'h8c5;
      expv[40] = 12'ha1d;
      expv[41] = 12'hf15;
      expv[42] = 12'h716;
      expv[43] = 12'h716;
      expv[44] = 12'h716;
      expv[45] = 12'h716;
      expv[46] = 12'h716;
      expv[47] = 12'he25;
      expv[48] = 12'h626;
      expv[49] = 12'hce5;
      expv[50] = 12'hc2d;
      expv[51] = 12'h42e;
      expv[52] = 12'h42e;
      expv[53] = 12'hb55;
      expv[54] = 12'h356;
      expv[55] = 12'h356;
      expv[56] = 12'h356;
      expv[57] = 12'hb55;
      expv[58] = 12'h356;
      expv[59] = 12'h9cd;
      expv[60] = 12'h9cd;
      expv[61] = 12'h9cd;
      expv[62] = 12'h9c8;
      expv[63] = 12'h9c8;
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
