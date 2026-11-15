// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 3;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_128077 dut (
    .CLOCK_50(clk),
    .KEY(in_vec[2:1]),
    .req(in_vec[0:0]),
    .value_0(out_vec[26:19]),
    .value_1(out_vec[18:11]),
    .value_2(out_vec[10:3]),
    .value_0_valid(out_vec[2:2]),
    .value_1_valid(out_vec[1:1]),
    .value_2_valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 3'h4;
    stim[1] = 3'h3;
    stim[2] = 3'h5;
    stim[3] = 3'h0;
    stim[4] = 3'h7;
    stim[5] = 3'h1;
    stim[6] = 3'h2;
    stim[7] = 3'h7;
    stim[8] = 3'h3;
    stim[9] = 3'h6;
    stim[10] = 3'h1;
    stim[11] = 3'h4;
    stim[12] = 3'h2;
    stim[13] = 3'h2;
    stim[14] = 3'h6;
    stim[15] = 3'h5;
    stim[16] = 3'h7;
    stim[17] = 3'h4;
    stim[18] = 3'h6;
    stim[19] = 3'h3;
    stim[20] = 3'h5;
    stim[21] = 3'h5;
    stim[22] = 3'h1;
    stim[23] = 3'h3;
    stim[24] = 3'h0;
    stim[25] = 3'h5;
    stim[26] = 3'h7;
    stim[27] = 3'h4;
    stim[28] = 3'h1;
    stim[29] = 3'h0;
    stim[30] = 3'h0;
    stim[31] = 3'h0;
    stim[32] = 3'h5;
    stim[33] = 3'h6;
    stim[34] = 3'h3;
    stim[35] = 3'h4;
    stim[36] = 3'h3;
    stim[37] = 3'h0;
    stim[38] = 3'h3;
    stim[39] = 3'h7;
    stim[40] = 3'h7;
    stim[41] = 3'h0;
    stim[42] = 3'h5;
    stim[43] = 3'h1;
    stim[44] = 3'h5;
    stim[45] = 3'h3;
    stim[46] = 3'h2;
    stim[47] = 3'h7;
    stim[48] = 3'h5;
    stim[49] = 3'h6;
    stim[50] = 3'h2;
    stim[51] = 3'h6;
    stim[52] = 3'h0;
    stim[53] = 3'h7;
    stim[54] = 3'h1;
    stim[55] = 3'h2;
    stim[56] = 3'h4;
    stim[57] = 3'h0;
    stim[58] = 3'h0;
    stim[59] = 3'h4;
    stim[60] = 3'h0;
    stim[61] = 3'h2;
    stim[62] = 3'h4;
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
      expv[0] = 27'hxxxxxxx;
      expv[1] = 27'h2axxxxx;
      expv[2] = 27'h2ad5xxx;
      expv[3] = 27'h2ad5xxx;
      expv[4] = 27'h2ad5xxx;
      expv[5] = 27'h2ad5xxx;
      expv[6] = 27'h2ad5xxx;
      expv[7] = 27'h2ad5xxx;
      expv[8] = 27'h2ad5xxx;
      expv[9] = 27'h2ad5xxx;
      expv[10] = 27'h2ad5xxx;
      expv[11] = 27'h2ad5xxx;
      expv[12] = 27'h2ad5xxx;
      expv[13] = 27'h2ad5xxx;
      expv[14] = 27'h2ad5xxx;
      expv[15] = 27'h2ad5xxx;
      expv[16] = 27'h2ad5xxx;
      expv[17] = 27'h2ad5xxx;
      expv[18] = 27'h2ad5xxx;
      expv[19] = 27'h2ad5xxx;
      expv[20] = 27'h2ad5xxx;
      expv[21] = 27'h2ad5xxx;
      expv[22] = 27'h2ad5xxx;
      expv[23] = 27'h2ad5xxx;
      expv[24] = 27'h2ad5xxx;
      expv[25] = 27'h2ad5xxx;
      expv[26] = 27'h2ad5xxx;
      expv[27] = 27'h2ad5xxx;
      expv[28] = 27'h2ad5xxx;
      expv[29] = 27'h2ad5xxx;
      expv[30] = 27'h2ad5xxx;
      expv[31] = 27'h2ad5xxx;
      expv[32] = 27'h2ad5xxx;
      expv[33] = 27'h2ad5xxx;
      expv[34] = 27'h2ad5xxx;
      expv[35] = 27'h2ad5xxx;
      expv[36] = 27'h2ad5xxx;
      expv[37] = 27'h2ad5xxx;
      expv[38] = 27'h2ad5xxx;
      expv[39] = 27'h2ad5xxx;
      expv[40] = 27'h2ad5xxx;
      expv[41] = 27'h2ad5xxx;
      expv[42] = 27'h2ad5xxx;
      expv[43] = 27'h2ad5xxx;
      expv[44] = 27'h2ad5xxx;
      expv[45] = 27'h2ad5xxx;
      expv[46] = 27'h2ad5xxx;
      expv[47] = 27'h2ad5xxx;
      expv[48] = 27'h2ad5xxx;
      expv[49] = 27'h2ad5xxx;
      expv[50] = 27'h2ad5xxx;
      expv[51] = 27'h2ad5xxx;
      expv[52] = 27'h2ad5xxx;
      expv[53] = 27'h2ad5xxx;
      expv[54] = 27'h2ad5xxx;
      expv[55] = 27'h2ad5xxx;
      expv[56] = 27'h2ad5xxx;
      expv[57] = 27'h2ad5xxx;
      expv[58] = 27'h2ad5xxx;
      expv[59] = 27'h2ad5xxx;
      expv[60] = 27'h2ad5xxx;
      expv[61] = 27'h2ad5xxx;
      expv[62] = 27'h2ad5xxx;
      expv[63] = 27'h2ad5xxx;
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
