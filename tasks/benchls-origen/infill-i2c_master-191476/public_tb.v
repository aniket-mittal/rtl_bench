// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 1;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_191476 dut (
    .sysclk(clk),
    .sda_in(in_vec[0:0]),
    .scl_out(out_vec[10:10]),
    .sda_out(out_vec[9:9]),
    .slave_ok(out_vec[8:8]),
    .result(out_vec[7:0])
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
    stim[1] = 1'h1;
    stim[2] = 1'h1;
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
    stim[14] = 1'h1;
    stim[15] = 1'h1;
    stim[16] = 1'h0;
    stim[17] = 1'h0;
    stim[18] = 1'h1;
    stim[19] = 1'h0;
    stim[20] = 1'h1;
    stim[21] = 1'h1;
    stim[22] = 1'h0;
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
    stim[34] = 1'h1;
    stim[35] = 1'h1;
    stim[36] = 1'h1;
    stim[37] = 1'h1;
    stim[38] = 1'h0;
    stim[39] = 1'h1;
    stim[40] = 1'h0;
    stim[41] = 1'h0;
    stim[42] = 1'h1;
    stim[43] = 1'h0;
    stim[44] = 1'h0;
    stim[45] = 1'h1;
    stim[46] = 1'h1;
    stim[47] = 1'h0;
    stim[48] = 1'h1;
    stim[49] = 1'h1;
    stim[50] = 1'h1;
    stim[51] = 1'h1;
    stim[52] = 1'h1;
    stim[53] = 1'h1;
    stim[54] = 1'h0;
    stim[55] = 1'h1;
    stim[56] = 1'h1;
    stim[57] = 1'h0;
    stim[58] = 1'h1;
    stim[59] = 1'h0;
    stim[60] = 1'h1;
    stim[61] = 1'h0;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'hxxx;
      expv[2] = 11'hxxx;
      expv[3] = 11'hxxx;
      expv[4] = 11'hxxx;
      expv[5] = 11'hxxx;
      expv[6] = 11'hxxx;
      expv[7] = 11'hxxx;
      expv[8] = 11'hxxx;
      expv[9] = 11'hxxx;
      expv[10] = 11'hxxx;
      expv[11] = 11'hxxx;
      expv[12] = 11'hxxx;
      expv[13] = 11'h6xx;
      expv[14] = 11'h6xx;
      expv[15] = 11'h6xx;
      expv[16] = 11'h2xx;
      expv[17] = 11'h2xx;
      expv[18] = 11'h2xx;
      expv[19] = 11'h2xx;
      expv[20] = 11'h2xx;
      expv[21] = 11'h2xx;
      expv[22] = 11'h2xx;
      expv[23] = 11'h2xx;
      expv[24] = 11'h2xx;
      expv[25] = 11'h4xx;
      expv[26] = 11'h4xx;
      expv[27] = 11'h4xx;
      expv[28] = 11'h4xx;
      expv[29] = 11'h0xx;
      expv[30] = 11'h0xx;
      expv[31] = 11'h0xx;
      expv[32] = 11'h0xx;
      expv[33] = 11'h0xx;
      expv[34] = 11'h0xx;
      expv[35] = 11'h0xx;
      expv[36] = 11'h0xx;
      expv[37] = 11'h0xx;
      expv[38] = 11'h6xx;
      expv[39] = 11'h6xx;
      expv[40] = 11'h6xx;
      expv[41] = 11'h6xx;
      expv[42] = 11'h250;
      expv[43] = 11'h450;
      expv[44] = 11'h450;
      expv[45] = 11'h250;
      expv[46] = 11'h250;
      expv[47] = 11'h250;
      expv[48] = 11'h250;
      expv[49] = 11'h250;
      expv[50] = 11'h250;
      expv[51] = 11'h250;
      expv[52] = 11'h250;
      expv[53] = 11'h250;
      expv[54] = 11'h750;
      expv[55] = 11'h750;
      expv[56] = 11'h750;
      expv[57] = 11'h350;
      expv[58] = 11'h350;
      expv[59] = 11'h350;
      expv[60] = 11'h350;
      expv[61] = 11'h350;
      expv[62] = 11'h350;
      expv[63] = 11'h350;
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
