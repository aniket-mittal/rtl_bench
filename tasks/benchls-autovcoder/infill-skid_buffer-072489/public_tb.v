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

  autovcoder_072489 dut (
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
    stim[0] = 11'h79e;
    stim[1] = 11'h448;
    stim[2] = 11'h15e;
    stim[3] = 11'h25e;
    stim[4] = 11'h28c;
    stim[5] = 11'h32a;
    stim[6] = 11'h0d2;
    stim[7] = 11'h265;
    stim[8] = 11'h2a4;
    stim[9] = 11'h3d7;
    stim[10] = 11'h0d4;
    stim[11] = 11'h22f;
    stim[12] = 11'h253;
    stim[13] = 11'h042;
    stim[14] = 11'h7a2;
    stim[15] = 11'h3fe;
    stim[16] = 11'h0e4;
    stim[17] = 11'h3b8;
    stim[18] = 11'h33b;
    stim[19] = 11'h383;
    stim[20] = 11'h1ec;
    stim[21] = 11'h1d7;
    stim[22] = 11'h2ef;
    stim[23] = 11'h242;
    stim[24] = 11'h093;
    stim[25] = 11'h053;
    stim[26] = 11'h29c;
    stim[27] = 11'h3c0;
    stim[28] = 11'h183;
    stim[29] = 11'h3cf;
    stim[30] = 11'h1df;
    stim[31] = 11'h3a0;
    stim[32] = 11'h0b8;
    stim[33] = 11'h192;
    stim[34] = 11'h104;
    stim[35] = 11'h10c;
    stim[36] = 11'h0f9;
    stim[37] = 11'h0a5;
    stim[38] = 11'h053;
    stim[39] = 11'h0cb;
    stim[40] = 11'h159;
    stim[41] = 11'h034;
    stim[42] = 11'h12f;
    stim[43] = 11'h35a;
    stim[44] = 11'h0cc;
    stim[45] = 11'h1f1;
    stim[46] = 11'h130;
    stim[47] = 11'h343;
    stim[48] = 11'h203;
    stim[49] = 11'h262;
    stim[50] = 11'h006;
    stim[51] = 11'h030;
    stim[52] = 11'h426;
    stim[53] = 11'h3a5;
    stim[54] = 11'h2e1;
    stim[55] = 11'h196;
    stim[56] = 11'h3d1;
    stim[57] = 11'h35f;
    stim[58] = 11'h10c;
    stim[59] = 11'h135;
    stim[60] = 11'h1f9;
    stim[61] = 11'h208;
    stim[62] = 11'h17e;
    stim[63] = 11'h315;
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
      expv[3] = 12'hab8;
      expv[4] = 12'hcbd;
      expv[5] = 12'hcbd;
      expv[6] = 12'h4be;
      expv[7] = 12'h4be;
      expv[8] = 12'he55;
      expv[9] = 12'he55;
      expv[10] = 12'hfad;
      expv[11] = 12'hfad;
      expv[12] = 12'hc5d;
      expv[13] = 12'hca5;
      expv[14] = 12'h4a6;
      expv[15] = 12'h4a0;
      expv[16] = 12'hff8;
      expv[17] = 12'hff8;
      expv[18] = 12'hff8;
      expv[19] = 12'he75;
      expv[20] = 12'hf05;
      expv[21] = 12'hf05;
      expv[22] = 12'hbad;
      expv[23] = 12'hddd;
      expv[24] = 12'h5de;
      expv[25] = 12'hc85;
      expv[26] = 12'h8a5;
      expv[27] = 12'h8a5;
      expv[28] = 12'h8a5;
      expv[29] = 12'hb05;
      expv[30] = 12'hf9d;
      expv[31] = 12'hbbd;
      expv[32] = 12'hbbd;
      expv[33] = 12'hbbd;
      expv[34] = 12'h3be;
      expv[35] = 12'h3be;
      expv[36] = 12'h3be;
      expv[37] = 12'hb25;
      expv[38] = 12'hb20;
      expv[39] = 12'h8a5;
      expv[40] = 12'h995;
      expv[41] = 12'h990;
      expv[42] = 12'h990;
      expv[43] = 12'ha5d;
      expv[44] = 12'h25e;
      expv[45] = 12'h25e;
      expv[46] = 12'heb5;
      expv[47] = 12'heb5;
      expv[48] = 12'he85;
      expv[49] = 12'hc05;
      expv[50] = 12'h406;
      expv[51] = 12'h406;
      expv[52] = 12'h406;
      expv[53] = 12'h400;
      expv[54] = 12'hc00;
      expv[55] = 12'hc00;
      expv[56] = 12'hb2d;
      expv[57] = 12'hb28;
      expv[58] = 12'hebd;
      expv[59] = 12'hebd;
      expv[60] = 12'heb8;
      expv[61] = 12'heb8;
      expv[62] = 12'heb8;
      expv[63] = 12'hafd;
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
