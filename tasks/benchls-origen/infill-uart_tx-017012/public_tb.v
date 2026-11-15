// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_017012 dut (
    .i_clk(clk),
    .i_rst_n(in_vec[9:9]),
    .i_data(in_vec[8:1]),
    .i_txen(in_vec[0:0]),
    .o_uart_miso(out_vec[1:1]),
    .o_txempty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h0b7;
    stim[1] = 10'h14f;
    stim[2] = 10'h3bf;
    stim[3] = 10'h3f6;
    stim[4] = 10'h27c;
    stim[5] = 10'h261;
    stim[6] = 10'h2c4;
    stim[7] = 10'h2f3;
    stim[8] = 10'h209;
    stim[9] = 10'h212;
    stim[10] = 10'h2e5;
    stim[11] = 10'h3af;
    stim[12] = 10'h28f;
    stim[13] = 10'h218;
    stim[14] = 10'h328;
    stim[15] = 10'h274;
    stim[16] = 10'h200;
    stim[17] = 10'h27f;
    stim[18] = 10'h2b3;
    stim[19] = 10'h3c5;
    stim[20] = 10'h3a3;
    stim[21] = 10'h33a;
    stim[22] = 10'h336;
    stim[23] = 10'h23b;
    stim[24] = 10'h21e;
    stim[25] = 10'h0b9;
    stim[26] = 10'h343;
    stim[27] = 10'h3b6;
    stim[28] = 10'h212;
    stim[29] = 10'h2de;
    stim[30] = 10'h208;
    stim[31] = 10'h337;
    stim[32] = 10'h337;
    stim[33] = 10'h33c;
    stim[34] = 10'h3b2;
    stim[35] = 10'h2e8;
    stim[36] = 10'h332;
    stim[37] = 10'h2c6;
    stim[38] = 10'h223;
    stim[39] = 10'h272;
    stim[40] = 10'h3cb;
    stim[41] = 10'h31d;
    stim[42] = 10'h3a4;
    stim[43] = 10'h222;
    stim[44] = 10'h3db;
    stim[45] = 10'h35a;
    stim[46] = 10'h227;
    stim[47] = 10'h202;
    stim[48] = 10'h201;
    stim[49] = 10'h3e2;
    stim[50] = 10'h3bd;
    stim[51] = 10'h247;
    stim[52] = 10'h3e9;
    stim[53] = 10'h3cc;
    stim[54] = 10'h363;
    stim[55] = 10'h294;
    stim[56] = 10'h31f;
    stim[57] = 10'h22a;
    stim[58] = 10'h3e6;
    stim[59] = 10'h29d;
    stim[60] = 10'h221;
    stim[61] = 10'h2b1;
    stim[62] = 10'h2c3;
    stim[63] = 10'h3fe;
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
      expv[0] = 2'h3;
      expv[1] = 2'h3;
      expv[2] = 2'h3;
      expv[3] = 2'h2;
      expv[4] = 2'h2;
      expv[5] = 2'h2;
      expv[6] = 2'h2;
      expv[7] = 2'h2;
      expv[8] = 2'h2;
      expv[9] = 2'h2;
      expv[10] = 2'h2;
      expv[11] = 2'h2;
      expv[12] = 2'h2;
      expv[13] = 2'h2;
      expv[14] = 2'h2;
      expv[15] = 2'h2;
      expv[16] = 2'h2;
      expv[17] = 2'h2;
      expv[18] = 2'h2;
      expv[19] = 2'h2;
      expv[20] = 2'h2;
      expv[21] = 2'h2;
      expv[22] = 2'h2;
      expv[23] = 2'h2;
      expv[24] = 2'h2;
      expv[25] = 2'h3;
      expv[26] = 2'h3;
      expv[27] = 2'h2;
      expv[28] = 2'h2;
      expv[29] = 2'h2;
      expv[30] = 2'h2;
      expv[31] = 2'h2;
      expv[32] = 2'h2;
      expv[33] = 2'h2;
      expv[34] = 2'h2;
      expv[35] = 2'h2;
      expv[36] = 2'h2;
      expv[37] = 2'h2;
      expv[38] = 2'h2;
      expv[39] = 2'h2;
      expv[40] = 2'h2;
      expv[41] = 2'h2;
      expv[42] = 2'h2;
      expv[43] = 2'h2;
      expv[44] = 2'h2;
      expv[45] = 2'h2;
      expv[46] = 2'h2;
      expv[47] = 2'h2;
      expv[48] = 2'h2;
      expv[49] = 2'h2;
      expv[50] = 2'h2;
      expv[51] = 2'h2;
      expv[52] = 2'h2;
      expv[53] = 2'h2;
      expv[54] = 2'h2;
      expv[55] = 2'h2;
      expv[56] = 2'h2;
      expv[57] = 2'h2;
      expv[58] = 2'h2;
      expv[59] = 2'h2;
      expv[60] = 2'h2;
      expv[61] = 2'h2;
      expv[62] = 2'h2;
      expv[63] = 2'h2;
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
