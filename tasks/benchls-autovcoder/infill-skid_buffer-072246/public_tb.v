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

  autovcoder_072246 dut (
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
    stim[0] = 11'h502;
    stim[1] = 11'h5d3;
    stim[2] = 11'h056;
    stim[3] = 11'h082;
    stim[4] = 11'h049;
    stim[5] = 11'h290;
    stim[6] = 11'h2b7;
    stim[7] = 11'h1a5;
    stim[8] = 11'h1f1;
    stim[9] = 11'h092;
    stim[10] = 11'h35c;
    stim[11] = 11'h0a4;
    stim[12] = 11'h341;
    stim[13] = 11'h144;
    stim[14] = 11'h1eb;
    stim[15] = 11'h2f4;
    stim[16] = 11'h278;
    stim[17] = 11'h009;
    stim[18] = 11'h13f;
    stim[19] = 11'h19d;
    stim[20] = 11'h032;
    stim[21] = 11'h241;
    stim[22] = 11'h2a7;
    stim[23] = 11'h1f3;
    stim[24] = 11'h0d1;
    stim[25] = 11'h06d;
    stim[26] = 11'h0d1;
    stim[27] = 11'h2bd;
    stim[28] = 11'h081;
    stim[29] = 11'h1dd;
    stim[30] = 11'h156;
    stim[31] = 11'h0c9;
    stim[32] = 11'h255;
    stim[33] = 11'h0d2;
    stim[34] = 11'h389;
    stim[35] = 11'h0b5;
    stim[36] = 11'h2a7;
    stim[37] = 11'h4d4;
    stim[38] = 11'h12a;
    stim[39] = 11'h3af;
    stim[40] = 11'h257;
    stim[41] = 11'h376;
    stim[42] = 11'h01b;
    stim[43] = 11'h3d6;
    stim[44] = 11'h334;
    stim[45] = 11'h2f2;
    stim[46] = 11'h32f;
    stim[47] = 11'h07e;
    stim[48] = 11'h0ea;
    stim[49] = 11'h3b7;
    stim[50] = 11'h03c;
    stim[51] = 11'h36f;
    stim[52] = 11'h1f1;
    stim[53] = 11'h32b;
    stim[54] = 11'h093;
    stim[55] = 11'h75c;
    stim[56] = 11'h370;
    stim[57] = 11'h2f2;
    stim[58] = 11'h22b;
    stim[59] = 11'h292;
    stim[60] = 11'h228;
    stim[61] = 11'h048;
    stim[62] = 11'h08b;
    stim[63] = 11'h1bc;
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
      expv[2] = 12'h3a0;
      expv[3] = 12'h8a8;
      expv[4] = 12'h905;
      expv[5] = 12'h900;
      expv[6] = 12'h900;
      expv[7] = 12'hd6d;
      expv[8] = 12'hd68;
      expv[9] = 12'hd68;
      expv[10] = 12'h925;
      expv[11] = 12'h925;
      expv[12] = 12'h925;
      expv[13] = 12'h920;
      expv[14] = 12'h920;
      expv[15] = 12'hbd5;
      expv[16] = 12'hbd5;
      expv[17] = 12'hbd5;
      expv[18] = 12'hbd0;
      expv[19] = 12'ha7d;
      expv[20] = 12'ha78;
      expv[21] = 12'h865;
      expv[22] = 12'h860;
      expv[23] = 12'hd4d;
      expv[24] = 12'hbe5;
      expv[25] = 12'hbe0;
      expv[26] = 12'hbe0;
      expv[27] = 12'hbe0;
      expv[28] = 12'hbe0;
      expv[29] = 12'hbe0;
      expv[30] = 12'hbe0;
      expv[31] = 12'haad;
      expv[32] = 12'haa8;
      expv[33] = 12'haa8;
      expv[34] = 12'h9a5;
      expv[35] = 12'h9a0;
      expv[36] = 12'h9a0;
      expv[37] = 12'hd4d;
      expv[38] = 12'h548;
      expv[39] = 12'ha50;
      expv[40] = 12'hf5d;
      expv[41] = 12'hcad;
      expv[42] = 12'h4ae;
      expv[43] = 12'heed;
      expv[44] = 12'h6ee;
      expv[45] = 12'h6ee;
      expv[46] = 12'h6ee;
      expv[47] = 12'hfad;
      expv[48] = 12'h7ae;
      expv[49] = 12'h7ae;
      expv[50] = 12'h8fd;
      expv[51] = 12'h8fd;
      expv[52] = 12'hedd;
      expv[53] = 12'hed8;
      expv[54] = 12'he55;
      expv[55] = 12'h925;
      expv[56] = 12'h120;
      expv[57] = 12'h920;
      expv[58] = 12'hde5;
      expv[59] = 12'hc55;
      expv[60] = 12'h456;
      expv[61] = 12'h456;
      expv[62] = 12'h456;
      expv[63] = 12'hd25;
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
