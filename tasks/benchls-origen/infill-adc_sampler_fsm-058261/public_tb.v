// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_058261 dut (
    .clock(clk),
    .reset(in_vec[2:2]),
    .start(in_vec[1:1]),
    .SDO(in_vec[0:0]),
    .CLK(out_vec[19:19]),
    .CNV(out_vec[18:18]),
    .SDI(out_vec[17:17]),
    .sample_rdy(out_vec[16:16]),
    .ADC_sample(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h5;
    stim[1] = 3'h5;
    stim[2] = 3'h0;
    stim[3] = 3'h1;
    stim[4] = 3'h2;
    stim[5] = 3'h3;
    stim[6] = 3'h0;
    stim[7] = 3'h3;
    stim[8] = 3'h0;
    stim[9] = 3'h3;
    stim[10] = 3'h1;
    stim[11] = 3'h2;
    stim[12] = 3'h2;
    stim[13] = 3'h1;
    stim[14] = 3'h1;
    stim[15] = 3'h3;
    stim[16] = 3'h3;
    stim[17] = 3'h2;
    stim[18] = 3'h0;
    stim[19] = 3'h1;
    stim[20] = 3'h3;
    stim[21] = 3'h0;
    stim[22] = 3'h1;
    stim[23] = 3'h2;
    stim[24] = 3'h1;
    stim[25] = 3'h1;
    stim[26] = 3'h2;
    stim[27] = 3'h2;
    stim[28] = 3'h3;
    stim[29] = 3'h0;
    stim[30] = 3'h0;
    stim[31] = 3'h0;
    stim[32] = 3'h3;
    stim[33] = 3'h0;
    stim[34] = 3'h0;
    stim[35] = 3'h3;
    stim[36] = 3'h0;
    stim[37] = 3'h1;
    stim[38] = 3'h1;
    stim[39] = 3'h3;
    stim[40] = 3'h3;
    stim[41] = 3'h0;
    stim[42] = 3'h3;
    stim[43] = 3'h3;
    stim[44] = 3'h3;
    stim[45] = 3'h2;
    stim[46] = 3'h1;
    stim[47] = 3'h1;
    stim[48] = 3'h2;
    stim[49] = 3'h0;
    stim[50] = 3'h3;
    stim[51] = 3'h0;
    stim[52] = 3'h1;
    stim[53] = 3'h1;
    stim[54] = 3'h2;
    stim[55] = 3'h0;
    stim[56] = 3'h0;
    stim[57] = 3'h3;
    stim[58] = 3'h1;
    stim[59] = 3'h2;
    stim[60] = 3'h0;
    stim[61] = 3'h2;
    stim[62] = 3'h2;
    stim[63] = 3'h2;
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
      expv[0] = 20'h00000;
      expv[1] = 20'h00000;
      expv[2] = 20'h00000;
      expv[3] = 20'h00000;
      expv[4] = 20'h00000;
      expv[5] = 20'h00000;
      expv[6] = 20'h40000;
      expv[7] = 20'h80000;
      expv[8] = 20'h80000;
      expv[9] = 20'h80000;
      expv[10] = 20'h80000;
      expv[11] = 20'h80000;
      expv[12] = 20'h80000;
      expv[13] = 20'h80000;
      expv[14] = 20'h80000;
      expv[15] = 20'h80000;
      expv[16] = 20'h80000;
      expv[17] = 20'h80000;
      expv[18] = 20'h80000;
      expv[19] = 20'h80000;
      expv[20] = 20'h80000;
      expv[21] = 20'h80000;
      expv[22] = 20'h80000;
      expv[23] = 20'h80000;
      expv[24] = 20'h80000;
      expv[25] = 20'h80000;
      expv[26] = 20'h80000;
      expv[27] = 20'h1cf35;
      expv[28] = 20'h0cf35;
      expv[29] = 20'h4cf35;
      expv[30] = 20'h8cf35;
      expv[31] = 20'h8cf35;
      expv[32] = 20'h8cf35;
      expv[33] = 20'h8cf35;
      expv[34] = 20'h8cf35;
      expv[35] = 20'h8cf35;
      expv[36] = 20'h8cf35;
      expv[37] = 20'h8cf35;
      expv[38] = 20'h8cf35;
      expv[39] = 20'h8cf35;
      expv[40] = 20'h8cf35;
      expv[41] = 20'h8cf35;
      expv[42] = 20'h8cf35;
      expv[43] = 20'h8cf35;
      expv[44] = 20'h8cf35;
      expv[45] = 20'h8cf35;
      expv[46] = 20'h8cf35;
      expv[47] = 20'h8cf35;
      expv[48] = 20'h8cf35;
      expv[49] = 20'h8cf35;
      expv[50] = 20'h197bb;
      expv[51] = 20'h097bb;
      expv[52] = 20'h497bb;
      expv[53] = 20'h897bb;
      expv[54] = 20'h897bb;
      expv[55] = 20'h897bb;
      expv[56] = 20'h897bb;
      expv[57] = 20'h897bb;
      expv[58] = 20'h897bb;
      expv[59] = 20'h897bb;
      expv[60] = 20'h897bb;
      expv[61] = 20'h897bb;
      expv[62] = 20'h897bb;
      expv[63] = 20'h897bb;
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
