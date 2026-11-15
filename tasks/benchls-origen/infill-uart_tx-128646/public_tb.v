// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_128646 dut (
    .clock(clk),
    .reset(in_vec[10:10]),
    .s_tick(in_vec[9:9]),
    .tx_start(in_vec[8:8]),
    .data_in(in_vec[7:0]),
    .tx(out_vec[2:2]),
    .tx_done(out_vec[1:1]),
    .baud_rate_clock(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h6f0;
    stim[1] = 11'h6c9;
    stim[2] = 11'h22e;
    stim[3] = 11'h26a;
    stim[4] = 11'h211;
    stim[5] = 11'h00a;
    stim[6] = 11'h23a;
    stim[7] = 11'h379;
    stim[8] = 11'h0e5;
    stim[9] = 11'h0f1;
    stim[10] = 11'h69a;
    stim[11] = 11'h049;
    stim[12] = 11'h3e3;
    stim[13] = 11'h366;
    stim[14] = 11'h265;
    stim[15] = 11'h075;
    stim[16] = 11'h328;
    stim[17] = 11'h04e;
    stim[18] = 11'h214;
    stim[19] = 11'h2ac;
    stim[20] = 11'h046;
    stim[21] = 11'h3b5;
    stim[22] = 11'h1b0;
    stim[23] = 11'h246;
    stim[24] = 11'h033;
    stim[25] = 11'h1de;
    stim[26] = 11'h2cb;
    stim[27] = 11'h072;
    stim[28] = 11'h337;
    stim[29] = 11'h3d7;
    stim[30] = 11'h045;
    stim[31] = 11'h139;
    stim[32] = 11'h224;
    stim[33] = 11'h0d7;
    stim[34] = 11'h0ab;
    stim[35] = 11'h0e1;
    stim[36] = 11'h32d;
    stim[37] = 11'h1b7;
    stim[38] = 11'h0d0;
    stim[39] = 11'h2d3;
    stim[40] = 11'h1f7;
    stim[41] = 11'h3cc;
    stim[42] = 11'h0e5;
    stim[43] = 11'h357;
    stim[44] = 11'h3a8;
    stim[45] = 11'h295;
    stim[46] = 11'h209;
    stim[47] = 11'h10d;
    stim[48] = 11'h3c4;
    stim[49] = 11'h0f9;
    stim[50] = 11'h364;
    stim[51] = 11'h1e2;
    stim[52] = 11'h095;
    stim[53] = 11'h030;
    stim[54] = 11'h035;
    stim[55] = 11'h26f;
    stim[56] = 11'h2a2;
    stim[57] = 11'h3a1;
    stim[58] = 11'h36b;
    stim[59] = 11'h188;
    stim[60] = 11'h153;
    stim[61] = 11'h0df;
    stim[62] = 11'h0bf;
    stim[63] = 11'h033;
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
      expv[0] = 3'h4;
      expv[1] = 3'h4;
      expv[2] = 3'h4;
      expv[3] = 3'h4;
      expv[4] = 3'h4;
      expv[5] = 3'h4;
      expv[6] = 3'h4;
      expv[7] = 3'h4;
      expv[8] = 3'h4;
      expv[9] = 3'h4;
      expv[10] = 3'h4;
      expv[11] = 3'h4;
      expv[12] = 3'h4;
      expv[13] = 3'h4;
      expv[14] = 3'h4;
      expv[15] = 3'h4;
      expv[16] = 3'h4;
      expv[17] = 3'h4;
      expv[18] = 3'h4;
      expv[19] = 3'h4;
      expv[20] = 3'h4;
      expv[21] = 3'h4;
      expv[22] = 3'h4;
      expv[23] = 3'h4;
      expv[24] = 3'h4;
      expv[25] = 3'h4;
      expv[26] = 3'h4;
      expv[27] = 3'h4;
      expv[28] = 3'h4;
      expv[29] = 3'h4;
      expv[30] = 3'h4;
      expv[31] = 3'h4;
      expv[32] = 3'h4;
      expv[33] = 3'h4;
      expv[34] = 3'h4;
      expv[35] = 3'h4;
      expv[36] = 3'h4;
      expv[37] = 3'h4;
      expv[38] = 3'h4;
      expv[39] = 3'h4;
      expv[40] = 3'h4;
      expv[41] = 3'h4;
      expv[42] = 3'h4;
      expv[43] = 3'h4;
      expv[44] = 3'h4;
      expv[45] = 3'h4;
      expv[46] = 3'h4;
      expv[47] = 3'h4;
      expv[48] = 3'h4;
      expv[49] = 3'h4;
      expv[50] = 3'h4;
      expv[51] = 3'h4;
      expv[52] = 3'h4;
      expv[53] = 3'h4;
      expv[54] = 3'h4;
      expv[55] = 3'h4;
      expv[56] = 3'h4;
      expv[57] = 3'h4;
      expv[58] = 3'h4;
      expv[59] = 3'h4;
      expv[60] = 3'h4;
      expv[61] = 3'h4;
      expv[62] = 3'h4;
      expv[63] = 3'h4;
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
