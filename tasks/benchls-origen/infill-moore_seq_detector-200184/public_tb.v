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

  origen_200184 dut (
    .clk(clk),
    .reset(in_vec[1:1]),
    .ain(in_vec[0:0]),
    .count(out_vec[8:5]),
    .yout(out_vec[4:4]),
    .state(out_vec[3:2]),
    .nextstate(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h2;
    stim[1] = 2'h3;
    stim[2] = 2'h0;
    stim[3] = 2'h0;
    stim[4] = 2'h1;
    stim[5] = 2'h0;
    stim[6] = 2'h0;
    stim[7] = 2'h1;
    stim[8] = 2'h0;
    stim[9] = 2'h1;
    stim[10] = 2'h0;
    stim[11] = 2'h0;
    stim[12] = 2'h1;
    stim[13] = 2'h1;
    stim[14] = 2'h1;
    stim[15] = 2'h1;
    stim[16] = 2'h0;
    stim[17] = 2'h0;
    stim[18] = 2'h1;
    stim[19] = 2'h0;
    stim[20] = 2'h1;
    stim[21] = 2'h3;
    stim[22] = 2'h0;
    stim[23] = 2'h1;
    stim[24] = 2'h1;
    stim[25] = 2'h1;
    stim[26] = 2'h1;
    stim[27] = 2'h1;
    stim[28] = 2'h1;
    stim[29] = 2'h1;
    stim[30] = 2'h1;
    stim[31] = 2'h1;
    stim[32] = 2'h1;
    stim[33] = 2'h0;
    stim[34] = 2'h0;
    stim[35] = 2'h0;
    stim[36] = 2'h0;
    stim[37] = 2'h1;
    stim[38] = 2'h0;
    stim[39] = 2'h0;
    stim[40] = 2'h1;
    stim[41] = 2'h0;
    stim[42] = 2'h1;
    stim[43] = 2'h1;
    stim[44] = 2'h1;
    stim[45] = 2'h0;
    stim[46] = 2'h0;
    stim[47] = 2'h1;
    stim[48] = 2'h0;
    stim[49] = 2'h1;
    stim[50] = 2'h0;
    stim[51] = 2'h1;
    stim[52] = 2'h1;
    stim[53] = 2'h1;
    stim[54] = 2'h1;
    stim[55] = 2'h0;
    stim[56] = 2'h1;
    stim[57] = 2'h0;
    stim[58] = 2'h0;
    stim[59] = 2'h1;
    stim[60] = 2'h0;
    stim[61] = 2'h1;
    stim[62] = 2'h0;
    stim[63] = 2'h0;
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
      expv[0] = 9'h010;
      expv[1] = 9'h001;
      expv[2] = 9'h010;
      expv[3] = 9'h010;
      expv[4] = 9'h001;
      expv[5] = 9'h025;
      expv[6] = 9'h025;
      expv[7] = 9'h026;
      expv[8] = 9'h04a;
      expv[9] = 9'h04b;
      expv[10] = 9'h06f;
      expv[11] = 9'h06f;
      expv[12] = 9'h07d;
      expv[13] = 9'h086;
      expv[14] = 9'h0ab;
      expv[15] = 9'h0dd;
      expv[16] = 9'h0e5;
      expv[17] = 9'h0e5;
      expv[18] = 9'h0e6;
      expv[19] = 9'h10a;
      expv[20] = 9'h10b;
      expv[21] = 9'h001;
      expv[22] = 9'h010;
      expv[23] = 9'h001;
      expv[24] = 9'h026;
      expv[25] = 9'h04b;
      expv[26] = 9'h07d;
      expv[27] = 9'h086;
      expv[28] = 9'h0ab;
      expv[29] = 9'h0dd;
      expv[30] = 9'h0e6;
      expv[31] = 9'h10b;
      expv[32] = 9'h13d;
      expv[33] = 9'h145;
      expv[34] = 9'h145;
      expv[35] = 9'h145;
      expv[36] = 9'h145;
      expv[37] = 9'h146;
      expv[38] = 9'h16a;
      expv[39] = 9'h16a;
      expv[40] = 9'h16b;
      expv[41] = 9'h18f;
      expv[42] = 9'h19d;
      expv[43] = 9'h1a6;
      expv[44] = 9'h1cb;
      expv[45] = 9'h1ef;
      expv[46] = 9'h1ef;
      expv[47] = 9'h1fd;
      expv[48] = 9'h005;
      expv[49] = 9'h006;
      expv[50] = 9'h02a;
      expv[51] = 9'h02b;
      expv[52] = 9'h05d;
      expv[53] = 9'h066;
      expv[54] = 9'h08b;
      expv[55] = 9'h0af;
      expv[56] = 9'h0bd;
      expv[57] = 9'h0c5;
      expv[58] = 9'h0c5;
      expv[59] = 9'h0c6;
      expv[60] = 9'h0ea;
      expv[61] = 9'h0eb;
      expv[62] = 9'h10f;
      expv[63] = 9'h10f;
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
