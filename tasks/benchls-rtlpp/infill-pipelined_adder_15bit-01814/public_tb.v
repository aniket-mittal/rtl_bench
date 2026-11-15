// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 30;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_01814 dut (
    .clk(clk),
    .x(in_vec[29:15]),
    .y(in_vec[14:0]),
    .sum(out_vec[14:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 30'h0a3f4620;
    stim[1] = 30'h2e7922ae;
    stim[2] = 30'h3b108e7e;
    stim[3] = 30'h15112afb;
    stim[4] = 30'h2532ad00;
    stim[5] = 30'h2074a2db;
    stim[6] = 30'h3a08f17b;
    stim[7] = 30'h2587018e;
    stim[8] = 30'h0892967d;
    stim[9] = 30'h3706801c;
    stim[10] = 30'h01cece59;
    stim[11] = 30'h0922dd5b;
    stim[12] = 30'h0aa8bc0c;
    stim[13] = 30'h3fa93870;
    stim[14] = 30'h3c3d6c28;
    stim[15] = 30'h1700891d;
    stim[16] = 30'h3b50a342;
    stim[17] = 30'h220b9071;
    stim[18] = 30'h0d852fcb;
    stim[19] = 30'h0888bade;
    stim[20] = 30'h2ff95e7b;
    stim[21] = 30'h39438d60;
    stim[22] = 30'h2242ac3d;
    stim[23] = 30'h10b248b2;
    stim[24] = 30'h1279d14d;
    stim[25] = 30'h0b678dda;
    stim[26] = 30'h319a8f62;
    stim[27] = 30'h2a09ce3c;
    stim[28] = 30'h1ec24f95;
    stim[29] = 30'h315f4220;
    stim[30] = 30'h2768c7c8;
    stim[31] = 30'h32fc6d06;
    stim[32] = 30'h07647992;
    stim[33] = 30'h3f0f3009;
    stim[34] = 30'h022817df;
    stim[35] = 30'h04d49f2b;
    stim[36] = 30'h251295ce;
    stim[37] = 30'h0e00227c;
    stim[38] = 30'h37fb1a67;
    stim[39] = 30'h186f1e00;
    stim[40] = 30'h093a269e;
    stim[41] = 30'h0ffc4374;
    stim[42] = 30'h0ce27be7;
    stim[43] = 30'h2db05180;
    stim[44] = 30'h18a1be3d;
    stim[45] = 30'h002bf048;
    stim[46] = 30'h298a7456;
    stim[47] = 30'h34a4701c;
    stim[48] = 30'h0585957c;
    stim[49] = 30'h141e6a36;
    stim[50] = 30'h03c42a51;
    stim[51] = 30'h05e2a62f;
    stim[52] = 30'h31cafe2b;
    stim[53] = 30'h1628f510;
    stim[54] = 30'h36969f31;
    stim[55] = 30'h094f332a;
    stim[56] = 30'h0c8cc65c;
    stim[57] = 30'h00363d71;
    stim[58] = 30'h10b230f4;
    stim[59] = 30'h01db6e4a;
    stim[60] = 30'h34ef8d3c;
    stim[61] = 30'h045ea8e9;
    stim[62] = 30'h3fd04618;
    stim[63] = 30'h1465bd31;
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
      expv[0] = 15'hxxxx;
      expv[1] = 15'hxxxx;
      expv[2] = 15'hxxxx;
      expv[3] = 15'h5a1e;
      expv[4] = 15'h7f20;
      expv[5] = 15'h041f;
      expv[6] = 15'h549d;
      expv[7] = 15'h7765;
      expv[8] = 15'h6344;
      expv[9] = 15'h650c;
      expv[10] = 15'h4c9c;
      expv[11] = 15'h2722;
      expv[12] = 15'h6e29;
      expv[13] = 15'h51f6;
      expv[14] = 15'h6f20;
      expv[15] = 15'h515d;
      expv[16] = 15'h3742;
      expv[17] = 15'h6422;
      expv[18] = 15'h371e;
      expv[19] = 15'h19e3;
      expv[20] = 15'h5408;
      expv[21] = 15'h4ad5;
      expv[22] = 15'h4bef;
      expv[23] = 15'h3ded;
      expv[24] = 15'h7fe7;
      expv[25] = 15'h70c2;
      expv[26] = 15'h6996;
      expv[27] = 15'h75c0;
      expv[28] = 15'h2429;
      expv[29] = 15'h7217;
      expv[30] = 15'h224f;
      expv[31] = 15'h0d19;
      expv[32] = 15'h24de;
      expv[33] = 15'h1619;
      expv[34] = 15'h52fe;
      expv[35] = 15'h085a;
      expv[36] = 15'h2e27;
      expv[37] = 15'h1baf;
      expv[38] = 15'h28d4;
      expv[39] = 15'h5ff3;
      expv[40] = 15'h3e7c;
      expv[41] = 15'h09dd;
      expv[42] = 15'h4ede;
      expv[43] = 15'h3892;
      expv[44] = 15'h62ec;
      expv[45] = 15'h152b;
      expv[46] = 15'h2ce0;
      expv[47] = 15'h6f00;
      expv[48] = 15'h701f;
      expv[49] = 15'h476a;
      expv[50] = 15'h5964;
      expv[51] = 15'h2007;
      expv[52] = 15'h1272;
      expv[53] = 15'h31d9;
      expv[54] = 15'h31f4;
      expv[55] = 15'h61c0;
      expv[56] = 15'h2161;
      expv[57] = 15'h0c5e;
      expv[58] = 15'h45c8;
      expv[59] = 15'h5f75;
      expv[60] = 15'h3d5d;
      expv[61] = 15'h51d8;
      expv[62] = 15'h7180;
      expv[63] = 15'h769b;
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
