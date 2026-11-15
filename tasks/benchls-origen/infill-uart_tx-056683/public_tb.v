// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_056683 dut (
    .i_clock(clk),
    .i_reset(in_vec[10:10]),
    .i_tick(in_vec[9:9]),
    .i_data(in_vec[8:1]),
    .i_start(in_vec[0:0]),
    .o_data(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h4ea;
    stim[1] = 11'h6c4;
    stim[2] = 11'h267;
    stim[3] = 11'h2f6;
    stim[4] = 11'h050;
    stim[5] = 11'h19c;
    stim[6] = 11'h03c;
    stim[7] = 11'h23f;
    stim[8] = 11'h0c8;
    stim[9] = 11'h3a9;
    stim[10] = 11'h03a;
    stim[11] = 11'h26e;
    stim[12] = 11'h052;
    stim[13] = 11'h3ee;
    stim[14] = 11'h30f;
    stim[15] = 11'h1ee;
    stim[16] = 11'h006;
    stim[17] = 11'h0e9;
    stim[18] = 11'h2de;
    stim[19] = 11'h59c;
    stim[20] = 11'h29e;
    stim[21] = 11'h3ad;
    stim[22] = 11'h3ea;
    stim[23] = 11'h2e8;
    stim[24] = 11'h06f;
    stim[25] = 11'h238;
    stim[26] = 11'h2bf;
    stim[27] = 11'h39f;
    stim[28] = 11'h102;
    stim[29] = 11'h3aa;
    stim[30] = 11'h35e;
    stim[31] = 11'h090;
    stim[32] = 11'h182;
    stim[33] = 11'h19d;
    stim[34] = 11'h14f;
    stim[35] = 11'h257;
    stim[36] = 11'h03a;
    stim[37] = 11'h010;
    stim[38] = 11'h184;
    stim[39] = 11'h2e2;
    stim[40] = 11'h521;
    stim[41] = 11'h320;
    stim[42] = 11'h18d;
    stim[43] = 11'h0d5;
    stim[44] = 11'h03a;
    stim[45] = 11'h393;
    stim[46] = 11'h163;
    stim[47] = 11'h3e5;
    stim[48] = 11'h331;
    stim[49] = 11'h204;
    stim[50] = 11'h210;
    stim[51] = 11'h0f3;
    stim[52] = 11'h053;
    stim[53] = 11'h1b1;
    stim[54] = 11'h19a;
    stim[55] = 11'h018;
    stim[56] = 11'h3bb;
    stim[57] = 11'h293;
    stim[58] = 11'h314;
    stim[59] = 11'h2a3;
    stim[60] = 11'h2a0;
    stim[61] = 11'h3d0;
    stim[62] = 11'h288;
    stim[63] = 11'h35b;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h1;
      expv[4] = 1'h0;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h0;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h1;
      expv[20] = 1'h1;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h0;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h0;
      expv[29] = 1'h0;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h0;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h1;
      expv[41] = 1'h1;
      expv[42] = 1'h1;
      expv[43] = 1'h1;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h0;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h0;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h0;
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
