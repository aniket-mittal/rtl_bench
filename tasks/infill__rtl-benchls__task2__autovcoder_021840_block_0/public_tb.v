// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 12;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_021840 dut (
    .FPGA_CLK(clk),
    .SEG(out_vec[11:4]),
    .DIG(out_vec[3:0])
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
      expv[0] = 12'hxxe;
      expv[1] = 12'hxxe;
      expv[2] = 12'hxxe;
      expv[3] = 12'hxxe;
      expv[4] = 12'hxxe;
      expv[5] = 12'hxxe;
      expv[6] = 12'hxxe;
      expv[7] = 12'hxxe;
      expv[8] = 12'hxxe;
      expv[9] = 12'hxxe;
      expv[10] = 12'hxxe;
      expv[11] = 12'hxxe;
      expv[12] = 12'hxxe;
      expv[13] = 12'hxxe;
      expv[14] = 12'hxxe;
      expv[15] = 12'hxxe;
      expv[16] = 12'hxxe;
      expv[17] = 12'hxxe;
      expv[18] = 12'hxxe;
      expv[19] = 12'hxxe;
      expv[20] = 12'hxxe;
      expv[21] = 12'hxxe;
      expv[22] = 12'hxxe;
      expv[23] = 12'hxxe;
      expv[24] = 12'hxxe;
      expv[25] = 12'hxxe;
      expv[26] = 12'hxxe;
      expv[27] = 12'hxxe;
      expv[28] = 12'hxxe;
      expv[29] = 12'hxxe;
      expv[30] = 12'hxxe;
      expv[31] = 12'hxxe;
      expv[32] = 12'hxxe;
      expv[33] = 12'hxxe;
      expv[34] = 12'hxxe;
      expv[35] = 12'hxxe;
      expv[36] = 12'hxxe;
      expv[37] = 12'hxxe;
      expv[38] = 12'hxxe;
      expv[39] = 12'hxxe;
      expv[40] = 12'hxxe;
      expv[41] = 12'hxxe;
      expv[42] = 12'hxxe;
      expv[43] = 12'hxxe;
      expv[44] = 12'hxxe;
      expv[45] = 12'hxxe;
      expv[46] = 12'hxxe;
      expv[47] = 12'hxxe;
      expv[48] = 12'hxxe;
      expv[49] = 12'hxxe;
      expv[50] = 12'hxxe;
      expv[51] = 12'hxxe;
      expv[52] = 12'hxxe;
      expv[53] = 12'hxxe;
      expv[54] = 12'hxxe;
      expv[55] = 12'hxxe;
      expv[56] = 12'hxxe;
      expv[57] = 12'hxxe;
      expv[58] = 12'hxxe;
      expv[59] = 12'hxxe;
      expv[60] = 12'hxxe;
      expv[61] = 12'hxxe;
      expv[62] = 12'hxxe;
      expv[63] = 12'hxxe;
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
