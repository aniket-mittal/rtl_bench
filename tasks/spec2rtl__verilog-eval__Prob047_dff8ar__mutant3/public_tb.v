// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .d(in_vec[8:1]),
    .areset(in_vec[0:0]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h03f;
    stim[1] = 9'h07b;
    stim[2] = 9'h166;
    stim[3] = 9'h008;
    stim[4] = 9'h104;
    stim[5] = 9'h10e;
    stim[6] = 9'h034;
    stim[7] = 9'h150;
    stim[8] = 9'h008;
    stim[9] = 9'h15e;
    stim[10] = 9'h176;
    stim[11] = 9'h1b8;
    stim[12] = 9'h0b8;
    stim[13] = 9'h0d0;
    stim[14] = 9'h1fa;
    stim[15] = 9'h1a6;
    stim[16] = 9'h16e;
    stim[17] = 9'h03e;
    stim[18] = 9'h02e;
    stim[19] = 9'h098;
    stim[20] = 9'h048;
    stim[21] = 9'h1f0;
    stim[22] = 9'h17a;
    stim[23] = 9'h1e2;
    stim[24] = 9'h1dc;
    stim[25] = 9'h15e;
    stim[26] = 9'h1ba;
    stim[27] = 9'h08e;
    stim[28] = 9'h02e;
    stim[29] = 9'h0ee;
    stim[30] = 9'h12e;
    stim[31] = 9'h086;
    stim[32] = 9'h1e3;
    stim[33] = 9'h050;
    stim[34] = 9'h160;
    stim[35] = 9'h106;
    stim[36] = 9'h030;
    stim[37] = 9'h014;
    stim[38] = 9'h078;
    stim[39] = 9'h07a;
    stim[40] = 9'h06e;
    stim[41] = 9'h0ba;
    stim[42] = 9'h0f4;
    stim[43] = 9'h0ce;
    stim[44] = 9'h09a;
    stim[45] = 9'h074;
    stim[46] = 9'h13a;
    stim[47] = 9'h11c;
    stim[48] = 9'h030;
    stim[49] = 9'h002;
    stim[50] = 9'h15c;
    stim[51] = 9'h1ba;
    stim[52] = 9'h1b0;
    stim[53] = 9'h154;
    stim[54] = 9'h1d4;
    stim[55] = 9'h1f6;
    stim[56] = 9'h022;
    stim[57] = 9'h070;
    stim[58] = 9'h196;
    stim[59] = 9'h028;
    stim[60] = 9'h0b6;
    stim[61] = 9'h17e;
    stim[62] = 9'h0ba;
    stim[63] = 9'h164;
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
      expv[0] = 8'h00;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'hb2;
      expv[4] = 8'h04;
      expv[5] = 8'h82;
      expv[6] = 8'h86;
      expv[7] = 8'h1a;
      expv[8] = 8'ha8;
      expv[9] = 8'h04;
      expv[10] = 8'hae;
      expv[11] = 8'hba;
      expv[12] = 8'hdc;
      expv[13] = 8'h5c;
      expv[14] = 8'h68;
      expv[15] = 8'hfc;
      expv[16] = 8'hd2;
      expv[17] = 8'hb6;
      expv[18] = 8'h1e;
      expv[19] = 8'h16;
      expv[20] = 8'h4c;
      expv[21] = 8'h24;
      expv[22] = 8'hf8;
      expv[23] = 8'hbc;
      expv[24] = 8'hf0;
      expv[25] = 8'hee;
      expv[26] = 8'hae;
      expv[27] = 8'hdc;
      expv[28] = 8'h46;
      expv[29] = 8'h16;
      expv[30] = 8'h76;
      expv[31] = 8'h96;
      expv[32] = 8'h00;
      expv[33] = 8'h00;
      expv[34] = 8'h28;
      expv[35] = 8'hb0;
      expv[36] = 8'h82;
      expv[37] = 8'h18;
      expv[38] = 8'h0a;
      expv[39] = 8'h3c;
      expv[40] = 8'h3c;
      expv[41] = 8'h36;
      expv[42] = 8'h5c;
      expv[43] = 8'h7a;
      expv[44] = 8'h66;
      expv[45] = 8'h4c;
      expv[46] = 8'h3a;
      expv[47] = 8'h9c;
      expv[48] = 8'h8e;
      expv[49] = 8'h18;
      expv[50] = 8'h00;
      expv[51] = 8'hae;
      expv[52] = 8'hdc;
      expv[53] = 8'hd8;
      expv[54] = 8'haa;
      expv[55] = 8'hea;
      expv[56] = 8'hfa;
      expv[57] = 8'h10;
      expv[58] = 8'h38;
      expv[59] = 8'hca;
      expv[60] = 8'h14;
      expv[61] = 8'h5a;
      expv[62] = 8'hbe;
      expv[63] = 8'h5c;
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
