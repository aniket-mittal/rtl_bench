// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 20;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_097352 dut (
    .clk(clk),
    .rst_n(in_vec[19:19]),
    .i_start(in_vec[18:18]),
    .i_multiplicand(in_vec[17:9]),
    .i_multiplier(in_vec[8:0]),
    .o_mult(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 20'h64ea6;
    stim[1] = 20'h6db11;
    stim[2] = 20'hd8b5a;
    stim[3] = 20'hd5bb9;
    stim[4] = 20'hdd9e2;
    stim[5] = 20'h8bc43;
    stim[6] = 20'he32cb;
    stim[7] = 20'h820f0;
    stim[8] = 20'hb5d1e;
    stim[9] = 20'ha3210;
    stim[10] = 20'h872cb;
    stim[11] = 20'h804f2;
    stim[12] = 20'hdc8d2;
    stim[13] = 20'hc14cb;
    stim[14] = 20'h91136;
    stim[15] = 20'hcb683;
    stim[16] = 20'hc4515;
    stim[17] = 20'h849bb;
    stim[18] = 20'hf38da;
    stim[19] = 20'h8e8f5;
    stim[20] = 20'ha3bd2;
    stim[21] = 20'h92db5;
    stim[22] = 20'hf9485;
    stim[23] = 20'he12e3;
    stim[24] = 20'heae02;
    stim[25] = 20'hf1f16;
    stim[26] = 20'hfd89c;
    stim[27] = 20'h878e2;
    stim[28] = 20'h8126e;
    stim[29] = 20'hcbb5b;
    stim[30] = 20'h9e9ca;
    stim[31] = 20'hbfa97;
    stim[32] = 20'hb13c3;
    stim[33] = 20'h818bb;
    stim[34] = 20'hb40b9;
    stim[35] = 20'hcbf00;
    stim[36] = 20'hfe1f8;
    stim[37] = 20'hf6f23;
    stim[38] = 20'hc565c;
    stim[39] = 20'h96042;
    stim[40] = 20'hf5b2a;
    stim[41] = 20'h83929;
    stim[42] = 20'hbbf1f;
    stim[43] = 20'ha1ead;
    stim[44] = 20'h9c6ba;
    stim[45] = 20'hde6f1;
    stim[46] = 20'hf5fe0;
    stim[47] = 20'h6d4ef;
    stim[48] = 20'h8ebf8;
    stim[49] = 20'hb1df3;
    stim[50] = 20'h8fde9;
    stim[51] = 20'hdbf0d;
    stim[52] = 20'hb91c7;
    stim[53] = 20'hefc72;
    stim[54] = 20'h8910f;
    stim[55] = 20'ha507a;
    stim[56] = 20'hebf75;
    stim[57] = 20'hf9d7d;
    stim[58] = 20'ha4463;
    stim[59] = 20'hf5b09;
    stim[60] = 20'h8c4bc;
    stim[61] = 20'h87fbe;
    stim[62] = 20'hf9d26;
    stim[63] = 20'he2974;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'h0000;
      expv[9] = 16'h0000;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
