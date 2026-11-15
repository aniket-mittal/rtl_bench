// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_023539 dut (
    .CLOCK_50(clk),
    .ADC_DOUT(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .d_out(out_vec[14:3]),
    .ADC_CS_N(out_vec[2:2]),
    .ADC_SCLK(out_vec[1:1]),
    .ADC_DIN(out_vec[0:0])
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
    stim[2] = 2'h0;
    stim[3] = 2'h0;
    stim[4] = 2'h0;
    stim[5] = 2'h2;
    stim[6] = 2'h2;
    stim[7] = 2'h0;
    stim[8] = 2'h3;
    stim[9] = 2'h0;
    stim[10] = 2'h2;
    stim[11] = 2'h0;
    stim[12] = 2'h0;
    stim[13] = 2'h0;
    stim[14] = 2'h2;
    stim[15] = 2'h2;
    stim[16] = 2'h2;
    stim[17] = 2'h0;
    stim[18] = 2'h0;
    stim[19] = 2'h2;
    stim[20] = 2'h0;
    stim[21] = 2'h0;
    stim[22] = 2'h2;
    stim[23] = 2'h0;
    stim[24] = 2'h2;
    stim[25] = 2'h0;
    stim[26] = 2'h0;
    stim[27] = 2'h0;
    stim[28] = 2'h2;
    stim[29] = 2'h0;
    stim[30] = 2'h2;
    stim[31] = 2'h2;
    stim[32] = 2'h2;
    stim[33] = 2'h0;
    stim[34] = 2'h0;
    stim[35] = 2'h2;
    stim[36] = 2'h2;
    stim[37] = 2'h2;
    stim[38] = 2'h0;
    stim[39] = 2'h2;
    stim[40] = 2'h0;
    stim[41] = 2'h0;
    stim[42] = 2'h0;
    stim[43] = 2'h0;
    stim[44] = 2'h0;
    stim[45] = 2'h0;
    stim[46] = 2'h0;
    stim[47] = 2'h2;
    stim[48] = 2'h0;
    stim[49] = 2'h0;
    stim[50] = 2'h0;
    stim[51] = 2'h2;
    stim[52] = 2'h2;
    stim[53] = 2'h0;
    stim[54] = 2'h2;
    stim[55] = 2'h2;
    stim[56] = 2'h2;
    stim[57] = 2'h2;
    stim[58] = 2'h0;
    stim[59] = 2'h2;
    stim[60] = 2'h2;
    stim[61] = 2'h0;
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
      expv[0] = 15'h0005;
      expv[1] = 15'h0004;
      expv[2] = 15'h0004;
      expv[3] = 15'h0004;
      expv[4] = 15'h0004;
      expv[5] = 15'h0004;
      expv[6] = 15'h0004;
      expv[7] = 15'h0004;
      expv[8] = 15'h0004;
      expv[9] = 15'h0004;
      expv[10] = 15'h0004;
      expv[11] = 15'h0004;
      expv[12] = 15'h0004;
      expv[13] = 15'h0004;
      expv[14] = 15'h0004;
      expv[15] = 15'h0004;
      expv[16] = 15'h0004;
      expv[17] = 15'h0004;
      expv[18] = 15'h0004;
      expv[19] = 15'h0004;
      expv[20] = 15'h0004;
      expv[21] = 15'h0004;
      expv[22] = 15'h0004;
      expv[23] = 15'h0004;
      expv[24] = 15'h0004;
      expv[25] = 15'h0004;
      expv[26] = 15'h0000;
      expv[27] = 15'h0000;
      expv[28] = 15'h0000;
      expv[29] = 15'h0000;
      expv[30] = 15'h0002;
      expv[31] = 15'h0002;
      expv[32] = 15'h0002;
      expv[33] = 15'h0002;
      expv[34] = 15'h0000;
      expv[35] = 15'h0000;
      expv[36] = 15'h0000;
      expv[37] = 15'h0000;
      expv[38] = 15'h0001;
      expv[39] = 15'h0001;
      expv[40] = 15'h0001;
      expv[41] = 15'h0001;
      expv[42] = 15'h0001;
      expv[43] = 15'h0001;
      expv[44] = 15'h0001;
      expv[45] = 15'h0001;
      expv[46] = 15'h0003;
      expv[47] = 15'h0003;
      expv[48] = 15'h0003;
      expv[49] = 15'h0003;
      expv[50] = 15'h0001;
      expv[51] = 15'h0001;
      expv[52] = 15'h0001;
      expv[53] = 15'h0001;
      expv[54] = 15'h0000;
      expv[55] = 15'h0000;
      expv[56] = 15'h0000;
      expv[57] = 15'h0000;
      expv[58] = 15'h0000;
      expv[59] = 15'h0000;
      expv[60] = 15'h0000;
      expv[61] = 15'h0000;
      expv[62] = 15'h0002;
      expv[63] = 15'h0002;
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
