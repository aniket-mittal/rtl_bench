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

  autovcoder_072477 dut (
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
    stim[0] = 11'h755;
    stim[1] = 11'h6fa;
    stim[2] = 11'h0eb;
    stim[3] = 11'h297;
    stim[4] = 11'h3e9;
    stim[5] = 11'h034;
    stim[6] = 11'h21f;
    stim[7] = 11'h1d7;
    stim[8] = 11'h211;
    stim[9] = 11'h2cf;
    stim[10] = 11'h364;
    stim[11] = 11'h148;
    stim[12] = 11'h031;
    stim[13] = 11'h17b;
    stim[14] = 11'h158;
    stim[15] = 11'h17c;
    stim[16] = 11'h2da;
    stim[17] = 11'h14a;
    stim[18] = 11'h1f1;
    stim[19] = 11'h18c;
    stim[20] = 11'h31e;
    stim[21] = 11'h31b;
    stim[22] = 11'h09b;
    stim[23] = 11'h083;
    stim[24] = 11'h076;
    stim[25] = 11'h27a;
    stim[26] = 11'h2a3;
    stim[27] = 11'h393;
    stim[28] = 11'h0d4;
    stim[29] = 11'h30c;
    stim[30] = 11'h0b2;
    stim[31] = 11'h3a1;
    stim[32] = 11'h3bb;
    stim[33] = 11'h05e;
    stim[34] = 11'h3ce;
    stim[35] = 11'h236;
    stim[36] = 11'h1fb;
    stim[37] = 11'h297;
    stim[38] = 11'h121;
    stim[39] = 11'h37a;
    stim[40] = 11'h22b;
    stim[41] = 11'h002;
    stim[42] = 11'h08a;
    stim[43] = 11'h1ae;
    stim[44] = 11'h027;
    stim[45] = 11'h33d;
    stim[46] = 11'h0f8;
    stim[47] = 11'h0f8;
    stim[48] = 11'h3ff;
    stim[49] = 11'h3de;
    stim[50] = 11'h1da;
    stim[51] = 11'h27b;
    stim[52] = 11'h199;
    stim[53] = 11'h2a5;
    stim[54] = 11'h377;
    stim[55] = 11'h328;
    stim[56] = 11'h3a7;
    stim[57] = 11'h31a;
    stim[58] = 11'h12e;
    stim[59] = 11'h0b1;
    stim[60] = 11'h358;
    stim[61] = 11'h1a6;
    stim[62] = 11'h1ad;
    stim[63] = 11'h012;
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
      expv[2] = 12'h5f0;
      expv[3] = 12'h9d0;
      expv[4] = 12'hd2d;
      expv[5] = 12'hd28;
      expv[6] = 12'hd28;
      expv[7] = 12'hc3d;
      expv[8] = 12'hbad;
      expv[9] = 12'hba8;
      expv[10] = 12'hd9d;
      expv[11] = 12'hd9d;
      expv[12] = 12'hd9d;
      expv[13] = 12'hd98;
      expv[14] = 12'haf5;
      expv[15] = 12'haf5;
      expv[16] = 12'haf5;
      expv[17] = 12'h2f6;
      expv[18] = 12'h2f6;
      expv[19] = 12'hdb5;
      expv[20] = 12'hdb5;
      expv[21] = 12'h5b6;
      expv[22] = 12'he3d;
      expv[23] = 12'h935;
      expv[24] = 12'h905;
      expv[25] = 12'h106;
      expv[26] = 12'h106;
      expv[27] = 12'h8ed;
      expv[28] = 12'hf25;
      expv[29] = 12'hf25;
      expv[30] = 12'hf25;
      expv[31] = 12'h726;
      expv[32] = 12'h965;
      expv[33] = 12'hf75;
      expv[34] = 12'h776;
      expv[35] = 12'h776;
      expv[36] = 12'h776;
      expv[37] = 12'h8bd;
      expv[38] = 12'hd2d;
      expv[39] = 12'hd28;
      expv[40] = 12'hef5;
      expv[41] = 12'hc55;
      expv[42] = 12'h456;
      expv[43] = 12'h456;
      expv[44] = 12'h456;
      expv[45] = 12'h805;
      expv[46] = 12'h800;
      expv[47] = 12'h800;
      expv[48] = 12'h800;
      expv[49] = 12'hffd;
      expv[50] = 12'h7fe;
      expv[51] = 12'h7fe;
      expv[52] = 12'hfbd;
      expv[53] = 12'hfb8;
      expv[54] = 12'hfb8;
      expv[55] = 12'heed;
      expv[56] = 12'heed;
      expv[57] = 12'hf4d;
      expv[58] = 12'h74e;
      expv[59] = 12'h74e;
      expv[60] = 12'he35;
      expv[61] = 12'he35;
      expv[62] = 12'h636;
      expv[63] = 12'hb4d;
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
