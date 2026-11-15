// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_06420 dut (
    .o1(out_vec[47:44]),
    .o2(out_vec[43:40]),
    .o3(out_vec[39:36]),
    .o4(out_vec[35:32]),
    .o5(out_vec[31:28]),
    .o6(out_vec[27:24]),
    .o7(out_vec[23:20]),
    .o8(out_vec[19:16]),
    .o9(out_vec[15:12]),
    .yay1(out_vec[11:9]),
    .nay1(out_vec[8:6]),
    .yay2(out_vec[5:3]),
    .nay2(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h0;
    stim[1] = 1'h0;
    stim[2] = 1'h0;
    stim[3] = 1'h0;
    stim[4] = 1'h0;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h0;
    stim[8] = 1'h0;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h0;
    stim[12] = 1'h0;
    stim[13] = 1'h0;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h0;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h0;
    stim[20] = 1'h0;
    stim[21] = 1'h0;
    stim[22] = 1'h0;
    stim[23] = 1'h0;
    stim[24] = 1'h0;
    stim[25] = 1'h0;
    stim[26] = 1'h0;
    stim[27] = 1'h0;
    stim[28] = 1'h0;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h0;
    stim[35] = 1'h0;
    stim[36] = 1'h0;
    stim[37] = 1'h0;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h0;
    stim[43] = 1'h0;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h0;
    stim[54] = 1'h0;
    stim[55] = 1'h0;
    stim[56] = 1'h0;
    stim[57] = 1'h0;
    stim[58] = 1'h0;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
    stim[61] = 1'h0;
    stim[62] = 1'h0;
    stim[63] = 1'h0;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 48'h11ffeccdfe72;
      expv[1] = 48'h11ffeccdfe72;
      expv[2] = 48'h11ffeccdfe72;
      expv[3] = 48'h11ffeccdfe72;
      expv[4] = 48'h11ffeccdfe72;
      expv[5] = 48'h11ffeccdfe72;
      expv[6] = 48'h11ffeccdfe72;
      expv[7] = 48'h11ffeccdfe72;
      expv[8] = 48'h11ffeccdfe72;
      expv[9] = 48'h11ffeccdfe72;
      expv[10] = 48'h11ffeccdfe72;
      expv[11] = 48'h11ffeccdfe72;
      expv[12] = 48'h11ffeccdfe72;
      expv[13] = 48'h11ffeccdfe72;
      expv[14] = 48'h11ffeccdfe72;
      expv[15] = 48'h11ffeccdfe72;
      expv[16] = 48'h11ffeccdfe72;
      expv[17] = 48'h11ffeccdfe72;
      expv[18] = 48'h11ffeccdfe72;
      expv[19] = 48'h11ffeccdfe72;
      expv[20] = 48'h11ffeccdfe72;
      expv[21] = 48'h11ffeccdfe72;
      expv[22] = 48'h11ffeccdfe72;
      expv[23] = 48'h11ffeccdfe72;
      expv[24] = 48'h11ffeccdfe72;
      expv[25] = 48'h11ffeccdfe72;
      expv[26] = 48'h11ffeccdfe72;
      expv[27] = 48'h11ffeccdfe72;
      expv[28] = 48'h11ffeccdfe72;
      expv[29] = 48'h11ffeccdfe72;
      expv[30] = 48'h11ffeccdfe72;
      expv[31] = 48'h11ffeccdfe72;
      expv[32] = 48'h11ffeccdfe72;
      expv[33] = 48'h11ffeccdfe72;
      expv[34] = 48'h11ffeccdfe72;
      expv[35] = 48'h11ffeccdfe72;
      expv[36] = 48'h11ffeccdfe72;
      expv[37] = 48'h11ffeccdfe72;
      expv[38] = 48'h11ffeccdfe72;
      expv[39] = 48'h11ffeccdfe72;
      expv[40] = 48'h11ffeccdfe72;
      expv[41] = 48'h11ffeccdfe72;
      expv[42] = 48'h11ffeccdfe72;
      expv[43] = 48'h11ffeccdfe72;
      expv[44] = 48'h11ffeccdfe72;
      expv[45] = 48'h11ffeccdfe72;
      expv[46] = 48'h11ffeccdfe72;
      expv[47] = 48'h11ffeccdfe72;
      expv[48] = 48'h11ffeccdfe72;
      expv[49] = 48'h11ffeccdfe72;
      expv[50] = 48'h11ffeccdfe72;
      expv[51] = 48'h11ffeccdfe72;
      expv[52] = 48'h11ffeccdfe72;
      expv[53] = 48'h11ffeccdfe72;
      expv[54] = 48'h11ffeccdfe72;
      expv[55] = 48'h11ffeccdfe72;
      expv[56] = 48'h11ffeccdfe72;
      expv[57] = 48'h11ffeccdfe72;
      expv[58] = 48'h11ffeccdfe72;
      expv[59] = 48'h11ffeccdfe72;
      expv[60] = 48'h11ffeccdfe72;
      expv[61] = 48'h11ffeccdfe72;
      expv[62] = 48'h11ffeccdfe72;
      expv[63] = 48'h11ffeccdfe72;
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
