// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_063739 dut (
    .clk(clk),
    .count(in_vec[4:0]),
    .CKi(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h19;
    stim[1] = 5'h0b;
    stim[2] = 5'h0a;
    stim[3] = 5'h0c;
    stim[4] = 5'h05;
    stim[5] = 5'h03;
    stim[6] = 5'h10;
    stim[7] = 5'h16;
    stim[8] = 5'h14;
    stim[9] = 5'h0f;
    stim[10] = 5'h16;
    stim[11] = 5'h0c;
    stim[12] = 5'h1f;
    stim[13] = 5'h04;
    stim[14] = 5'h1f;
    stim[15] = 5'h0b;
    stim[16] = 5'h18;
    stim[17] = 5'h00;
    stim[18] = 5'h13;
    stim[19] = 5'h0e;
    stim[20] = 5'h10;
    stim[21] = 5'h1b;
    stim[22] = 5'h19;
    stim[23] = 5'h19;
    stim[24] = 5'h1b;
    stim[25] = 5'h05;
    stim[26] = 5'h0e;
    stim[27] = 5'h1d;
    stim[28] = 5'h07;
    stim[29] = 5'h19;
    stim[30] = 5'h00;
    stim[31] = 5'h0d;
    stim[32] = 5'h19;
    stim[33] = 5'h13;
    stim[34] = 5'h14;
    stim[35] = 5'h08;
    stim[36] = 5'h06;
    stim[37] = 5'h0e;
    stim[38] = 5'h1f;
    stim[39] = 5'h01;
    stim[40] = 5'h06;
    stim[41] = 5'h15;
    stim[42] = 5'h07;
    stim[43] = 5'h15;
    stim[44] = 5'h1e;
    stim[45] = 5'h08;
    stim[46] = 5'h0b;
    stim[47] = 5'h12;
    stim[48] = 5'h05;
    stim[49] = 5'h1b;
    stim[50] = 5'h0a;
    stim[51] = 5'h1c;
    stim[52] = 5'h08;
    stim[53] = 5'h18;
    stim[54] = 5'h0d;
    stim[55] = 5'h15;
    stim[56] = 5'h04;
    stim[57] = 5'h0a;
    stim[58] = 5'h1d;
    stim[59] = 5'h0a;
    stim[60] = 5'h00;
    stim[61] = 5'h00;
    stim[62] = 5'h01;
    stim[63] = 5'h1c;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'hbcc3cad1;
      expv[2] = 32'h343b4249;
      expv[3] = 32'h181f262d;
      expv[4] = 32'h50575e65;
      expv[5] = 32'h8c939aa1;
      expv[6] = 32'h545b6269;
      expv[7] = 32'hc0c7ced5;
      expv[8] = 32'h686f767d;
      expv[9] = 32'h30373e45;
      expv[10] = 32'ha4abb2b9;
      expv[11] = 32'h686f767d;
      expv[12] = 32'h50575e65;
      expv[13] = 32'h646b7279;
      expv[14] = 32'h70777e85;
      expv[15] = 32'h646b7279;
      expv[16] = 32'h343b4249;
      expv[17] = 32'ha0a7aeb5;
      expv[18] = 32'h00070e15;
      expv[19] = 32'h141b2229;
      expv[20] = 32'h888f969d;
      expv[21] = 32'hc0c7ced5;
      expv[22] = 32'hf4fb0209;
      expv[23] = 32'hbcc3cad1;
      expv[24] = 32'hbcc3cad1;
      expv[25] = 32'hf4fb0209;
      expv[26] = 32'h8c939aa1;
      expv[27] = 32'h888f969d;
      expv[28] = 32'h2c333a41;
      expv[29] = 32'hc4cbd2d9;
      expv[30] = 32'hbcc3cad1;
      expv[31] = 32'h00070e15;
      expv[32] = 32'h6c737a81;
      expv[33] = 32'hbcc3cad1;
      expv[34] = 32'h141b2229;
      expv[35] = 32'h30373e45;
      expv[36] = 32'he0e7eef5;
      expv[37] = 32'ha8afb6bd;
      expv[38] = 32'h888f969d;
      expv[39] = 32'h646b7279;
      expv[40] = 32'h1c232a31;
      expv[41] = 32'ha8afb6bd;
      expv[42] = 32'h4c535a61;
      expv[43] = 32'hc4cbd2d9;
      expv[44] = 32'h4c535a61;
      expv[45] = 32'h484f565d;
      expv[46] = 32'he0e7eef5;
      expv[47] = 32'h343b4249;
      expv[48] = 32'hf8ff060d;
      expv[49] = 32'h8c939aa1;
      expv[50] = 32'hf4fb0209;
      expv[51] = 32'h181f262d;
      expv[52] = 32'h10171e25;
      expv[53] = 32'he0e7eef5;
      expv[54] = 32'ha0a7aeb5;
      expv[55] = 32'h6c737a81;
      expv[56] = 32'h4c535a61;
      expv[57] = 32'h70777e85;
      expv[58] = 32'h181f262d;
      expv[59] = 32'h2c333a41;
      expv[60] = 32'h181f262d;
      expv[61] = 32'h00070e15;
      expv[62] = 32'h00070e15;
      expv[63] = 32'h1c232a31;
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
