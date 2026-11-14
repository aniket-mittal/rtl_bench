// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  instr_reg dut (
    .clk(clk),
    .rst(in_vec[10:10]),
    .fetch(in_vec[9:8]),
    .data(in_vec[7:0]),
    .ins(out_vec[15:13]),
    .ad1(out_vec[12:8]),
    .ad2(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h4da;
    stim[1] = 11'h69c;
    stim[2] = 11'h194;
    stim[3] = 11'h19d;
    stim[4] = 11'h13f;
    stim[5] = 11'h104;
    stim[6] = 11'h3a4;
    stim[7] = 11'h06d;
    stim[8] = 11'h01e;
    stim[9] = 11'h262;
    stim[10] = 11'h1a9;
    stim[11] = 11'h1eb;
    stim[12] = 11'h0e5;
    stim[13] = 11'h4b6;
    stim[14] = 11'h021;
    stim[15] = 11'h3e9;
    stim[16] = 11'h08b;
    stim[17] = 11'h3e5;
    stim[18] = 11'h386;
    stim[19] = 11'h127;
    stim[20] = 11'h1e9;
    stim[21] = 11'h093;
    stim[22] = 11'h10c;
    stim[23] = 11'h200;
    stim[24] = 11'h2b6;
    stim[25] = 11'h2d8;
    stim[26] = 11'h065;
    stim[27] = 11'h2f5;
    stim[28] = 11'h086;
    stim[29] = 11'h35b;
    stim[30] = 11'h119;
    stim[31] = 11'h2e2;
    stim[32] = 11'h16a;
    stim[33] = 11'h067;
    stim[34] = 11'h0b7;
    stim[35] = 11'h1d3;
    stim[36] = 11'h0d5;
    stim[37] = 11'h4b9;
    stim[38] = 11'h287;
    stim[39] = 11'h159;
    stim[40] = 11'h374;
    stim[41] = 11'h06d;
    stim[42] = 11'h269;
    stim[43] = 11'h033;
    stim[44] = 11'h0d9;
    stim[45] = 11'h31f;
    stim[46] = 11'h2d3;
    stim[47] = 11'h0d5;
    stim[48] = 11'h0a5;
    stim[49] = 11'h0ba;
    stim[50] = 11'h043;
    stim[51] = 11'h0f9;
    stim[52] = 11'h291;
    stim[53] = 11'h3fe;
    stim[54] = 11'h02b;
    stim[55] = 11'h1c5;
    stim[56] = 11'h1ae;
    stim[57] = 11'h040;
    stim[58] = 11'h28d;
    stim[59] = 11'h3c6;
    stim[60] = 11'h37a;
    stim[61] = 11'h10b;
    stim[62] = 11'h2a0;
    stim[63] = 11'h050;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'h0000;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'h0000;
      expv[9] = 16'h0000;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'h0000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0000;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'h0000;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h0000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'h0000;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0000;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0000;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
