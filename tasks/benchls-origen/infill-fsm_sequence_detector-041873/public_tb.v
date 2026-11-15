// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_041873 dut (
    .clk(clk),
    .reset_b(in_vec[2:2]),
    .in_x(in_vec[1:1]),
    .in_y(in_vec[0:0]),
    .out_z(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h0;
    stim[1] = 3'h3;
    stim[2] = 3'h4;
    stim[3] = 3'h6;
    stim[4] = 3'h5;
    stim[5] = 3'h4;
    stim[6] = 3'h6;
    stim[7] = 3'h7;
    stim[8] = 3'h5;
    stim[9] = 3'h5;
    stim[10] = 3'h7;
    stim[11] = 3'h6;
    stim[12] = 3'h4;
    stim[13] = 3'h5;
    stim[14] = 3'h5;
    stim[15] = 3'h4;
    stim[16] = 3'h4;
    stim[17] = 3'h5;
    stim[18] = 3'h6;
    stim[19] = 3'h5;
    stim[20] = 3'h6;
    stim[21] = 3'h6;
    stim[22] = 3'h4;
    stim[23] = 3'h6;
    stim[24] = 3'h7;
    stim[25] = 3'h7;
    stim[26] = 3'h6;
    stim[27] = 3'h7;
    stim[28] = 3'h7;
    stim[29] = 3'h6;
    stim[30] = 3'h2;
    stim[31] = 3'h6;
    stim[32] = 3'h5;
    stim[33] = 3'h5;
    stim[34] = 3'h5;
    stim[35] = 3'h7;
    stim[36] = 3'h7;
    stim[37] = 3'h4;
    stim[38] = 3'h7;
    stim[39] = 3'h7;
    stim[40] = 3'h5;
    stim[41] = 3'h2;
    stim[42] = 3'h7;
    stim[43] = 3'h7;
    stim[44] = 3'h7;
    stim[45] = 3'h4;
    stim[46] = 3'h6;
    stim[47] = 3'h4;
    stim[48] = 3'h5;
    stim[49] = 3'h4;
    stim[50] = 3'h6;
    stim[51] = 3'h7;
    stim[52] = 3'h5;
    stim[53] = 3'h5;
    stim[54] = 3'h6;
    stim[55] = 3'h6;
    stim[56] = 3'h4;
    stim[57] = 3'h7;
    stim[58] = 3'h6;
    stim[59] = 3'h4;
    stim[60] = 3'h5;
    stim[61] = 3'h5;
    stim[62] = 3'h6;
    stim[63] = 3'h6;
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
      expv[0] = 1'h0;
      expv[1] = 1'h0;
      expv[2] = 1'h0;
      expv[3] = 1'h0;
      expv[4] = 1'h1;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h1;
      expv[8] = 1'h1;
      expv[9] = 1'h0;
      expv[10] = 1'h0;
      expv[11] = 1'h0;
      expv[12] = 1'h1;
      expv[13] = 1'h0;
      expv[14] = 1'h0;
      expv[15] = 1'h0;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h1;
      expv[20] = 1'h0;
      expv[21] = 1'h1;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h1;
      expv[25] = 1'h1;
      expv[26] = 1'h1;
      expv[27] = 1'h1;
      expv[28] = 1'h1;
      expv[29] = 1'h1;
      expv[30] = 1'h0;
      expv[31] = 1'h0;
      expv[32] = 1'h1;
      expv[33] = 1'h0;
      expv[34] = 1'h0;
      expv[35] = 1'h0;
      expv[36] = 1'h0;
      expv[37] = 1'h1;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h1;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h0;
      expv[44] = 1'h1;
      expv[45] = 1'h1;
      expv[46] = 1'h0;
      expv[47] = 1'h1;
      expv[48] = 1'h0;
      expv[49] = 1'h0;
      expv[50] = 1'h0;
      expv[51] = 1'h1;
      expv[52] = 1'h1;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h1;
      expv[56] = 1'h1;
      expv[57] = 1'h0;
      expv[58] = 1'h0;
      expv[59] = 1'h1;
      expv[60] = 1'h0;
      expv[61] = 1'h0;
      expv[62] = 1'h0;
      expv[63] = 1'h1;
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
