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

  autovcoder_072537 dut (
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
    stim[0] = 11'h40a;
    stim[1] = 11'h52d;
    stim[2] = 11'h258;
    stim[3] = 11'h15c;
    stim[4] = 11'h1cd;
    stim[5] = 11'h26e;
    stim[6] = 11'h0c4;
    stim[7] = 11'h396;
    stim[8] = 11'h3f2;
    stim[9] = 11'h074;
    stim[10] = 11'h0a1;
    stim[11] = 11'h149;
    stim[12] = 11'h017;
    stim[13] = 11'h244;
    stim[14] = 11'h2b6;
    stim[15] = 11'h018;
    stim[16] = 11'h3bf;
    stim[17] = 11'h145;
    stim[18] = 11'h251;
    stim[19] = 11'h33b;
    stim[20] = 11'h382;
    stim[21] = 11'h001;
    stim[22] = 11'h0ef;
    stim[23] = 11'h0a4;
    stim[24] = 11'h0a2;
    stim[25] = 11'h19f;
    stim[26] = 11'h316;
    stim[27] = 11'h3de;
    stim[28] = 11'h0dd;
    stim[29] = 11'h2c9;
    stim[30] = 11'h317;
    stim[31] = 11'h3e7;
    stim[32] = 11'h3a9;
    stim[33] = 11'h277;
    stim[34] = 11'h135;
    stim[35] = 11'h23e;
    stim[36] = 11'h1cf;
    stim[37] = 11'h39d;
    stim[38] = 11'h241;
    stim[39] = 11'h36f;
    stim[40] = 11'h0f9;
    stim[41] = 11'h2bf;
    stim[42] = 11'h1c1;
    stim[43] = 11'h062;
    stim[44] = 11'h3db;
    stim[45] = 11'h37f;
    stim[46] = 11'h047;
    stim[47] = 11'h200;
    stim[48] = 11'h03f;
    stim[49] = 11'h367;
    stim[50] = 11'h072;
    stim[51] = 11'h066;
    stim[52] = 11'h175;
    stim[53] = 11'h291;
    stim[54] = 11'h11f;
    stim[55] = 11'h1e8;
    stim[56] = 11'h3ac;
    stim[57] = 11'h372;
    stim[58] = 11'h071;
    stim[59] = 11'h266;
    stim[60] = 11'h273;
    stim[61] = 11'h295;
    stim[62] = 11'h236;
    stim[63] = 11'h3fd;
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
      expv[6] = 12'hcdd;
      expv[7] = 12'hcdd;
      expv[8] = 12'h4de;
      expv[9] = 12'h4de;
      expv[10] = 12'h4de;
      expv[11] = 12'hf2d;
      expv[12] = 12'hf28;
      expv[13] = 12'h82d;
      expv[14] = 12'h82d;
      expv[15] = 12'h02e;
      expv[16] = 12'h02e;
      expv[17] = 12'hd6d;
      expv[18] = 12'hd68;
      expv[19] = 12'hd68;
      expv[20] = 12'he75;
      expv[21] = 12'h676;
      expv[22] = 12'hf05;
      expv[23] = 12'h9dd;
      expv[24] = 12'h9dd;
      expv[25] = 12'h1de;
      expv[26] = 12'h945;
      expv[27] = 12'h146;
      expv[28] = 12'h146;
      expv[29] = 12'he2d;
      expv[30] = 12'he28;
      expv[31] = 12'he2d;
      expv[32] = 12'hfcd;
      expv[33] = 12'hfc8;
      expv[34] = 12'hced;
      expv[35] = 12'hce8;
      expv[36] = 12'hc7d;
      expv[37] = 12'hb9d;
      expv[38] = 12'hb98;
      expv[39] = 12'hb98;
      expv[40] = 12'hedd;
      expv[41] = 12'hed8;
      expv[42] = 12'hd7d;
      expv[43] = 12'hd78;
      expv[44] = 12'h8c5;
      expv[45] = 12'hfb5;
      expv[46] = 12'hefd;
      expv[47] = 12'h88d;
      expv[48] = 12'h88d;
      expv[49] = 12'h87d;
      expv[50] = 12'hecd;
      expv[51] = 12'h6ce;
      expv[52] = 12'h6ce;
      expv[53] = 12'h8e5;
      expv[54] = 12'h8e0;
      expv[55] = 12'ha3d;
      expv[56] = 12'ha3d;
      expv[57] = 12'ha3d;
      expv[58] = 12'h23e;
      expv[59] = 12'hee5;
      expv[60] = 12'h6e6;
      expv[61] = 12'hccd;
      expv[62] = 12'hcc8;
      expv[63] = 12'hc6d;
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
