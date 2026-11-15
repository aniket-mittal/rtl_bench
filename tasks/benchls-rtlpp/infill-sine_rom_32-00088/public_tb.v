// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 19;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00088 dut (
    .clock(clk),
    .res(in_vec[0:0]),
    .counter_out(out_vec[18:14]),
    .sin_out(out_vec[13:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 1'h1;
    stim[1] = 1'h0;
    stim[2] = 1'h1;
    stim[3] = 1'h1;
    stim[4] = 1'h1;
    stim[5] = 1'h0;
    stim[6] = 1'h0;
    stim[7] = 1'h1;
    stim[8] = 1'h1;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h1;
    stim[12] = 1'h0;
    stim[13] = 1'h0;
    stim[14] = 1'h0;
    stim[15] = 1'h0;
    stim[16] = 1'h1;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h0;
    stim[20] = 1'h1;
    stim[21] = 1'h0;
    stim[22] = 1'h1;
    stim[23] = 1'h1;
    stim[24] = 1'h1;
    stim[25] = 1'h0;
    stim[26] = 1'h1;
    stim[27] = 1'h0;
    stim[28] = 1'h1;
    stim[29] = 1'h1;
    stim[30] = 1'h0;
    stim[31] = 1'h1;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h0;
    stim[35] = 1'h1;
    stim[36] = 1'h0;
    stim[37] = 1'h1;
    stim[38] = 1'h0;
    stim[39] = 1'h1;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h1;
    stim[43] = 1'h1;
    stim[44] = 1'h0;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h1;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h1;
    stim[52] = 1'h1;
    stim[53] = 1'h1;
    stim[54] = 1'h0;
    stim[55] = 1'h0;
    stim[56] = 1'h1;
    stim[57] = 1'h0;
    stim[58] = 1'h1;
    stim[59] = 1'h0;
    stim[60] = 1'h1;
    stim[61] = 1'h1;
    stim[62] = 1'h0;
    stim[63] = 1'h1;
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
      expv[0] = 19'h00000;
      expv[1] = 19'h066a7;
      expv[2] = 19'h00000;
      expv[3] = 19'h066a7;
      expv[4] = 19'h0ad04;
      expv[5] = 19'h0f2cf;
      expv[6] = 19'h137c8;
      expv[7] = 19'h00000;
      expv[8] = 19'h066a7;
      expv[9] = 19'h0ad04;
      expv[10] = 19'h0f2cf;
      expv[11] = 19'h00000;
      expv[12] = 19'h066a7;
      expv[13] = 19'h0ad04;
      expv[14] = 19'h0f2cf;
      expv[15] = 19'h137c8;
      expv[16] = 19'h00000;
      expv[17] = 19'h066a7;
      expv[18] = 19'h0ad04;
      expv[19] = 19'h0f2cf;
      expv[20] = 19'h00000;
      expv[21] = 19'h066a7;
      expv[22] = 19'h00000;
      expv[23] = 19'h066a7;
      expv[24] = 19'h0ad04;
      expv[25] = 19'h0f2cf;
      expv[26] = 19'h00000;
      expv[27] = 19'h066a7;
      expv[28] = 19'h00000;
      expv[29] = 19'h066a7;
      expv[30] = 19'h0ad04;
      expv[31] = 19'h00000;
      expv[32] = 19'h066a7;
      expv[33] = 19'h0ad04;
      expv[34] = 19'h0f2cf;
      expv[35] = 19'h00000;
      expv[36] = 19'h066a7;
      expv[37] = 19'h00000;
      expv[38] = 19'h066a7;
      expv[39] = 19'h00000;
      expv[40] = 19'h066a7;
      expv[41] = 19'h0ad04;
      expv[42] = 19'h00000;
      expv[43] = 19'h066a7;
      expv[44] = 19'h0ad04;
      expv[45] = 19'h0f2cf;
      expv[46] = 19'h137c8;
      expv[47] = 19'h00000;
      expv[48] = 19'h066a7;
      expv[49] = 19'h0ad04;
      expv[50] = 19'h0f2cf;
      expv[51] = 19'h00000;
      expv[52] = 19'h066a7;
      expv[53] = 19'h0ad04;
      expv[54] = 19'h0f2cf;
      expv[55] = 19'h137c8;
      expv[56] = 19'h00000;
      expv[57] = 19'h066a7;
      expv[58] = 19'h00000;
      expv[59] = 19'h066a7;
      expv[60] = 19'h00000;
      expv[61] = 19'h066a7;
      expv[62] = 19'h0ad04;
      expv[63] = 19'h00000;
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
