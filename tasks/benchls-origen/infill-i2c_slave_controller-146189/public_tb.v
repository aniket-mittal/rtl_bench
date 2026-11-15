// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_146189 dut (
    .SCL(clk),
    .SDA(in_vec[1:1]),
    .i_reset(in_vec[0:0]),
    .o_busy(out_vec[9:9]),
    .o_error(out_vec[8:8]),
    .o_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h3;
    stim[1] = 2'h1;
    stim[2] = 2'h0;
    stim[3] = 2'h0;
    stim[4] = 2'h0;
    stim[5] = 2'h2;
    stim[6] = 2'h0;
    stim[7] = 2'h0;
    stim[8] = 2'h0;
    stim[9] = 2'h1;
    stim[10] = 2'h2;
    stim[11] = 2'h0;
    stim[12] = 2'h2;
    stim[13] = 2'h2;
    stim[14] = 2'h2;
    stim[15] = 2'h3;
    stim[16] = 2'h2;
    stim[17] = 2'h0;
    stim[18] = 2'h0;
    stim[19] = 2'h2;
    stim[20] = 2'h2;
    stim[21] = 2'h0;
    stim[22] = 2'h0;
    stim[23] = 2'h2;
    stim[24] = 2'h0;
    stim[25] = 2'h0;
    stim[26] = 2'h0;
    stim[27] = 2'h0;
    stim[28] = 2'h0;
    stim[29] = 2'h2;
    stim[30] = 2'h0;
    stim[31] = 2'h0;
    stim[32] = 2'h2;
    stim[33] = 2'h2;
    stim[34] = 2'h0;
    stim[35] = 2'h1;
    stim[36] = 2'h2;
    stim[37] = 2'h0;
    stim[38] = 2'h0;
    stim[39] = 2'h2;
    stim[40] = 2'h3;
    stim[41] = 2'h0;
    stim[42] = 2'h2;
    stim[43] = 2'h2;
    stim[44] = 2'h2;
    stim[45] = 2'h2;
    stim[46] = 2'h0;
    stim[47] = 2'h2;
    stim[48] = 2'h2;
    stim[49] = 2'h0;
    stim[50] = 2'h0;
    stim[51] = 2'h0;
    stim[52] = 2'h2;
    stim[53] = 2'h2;
    stim[54] = 2'h2;
    stim[55] = 2'h2;
    stim[56] = 2'h2;
    stim[57] = 2'h0;
    stim[58] = 2'h0;
    stim[59] = 2'h0;
    stim[60] = 2'h2;
    stim[61] = 2'h2;
    stim[62] = 2'h2;
    stim[63] = 2'h2;
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
      expv[0] = 10'h000;
      expv[1] = 10'h000;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h200;
      expv[5] = 10'h200;
      expv[6] = 10'h200;
      expv[7] = 10'h200;
      expv[8] = 10'h200;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h000;
      expv[13] = 10'h200;
      expv[14] = 10'h200;
      expv[15] = 10'h000;
      expv[16] = 10'h000;
      expv[17] = 10'h000;
      expv[18] = 10'h000;
      expv[19] = 10'h200;
      expv[20] = 10'h200;
      expv[21] = 10'h200;
      expv[22] = 10'h200;
      expv[23] = 10'h200;
      expv[24] = 10'h200;
      expv[25] = 10'h200;
      expv[26] = 10'h200;
      expv[27] = 10'h200;
      expv[28] = 10'h200;
      expv[29] = 10'h200;
      expv[30] = 10'h200;
      expv[31] = 10'h200;
      expv[32] = 10'h200;
      expv[33] = 10'h200;
      expv[34] = 10'h200;
      expv[35] = 10'h000;
      expv[36] = 10'h000;
      expv[37] = 10'h000;
      expv[38] = 10'h000;
      expv[39] = 10'h200;
      expv[40] = 10'h000;
      expv[41] = 10'h000;
      expv[42] = 10'h000;
      expv[43] = 10'h200;
      expv[44] = 10'h200;
      expv[45] = 10'h200;
      expv[46] = 10'h200;
      expv[47] = 10'h200;
      expv[48] = 10'h200;
      expv[49] = 10'h200;
      expv[50] = 10'h200;
      expv[51] = 10'h200;
      expv[52] = 10'h200;
      expv[53] = 10'h200;
      expv[54] = 10'h200;
      expv[55] = 10'h200;
      expv[56] = 10'h200;
      expv[57] = 10'h200;
      expv[58] = 10'h200;
      expv[59] = 10'h200;
      expv[60] = 10'h200;
      expv[61] = 10'h200;
      expv[62] = 10'h200;
      expv[63] = 10'h200;
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
