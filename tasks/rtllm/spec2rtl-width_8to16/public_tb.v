// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  width_8to16 dut (
    .clk(clk),
    .rst_n(in_vec[9:9]),
    .valid_in(in_vec[8:8]),
    .data_in(in_vec[7:0]),
    .valid_out(out_vec[16:16]),
    .data_out(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h104;
    stim[1] = 10'h070;
    stim[2] = 10'h3bf;
    stim[3] = 10'h39d;
    stim[4] = 10'h395;
    stim[5] = 10'h364;
    stim[6] = 10'h2ab;
    stim[7] = 10'h357;
    stim[8] = 10'h2de;
    stim[9] = 10'h348;
    stim[10] = 10'h3ad;
    stim[11] = 10'h30b;
    stim[12] = 10'h3e8;
    stim[13] = 10'h2d7;
    stim[14] = 10'h31a;
    stim[15] = 10'h336;
    stim[16] = 10'h323;
    stim[17] = 10'h2e7;
    stim[18] = 10'h306;
    stim[19] = 10'h270;
    stim[20] = 10'h36a;
    stim[21] = 10'h399;
    stim[22] = 10'h26d;
    stim[23] = 10'h34d;
    stim[24] = 10'h2e5;
    stim[25] = 10'h2a5;
    stim[26] = 10'h3a7;
    stim[27] = 10'h355;
    stim[28] = 10'h34f;
    stim[29] = 10'h21b;
    stim[30] = 10'h328;
    stim[31] = 10'h23c;
    stim[32] = 10'h390;
    stim[33] = 10'h3b0;
    stim[34] = 10'h366;
    stim[35] = 10'h3f7;
    stim[36] = 10'h24b;
    stim[37] = 10'h2d3;
    stim[38] = 10'h2b9;
    stim[39] = 10'h354;
    stim[40] = 10'h3e9;
    stim[41] = 10'h354;
    stim[42] = 10'h31a;
    stim[43] = 10'h265;
    stim[44] = 10'h2ef;
    stim[45] = 10'h25d;
    stim[46] = 10'h23e;
    stim[47] = 10'h379;
    stim[48] = 10'h2b6;
    stim[49] = 10'h23c;
    stim[50] = 10'h31d;
    stim[51] = 10'h3f3;
    stim[52] = 10'h3a9;
    stim[53] = 10'h356;
    stim[54] = 10'h32d;
    stim[55] = 10'h279;
    stim[56] = 10'h221;
    stim[57] = 10'h2db;
    stim[58] = 10'h3c9;
    stim[59] = 10'h28a;
    stim[60] = 10'h32e;
    stim[61] = 10'h3b6;
    stim[62] = 10'h071;
    stim[63] = 10'h3be;
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
      expv[0] = 17'h00000;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h1bf9d;
      expv[5] = 17'h0bf9d;
      expv[6] = 17'h19564;
      expv[7] = 17'h09564;
      expv[8] = 17'h09564;
      expv[9] = 17'h09564;
      expv[10] = 17'h15748;
      expv[11] = 17'h05748;
      expv[12] = 17'h1ad0b;
      expv[13] = 17'h0ad0b;
      expv[14] = 17'h0ad0b;
      expv[15] = 17'h1e81a;
      expv[16] = 17'h0e81a;
      expv[17] = 17'h13623;
      expv[18] = 17'h03623;
      expv[19] = 17'h03623;
      expv[20] = 17'h03623;
      expv[21] = 17'h1066a;
      expv[22] = 17'h0066a;
      expv[23] = 17'h0066a;
      expv[24] = 17'h1994d;
      expv[25] = 17'h0994d;
      expv[26] = 17'h0994d;
      expv[27] = 17'h0994d;
      expv[28] = 17'h1a755;
      expv[29] = 17'h0a755;
      expv[30] = 17'h0a755;
      expv[31] = 17'h14f28;
      expv[32] = 17'h04f28;
      expv[33] = 17'h04f28;
      expv[34] = 17'h190b0;
      expv[35] = 17'h090b0;
      expv[36] = 17'h166f7;
      expv[37] = 17'h066f7;
      expv[38] = 17'h066f7;
      expv[39] = 17'h066f7;
      expv[40] = 17'h066f7;
      expv[41] = 17'h154e9;
      expv[42] = 17'h054e9;
      expv[43] = 17'h1541a;
      expv[44] = 17'h0541a;
      expv[45] = 17'h0541a;
      expv[46] = 17'h0541a;
      expv[47] = 17'h0541a;
      expv[48] = 17'h0541a;
      expv[49] = 17'h0541a;
      expv[50] = 17'h0541a;
      expv[51] = 17'h1791d;
      expv[52] = 17'h0791d;
      expv[53] = 17'h1f3a9;
      expv[54] = 17'h0f3a9;
      expv[55] = 17'h1562d;
      expv[56] = 17'h0562d;
      expv[57] = 17'h0562d;
      expv[58] = 17'h0562d;
      expv[59] = 17'h0562d;
      expv[60] = 17'h0562d;
      expv[61] = 17'h1c92e;
      expv[62] = 17'h00000;
      expv[63] = 17'h00000;
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
