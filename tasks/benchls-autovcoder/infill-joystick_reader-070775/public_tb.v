// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_070775 dut (
    .clk(clk),
    .JOY_DATA(in_vec[0:0]),
    .JOY_CLK(out_vec[17:17]),
    .JOY_LOAD(out_vec[16:16]),
    .JOYSTICK1(out_vec[15:0])
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
    stim[6] = 1'h0;
    stim[7] = 1'h1;
    stim[8] = 1'h1;
    stim[9] = 1'h0;
    stim[10] = 1'h0;
    stim[11] = 1'h1;
    stim[12] = 1'h1;
    stim[13] = 1'h0;
    stim[14] = 1'h1;
    stim[15] = 1'h1;
    stim[16] = 1'h0;
    stim[17] = 1'h0;
    stim[18] = 1'h0;
    stim[19] = 1'h0;
    stim[20] = 1'h1;
    stim[21] = 1'h1;
    stim[22] = 1'h0;
    stim[23] = 1'h1;
    stim[24] = 1'h1;
    stim[25] = 1'h0;
    stim[26] = 1'h0;
    stim[27] = 1'h1;
    stim[28] = 1'h1;
    stim[29] = 1'h0;
    stim[30] = 1'h0;
    stim[31] = 1'h0;
    stim[32] = 1'h0;
    stim[33] = 1'h0;
    stim[34] = 1'h1;
    stim[35] = 1'h0;
    stim[36] = 1'h0;
    stim[37] = 1'h0;
    stim[38] = 1'h0;
    stim[39] = 1'h0;
    stim[40] = 1'h1;
    stim[41] = 1'h0;
    stim[42] = 1'h1;
    stim[43] = 1'h1;
    stim[44] = 1'h1;
    stim[45] = 1'h0;
    stim[46] = 1'h0;
    stim[47] = 1'h0;
    stim[48] = 1'h0;
    stim[49] = 1'h0;
    stim[50] = 1'h0;
    stim[51] = 1'h0;
    stim[52] = 1'h0;
    stim[53] = 1'h1;
    stim[54] = 1'h0;
    stim[55] = 1'h1;
    stim[56] = 1'h0;
    stim[57] = 1'h0;
    stim[58] = 1'h1;
    stim[59] = 1'h0;
    stim[60] = 1'h0;
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
      expv[0] = 18'hxffff;
      expv[1] = 18'hxffff;
      expv[2] = 18'hxffff;
      expv[3] = 18'hxffff;
      expv[4] = 18'hxffff;
      expv[5] = 18'hxffff;
      expv[6] = 18'hxffff;
      expv[7] = 18'hxffff;
      expv[8] = 18'hxffff;
      expv[9] = 18'hxffff;
      expv[10] = 18'hxffff;
      expv[11] = 18'hxffff;
      expv[12] = 18'hxffff;
      expv[13] = 18'hxffff;
      expv[14] = 18'hxffff;
      expv[15] = 18'hxffff;
      expv[16] = 18'hxffff;
      expv[17] = 18'hxffff;
      expv[18] = 18'hxffff;
      expv[19] = 18'hxffff;
      expv[20] = 18'hxffff;
      expv[21] = 18'hxffff;
      expv[22] = 18'hxffff;
      expv[23] = 18'hxffff;
      expv[24] = 18'hxffff;
      expv[25] = 18'hxffff;
      expv[26] = 18'hxffff;
      expv[27] = 18'hxffff;
      expv[28] = 18'hxffff;
      expv[29] = 18'hxffff;
      expv[30] = 18'hxffff;
      expv[31] = 18'hxffff;
      expv[32] = 18'hxffff;
      expv[33] = 18'hxffff;
      expv[34] = 18'hxffff;
      expv[35] = 18'hxffff;
      expv[36] = 18'hxffff;
      expv[37] = 18'hxffff;
      expv[38] = 18'hxffff;
      expv[39] = 18'hxffff;
      expv[40] = 18'hxffff;
      expv[41] = 18'hxffff;
      expv[42] = 18'hxffff;
      expv[43] = 18'hxffff;
      expv[44] = 18'hxffff;
      expv[45] = 18'hxffff;
      expv[46] = 18'hxffff;
      expv[47] = 18'hxffff;
      expv[48] = 18'hxffff;
      expv[49] = 18'hxffff;
      expv[50] = 18'hxffff;
      expv[51] = 18'hxffff;
      expv[52] = 18'hxffff;
      expv[53] = 18'hxffff;
      expv[54] = 18'hxffff;
      expv[55] = 18'hxffff;
      expv[56] = 18'hxffff;
      expv[57] = 18'hxffff;
      expv[58] = 18'hxffff;
      expv[59] = 18'hxffff;
      expv[60] = 18'hxffff;
      expv[61] = 18'hxffff;
      expv[62] = 18'hxffff;
      expv[63] = 18'hxffff;
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
