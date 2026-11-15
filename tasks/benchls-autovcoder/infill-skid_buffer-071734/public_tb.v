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

  autovcoder_071734 dut (
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
    stim[0] = 11'h646;
    stim[1] = 11'h7d1;
    stim[2] = 11'h0f1;
    stim[3] = 11'h23d;
    stim[4] = 11'h1cd;
    stim[5] = 11'h03a;
    stim[6] = 11'h077;
    stim[7] = 11'h0d1;
    stim[8] = 11'h27d;
    stim[9] = 11'h159;
    stim[10] = 11'h09c;
    stim[11] = 11'h3c0;
    stim[12] = 11'h313;
    stim[13] = 11'h000;
    stim[14] = 11'h0e9;
    stim[15] = 11'h0c4;
    stim[16] = 11'h184;
    stim[17] = 11'h289;
    stim[18] = 11'h3a6;
    stim[19] = 11'h3af;
    stim[20] = 11'h168;
    stim[21] = 11'h2c3;
    stim[22] = 11'h379;
    stim[23] = 11'h0ca;
    stim[24] = 11'h2ca;
    stim[25] = 11'h1fb;
    stim[26] = 11'h34b;
    stim[27] = 11'h22a;
    stim[28] = 11'h086;
    stim[29] = 11'h39e;
    stim[30] = 11'h3b1;
    stim[31] = 11'h270;
    stim[32] = 11'h24e;
    stim[33] = 11'h11b;
    stim[34] = 11'h394;
    stim[35] = 11'h096;
    stim[36] = 11'h13b;
    stim[37] = 11'h30e;
    stim[38] = 11'h335;
    stim[39] = 11'h302;
    stim[40] = 11'h272;
    stim[41] = 11'h27e;
    stim[42] = 11'h00d;
    stim[43] = 11'h323;
    stim[44] = 11'h3e4;
    stim[45] = 11'h3f1;
    stim[46] = 11'h27a;
    stim[47] = 11'h36e;
    stim[48] = 11'h1f9;
    stim[49] = 11'h1ae;
    stim[50] = 11'h293;
    stim[51] = 11'h06c;
    stim[52] = 11'h1a6;
    stim[53] = 11'h3b0;
    stim[54] = 11'h344;
    stim[55] = 11'h3ea;
    stim[56] = 11'h0fd;
    stim[57] = 11'h3ac;
    stim[58] = 11'h0b2;
    stim[59] = 11'h0c6;
    stim[60] = 11'h133;
    stim[61] = 11'h32e;
    stim[62] = 11'h059;
    stim[63] = 11'h098;
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
      expv[6] = 12'h875;
      expv[7] = 12'h8ed;
      expv[8] = 12'h8e8;
      expv[9] = 12'h8e8;
      expv[10] = 12'h8e8;
      expv[11] = 12'h8e8;
      expv[12] = 12'h8e8;
      expv[13] = 12'he25;
      expv[14] = 12'he25;
      expv[15] = 12'he20;
      expv[16] = 12'he20;
      expv[17] = 12'he20;
      expv[18] = 12'he20;
      expv[19] = 12'hf4d;
      expv[20] = 12'hf5d;
      expv[21] = 12'hf5d;
      expv[22] = 12'hd85;
      expv[23] = 12'hd80;
      expv[24] = 12'h995;
      expv[25] = 12'h196;
      expv[26] = 12'hd95;
      expv[27] = 12'he95;
      expv[28] = 12'h696;
      expv[29] = 12'h696;
      expv[30] = 12'h696;
      expv[31] = 12'hc55;
      expv[32] = 12'hc55;
      expv[33] = 12'h456;
      expv[34] = 12'hc9d;
      expv[35] = 12'hc9d;
      expv[36] = 12'h49e;
      expv[37] = 12'h92d;
      expv[38] = 12'h12e;
      expv[39] = 12'he1d;
      expv[40] = 12'h61e;
      expv[41] = 12'h61e;
      expv[42] = 12'h61e;
      expv[43] = 12'he05;
      expv[44] = 12'he45;
      expv[45] = 12'he45;
      expv[46] = 12'he40;
      expv[47] = 12'hcf5;
      expv[48] = 12'h4f6;
      expv[49] = 12'hedd;
      expv[50] = 12'h6de;
      expv[51] = 12'hb5d;
      expv[52] = 12'hb5d;
      expv[53] = 12'h35e;
      expv[54] = 12'h35e;
      expv[55] = 12'h35e;
      expv[56] = 12'h35e;
      expv[57] = 12'hb4d;
      expv[58] = 12'hb4d;
      expv[59] = 12'h34e;
      expv[60] = 12'h34e;
      expv[61] = 12'h965;
      expv[62] = 12'h166;
      expv[63] = 12'he5d;
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
