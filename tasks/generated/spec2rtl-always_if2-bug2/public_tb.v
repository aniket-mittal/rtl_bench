// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .cpu_overheated(in_vec[2:2]),
    .arrived(in_vec[1:1]),
    .gas_tank_empty(in_vec[0:0]),
    .shut_off_computer(out_vec[1:1]),
    .keep_driving(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h7;
    stim[1] = 3'h5;
    stim[2] = 3'h2;
    stim[3] = 3'h6;
    stim[4] = 3'h4;
    stim[5] = 3'h7;
    stim[6] = 3'h4;
    stim[7] = 3'h0;
    stim[8] = 3'h2;
    stim[9] = 3'h0;
    stim[10] = 3'h2;
    stim[11] = 3'h7;
    stim[12] = 3'h6;
    stim[13] = 3'h6;
    stim[14] = 3'h2;
    stim[15] = 3'h7;
    stim[16] = 3'h7;
    stim[17] = 3'h5;
    stim[18] = 3'h7;
    stim[19] = 3'h4;
    stim[20] = 3'h0;
    stim[21] = 3'h4;
    stim[22] = 3'h6;
    stim[23] = 3'h5;
    stim[24] = 3'h4;
    stim[25] = 3'h1;
    stim[26] = 3'h4;
    stim[27] = 3'h0;
    stim[28] = 3'h2;
    stim[29] = 3'h6;
    stim[30] = 3'h5;
    stim[31] = 3'h2;
    stim[32] = 3'h4;
    stim[33] = 3'h7;
    stim[34] = 3'h1;
    stim[35] = 3'h7;
    stim[36] = 3'h5;
    stim[37] = 3'h3;
    stim[38] = 3'h2;
    stim[39] = 3'h3;
    stim[40] = 3'h3;
    stim[41] = 3'h7;
    stim[42] = 3'h4;
    stim[43] = 3'h0;
    stim[44] = 3'h2;
    stim[45] = 3'h2;
    stim[46] = 3'h1;
    stim[47] = 3'h1;
    stim[48] = 3'h4;
    stim[49] = 3'h0;
    stim[50] = 3'h5;
    stim[51] = 3'h4;
    stim[52] = 3'h5;
    stim[53] = 3'h6;
    stim[54] = 3'h3;
    stim[55] = 3'h0;
    stim[56] = 3'h0;
    stim[57] = 3'h2;
    stim[58] = 3'h2;
    stim[59] = 3'h7;
    stim[60] = 3'h0;
    stim[61] = 3'h0;
    stim[62] = 3'h6;
    stim[63] = 3'h6;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 2'h0;
      expv[1] = 2'h0;
      expv[2] = 2'h2;
      expv[3] = 2'h0;
      expv[4] = 2'h1;
      expv[5] = 2'h0;
      expv[6] = 2'h1;
      expv[7] = 2'h3;
      expv[8] = 2'h2;
      expv[9] = 2'h3;
      expv[10] = 2'h2;
      expv[11] = 2'h0;
      expv[12] = 2'h0;
      expv[13] = 2'h0;
      expv[14] = 2'h2;
      expv[15] = 2'h0;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h0;
      expv[19] = 2'h1;
      expv[20] = 2'h3;
      expv[21] = 2'h1;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h1;
      expv[25] = 2'h2;
      expv[26] = 2'h1;
      expv[27] = 2'h3;
      expv[28] = 2'h2;
      expv[29] = 2'h0;
      expv[30] = 2'h0;
      expv[31] = 2'h2;
      expv[32] = 2'h1;
      expv[33] = 2'h0;
      expv[34] = 2'h2;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h2;
      expv[38] = 2'h2;
      expv[39] = 2'h2;
      expv[40] = 2'h2;
      expv[41] = 2'h0;
      expv[42] = 2'h1;
      expv[43] = 2'h3;
      expv[44] = 2'h2;
      expv[45] = 2'h2;
      expv[46] = 2'h2;
      expv[47] = 2'h2;
      expv[48] = 2'h1;
      expv[49] = 2'h3;
      expv[50] = 2'h0;
      expv[51] = 2'h1;
      expv[52] = 2'h0;
      expv[53] = 2'h0;
      expv[54] = 2'h2;
      expv[55] = 2'h3;
      expv[56] = 2'h3;
      expv[57] = 2'h2;
      expv[58] = 2'h2;
      expv[59] = 2'h0;
      expv[60] = 2'h3;
      expv[61] = 2'h3;
      expv[62] = 2'h0;
      expv[63] = 2'h0;
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
