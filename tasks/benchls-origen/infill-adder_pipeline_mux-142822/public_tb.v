// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 16;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_142822 dut (
    .clk(clk),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .sum(out_vec[8:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 16'h6934;
    stim[1] = 16'ha78b;
    stim[2] = 16'h1db4;
    stim[3] = 16'h4d94;
    stim[4] = 16'h6ab3;
    stim[5] = 16'hd790;
    stim[6] = 16'h32a6;
    stim[7] = 16'hb570;
    stim[8] = 16'h6c4f;
    stim[9] = 16'h9c65;
    stim[10] = 16'h0a88;
    stim[11] = 16'h6d90;
    stim[12] = 16'h7bc3;
    stim[13] = 16'ha45a;
    stim[14] = 16'hb3d3;
    stim[15] = 16'h0012;
    stim[16] = 16'hb718;
    stim[17] = 16'ha0c6;
    stim[18] = 16'ha409;
    stim[19] = 16'h0cc1;
    stim[20] = 16'h0e69;
    stim[21] = 16'h0ca9;
    stim[22] = 16'h06b9;
    stim[23] = 16'hd599;
    stim[24] = 16'ha8c7;
    stim[25] = 16'hfa58;
    stim[26] = 16'hdab2;
    stim[27] = 16'h58a0;
    stim[28] = 16'h3129;
    stim[29] = 16'h70c8;
    stim[30] = 16'h600e;
    stim[31] = 16'h8d58;
    stim[32] = 16'hae21;
    stim[33] = 16'h79b5;
    stim[34] = 16'h2ce1;
    stim[35] = 16'h200e;
    stim[36] = 16'he321;
    stim[37] = 16'h4a61;
    stim[38] = 16'h7d7c;
    stim[39] = 16'hd592;
    stim[40] = 16'hdefa;
    stim[41] = 16'h31bf;
    stim[42] = 16'h510b;
    stim[43] = 16'hd223;
    stim[44] = 16'h6270;
    stim[45] = 16'hcf8e;
    stim[46] = 16'h8742;
    stim[47] = 16'h046e;
    stim[48] = 16'hfebf;
    stim[49] = 16'hd62c;
    stim[50] = 16'h0877;
    stim[51] = 16'h6dd4;
    stim[52] = 16'h6921;
    stim[53] = 16'h4c21;
    stim[54] = 16'h0580;
    stim[55] = 16'h2dc6;
    stim[56] = 16'hb123;
    stim[57] = 16'h432f;
    stim[58] = 16'hd3a5;
    stim[59] = 16'hc1d5;
    stim[60] = 16'hddf3;
    stim[61] = 16'h71a7;
    stim[62] = 16'hd3c0;
    stim[63] = 16'ha842;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'h0c6;
      expv[2] = 9'h1d3;
      expv[3] = 9'h0c6;
      expv[4] = 9'h126;
      expv[5] = 9'h143;
      expv[6] = 9'h11e;
      expv[7] = 9'h0c6;
      expv[8] = 9'h17a;
      expv[9] = 9'h08f;
      expv[10] = 9'h195;
      expv[11] = 9'h08c;
      expv[12] = 9'h16a;
      expv[13] = 9'h033;
      expv[14] = 9'h1a2;
      expv[15] = 9'h013;
      expv[16] = 9'h012;
      expv[17] = 9'h166;
      expv[18] = 9'h106;
      expv[19] = 9'h151;
      expv[20] = 9'h0d9;
      expv[21] = 9'h075;
      expv[22] = 9'h0b1;
      expv[23] = 9'h0c5;
      expv[24] = 9'h021;
      expv[25] = 9'h117;
      expv[26] = 9'h19c;
      expv[27] = 9'h142;
      expv[28] = 9'h150;
      expv[29] = 9'h149;
      expv[30] = 9'h128;
      expv[31] = 9'h0ce;
      expv[32] = 9'h162;
      expv[33] = 9'h13d;
      expv[34] = 9'h045;
      expv[35] = 9'h0f9;
      expv[36] = 9'h04e;
      expv[37] = 9'h0a5;
      expv[38] = 9'h075;
      expv[39] = 9'h07e;
      expv[40] = 9'h11c;
      expv[41] = 9'h102;
      expv[42] = 9'h1bf;
      expv[43] = 9'h1ab;
      expv[44] = 9'h1c3;
      expv[45] = 9'h074;
      expv[46] = 9'h110;
      expv[47] = 9'h14c;
      expv[48] = 9'h06e;
      expv[49] = 9'h13f;
      expv[50] = 9'h1d0;
      expv[51] = 9'h087;
      expv[52] = 9'h126;
      expv[53] = 9'h1b1;
      expv[54] = 9'h0b9;
      expv[55] = 9'h08a;
      expv[56] = 9'h118;
      expv[57] = 9'h043;
      expv[58] = 9'h1af;
      expv[59] = 9'h049;
      expv[60] = 9'h1d5;
      expv[61] = 9'h00b;
      expv[62] = 9'h047;
      expv[63] = 9'h0e6;
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
