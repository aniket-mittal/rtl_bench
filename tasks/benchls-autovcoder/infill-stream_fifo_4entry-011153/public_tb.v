// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_011153 dut (
    .io_axiClk(clk),
    .io_push_valid(in_vec[3:3]),
    .io_pop_ready(in_vec[2:2]),
    .io_flush(in_vec[1:1]),
    .resetCtrl_axiReset(in_vec[0:0]),
    .io_push_ready(out_vec[4:4]),
    .io_pop_valid(out_vec[3:3]),
    .io_occupancy(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'h7;
    stim[1] = 4'h7;
    stim[2] = 4'hc;
    stim[3] = 4'h0;
    stim[4] = 4'h6;
    stim[5] = 4'h0;
    stim[6] = 4'h0;
    stim[7] = 4'h4;
    stim[8] = 4'hc;
    stim[9] = 4'ha;
    stim[10] = 4'hc;
    stim[11] = 4'h6;
    stim[12] = 4'h2;
    stim[13] = 4'h0;
    stim[14] = 4'he;
    stim[15] = 4'h0;
    stim[16] = 4'h6;
    stim[17] = 4'h2;
    stim[18] = 4'h6;
    stim[19] = 4'h2;
    stim[20] = 4'ha;
    stim[21] = 4'h2;
    stim[22] = 4'h4;
    stim[23] = 4'h6;
    stim[24] = 4'ha;
    stim[25] = 4'hc;
    stim[26] = 4'h4;
    stim[27] = 4'h2;
    stim[28] = 4'h2;
    stim[29] = 4'he;
    stim[30] = 4'h6;
    stim[31] = 4'h0;
    stim[32] = 4'h4;
    stim[33] = 4'h0;
    stim[34] = 4'ha;
    stim[35] = 4'h8;
    stim[36] = 4'hc;
    stim[37] = 4'hc;
    stim[38] = 4'h2;
    stim[39] = 4'h4;
    stim[40] = 4'h8;
    stim[41] = 4'ha;
    stim[42] = 4'ha;
    stim[43] = 4'he;
    stim[44] = 4'h8;
    stim[45] = 4'h0;
    stim[46] = 4'h2;
    stim[47] = 4'h4;
    stim[48] = 4'ha;
    stim[49] = 4'h4;
    stim[50] = 4'hc;
    stim[51] = 4'h6;
    stim[52] = 4'h6;
    stim[53] = 4'h0;
    stim[54] = 4'h2;
    stim[55] = 4'h6;
    stim[56] = 4'h4;
    stim[57] = 4'h2;
    stim[58] = 4'h4;
    stim[59] = 4'h4;
    stim[60] = 4'h2;
    stim[61] = 4'ha;
    stim[62] = 4'h4;
    stim[63] = 4'h0;
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
      expv[0] = 5'h10;
      expv[1] = 5'h10;
      expv[2] = 5'h18;
      expv[3] = 5'h10;
      expv[4] = 5'h10;
      expv[5] = 5'h10;
      expv[6] = 5'h10;
      expv[7] = 5'h10;
      expv[8] = 5'h18;
      expv[9] = 5'h18;
      expv[10] = 5'h18;
      expv[11] = 5'h10;
      expv[12] = 5'h10;
      expv[13] = 5'h10;
      expv[14] = 5'h18;
      expv[15] = 5'h10;
      expv[16] = 5'h10;
      expv[17] = 5'h10;
      expv[18] = 5'h10;
      expv[19] = 5'h10;
      expv[20] = 5'h18;
      expv[21] = 5'h10;
      expv[22] = 5'h10;
      expv[23] = 5'h10;
      expv[24] = 5'h18;
      expv[25] = 5'h18;
      expv[26] = 5'h10;
      expv[27] = 5'h10;
      expv[28] = 5'h10;
      expv[29] = 5'h18;
      expv[30] = 5'h10;
      expv[31] = 5'h10;
      expv[32] = 5'h10;
      expv[33] = 5'h10;
      expv[34] = 5'h18;
      expv[35] = 5'h18;
      expv[36] = 5'h19;
      expv[37] = 5'h19;
      expv[38] = 5'h19;
      expv[39] = 5'h10;
      expv[40] = 5'h18;
      expv[41] = 5'h19;
      expv[42] = 5'h18;
      expv[43] = 5'h18;
      expv[44] = 5'h18;
      expv[45] = 5'h19;
      expv[46] = 5'h19;
      expv[47] = 5'h10;
      expv[48] = 5'h18;
      expv[49] = 5'h10;
      expv[50] = 5'h18;
      expv[51] = 5'h10;
      expv[52] = 5'h10;
      expv[53] = 5'h10;
      expv[54] = 5'h10;
      expv[55] = 5'h10;
      expv[56] = 5'h10;
      expv[57] = 5'h10;
      expv[58] = 5'h10;
      expv[59] = 5'h10;
      expv[60] = 5'h10;
      expv[61] = 5'h18;
      expv[62] = 5'h10;
      expv[63] = 5'h10;
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
