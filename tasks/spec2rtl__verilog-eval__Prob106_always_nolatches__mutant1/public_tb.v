// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .scancode(in_vec[15:0]),
    .left(out_vec[3:3]),
    .down(out_vec[2:2]),
    .right(out_vec[1:1]),
    .up(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'hf6fd;
    stim[1] = 16'h90f0;
    stim[2] = 16'h87c5;
    stim[3] = 16'h93fb;
    stim[4] = 16'hc89b;
    stim[5] = 16'h7dc5;
    stim[6] = 16'h4ed7;
    stim[7] = 16'he7d2;
    stim[8] = 16'hf5f0;
    stim[9] = 16'hbebc;
    stim[10] = 16'hef6f;
    stim[11] = 16'h054b;
    stim[12] = 16'h18ec;
    stim[13] = 16'h3512;
    stim[14] = 16'h4357;
    stim[15] = 16'hf665;
    stim[16] = 16'habaf;
    stim[17] = 16'h5a02;
    stim[18] = 16'hf1c2;
    stim[19] = 16'h3d54;
    stim[20] = 16'h6d1e;
    stim[21] = 16'h8e11;
    stim[22] = 16'h2757;
    stim[23] = 16'h1207;
    stim[24] = 16'h96e6;
    stim[25] = 16'h38b1;
    stim[26] = 16'h85c8;
    stim[27] = 16'hb9e7;
    stim[28] = 16'h4247;
    stim[29] = 16'h9fd7;
    stim[30] = 16'hc602;
    stim[31] = 16'h24f3;
    stim[32] = 16'h0b3c;
    stim[33] = 16'h40c9;
    stim[34] = 16'h2c6b;
    stim[35] = 16'hd3da;
    stim[36] = 16'h6e2b;
    stim[37] = 16'h9024;
    stim[38] = 16'hc06b;
    stim[39] = 16'h57a8;
    stim[40] = 16'h38d7;
    stim[41] = 16'hc262;
    stim[42] = 16'h8061;
    stim[43] = 16'hb4b9;
    stim[44] = 16'hfbe5;
    stim[45] = 16'h1a98;
    stim[46] = 16'h273f;
    stim[47] = 16'h9ffb;
    stim[48] = 16'h4e89;
    stim[49] = 16'hcd6d;
    stim[50] = 16'hb9f5;
    stim[51] = 16'hf069;
    stim[52] = 16'heccd;
    stim[53] = 16'h9e99;
    stim[54] = 16'h6ad1;
    stim[55] = 16'h3dd2;
    stim[56] = 16'h4f14;
    stim[57] = 16'h148a;
    stim[58] = 16'h9c4d;
    stim[59] = 16'h683e;
    stim[60] = 16'hc2b6;
    stim[61] = 16'he3fd;
    stim[62] = 16'h36b4;
    stim[63] = 16'h7666;
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
      expv[0] = 4'h2;
      expv[1] = 4'h2;
      expv[2] = 4'h2;
      expv[3] = 4'h2;
      expv[4] = 4'h2;
      expv[5] = 4'h2;
      expv[6] = 4'h2;
      expv[7] = 4'h2;
      expv[8] = 4'h2;
      expv[9] = 4'h2;
      expv[10] = 4'h2;
      expv[11] = 4'h2;
      expv[12] = 4'h2;
      expv[13] = 4'h2;
      expv[14] = 4'h2;
      expv[15] = 4'h2;
      expv[16] = 4'h2;
      expv[17] = 4'h2;
      expv[18] = 4'h2;
      expv[19] = 4'h2;
      expv[20] = 4'h2;
      expv[21] = 4'h2;
      expv[22] = 4'h2;
      expv[23] = 4'h2;
      expv[24] = 4'h2;
      expv[25] = 4'h2;
      expv[26] = 4'h2;
      expv[27] = 4'h2;
      expv[28] = 4'h2;
      expv[29] = 4'h2;
      expv[30] = 4'h2;
      expv[31] = 4'h2;
      expv[32] = 4'h2;
      expv[33] = 4'h2;
      expv[34] = 4'h2;
      expv[35] = 4'h2;
      expv[36] = 4'h2;
      expv[37] = 4'h2;
      expv[38] = 4'h2;
      expv[39] = 4'h2;
      expv[40] = 4'h2;
      expv[41] = 4'h2;
      expv[42] = 4'h2;
      expv[43] = 4'h2;
      expv[44] = 4'h2;
      expv[45] = 4'h2;
      expv[46] = 4'h2;
      expv[47] = 4'h2;
      expv[48] = 4'h2;
      expv[49] = 4'h2;
      expv[50] = 4'h2;
      expv[51] = 4'h2;
      expv[52] = 4'h2;
      expv[53] = 4'h2;
      expv[54] = 4'h2;
      expv[55] = 4'h2;
      expv[56] = 4'h2;
      expv[57] = 4'h2;
      expv[58] = 4'h2;
      expv[59] = 4'h2;
      expv[60] = 4'h2;
      expv[61] = 4'h2;
      expv[62] = 4'h2;
      expv[63] = 4'h2;
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
