// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .a(in_vec[1:1]),
    .b(in_vec[0:0]),
    .out_and(out_vec[6:6]),
    .out_or(out_vec[5:5]),
    .out_xor(out_vec[4:4]),
    .out_nand(out_vec[3:3]),
    .out_nor(out_vec[2:2]),
    .out_xnor(out_vec[1:1]),
    .out_anotb(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h0;
    stim[1] = 2'h3;
    stim[2] = 2'h2;
    stim[3] = 2'h0;
    stim[4] = 2'h2;
    stim[5] = 2'h1;
    stim[6] = 2'h0;
    stim[7] = 2'h1;
    stim[8] = 2'h2;
    stim[9] = 2'h2;
    stim[10] = 2'h2;
    stim[11] = 2'h3;
    stim[12] = 2'h1;
    stim[13] = 2'h0;
    stim[14] = 2'h1;
    stim[15] = 2'h1;
    stim[16] = 2'h2;
    stim[17] = 2'h1;
    stim[18] = 2'h0;
    stim[19] = 2'h2;
    stim[20] = 2'h2;
    stim[21] = 2'h0;
    stim[22] = 2'h0;
    stim[23] = 2'h1;
    stim[24] = 2'h1;
    stim[25] = 2'h1;
    stim[26] = 2'h2;
    stim[27] = 2'h2;
    stim[28] = 2'h0;
    stim[29] = 2'h3;
    stim[30] = 2'h0;
    stim[31] = 2'h3;
    stim[32] = 2'h3;
    stim[33] = 2'h1;
    stim[34] = 2'h0;
    stim[35] = 2'h1;
    stim[36] = 2'h1;
    stim[37] = 2'h2;
    stim[38] = 2'h1;
    stim[39] = 2'h0;
    stim[40] = 2'h0;
    stim[41] = 2'h0;
    stim[42] = 2'h1;
    stim[43] = 2'h1;
    stim[44] = 2'h1;
    stim[45] = 2'h2;
    stim[46] = 2'h2;
    stim[47] = 2'h3;
    stim[48] = 2'h0;
    stim[49] = 2'h1;
    stim[50] = 2'h0;
    stim[51] = 2'h1;
    stim[52] = 2'h0;
    stim[53] = 2'h0;
    stim[54] = 2'h1;
    stim[55] = 2'h1;
    stim[56] = 2'h3;
    stim[57] = 2'h3;
    stim[58] = 2'h3;
    stim[59] = 2'h2;
    stim[60] = 2'h1;
    stim[61] = 2'h2;
    stim[62] = 2'h2;
    stim[63] = 2'h0;
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
      expv[0] = 7'h1c;
      expv[1] = 7'h70;
      expv[2] = 7'h2b;
      expv[3] = 7'h1c;
      expv[4] = 7'h2b;
      expv[5] = 7'h2a;
      expv[6] = 7'h1c;
      expv[7] = 7'h2a;
      expv[8] = 7'h2b;
      expv[9] = 7'h2b;
      expv[10] = 7'h2b;
      expv[11] = 7'h70;
      expv[12] = 7'h2a;
      expv[13] = 7'h1c;
      expv[14] = 7'h2a;
      expv[15] = 7'h2a;
      expv[16] = 7'h2b;
      expv[17] = 7'h2a;
      expv[18] = 7'h1c;
      expv[19] = 7'h2b;
      expv[20] = 7'h2b;
      expv[21] = 7'h1c;
      expv[22] = 7'h1c;
      expv[23] = 7'h2a;
      expv[24] = 7'h2a;
      expv[25] = 7'h2a;
      expv[26] = 7'h2b;
      expv[27] = 7'h2b;
      expv[28] = 7'h1c;
      expv[29] = 7'h70;
      expv[30] = 7'h1c;
      expv[31] = 7'h70;
      expv[32] = 7'h70;
      expv[33] = 7'h2a;
      expv[34] = 7'h1c;
      expv[35] = 7'h2a;
      expv[36] = 7'h2a;
      expv[37] = 7'h2b;
      expv[38] = 7'h2a;
      expv[39] = 7'h1c;
      expv[40] = 7'h1c;
      expv[41] = 7'h1c;
      expv[42] = 7'h2a;
      expv[43] = 7'h2a;
      expv[44] = 7'h2a;
      expv[45] = 7'h2b;
      expv[46] = 7'h2b;
      expv[47] = 7'h70;
      expv[48] = 7'h1c;
      expv[49] = 7'h2a;
      expv[50] = 7'h1c;
      expv[51] = 7'h2a;
      expv[52] = 7'h1c;
      expv[53] = 7'h1c;
      expv[54] = 7'h2a;
      expv[55] = 7'h2a;
      expv[56] = 7'h70;
      expv[57] = 7'h70;
      expv[58] = 7'h70;
      expv[59] = 7'h2b;
      expv[60] = 7'h2a;
      expv[61] = 7'h2b;
      expv[62] = 7'h2b;
      expv[63] = 7'h1c;
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
