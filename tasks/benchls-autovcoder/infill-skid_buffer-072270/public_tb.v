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

  autovcoder_072270 dut (
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
    stim[0] = 11'h60e;
    stim[1] = 11'h7ac;
    stim[2] = 11'h038;
    stim[3] = 11'h05e;
    stim[4] = 11'h390;
    stim[5] = 11'h3fd;
    stim[6] = 11'h1bc;
    stim[7] = 11'h25d;
    stim[8] = 11'h1f1;
    stim[9] = 11'h119;
    stim[10] = 11'h320;
    stim[11] = 11'h07c;
    stim[12] = 11'h1c8;
    stim[13] = 11'h22d;
    stim[14] = 11'h188;
    stim[15] = 11'h1de;
    stim[16] = 11'h015;
    stim[17] = 11'h3db;
    stim[18] = 11'h0ec;
    stim[19] = 11'h2a7;
    stim[20] = 11'h33f;
    stim[21] = 11'h26c;
    stim[22] = 11'h1ca;
    stim[23] = 11'h256;
    stim[24] = 11'h277;
    stim[25] = 11'h167;
    stim[26] = 11'h22c;
    stim[27] = 11'h4e0;
    stim[28] = 11'h166;
    stim[29] = 11'h1df;
    stim[30] = 11'h0fd;
    stim[31] = 11'h247;
    stim[32] = 11'h24d;
    stim[33] = 11'h23a;
    stim[34] = 11'h0bb;
    stim[35] = 11'h2da;
    stim[36] = 11'h09d;
    stim[37] = 11'h329;
    stim[38] = 11'h0dd;
    stim[39] = 11'h33c;
    stim[40] = 11'h056;
    stim[41] = 11'h1a8;
    stim[42] = 11'h084;
    stim[43] = 11'h3fa;
    stim[44] = 11'h392;
    stim[45] = 11'h076;
    stim[46] = 11'h3b4;
    stim[47] = 11'h224;
    stim[48] = 11'h0b5;
    stim[49] = 11'h654;
    stim[50] = 11'h217;
    stim[51] = 11'h13c;
    stim[52] = 11'h194;
    stim[53] = 11'h28a;
    stim[54] = 11'h2d5;
    stim[55] = 11'h243;
    stim[56] = 11'h2fb;
    stim[57] = 11'h1fb;
    stim[58] = 11'h10b;
    stim[59] = 11'h27a;
    stim[60] = 11'h3f3;
    stim[61] = 11'h213;
    stim[62] = 11'h062;
    stim[63] = 11'h1db;
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
      expv[4] = 12'h8bd;
      expv[5] = 12'h8bd;
      expv[6] = 12'h8b8;
      expv[7] = 12'h8b8;
      expv[8] = 12'h8b8;
      expv[9] = 12'h8b8;
      expv[10] = 12'h8b8;
      expv[11] = 12'h8b8;
      expv[12] = 12'h8b8;
      expv[13] = 12'h8b8;
      expv[14] = 12'h8b8;
      expv[15] = 12'h8b8;
      expv[16] = 12'hbbd;
      expv[17] = 12'hbb8;
      expv[18] = 12'hfb5;
      expv[19] = 12'hfb5;
      expv[20] = 12'hd4d;
      expv[21] = 12'he7d;
      expv[22] = 12'he7d;
      expv[23] = 12'h67e;
      expv[24] = 12'h67e;
      expv[25] = 12'hb95;
      expv[26] = 12'hacd;
      expv[27] = 12'hacd;
      expv[28] = 12'h2c8;
      expv[29] = 12'hac8;
      expv[30] = 12'hbbd;
      expv[31] = 12'hbb8;
      expv[32] = 12'hc8d;
      expv[33] = 12'hc88;
      expv[34] = 12'hc75;
      expv[35] = 12'h975;
      expv[36] = 12'h176;
      expv[37] = 12'hdb5;
      expv[38] = 12'hdb0;
      expv[39] = 12'hdb0;
      expv[40] = 12'hdb0;
      expv[41] = 12'h8ad;
      expv[42] = 12'h8ad;
      expv[43] = 12'h8ad;
      expv[44] = 12'h0ae;
      expv[45] = 12'h0ae;
      expv[46] = 12'h0ae;
      expv[47] = 12'h0ae;
      expv[48] = 12'h0ae;
      expv[49] = 12'hff5;
      expv[50] = 12'h7f0;
      expv[51] = 12'hc28;
      expv[52] = 12'hc28;
      expv[53] = 12'hc28;
      expv[54] = 12'hd15;
      expv[55] = 12'hd10;
      expv[56] = 12'hc85;
      expv[57] = 12'hdf5;
      expv[58] = 12'hbf5;
      expv[59] = 12'ha15;
      expv[60] = 12'h216;
      expv[61] = 12'hcf5;
      expv[62] = 12'hc25;
      expv[63] = 12'h426;
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
