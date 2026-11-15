// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_045281 dut (
    .smp_clk(clk),
    .uart_rx(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .rx_status(out_vec[8:8]),
    .rx_data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h1;
    stim[1] = 2'h1;
    stim[2] = 2'h2;
    stim[3] = 2'h2;
    stim[4] = 2'h2;
    stim[5] = 2'h0;
    stim[6] = 2'h0;
    stim[7] = 2'h2;
    stim[8] = 2'h2;
    stim[9] = 2'h2;
    stim[10] = 2'h2;
    stim[11] = 2'h2;
    stim[12] = 2'h2;
    stim[13] = 2'h2;
    stim[14] = 2'h0;
    stim[15] = 2'h2;
    stim[16] = 2'h0;
    stim[17] = 2'h2;
    stim[18] = 2'h2;
    stim[19] = 2'h0;
    stim[20] = 2'h2;
    stim[21] = 2'h2;
    stim[22] = 2'h2;
    stim[23] = 2'h0;
    stim[24] = 2'h2;
    stim[25] = 2'h0;
    stim[26] = 2'h0;
    stim[27] = 2'h0;
    stim[28] = 2'h0;
    stim[29] = 2'h2;
    stim[30] = 2'h0;
    stim[31] = 2'h0;
    stim[32] = 2'h0;
    stim[33] = 2'h0;
    stim[34] = 2'h2;
    stim[35] = 2'h0;
    stim[36] = 2'h0;
    stim[37] = 2'h0;
    stim[38] = 2'h2;
    stim[39] = 2'h0;
    stim[40] = 2'h0;
    stim[41] = 2'h2;
    stim[42] = 2'h0;
    stim[43] = 2'h2;
    stim[44] = 2'h0;
    stim[45] = 2'h0;
    stim[46] = 2'h0;
    stim[47] = 2'h0;
    stim[48] = 2'h0;
    stim[49] = 2'h0;
    stim[50] = 2'h2;
    stim[51] = 2'h2;
    stim[52] = 2'h0;
    stim[53] = 2'h0;
    stim[54] = 2'h0;
    stim[55] = 2'h2;
    stim[56] = 2'h2;
    stim[57] = 2'h3;
    stim[58] = 2'h0;
    stim[59] = 2'h2;
    stim[60] = 2'h2;
    stim[61] = 2'h0;
    stim[62] = 2'h0;
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
      expv[0] = 9'h000;
      expv[1] = 9'h000;
      expv[2] = 9'h000;
      expv[3] = 9'h000;
      expv[4] = 9'h000;
      expv[5] = 9'h000;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h000;
      expv[9] = 9'h000;
      expv[10] = 9'h000;
      expv[11] = 9'h000;
      expv[12] = 9'h000;
      expv[13] = 9'h000;
      expv[14] = 9'h000;
      expv[15] = 9'h000;
      expv[16] = 9'h000;
      expv[17] = 9'h000;
      expv[18] = 9'h000;
      expv[19] = 9'h000;
      expv[20] = 9'h000;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h000;
      expv[24] = 9'h000;
      expv[25] = 9'h000;
      expv[26] = 9'h000;
      expv[27] = 9'h000;
      expv[28] = 9'h000;
      expv[29] = 9'h000;
      expv[30] = 9'h000;
      expv[31] = 9'h000;
      expv[32] = 9'h000;
      expv[33] = 9'h000;
      expv[34] = 9'h000;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h000;
      expv[38] = 9'h000;
      expv[39] = 9'h000;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h000;
      expv[43] = 9'h000;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h000;
      expv[47] = 9'h000;
      expv[48] = 9'h000;
      expv[49] = 9'h000;
      expv[50] = 9'h000;
      expv[51] = 9'h000;
      expv[52] = 9'h000;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h000;
      expv[57] = 9'h000;
      expv[58] = 9'h000;
      expv[59] = 9'h000;
      expv[60] = 9'h000;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
