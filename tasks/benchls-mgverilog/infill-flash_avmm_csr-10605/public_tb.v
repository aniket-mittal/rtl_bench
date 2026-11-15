// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 46;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10605 dut (
    .clock(clk),
    .reset_n(in_vec[45:45]),
    .avmm_read(in_vec[44:44]),
    .avmm_write(in_vec[43:43]),
    .avmm_addr(in_vec[42:42]),
    .avmm_writedata(in_vec[41:10]),
    .csr_status(in_vec[9:0]),
    .avmm_readdata(out_vec[63:32]),
    .csr_control(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 46'h069181704478;
    stim[1] = 46'h0b9a8334372f;
    stim[2] = 46'h3e8aaa0efc13;
    stim[3] = 46'h342363653260;
    stim[4] = 46'h264d2b02ef07;
    stim[5] = 46'h33f449951aeb;
    stim[6] = 46'h267670e5a05f;
    stim[7] = 46'h340c13d201df;
    stim[8] = 46'h351cc9c7ea23;
    stim[9] = 46'h228bf578d419;
    stim[10] = 46'h28c119f07406;
    stim[11] = 46'h32242015f267;
    stim[12] = 46'h324d81dd848d;
    stim[13] = 46'h3b177dab35e5;
    stim[14] = 46'h181e07c7b6b5;
    stim[15] = 46'h288553a42e5b;
    stim[16] = 46'h3c5b4933ed3a;
    stim[17] = 46'h3ffb61ee0146;
    stim[18] = 46'h29277529fe39;
    stim[19] = 46'h2c87cd200eb1;
    stim[20] = 46'h3ecfe121720f;
    stim[21] = 46'h2ac08c68b56e;
    stim[22] = 46'h30f15233267e;
    stim[23] = 46'h37b15e174f6e;
    stim[24] = 46'h3aa6ad23a874;
    stim[25] = 46'h34424d1bead8;
    stim[26] = 46'h341ebb00ead6;
    stim[27] = 46'h3bb59fb86ba5;
    stim[28] = 46'h33197240f61c;
    stim[29] = 46'h25e3867307ac;
    stim[30] = 46'h2ef57161a2c0;
    stim[31] = 46'h3ad681c18756;
    stim[32] = 46'h07169bd67b68;
    stim[33] = 46'h21c8833f762b;
    stim[34] = 46'h3e195a601b84;
    stim[35] = 46'h0a0e5d088e2e;
    stim[36] = 46'h3492d686875e;
    stim[37] = 46'h22a0817ce685;
    stim[38] = 46'h31e8c3040ac8;
    stim[39] = 46'h3efe52e711bf;
    stim[40] = 46'h3ec2a0c599d4;
    stim[41] = 46'h3714706d8970;
    stim[42] = 46'h2f409b724b3d;
    stim[43] = 46'h3c70e3d8bed7;
    stim[44] = 46'h355adc2ea870;
    stim[45] = 46'h262600c6967d;
    stim[46] = 46'h3a4d617810a8;
    stim[47] = 46'h336c5580148f;
    stim[48] = 46'h21fa18c902ab;
    stim[49] = 46'h27351df7915c;
    stim[50] = 46'h27e2ca2d6fca;
    stim[51] = 46'h381adf62d583;
    stim[52] = 46'h23daa7f973e0;
    stim[53] = 46'h2a84fccdc504;
    stim[54] = 46'h378f1418ecbf;
    stim[55] = 46'h2cb8f5587601;
    stim[56] = 46'h396d62475520;
    stim[57] = 46'h28351f8d975b;
    stim[58] = 46'h394d48e5e93c;
    stim[59] = 46'h3479bb27aa39;
    stim[60] = 46'h3e7a6d078a5d;
    stim[61] = 46'h2581fe35cfb9;
    stim[62] = 46'h36a2b61b0dcf;
    stim[63] = 46'h3e214aafabb2;
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
      expv[0] = 64'hfffffc783fffffff;
      expv[1] = 64'hffffff2f3fffffff;
      expv[2] = 64'hfffffc133fffffff;
      expv[3] = 64'hfffffe603fffffff;
      expv[4] = 64'hffffff073fffffff;
      expv[5] = 64'hfffffeeb3fffffff;
      expv[6] = 64'hfffffc5f3fffffff;
      expv[7] = 64'hfffffddf3fffffff;
      expv[8] = 64'h3fffffff3fffffff;
      expv[9] = 64'h3fffffff3fffffff;
      expv[10] = 64'h3fffffff3fffffff;
      expv[11] = 64'h3fffffff3fffffff;
      expv[12] = 64'hfffffc8d3fffffff;
      expv[13] = 64'hfffffde53fffffff;
      expv[14] = 64'hfffffeb53fffffff;
      expv[15] = 64'hfffffe5b3fffffff;
      expv[16] = 64'hfffffd3a3fffffff;
      expv[17] = 64'hfffffd463fffffff;
      expv[18] = 64'h3effffff3effffff;
      expv[19] = 64'h3effffff3effffff;
      expv[20] = 64'h31ffffff31ffffff;
      expv[21] = 64'h33ffffff33ffffff;
      expv[22] = 64'h33ffffff33ffffff;
      expv[23] = 64'hffffff6e33ffffff;
      expv[24] = 64'h33ffffff33ffffff;
      expv[25] = 64'hfffffed833ffffff;
      expv[26] = 64'h33ffffff33ffffff;
      expv[27] = 64'h33ffffff33ffffff;
      expv[28] = 64'hfffffe1c33ffffff;
      expv[29] = 64'hffffffac33ffffff;
      expv[30] = 64'hfffffec033ffffff;
      expv[31] = 64'hffffff567d5c5868;
      expv[32] = 64'hffffff687d5c5868;
      expv[33] = 64'hfffffe2b3fffffff;
      expv[34] = 64'hffffff843fffffff;
      expv[35] = 64'hfffffe2e3fffffff;
      expv[36] = 64'hffffff5e3fffffff;
      expv[37] = 64'hfffffe853fffffff;
      expv[38] = 64'hfffffec83fffffff;
      expv[39] = 64'hfffffdbf3fffffff;
      expv[40] = 64'h3fffffff3fffffff;
      expv[41] = 64'h70a8316670a83166;
      expv[42] = 64'h70a8316670a83166;
      expv[43] = 64'hb0283166b0283166;
      expv[44] = 64'hbc283166bc283166;
      expv[45] = 64'h3c2831663c283166;
      expv[46] = 64'h3c2831663c283166;
      expv[47] = 64'hfffffc8f3c283166;
      expv[48] = 64'hfffffeab3c283166;
      expv[49] = 64'hfffffd5c3c283166;
      expv[50] = 64'hffffffca3c283166;
      expv[51] = 64'hfffffd833c283166;
      expv[52] = 64'hffffffe03c283166;
      expv[53] = 64'hfffffd043c283166;
      expv[54] = 64'hfffffcbf3c283166;
      expv[55] = 64'h3c2831663c283166;
      expv[56] = 64'h3e2831663e283166;
      expv[57] = 64'hffffff5b3e283166;
      expv[58] = 64'hfffffd3c3e283166;
      expv[59] = 64'hfffffe393e283166;
      expv[60] = 64'h3e2831663e283166;
      expv[61] = 64'h3ea831663ea83166;
      expv[62] = 64'h3ea831663ea83166;
      expv[63] = 64'h3ea831663ea83166;
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
