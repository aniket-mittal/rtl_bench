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

  autovcoder_072172 dut (
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
    stim[0] = 11'h738;
    stim[1] = 11'h68e;
    stim[2] = 11'h08a;
    stim[3] = 11'h304;
    stim[4] = 11'h25e;
    stim[5] = 11'h2da;
    stim[6] = 11'h1e6;
    stim[7] = 11'h369;
    stim[8] = 11'h3b8;
    stim[9] = 11'h358;
    stim[10] = 11'h0b7;
    stim[11] = 11'h1c6;
    stim[12] = 11'h243;
    stim[13] = 11'h212;
    stim[14] = 11'h184;
    stim[15] = 11'h00b;
    stim[16] = 11'h072;
    stim[17] = 11'h16a;
    stim[18] = 11'h063;
    stim[19] = 11'h2ea;
    stim[20] = 11'h3f4;
    stim[21] = 11'h3f4;
    stim[22] = 11'h033;
    stim[23] = 11'h35e;
    stim[24] = 11'h1fd;
    stim[25] = 11'h192;
    stim[26] = 11'h31f;
    stim[27] = 11'h0e2;
    stim[28] = 11'h09e;
    stim[29] = 11'h329;
    stim[30] = 11'h289;
    stim[31] = 11'h04a;
    stim[32] = 11'h270;
    stim[33] = 11'h1c1;
    stim[34] = 11'h23e;
    stim[35] = 11'h385;
    stim[36] = 11'h157;
    stim[37] = 11'h000;
    stim[38] = 11'h28b;
    stim[39] = 11'h2c8;
    stim[40] = 11'h186;
    stim[41] = 11'h0ec;
    stim[42] = 11'h0f6;
    stim[43] = 11'h371;
    stim[44] = 11'h105;
    stim[45] = 11'h33c;
    stim[46] = 11'h38e;
    stim[47] = 11'h29c;
    stim[48] = 11'h2d4;
    stim[49] = 11'h3a4;
    stim[50] = 11'h1a2;
    stim[51] = 11'h37f;
    stim[52] = 11'h3d5;
    stim[53] = 11'h0d7;
    stim[54] = 11'h339;
    stim[55] = 11'h090;
    stim[56] = 11'h2fc;
    stim[57] = 11'h0f4;
    stim[58] = 11'h3e1;
    stim[59] = 11'h3b0;
    stim[60] = 11'h17d;
    stim[61] = 11'h393;
    stim[62] = 11'h219;
    stim[63] = 11'h041;
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
      expv[2] = 12'h518;
      expv[3] = 12'h910;
      expv[4] = 12'h910;
      expv[5] = 12'hcbd;
      expv[6] = 12'h4be;
      expv[7] = 12'h4be;
      expv[8] = 12'hdb5;
      expv[9] = 12'hdb5;
      expv[10] = 12'hdb5;
      expv[11] = 12'h96d;
      expv[12] = 12'h16e;
      expv[13] = 12'hb8d;
      expv[14] = 12'h38e;
      expv[15] = 12'h38e;
      expv[16] = 12'hc25;
      expv[17] = 12'h426;
      expv[18] = 12'h426;
      expv[19] = 12'h8e5;
      expv[20] = 12'h0e6;
      expv[21] = 12'h0e6;
      expv[22] = 12'h0e6;
      expv[23] = 12'hdd5;
      expv[24] = 12'h5d6;
      expv[25] = 12'hebd;
      expv[26] = 12'h6be;
      expv[27] = 12'hb25;
      expv[28] = 12'h326;
      expv[29] = 12'h326;
      expv[30] = 12'h9c5;
      expv[31] = 12'h9c0;
      expv[32] = 12'h895;
      expv[33] = 12'h895;
      expv[34] = 12'h890;
      expv[35] = 12'hc7d;
      expv[36] = 12'hc78;
      expv[37] = 12'haad;
      expv[38] = 12'haad;
      expv[39] = 12'hd15;
      expv[40] = 12'hd15;
      expv[41] = 12'h516;
      expv[42] = 12'h516;
      expv[43] = 12'h516;
      expv[44] = 12'hb0d;
      expv[45] = 12'hb08;
      expv[46] = 12'hb08;
      expv[47] = 12'hf1d;
      expv[48] = 12'hf1d;
      expv[49] = 12'hf1d;
      expv[50] = 12'hf1d;
      expv[51] = 12'h71e;
      expv[52] = 12'hb45;
      expv[53] = 12'hb40;
      expv[54] = 12'h9ad;
      expv[55] = 12'h9a8;
      expv[56] = 12'h9a8;
      expv[57] = 12'h9a8;
      expv[58] = 12'h9a8;
      expv[59] = 12'h9a8;
      expv[60] = 12'h9a8;
      expv[61] = 12'h9a8;
      expv[62] = 12'hf25;
      expv[63] = 12'hf20;
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
