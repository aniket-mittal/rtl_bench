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

  autovcoder_072169 dut (
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
    stim[0] = 11'h4b6;
    stim[1] = 11'h7fb;
    stim[2] = 11'h0ce;
    stim[3] = 11'h2a6;
    stim[4] = 11'h1be;
    stim[5] = 11'h120;
    stim[6] = 11'h0e8;
    stim[7] = 11'h341;
    stim[8] = 11'h2f6;
    stim[9] = 11'h341;
    stim[10] = 11'h102;
    stim[11] = 11'h3ab;
    stim[12] = 11'h267;
    stim[13] = 11'h212;
    stim[14] = 11'h011;
    stim[15] = 11'h17f;
    stim[16] = 11'h10c;
    stim[17] = 11'h024;
    stim[18] = 11'h039;
    stim[19] = 11'h162;
    stim[20] = 11'h2ee;
    stim[21] = 11'h1e3;
    stim[22] = 11'h308;
    stim[23] = 11'h0bd;
    stim[24] = 11'h017;
    stim[25] = 11'h42c;
    stim[26] = 11'h323;
    stim[27] = 11'h143;
    stim[28] = 11'h2c8;
    stim[29] = 11'h011;
    stim[30] = 11'h1b4;
    stim[31] = 11'h336;
    stim[32] = 11'h3c0;
    stim[33] = 11'h39f;
    stim[34] = 11'h38c;
    stim[35] = 11'h34b;
    stim[36] = 11'h241;
    stim[37] = 11'h056;
    stim[38] = 11'h107;
    stim[39] = 11'h1e4;
    stim[40] = 11'h2e4;
    stim[41] = 11'h2c5;
    stim[42] = 11'h25e;
    stim[43] = 11'h3ba;
    stim[44] = 11'h05a;
    stim[45] = 11'h012;
    stim[46] = 11'h267;
    stim[47] = 11'h3db;
    stim[48] = 11'h138;
    stim[49] = 11'h033;
    stim[50] = 11'h086;
    stim[51] = 11'h336;
    stim[52] = 11'h39f;
    stim[53] = 11'h529;
    stim[54] = 11'h259;
    stim[55] = 11'h1f3;
    stim[56] = 11'h33e;
    stim[57] = 11'h04d;
    stim[58] = 11'h2fa;
    stim[59] = 11'h3e8;
    stim[60] = 11'h1a8;
    stim[61] = 11'h28a;
    stim[62] = 11'h05c;
    stim[63] = 11'h215;
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
      expv[2] = 12'h7f0;
      expv[3] = 12'h998;
      expv[4] = 12'hd4d;
      expv[5] = 12'h54e;
      expv[6] = 12'h54e;
      expv[7] = 12'h54e;
      expv[8] = 12'hb7d;
      expv[9] = 12'h37e;
      expv[10] = 12'hded;
      expv[11] = 12'h5ee;
      expv[12] = 12'ha05;
      expv[13] = 12'hccd;
      expv[14] = 12'h4ce;
      expv[15] = 12'hc25;
      expv[16] = 12'hafd;
      expv[17] = 12'hafd;
      expv[18] = 12'hafd;
      expv[19] = 12'haf8;
      expv[20] = 12'hac5;
      expv[21] = 12'h2c6;
      expv[22] = 12'hddd;
      expv[23] = 12'hddd;
      expv[24] = 12'hdd8;
      expv[25] = 12'h82d;
      expv[26] = 12'h028;
      expv[27] = 12'he40;
      expv[28] = 12'ha85;
      expv[29] = 12'ha85;
      expv[30] = 12'ha80;
      expv[31] = 12'ha80;
      expv[32] = 12'he6d;
      expv[33] = 12'he6d;
      expv[34] = 12'hf3d;
      expv[35] = 12'hf3d;
      expv[36] = 12'he95;
      expv[37] = 12'he90;
      expv[38] = 12'h8ad;
      expv[39] = 12'ha0d;
      expv[40] = 12'ha0d;
      expv[41] = 12'ha0d;
      expv[42] = 12'ha08;
      expv[43] = 12'hcbd;
      expv[44] = 12'h4be;
      expv[45] = 12'h4be;
      expv[46] = 12'h4be;
      expv[47] = 12'hf75;
      expv[48] = 12'hfb5;
      expv[49] = 12'hfb5;
      expv[50] = 12'h865;
      expv[51] = 12'h066;
      expv[52] = 12'h066;
      expv[53] = 12'h90d;
      expv[54] = 12'h108;
      expv[55] = 12'h908;
      expv[56] = 12'hbe5;
      expv[57] = 12'h3e6;
      expv[58] = 12'he7d;
      expv[59] = 12'h67e;
      expv[60] = 12'h67e;
      expv[61] = 12'h67e;
      expv[62] = 12'h67e;
      expv[63] = 12'h67e;
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
