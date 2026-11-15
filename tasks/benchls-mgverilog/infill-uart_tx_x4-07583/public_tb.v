// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07583 dut (
    .clk_x4(clk),
    .rst_x(in_vec[9:9]),
    .i_data(in_vec[8:1]),
    .i_valid(in_vec[0:0]),
    .o_tx(out_vec[2:2]),
    .o_busy(out_vec[1:1]),
    .o_error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h2b5;
    stim[1] = 10'h20f;
    stim[2] = 10'h17b;
    stim[3] = 10'h031;
    stim[4] = 10'h2b3;
    stim[5] = 10'h1a2;
    stim[6] = 10'h041;
    stim[7] = 10'h0e4;
    stim[8] = 10'h05c;
    stim[9] = 10'h0a4;
    stim[10] = 10'h0a6;
    stim[11] = 10'h060;
    stim[12] = 10'h006;
    stim[13] = 10'h14d;
    stim[14] = 10'h1cd;
    stim[15] = 10'h0a4;
    stim[16] = 10'h1b5;
    stim[17] = 10'h1b1;
    stim[18] = 10'h079;
    stim[19] = 10'h0a5;
    stim[20] = 10'h0ef;
    stim[21] = 10'h1df;
    stim[22] = 10'h05f;
    stim[23] = 10'h1d9;
    stim[24] = 10'h19b;
    stim[25] = 10'h0fa;
    stim[26] = 10'h009;
    stim[27] = 10'h1a6;
    stim[28] = 10'h150;
    stim[29] = 10'h140;
    stim[30] = 10'h06a;
    stim[31] = 10'h1e0;
    stim[32] = 10'h0ed;
    stim[33] = 10'h198;
    stim[34] = 10'h091;
    stim[35] = 10'h085;
    stim[36] = 10'h132;
    stim[37] = 10'h0ac;
    stim[38] = 10'h07c;
    stim[39] = 10'h05e;
    stim[40] = 10'h0b9;
    stim[41] = 10'h34b;
    stim[42] = 10'h07c;
    stim[43] = 10'h067;
    stim[44] = 10'h124;
    stim[45] = 10'h0f9;
    stim[46] = 10'h08c;
    stim[47] = 10'h0e3;
    stim[48] = 10'h0c3;
    stim[49] = 10'h133;
    stim[50] = 10'h197;
    stim[51] = 10'h194;
    stim[52] = 10'h127;
    stim[53] = 10'h0d3;
    stim[54] = 10'h0e1;
    stim[55] = 10'h138;
    stim[56] = 10'h0f0;
    stim[57] = 10'h081;
    stim[58] = 10'h1ec;
    stim[59] = 10'h1cb;
    stim[60] = 10'h14c;
    stim[61] = 10'h17e;
    stim[62] = 10'h171;
    stim[63] = 10'h063;
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
      expv[0] = 3'h6;
      expv[1] = 3'h3;
      expv[2] = 3'h6;
      expv[3] = 3'h6;
      expv[4] = 3'h6;
      expv[5] = 3'h4;
      expv[6] = 3'h6;
      expv[7] = 3'h4;
      expv[8] = 3'h4;
      expv[9] = 3'h4;
      expv[10] = 3'h4;
      expv[11] = 3'h4;
      expv[12] = 3'h4;
      expv[13] = 3'h6;
      expv[14] = 3'h6;
      expv[15] = 3'h4;
      expv[16] = 3'h6;
      expv[17] = 3'h6;
      expv[18] = 3'h6;
      expv[19] = 3'h6;
      expv[20] = 3'h6;
      expv[21] = 3'h6;
      expv[22] = 3'h6;
      expv[23] = 3'h6;
      expv[24] = 3'h6;
      expv[25] = 3'h4;
      expv[26] = 3'h6;
      expv[27] = 3'h4;
      expv[28] = 3'h4;
      expv[29] = 3'h4;
      expv[30] = 3'h4;
      expv[31] = 3'h4;
      expv[32] = 3'h6;
      expv[33] = 3'h4;
      expv[34] = 3'h6;
      expv[35] = 3'h6;
      expv[36] = 3'h4;
      expv[37] = 3'h4;
      expv[38] = 3'h4;
      expv[39] = 3'h4;
      expv[40] = 3'h6;
      expv[41] = 3'h6;
      expv[42] = 3'h4;
      expv[43] = 3'h6;
      expv[44] = 3'h4;
      expv[45] = 3'h6;
      expv[46] = 3'h4;
      expv[47] = 3'h6;
      expv[48] = 3'h6;
      expv[49] = 3'h6;
      expv[50] = 3'h6;
      expv[51] = 3'h4;
      expv[52] = 3'h6;
      expv[53] = 3'h6;
      expv[54] = 3'h6;
      expv[55] = 3'h4;
      expv[56] = 3'h4;
      expv[57] = 3'h6;
      expv[58] = 3'h4;
      expv[59] = 3'h6;
      expv[60] = 3'h4;
      expv[61] = 3'h4;
      expv[62] = 3'h6;
      expv[63] = 3'h6;
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
