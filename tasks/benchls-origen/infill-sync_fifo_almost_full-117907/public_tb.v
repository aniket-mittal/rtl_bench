// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_117907 dut (
    .clk(clk),
    .reset(in_vec[10:10]),
    .valid_i(in_vec[9:9]),
    .ready_o(in_vec[8:8]),
    .data_i(in_vec[7:0]),
    .ready_i(out_vec[9:9]),
    .valid_o(out_vec[8:8]),
    .data_o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h589;
    stim[1] = 11'h607;
    stim[2] = 11'h122;
    stim[3] = 11'h03e;
    stim[4] = 11'h1a4;
    stim[5] = 11'h0c5;
    stim[6] = 11'h1be;
    stim[7] = 11'h04e;
    stim[8] = 11'h09e;
    stim[9] = 11'h224;
    stim[10] = 11'h08e;
    stim[11] = 11'h241;
    stim[12] = 11'h00c;
    stim[13] = 11'h158;
    stim[14] = 11'h056;
    stim[15] = 11'h160;
    stim[16] = 11'h195;
    stim[17] = 11'h308;
    stim[18] = 11'h3c8;
    stim[19] = 11'h286;
    stim[20] = 11'h3a5;
    stim[21] = 11'h167;
    stim[22] = 11'h208;
    stim[23] = 11'h314;
    stim[24] = 11'h113;
    stim[25] = 11'h0a1;
    stim[26] = 11'h036;
    stim[27] = 11'h2ea;
    stim[28] = 11'h2f4;
    stim[29] = 11'h025;
    stim[30] = 11'h180;
    stim[31] = 11'h208;
    stim[32] = 11'h317;
    stim[33] = 11'h039;
    stim[34] = 11'h095;
    stim[35] = 11'h2c7;
    stim[36] = 11'h101;
    stim[37] = 11'h1f5;
    stim[38] = 11'h2df;
    stim[39] = 11'h014;
    stim[40] = 11'h2b1;
    stim[41] = 11'h686;
    stim[42] = 11'h08c;
    stim[43] = 11'h04f;
    stim[44] = 11'h1de;
    stim[45] = 11'h2f3;
    stim[46] = 11'h2ba;
    stim[47] = 11'h328;
    stim[48] = 11'h138;
    stim[49] = 11'h2e5;
    stim[50] = 11'h241;
    stim[51] = 11'h0cd;
    stim[52] = 11'h2b1;
    stim[53] = 11'h2d9;
    stim[54] = 11'h19f;
    stim[55] = 11'h10f;
    stim[56] = 11'h0ec;
    stim[57] = 11'h09a;
    stim[58] = 11'h2cf;
    stim[59] = 11'h229;
    stim[60] = 11'h22a;
    stim[61] = 11'h277;
    stim[62] = 11'h0c0;
    stim[63] = 11'h01b;
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
      expv[0] = 10'h200;
      expv[1] = 10'h200;
      expv[2] = 10'h200;
      expv[3] = 10'h200;
      expv[4] = 10'h200;
      expv[5] = 10'h200;
      expv[6] = 10'h200;
      expv[7] = 10'h200;
      expv[8] = 10'h200;
      expv[9] = 10'h200;
      expv[10] = 10'h200;
      expv[11] = 10'h324;
      expv[12] = 10'h324;
      expv[13] = 10'h324;
      expv[14] = 10'h324;
      expv[15] = 10'h341;
      expv[16] = 10'h341;
      expv[17] = 10'h041;
      expv[18] = 10'h1xx;
      expv[19] = 10'h1xx;
      expv[20] = 10'h1xx;
      expv[21] = 10'h1xx;
      expv[22] = 10'h1xx;
      expv[23] = 10'h1xx;
      expv[24] = 10'h1xx;
      expv[25] = 10'h1xx;
      expv[26] = 10'h1xx;
      expv[27] = 10'h1xx;
      expv[28] = 10'h1xx;
      expv[29] = 10'h1xx;
      expv[30] = 10'h1xx;
      expv[31] = 10'h1xx;
      expv[32] = 10'h1xx;
      expv[33] = 10'h1xx;
      expv[34] = 10'h1xx;
      expv[35] = 10'h1xx;
      expv[36] = 10'h1xx;
      expv[37] = 10'h1xx;
      expv[38] = 10'h1xx;
      expv[39] = 10'h1xx;
      expv[40] = 10'h1xx;
      expv[41] = 10'h200;
      expv[42] = 10'h200;
      expv[43] = 10'h200;
      expv[44] = 10'h200;
      expv[45] = 10'h200;
      expv[46] = 10'h200;
      expv[47] = 10'h3f3;
      expv[48] = 10'h3f3;
      expv[49] = 10'h3ba;
      expv[50] = 10'h2ba;
      expv[51] = 10'h328;
      expv[52] = 10'h328;
      expv[53] = 10'h328;
      expv[54] = 10'h328;
      expv[55] = 10'h328;
      expv[56] = 10'h3e5;
      expv[57] = 10'h341;
      expv[58] = 10'h341;
      expv[59] = 10'h341;
      expv[60] = 10'h341;
      expv[61] = 10'h341;
      expv[62] = 10'h341;
      expv[63] = 10'h341;
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
