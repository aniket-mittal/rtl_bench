// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_096059 dut (
    .Instruction(in_vec[31:0]),
    .OPOut(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h9ff13b76;
    stim[1] = 32'h1a27ab35;
    stim[2] = 32'h0922cd7b;
    stim[3] = 32'h56c239b8;
    stim[4] = 32'h53beaa63;
    stim[5] = 32'h8d5ff416;
    stim[6] = 32'hb352c3ee;
    stim[7] = 32'hb3e9b326;
    stim[8] = 32'h5fd5cdcc;
    stim[9] = 32'hfe58918a;
    stim[10] = 32'h0277a04b;
    stim[11] = 32'hc23d0c76;
    stim[12] = 32'h2b80f7ef;
    stim[13] = 32'h150b92d2;
    stim[14] = 32'h6a0c6fb9;
    stim[15] = 32'he6bfb273;
    stim[16] = 32'h99b26119;
    stim[17] = 32'hc3ac59af;
    stim[18] = 32'hfa6a8393;
    stim[19] = 32'h60bb1cc9;
    stim[20] = 32'h3c6cfc93;
    stim[21] = 32'h0746a275;
    stim[22] = 32'h7906212f;
    stim[23] = 32'hfa8224ac;
    stim[24] = 32'h80fc1625;
    stim[25] = 32'h7d4fe0dc;
    stim[26] = 32'h228504e5;
    stim[27] = 32'h28e90efb;
    stim[28] = 32'h03fa9bb8;
    stim[29] = 32'hfa4b96e9;
    stim[30] = 32'hc0affcb9;
    stim[31] = 32'hb83dc1e7;
    stim[32] = 32'h9cc54c67;
    stim[33] = 32'h74a23fca;
    stim[34] = 32'h7860cf95;
    stim[35] = 32'he5b8a68c;
    stim[36] = 32'h34fd7970;
    stim[37] = 32'h01f8203f;
    stim[38] = 32'h85e4ede2;
    stim[39] = 32'h6a2bd948;
    stim[40] = 32'h5b637018;
    stim[41] = 32'h447a86d2;
    stim[42] = 32'h37c0cbdf;
    stim[43] = 32'ha8e309bb;
    stim[44] = 32'hacfc9f18;
    stim[45] = 32'hc13c97bd;
    stim[46] = 32'h3f110f75;
    stim[47] = 32'hfab42785;
    stim[48] = 32'h5c68237c;
    stim[49] = 32'h89ddcdbb;
    stim[50] = 32'he3a12abb;
    stim[51] = 32'h298f4be8;
    stim[52] = 32'hcad58b9c;
    stim[53] = 32'hdf884d52;
    stim[54] = 32'h8230d3eb;
    stim[55] = 32'h0bede8a6;
    stim[56] = 32'h3e68971b;
    stim[57] = 32'hb11fd36d;
    stim[58] = 32'he42c8387;
    stim[59] = 32'h6d2cbb06;
    stim[60] = 32'h55c82492;
    stim[61] = 32'h4e069a04;
    stim[62] = 32'h2295b261;
    stim[63] = 32'hd03b5003;
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
      expv[0] = 4'hx;
      expv[1] = 4'hx;
      expv[2] = 4'hx;
      expv[3] = 4'hx;
      expv[4] = 4'hx;
      expv[5] = 4'hx;
      expv[6] = 4'hx;
      expv[7] = 4'hx;
      expv[8] = 4'hx;
      expv[9] = 4'hx;
      expv[10] = 4'hx;
      expv[11] = 4'hx;
      expv[12] = 4'hx;
      expv[13] = 4'h3;
      expv[14] = 4'hx;
      expv[15] = 4'hx;
      expv[16] = 4'hx;
      expv[17] = 4'hx;
      expv[18] = 4'hx;
      expv[19] = 4'hx;
      expv[20] = 4'hx;
      expv[21] = 4'hx;
      expv[22] = 4'hx;
      expv[23] = 4'hx;
      expv[24] = 4'hx;
      expv[25] = 4'hx;
      expv[26] = 4'hx;
      expv[27] = 4'hx;
      expv[28] = 4'hx;
      expv[29] = 4'hx;
      expv[30] = 4'hx;
      expv[31] = 4'hx;
      expv[32] = 4'hx;
      expv[33] = 4'hx;
      expv[34] = 4'hx;
      expv[35] = 4'hx;
      expv[36] = 4'hx;
      expv[37] = 4'hx;
      expv[38] = 4'hx;
      expv[39] = 4'hx;
      expv[40] = 4'hx;
      expv[41] = 4'hx;
      expv[42] = 4'hx;
      expv[43] = 4'hx;
      expv[44] = 4'hx;
      expv[45] = 4'hx;
      expv[46] = 4'hx;
      expv[47] = 4'hx;
      expv[48] = 4'hx;
      expv[49] = 4'hx;
      expv[50] = 4'hx;
      expv[51] = 4'hx;
      expv[52] = 4'hx;
      expv[53] = 4'hx;
      expv[54] = 4'hx;
      expv[55] = 4'hx;
      expv[56] = 4'hx;
      expv[57] = 4'hx;
      expv[58] = 4'hx;
      expv[59] = 4'hx;
      expv[60] = 4'hx;
      expv[61] = 4'hx;
      expv[62] = 4'hx;
      expv[63] = 4'hx;
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
