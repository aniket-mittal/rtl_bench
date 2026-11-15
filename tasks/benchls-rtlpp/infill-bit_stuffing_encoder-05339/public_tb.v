// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05339 dut (
    .clock(clk),
    .reset(in_vec[3:3]),
    .i_v(in_vec[2:2]),
    .o_b(in_vec[1:1]),
    .f(in_vec[0:0]),
    .i_b(out_vec[5:5]),
    .o_v(out_vec[4:4]),
    .sel_o_d(out_vec[3:3]),
    .sel_cnt(out_vec[2:1]),
    .sel_f(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h9;
    stim[1] = 4'h9;
    stim[2] = 4'h7;
    stim[3] = 4'h5;
    stim[4] = 4'h5;
    stim[5] = 4'h7;
    stim[6] = 4'h3;
    stim[7] = 4'h7;
    stim[8] = 4'h0;
    stim[9] = 4'h3;
    stim[10] = 4'he;
    stim[11] = 4'h3;
    stim[12] = 4'h4;
    stim[13] = 4'h1;
    stim[14] = 4'h2;
    stim[15] = 4'h3;
    stim[16] = 4'h7;
    stim[17] = 4'h6;
    stim[18] = 4'h2;
    stim[19] = 4'h2;
    stim[20] = 4'h3;
    stim[21] = 4'h4;
    stim[22] = 4'h0;
    stim[23] = 4'h7;
    stim[24] = 4'h1;
    stim[25] = 4'h7;
    stim[26] = 4'h1;
    stim[27] = 4'h5;
    stim[28] = 4'h2;
    stim[29] = 4'h4;
    stim[30] = 4'h1;
    stim[31] = 4'h0;
    stim[32] = 4'h6;
    stim[33] = 4'h4;
    stim[34] = 4'h0;
    stim[35] = 4'h6;
    stim[36] = 4'h3;
    stim[37] = 4'h7;
    stim[38] = 4'h1;
    stim[39] = 4'h3;
    stim[40] = 4'h4;
    stim[41] = 4'h3;
    stim[42] = 4'h2;
    stim[43] = 4'h0;
    stim[44] = 4'h3;
    stim[45] = 4'h7;
    stim[46] = 4'h4;
    stim[47] = 4'h5;
    stim[48] = 4'h0;
    stim[49] = 4'h1;
    stim[50] = 4'h7;
    stim[51] = 4'h0;
    stim[52] = 4'h4;
    stim[53] = 4'h7;
    stim[54] = 4'h0;
    stim[55] = 4'h2;
    stim[56] = 4'h7;
    stim[57] = 4'h4;
    stim[58] = 4'h3;
    stim[59] = 4'h6;
    stim[60] = 4'h0;
    stim[61] = 4'h5;
    stim[62] = 4'h4;
    stim[63] = 4'h6;
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
      expv[0] = 6'h2x;
      expv[1] = 6'h2x;
      expv[2] = 6'h0x;
      expv[3] = 6'h0x;
      expv[4] = 6'h0x;
      expv[5] = 6'h0x;
      expv[6] = 6'h2x;
      expv[7] = 6'h0x;
      expv[8] = 6'h2x;
      expv[9] = 6'h2x;
      expv[10] = 6'h0x;
      expv[11] = 6'h2x;
      expv[12] = 6'h0x;
      expv[13] = 6'h2x;
      expv[14] = 6'h2x;
      expv[15] = 6'h2x;
      expv[16] = 6'h0x;
      expv[17] = 6'h0x;
      expv[18] = 6'h2x;
      expv[19] = 6'h2x;
      expv[20] = 6'h2x;
      expv[21] = 6'h0x;
      expv[22] = 6'h2x;
      expv[23] = 6'h0x;
      expv[24] = 6'h2x;
      expv[25] = 6'h0x;
      expv[26] = 6'h2x;
      expv[27] = 6'h0x;
      expv[28] = 6'h2x;
      expv[29] = 6'h0x;
      expv[30] = 6'h2x;
      expv[31] = 6'h2x;
      expv[32] = 6'h0x;
      expv[33] = 6'h0x;
      expv[34] = 6'h2x;
      expv[35] = 6'h0x;
      expv[36] = 6'h2x;
      expv[37] = 6'h0x;
      expv[38] = 6'h2x;
      expv[39] = 6'h2x;
      expv[40] = 6'h0x;
      expv[41] = 6'h2x;
      expv[42] = 6'h2x;
      expv[43] = 6'h2x;
      expv[44] = 6'h2x;
      expv[45] = 6'h0x;
      expv[46] = 6'h0x;
      expv[47] = 6'h0x;
      expv[48] = 6'h2x;
      expv[49] = 6'h2x;
      expv[50] = 6'h0x;
      expv[51] = 6'h2x;
      expv[52] = 6'h0x;
      expv[53] = 6'h0x;
      expv[54] = 6'h2x;
      expv[55] = 6'h2x;
      expv[56] = 6'h0x;
      expv[57] = 6'h0x;
      expv[58] = 6'h2x;
      expv[59] = 6'h0x;
      expv[60] = 6'h2x;
      expv[61] = 6'h0x;
      expv[62] = 6'h0x;
      expv[63] = 6'h0x;
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
