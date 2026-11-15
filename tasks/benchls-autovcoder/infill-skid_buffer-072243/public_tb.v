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

  autovcoder_072243 dut (
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
    stim[0] = 11'h5d7;
    stim[1] = 11'h574;
    stim[2] = 11'h0db;
    stim[3] = 11'h332;
    stim[4] = 11'h224;
    stim[5] = 11'h17c;
    stim[6] = 11'h20a;
    stim[7] = 11'h0b8;
    stim[8] = 11'h008;
    stim[9] = 11'h239;
    stim[10] = 11'h2f3;
    stim[11] = 11'h309;
    stim[12] = 11'h38e;
    stim[13] = 11'h0d4;
    stim[14] = 11'h297;
    stim[15] = 11'h11e;
    stim[16] = 11'h2c9;
    stim[17] = 11'h27f;
    stim[18] = 11'h142;
    stim[19] = 11'h191;
    stim[20] = 11'h3c4;
    stim[21] = 11'h0fa;
    stim[22] = 11'h7de;
    stim[23] = 11'h046;
    stim[24] = 11'h06e;
    stim[25] = 11'h01e;
    stim[26] = 11'h3e8;
    stim[27] = 11'h02a;
    stim[28] = 11'h3ee;
    stim[29] = 11'h0aa;
    stim[30] = 11'h216;
    stim[31] = 11'h1ff;
    stim[32] = 11'h09f;
    stim[33] = 11'h164;
    stim[34] = 11'h34f;
    stim[35] = 11'h115;
    stim[36] = 11'h1f0;
    stim[37] = 11'h0b4;
    stim[38] = 11'h3c3;
    stim[39] = 11'h24f;
    stim[40] = 11'h1f1;
    stim[41] = 11'h0de;
    stim[42] = 11'h1b7;
    stim[43] = 11'h311;
    stim[44] = 11'h072;
    stim[45] = 11'h268;
    stim[46] = 11'h0db;
    stim[47] = 11'h2cf;
    stim[48] = 11'h2e0;
    stim[49] = 11'h28c;
    stim[50] = 11'h248;
    stim[51] = 11'h12b;
    stim[52] = 11'h3ff;
    stim[53] = 11'h3de;
    stim[54] = 11'h356;
    stim[55] = 11'h15e;
    stim[56] = 11'h3ad;
    stim[57] = 11'h0c3;
    stim[58] = 11'h137;
    stim[59] = 11'h17c;
    stim[60] = 11'h147;
    stim[61] = 11'h030;
    stim[62] = 11'h114;
    stim[63] = 11'h303;
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
      expv[3] = 12'h9b0;
      expv[4] = 12'he65;
      expv[5] = 12'he65;
      expv[6] = 12'he65;
      expv[7] = 12'h666;
      expv[8] = 12'h666;
      expv[9] = 12'h666;
      expv[10] = 12'hc15;
      expv[11] = 12'hde5;
      expv[12] = 12'hde0;
      expv[13] = 12'hf1d;
      expv[14] = 12'hf1d;
      expv[15] = 12'hd2d;
      expv[16] = 12'h52e;
      expv[17] = 12'ha3d;
      expv[18] = 12'hcfd;
      expv[19] = 12'h4fe;
      expv[20] = 12'ha85;
      expv[21] = 12'ha85;
      expv[22] = 12'h286;
      expv[23] = 12'h280;
      expv[24] = 12'h888;
      expv[25] = 12'h8dd;
      expv[26] = 12'h0de;
      expv[27] = 12'h0de;
      expv[28] = 12'h0de;
      expv[29] = 12'h0de;
      expv[30] = 12'h0de;
      expv[31] = 12'h0de;
      expv[32] = 12'h83d;
      expv[33] = 12'h93d;
      expv[34] = 12'h93d;
      expv[35] = 12'he9d;
      expv[36] = 12'he98;
      expv[37] = 12'he98;
      expv[38] = 12'he98;
      expv[39] = 12'hf85;
      expv[40] = 12'hc9d;
      expv[41] = 12'hc98;
      expv[42] = 12'h9bd;
      expv[43] = 12'hb6d;
      expv[44] = 12'hb68;
      expv[45] = 12'h8e5;
      expv[46] = 12'h8e5;
      expv[47] = 12'h9b5;
      expv[48] = 12'hd9d;
      expv[49] = 12'hd9d;
      expv[50] = 12'hd9d;
      expv[51] = 12'hd9d;
      expv[52] = 12'ha55;
      expv[53] = 12'hffd;
      expv[54] = 12'h7fe;
      expv[55] = 12'h7fe;
      expv[56] = 12'h7fe;
      expv[57] = 12'hfbd;
      expv[58] = 12'h985;
      expv[59] = 12'ha6d;
      expv[60] = 12'ha6d;
      expv[61] = 12'ha8d;
      expv[62] = 12'ha8d;
      expv[63] = 12'ha8d;
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
