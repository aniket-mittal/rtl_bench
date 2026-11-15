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

  autovcoder_071737 dut (
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
    stim[0] = 11'h6b4;
    stim[1] = 11'h496;
    stim[2] = 11'h052;
    stim[3] = 11'h1af;
    stim[4] = 11'h199;
    stim[5] = 11'h25b;
    stim[6] = 11'h324;
    stim[7] = 11'h0f4;
    stim[8] = 11'h305;
    stim[9] = 11'h37a;
    stim[10] = 11'h2b3;
    stim[11] = 11'h3c6;
    stim[12] = 11'h53d;
    stim[13] = 11'h261;
    stim[14] = 11'h3f4;
    stim[15] = 11'h360;
    stim[16] = 11'h01c;
    stim[17] = 11'h299;
    stim[18] = 11'h073;
    stim[19] = 11'h0a6;
    stim[20] = 11'h248;
    stim[21] = 11'h3f1;
    stim[22] = 11'h173;
    stim[23] = 11'h200;
    stim[24] = 11'h12c;
    stim[25] = 11'h214;
    stim[26] = 11'h0b3;
    stim[27] = 11'h3ee;
    stim[28] = 11'h2ca;
    stim[29] = 11'h1c0;
    stim[30] = 11'h16e;
    stim[31] = 11'h125;
    stim[32] = 11'h1ad;
    stim[33] = 11'h134;
    stim[34] = 11'h0f6;
    stim[35] = 11'h035;
    stim[36] = 11'h2c8;
    stim[37] = 11'h283;
    stim[38] = 11'h073;
    stim[39] = 11'h1c9;
    stim[40] = 11'h0b7;
    stim[41] = 11'h3be;
    stim[42] = 11'h39f;
    stim[43] = 11'h3eb;
    stim[44] = 11'h1fd;
    stim[45] = 11'h196;
    stim[46] = 11'h0fe;
    stim[47] = 11'h03f;
    stim[48] = 11'h083;
    stim[49] = 11'h4e8;
    stim[50] = 11'h37d;
    stim[51] = 11'h3cb;
    stim[52] = 11'h3d4;
    stim[53] = 11'h2a7;
    stim[54] = 11'h05c;
    stim[55] = 11'h016;
    stim[56] = 11'h31f;
    stim[57] = 11'h015;
    stim[58] = 11'h271;
    stim[59] = 11'h109;
    stim[60] = 11'h2e0;
    stim[61] = 11'h171;
    stim[62] = 11'h2fe;
    stim[63] = 11'h39f;
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
      expv[2] = 12'h128;
      expv[3] = 12'h8a0;
      expv[4] = 12'hb5d;
      expv[5] = 12'hb58;
      expv[6] = 12'hcb5;
      expv[7] = 12'hcb5;
      expv[8] = 12'hcb5;
      expv[9] = 12'hcb0;
      expv[10] = 12'hef5;
      expv[11] = 12'hd65;
      expv[12] = 12'h566;
      expv[13] = 12'h788;
      expv[14] = 12'hf88;
      expv[15] = 12'hf88;
      expv[16] = 12'hf88;
      expv[17] = 12'hf88;
      expv[18] = 12'hf88;
      expv[19] = 12'h8e5;
      expv[20] = 12'h0e6;
      expv[21] = 12'h0e6;
      expv[22] = 12'h94d;
      expv[23] = 12'hae5;
      expv[24] = 12'hae5;
      expv[25] = 12'hae5;
      expv[26] = 12'hae5;
      expv[27] = 12'h965;
      expv[28] = 12'h166;
      expv[29] = 12'h166;
      expv[30] = 12'h166;
      expv[31] = 12'h166;
      expv[32] = 12'hfdd;
      expv[33] = 12'hfd8;
      expv[34] = 12'hfd8;
      expv[35] = 12'h9ed;
      expv[36] = 12'h9e8;
      expv[37] = 12'h9e8;
      expv[38] = 12'hd05;
      expv[39] = 12'h8e5;
      expv[40] = 12'h8e0;
      expv[41] = 12'h96d;
      expv[42] = 12'h16e;
      expv[43] = 12'hf7d;
      expv[44] = 12'hfd5;
      expv[45] = 12'hfd0;
      expv[46] = 12'hb2d;
      expv[47] = 12'h32e;
      expv[48] = 12'h9fd;
      expv[49] = 12'h905;
      expv[50] = 12'h100;
      expv[51] = 12'h900;
      expv[52] = 12'hf95;
      expv[53] = 12'hf95;
      expv[54] = 12'hd4d;
      expv[55] = 12'hd4d;
      expv[56] = 12'h54e;
      expv[57] = 12'h82d;
      expv[58] = 12'h828;
      expv[59] = 12'h828;
      expv[60] = 12'h828;
      expv[61] = 12'h828;
      expv[62] = 12'h828;
      expv[63] = 12'hdfd;
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
