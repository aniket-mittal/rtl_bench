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

  autovcoder_071749 dut (
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
    stim[0] = 11'h579;
    stim[1] = 11'h646;
    stim[2] = 11'h235;
    stim[3] = 11'h3e5;
    stim[4] = 11'h1ad;
    stim[5] = 11'h17c;
    stim[6] = 11'h005;
    stim[7] = 11'h3a7;
    stim[8] = 11'h345;
    stim[9] = 11'h026;
    stim[10] = 11'h04f;
    stim[11] = 11'h11b;
    stim[12] = 11'h334;
    stim[13] = 11'h099;
    stim[14] = 11'h192;
    stim[15] = 11'h190;
    stim[16] = 11'h19b;
    stim[17] = 11'h375;
    stim[18] = 11'h1fd;
    stim[19] = 11'h3ae;
    stim[20] = 11'h0a3;
    stim[21] = 11'h37d;
    stim[22] = 11'h22f;
    stim[23] = 11'h215;
    stim[24] = 11'h293;
    stim[25] = 11'h0d4;
    stim[26] = 11'h087;
    stim[27] = 11'h366;
    stim[28] = 11'h1ec;
    stim[29] = 11'h080;
    stim[30] = 11'h247;
    stim[31] = 11'h388;
    stim[32] = 11'h212;
    stim[33] = 11'h10b;
    stim[34] = 11'h2d4;
    stim[35] = 11'h08a;
    stim[36] = 11'h212;
    stim[37] = 11'h07d;
    stim[38] = 11'h219;
    stim[39] = 11'h023;
    stim[40] = 11'h2a5;
    stim[41] = 11'h310;
    stim[42] = 11'h1f2;
    stim[43] = 11'h0f7;
    stim[44] = 11'h2c2;
    stim[45] = 11'h203;
    stim[46] = 11'h2f3;
    stim[47] = 11'h2c2;
    stim[48] = 11'h23c;
    stim[49] = 11'h396;
    stim[50] = 11'h2ab;
    stim[51] = 11'h2c7;
    stim[52] = 11'h3c9;
    stim[53] = 11'h002;
    stim[54] = 11'h2ab;
    stim[55] = 11'h0ad;
    stim[56] = 11'h304;
    stim[57] = 11'h747;
    stim[58] = 11'h340;
    stim[59] = 11'h3de;
    stim[60] = 11'h01f;
    stim[61] = 11'h315;
    stim[62] = 11'h078;
    stim[63] = 11'h3b3;
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
      expv[2] = 12'h488;
      expv[3] = 12'hc88;
      expv[4] = 12'hc88;
      expv[5] = 12'hc88;
      expv[6] = 12'hc88;
      expv[7] = 12'hc88;
      expv[8] = 12'hf4d;
      expv[9] = 12'hf48;
      expv[10] = 12'h84d;
      expv[11] = 12'h89d;
      expv[12] = 12'ha35;
      expv[13] = 12'ha35;
      expv[14] = 12'ha30;
      expv[15] = 12'hb25;
      expv[16] = 12'hb25;
      expv[17] = 12'hb35;
      expv[18] = 12'hb30;
      expv[19] = 12'hb30;
      expv[20] = 12'hf5d;
      expv[21] = 12'h945;
      expv[22] = 12'h940;
      expv[23] = 12'hc5d;
      expv[24] = 12'hc58;
      expv[25] = 12'hd25;
      expv[26] = 12'hd25;
      expv[27] = 12'h90d;
      expv[28] = 12'h10e;
      expv[29] = 12'h10e;
      expv[30] = 12'h10e;
      expv[31] = 12'hecd;
      expv[32] = 12'hecd;
      expv[33] = 12'h6ce;
      expv[34] = 12'hc25;
      expv[35] = 12'hc25;
      expv[36] = 12'h426;
      expv[37] = 12'h426;
      expv[38] = 12'h915;
      expv[39] = 12'h910;
      expv[40] = 12'h845;
      expv[41] = 12'h840;
      expv[42] = 12'h840;
      expv[43] = 12'hbe5;
      expv[44] = 12'h9ed;
      expv[45] = 12'h1ee;
      expv[46] = 12'hd85;
      expv[47] = 12'hde5;
      expv[48] = 12'h5e6;
      expv[49] = 12'h5e6;
      expv[50] = 12'h5e6;
      expv[51] = 12'hd85;
      expv[52] = 12'hd8d;
      expv[53] = 12'hd88;
      expv[54] = 12'h805;
      expv[55] = 12'hd55;
      expv[56] = 12'hd50;
      expv[57] = 12'hd50;
      expv[58] = 12'h688;
      expv[59] = 12'he88;
      expv[60] = 12'hfbd;
      expv[61] = 12'h83d;
      expv[62] = 12'h838;
      expv[63] = 12'h838;
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
