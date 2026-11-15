// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_209089 dut (
    .clk(clk),
    .rst(in_vec[4:4]),
    .initializeFinished(in_vec[3:3]),
    .sortFinished(in_vec[2:2]),
    .crossFinished(in_vec[1:1]),
    .networkFinished(in_vec[0:0]),
    .networkState(out_vec[33:32]),
    .generationCounter(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h16;
    stim[1] = 5'h14;
    stim[2] = 5'h00;
    stim[3] = 5'h02;
    stim[4] = 5'h0f;
    stim[5] = 5'h0c;
    stim[6] = 5'h0b;
    stim[7] = 5'h03;
    stim[8] = 5'h06;
    stim[9] = 5'h0b;
    stim[10] = 5'h0d;
    stim[11] = 5'h03;
    stim[12] = 5'h0f;
    stim[13] = 5'h04;
    stim[14] = 5'h0a;
    stim[15] = 5'h06;
    stim[16] = 5'h0d;
    stim[17] = 5'h07;
    stim[18] = 5'h0e;
    stim[19] = 5'h05;
    stim[20] = 5'h00;
    stim[21] = 5'h06;
    stim[22] = 5'h09;
    stim[23] = 5'h08;
    stim[24] = 5'h02;
    stim[25] = 5'h0b;
    stim[26] = 5'h00;
    stim[27] = 5'h06;
    stim[28] = 5'h08;
    stim[29] = 5'h06;
    stim[30] = 5'h03;
    stim[31] = 5'h0b;
    stim[32] = 5'h08;
    stim[33] = 5'h05;
    stim[34] = 5'h12;
    stim[35] = 5'h0f;
    stim[36] = 5'h05;
    stim[37] = 5'h07;
    stim[38] = 5'h07;
    stim[39] = 5'h0d;
    stim[40] = 5'h01;
    stim[41] = 5'h04;
    stim[42] = 5'h01;
    stim[43] = 5'h05;
    stim[44] = 5'h0a;
    stim[45] = 5'h0a;
    stim[46] = 5'h0f;
    stim[47] = 5'h0c;
    stim[48] = 5'h0b;
    stim[49] = 5'h0c;
    stim[50] = 5'h0d;
    stim[51] = 5'h05;
    stim[52] = 5'h00;
    stim[53] = 5'h02;
    stim[54] = 5'h01;
    stim[55] = 5'h0d;
    stim[56] = 5'h05;
    stim[57] = 5'h01;
    stim[58] = 5'h08;
    stim[59] = 5'h05;
    stim[60] = 5'h08;
    stim[61] = 5'h09;
    stim[62] = 5'h0a;
    stim[63] = 5'h0b;
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
      expv[0] = 34'h000000000;
      expv[1] = 34'h000000000;
      expv[2] = 34'h000000000;
      expv[3] = 34'h000000000;
      expv[4] = 34'h000000000;
      expv[5] = 34'h100000000;
      expv[6] = 34'h100000000;
      expv[7] = 34'h200000000;
      expv[8] = 34'h200000000;
      expv[9] = 34'h300000000;
      expv[10] = 34'h100000001;
      expv[11] = 34'h200000001;
      expv[12] = 34'h200000001;
      expv[13] = 34'h300000001;
      expv[14] = 34'h300000001;
      expv[15] = 34'h100000002;
      expv[16] = 34'h100000002;
      expv[17] = 34'h200000002;
      expv[18] = 34'h300000002;
      expv[19] = 34'h100000003;
      expv[20] = 34'h200000003;
      expv[21] = 34'h200000003;
      expv[22] = 34'h300000003;
      expv[23] = 34'h300000003;
      expv[24] = 34'h300000003;
      expv[25] = 34'h100000004;
      expv[26] = 34'h200000004;
      expv[27] = 34'h200000004;
      expv[28] = 34'h300000004;
      expv[29] = 34'h300000004;
      expv[30] = 34'h100000005;
      expv[31] = 34'h200000005;
      expv[32] = 34'h200000005;
      expv[33] = 34'h200000005;
      expv[34] = 34'h000000000;
      expv[35] = 34'h000000000;
      expv[36] = 34'h100000000;
      expv[37] = 34'h200000000;
      expv[38] = 34'h300000000;
      expv[39] = 34'h100000001;
      expv[40] = 34'h200000001;
      expv[41] = 34'h200000001;
      expv[42] = 34'h300000001;
      expv[43] = 34'h300000001;
      expv[44] = 34'h300000001;
      expv[45] = 34'h100000002;
      expv[46] = 34'h100000002;
      expv[47] = 34'h200000002;
      expv[48] = 34'h300000002;
      expv[49] = 34'h100000003;
      expv[50] = 34'h100000003;
      expv[51] = 34'h200000003;
      expv[52] = 34'h300000003;
      expv[53] = 34'h300000003;
      expv[54] = 34'h100000004;
      expv[55] = 34'h200000004;
      expv[56] = 34'h300000004;
      expv[57] = 34'h300000004;
      expv[58] = 34'h300000004;
      expv[59] = 34'h300000004;
      expv[60] = 34'h300000004;
      expv[61] = 34'h300000004;
      expv[62] = 34'h300000004;
      expv[63] = 34'h100000005;
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
