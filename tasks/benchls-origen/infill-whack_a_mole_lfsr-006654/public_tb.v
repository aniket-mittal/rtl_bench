// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_006654 dut (
    .clk(clk),
    .rst_n(in_vec[0:0]),
    .mole_location(out_vec[15:0])
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
    stim[2] = 1'h1;
    stim[3] = 1'h1;
    stim[4] = 1'h1;
    stim[5] = 1'h1;
    stim[6] = 1'h1;
    stim[7] = 1'h1;
    stim[8] = 1'h1;
    stim[9] = 1'h1;
    stim[10] = 1'h1;
    stim[11] = 1'h1;
    stim[12] = 1'h1;
    stim[13] = 1'h1;
    stim[14] = 1'h1;
    stim[15] = 1'h1;
    stim[16] = 1'h1;
    stim[17] = 1'h1;
    stim[18] = 1'h1;
    stim[19] = 1'h1;
    stim[20] = 1'h1;
    stim[21] = 1'h1;
    stim[22] = 1'h1;
    stim[23] = 1'h1;
    stim[24] = 1'h1;
    stim[25] = 1'h0;
    stim[26] = 1'h1;
    stim[27] = 1'h1;
    stim[28] = 1'h1;
    stim[29] = 1'h1;
    stim[30] = 1'h1;
    stim[31] = 1'h1;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h1;
    stim[35] = 1'h1;
    stim[36] = 1'h1;
    stim[37] = 1'h1;
    stim[38] = 1'h1;
    stim[39] = 1'h1;
    stim[40] = 1'h1;
    stim[41] = 1'h1;
    stim[42] = 1'h1;
    stim[43] = 1'h0;
    stim[44] = 1'h1;
    stim[45] = 1'h1;
    stim[46] = 1'h1;
    stim[47] = 1'h1;
    stim[48] = 1'h1;
    stim[49] = 1'h1;
    stim[50] = 1'h1;
    stim[51] = 1'h1;
    stim[52] = 1'h1;
    stim[53] = 1'h1;
    stim[54] = 1'h1;
    stim[55] = 1'h1;
    stim[56] = 1'h1;
    stim[57] = 1'h1;
    stim[58] = 1'h1;
    stim[59] = 1'h1;
    stim[60] = 1'h1;
    stim[61] = 1'h1;
    stim[62] = 1'h1;
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
      expv[0] = 16'h0001;
      expv[1] = 16'h0001;
      expv[2] = 16'h0001;
      expv[3] = 16'hffff;
      expv[4] = 16'h4000;
      expv[5] = 16'h1000;
      expv[6] = 16'h0100;
      expv[7] = 16'h0002;
      expv[8] = 16'h0008;
      expv[9] = 16'h0040;
      expv[10] = 16'h2000;
      expv[11] = 16'h0800;
      expv[12] = 16'h0080;
      expv[13] = 16'h4000;
      expv[14] = 16'h2000;
      expv[15] = 16'h0400;
      expv[16] = 16'h0020;
      expv[17] = 16'h0400;
      expv[18] = 16'h0010;
      expv[19] = 16'h0100;
      expv[20] = 16'h0001;
      expv[21] = 16'h0002;
      expv[22] = 16'h0004;
      expv[23] = 16'h0010;
      expv[24] = 16'h0200;
      expv[25] = 16'h0001;
      expv[26] = 16'h0001;
      expv[27] = 16'hffff;
      expv[28] = 16'h4000;
      expv[29] = 16'h1000;
      expv[30] = 16'h0100;
      expv[31] = 16'h0002;
      expv[32] = 16'h0001;
      expv[33] = 16'h0001;
      expv[34] = 16'h0001;
      expv[35] = 16'hffff;
      expv[36] = 16'h4000;
      expv[37] = 16'h1000;
      expv[38] = 16'h0100;
      expv[39] = 16'h0002;
      expv[40] = 16'h0008;
      expv[41] = 16'h0040;
      expv[42] = 16'h2000;
      expv[43] = 16'h0001;
      expv[44] = 16'h0001;
      expv[45] = 16'hffff;
      expv[46] = 16'h4000;
      expv[47] = 16'h1000;
      expv[48] = 16'h0100;
      expv[49] = 16'h0002;
      expv[50] = 16'h0008;
      expv[51] = 16'h0040;
      expv[52] = 16'h2000;
      expv[53] = 16'h0800;
      expv[54] = 16'h0080;
      expv[55] = 16'h4000;
      expv[56] = 16'h2000;
      expv[57] = 16'h0400;
      expv[58] = 16'h0020;
      expv[59] = 16'h0400;
      expv[60] = 16'h0010;
      expv[61] = 16'h0100;
      expv[62] = 16'h0001;
      expv[63] = 16'h0002;
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
