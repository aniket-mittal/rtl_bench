// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_184467 dut (
    .CLK(clk),
    .RST_n(in_vec[10:10]),
    .preset(in_vec[9:9]),
    .EN_LEFT(in_vec[8:8]),
    .REF_DATA(in_vec[7:0]),
    .REF_LEFT0(out_vec[63:56]),
    .REF_LEFT1(out_vec[55:48]),
    .REF_LEFT2(out_vec[47:40]),
    .REF_LEFT3(out_vec[39:32]),
    .REF_LEFT4(out_vec[31:24]),
    .REF_LEFT5(out_vec[23:16]),
    .REF_LEFT6(out_vec[15:8]),
    .REF_LEFT7(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h362;
    stim[1] = 11'h119;
    stim[2] = 11'h452;
    stim[3] = 11'h753;
    stim[4] = 11'h72b;
    stim[5] = 11'h6f4;
    stim[6] = 11'h711;
    stim[7] = 11'h423;
    stim[8] = 11'h5d8;
    stim[9] = 11'h7f5;
    stim[10] = 11'h6c3;
    stim[11] = 11'h703;
    stim[12] = 11'h741;
    stim[13] = 11'h5b9;
    stim[14] = 11'h5cb;
    stim[15] = 11'h760;
    stim[16] = 11'h4b6;
    stim[17] = 11'h3da;
    stim[18] = 11'h6c6;
    stim[19] = 11'h4fc;
    stim[20] = 11'h6eb;
    stim[21] = 11'h425;
    stim[22] = 11'h5f0;
    stim[23] = 11'h564;
    stim[24] = 11'h7a4;
    stim[25] = 11'h7ea;
    stim[26] = 11'h505;
    stim[27] = 11'h71b;
    stim[28] = 11'h4db;
    stim[29] = 11'h47f;
    stim[30] = 11'h6bf;
    stim[31] = 11'h40a;
    stim[32] = 11'h6b3;
    stim[33] = 11'h617;
    stim[34] = 11'h7d6;
    stim[35] = 11'h598;
    stim[36] = 11'h7d6;
    stim[37] = 11'h50d;
    stim[38] = 11'h5b8;
    stim[39] = 11'h75d;
    stim[40] = 11'h750;
    stim[41] = 11'h5ae;
    stim[42] = 11'h79e;
    stim[43] = 11'h6c3;
    stim[44] = 11'h4cd;
    stim[45] = 11'h48d;
    stim[46] = 11'h72b;
    stim[47] = 11'h599;
    stim[48] = 11'h5d1;
    stim[49] = 11'h4d0;
    stim[50] = 11'h70a;
    stim[51] = 11'h62c;
    stim[52] = 11'h4ac;
    stim[53] = 11'h6dc;
    stim[54] = 11'h41a;
    stim[55] = 11'h786;
    stim[56] = 11'h4ac;
    stim[57] = 11'h4c7;
    stim[58] = 11'h69a;
    stim[59] = 11'h710;
    stim[60] = 11'h767;
    stim[61] = 11'h5d3;
    stim[62] = 11'h62c;
    stim[63] = 11'h72a;
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
      expv[0] = 64'h0000000000000000;
      expv[1] = 64'h0000000000000000;
      expv[2] = 64'h0000000000000000;
      expv[3] = 64'h0000000000000000;
      expv[4] = 64'h0000000000000000;
      expv[5] = 64'h0000000000000000;
      expv[6] = 64'h0000000000000000;
      expv[7] = 64'h0000000000000000;
      expv[8] = 64'h0000000000000000;
      expv[9] = 64'hd800000000000000;
      expv[10] = 64'hd800000000000000;
      expv[11] = 64'hd800000000000000;
      expv[12] = 64'hd800000000000000;
      expv[13] = 64'hd800000000000000;
      expv[14] = 64'hb900000000000000;
      expv[15] = 64'hb9cb000000000000;
      expv[16] = 64'hb9cb000000000000;
      expv[17] = 64'h0000000000000000;
      expv[18] = 64'h0000000000000000;
      expv[19] = 64'h0000000000000000;
      expv[20] = 64'h0000000000000000;
      expv[21] = 64'h0000000000000000;
      expv[22] = 64'h0000000000000000;
      expv[23] = 64'hf000000000000000;
      expv[24] = 64'hf064000000000000;
      expv[25] = 64'hf064000000000000;
      expv[26] = 64'hf064000000000000;
      expv[27] = 64'h0564000000000000;
      expv[28] = 64'h0564000000000000;
      expv[29] = 64'h0564000000000000;
      expv[30] = 64'h0564000000000000;
      expv[31] = 64'h0564000000000000;
      expv[32] = 64'h0564000000000000;
      expv[33] = 64'h0564000000000000;
      expv[34] = 64'h0564000000000000;
      expv[35] = 64'h0564000000000000;
      expv[36] = 64'h9864000000000000;
      expv[37] = 64'h9864000000000000;
      expv[38] = 64'h0d64000000000000;
      expv[39] = 64'h0db8000000000000;
      expv[40] = 64'h0db8000000000000;
      expv[41] = 64'h0db8000000000000;
      expv[42] = 64'haeb8000000000000;
      expv[43] = 64'haeb8000000000000;
      expv[44] = 64'haeb8000000000000;
      expv[45] = 64'haeb8000000000000;
      expv[46] = 64'haeb8000000000000;
      expv[47] = 64'haeb8000000000000;
      expv[48] = 64'h99b8000000000000;
      expv[49] = 64'h99d1000000000000;
      expv[50] = 64'h99d1000000000000;
      expv[51] = 64'h99d1000000000000;
      expv[52] = 64'h99d1000000000000;
      expv[53] = 64'h99d1000000000000;
      expv[54] = 64'h99d1000000000000;
      expv[55] = 64'h99d1000000000000;
      expv[56] = 64'h99d1000000000000;
      expv[57] = 64'h99d1000000000000;
      expv[58] = 64'h99d1000000000000;
      expv[59] = 64'h99d1000000000000;
      expv[60] = 64'h99d1000000000000;
      expv[61] = 64'h99d1000000000000;
      expv[62] = 64'hd3d1000000000000;
      expv[63] = 64'hd3d1000000000000;
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
