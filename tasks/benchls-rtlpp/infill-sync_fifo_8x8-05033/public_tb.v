// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05033 dut (
    .clk(clk),
    .data_in(in_vec[10:3]),
    .push(in_vec[2:2]),
    .pop(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .data_out(out_vec[9:2]),
    .empty(out_vec[1:1]),
    .full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h41f;
    stim[1] = 11'h7c9;
    stim[2] = 11'h3a2;
    stim[3] = 11'h372;
    stim[4] = 11'h19c;
    stim[5] = 11'h61a;
    stim[6] = 11'h784;
    stim[7] = 11'h69c;
    stim[8] = 11'h2a4;
    stim[9] = 11'h286;
    stim[10] = 11'h676;
    stim[11] = 11'h511;
    stim[12] = 11'h4ca;
    stim[13] = 11'h194;
    stim[14] = 11'h4ba;
    stim[15] = 11'h358;
    stim[16] = 11'h44e;
    stim[17] = 11'h118;
    stim[18] = 11'h616;
    stim[19] = 11'h2ac;
    stim[20] = 11'h116;
    stim[21] = 11'h0e8;
    stim[22] = 11'h5e8;
    stim[23] = 11'h5ec;
    stim[24] = 11'h3ea;
    stim[25] = 11'h764;
    stim[26] = 11'h092;
    stim[27] = 11'h70a;
    stim[28] = 11'h05a;
    stim[29] = 11'h674;
    stim[30] = 11'h2be;
    stim[31] = 11'h3e4;
    stim[32] = 11'h0b8;
    stim[33] = 11'h680;
    stim[34] = 11'h384;
    stim[35] = 11'h5ba;
    stim[36] = 11'h7de;
    stim[37] = 11'h612;
    stim[38] = 11'h2d0;
    stim[39] = 11'h538;
    stim[40] = 11'h6b6;
    stim[41] = 11'h234;
    stim[42] = 11'h01a;
    stim[43] = 11'h04e;
    stim[44] = 11'h75a;
    stim[45] = 11'h5a8;
    stim[46] = 11'h5e0;
    stim[47] = 11'h6ba;
    stim[48] = 11'h63c;
    stim[49] = 11'h112;
    stim[50] = 11'h136;
    stim[51] = 11'h4b2;
    stim[52] = 11'h41c;
    stim[53] = 11'h7cc;
    stim[54] = 11'h75c;
    stim[55] = 11'h79a;
    stim[56] = 11'h584;
    stim[57] = 11'h336;
    stim[58] = 11'h13a;
    stim[59] = 11'h54e;
    stim[60] = 11'h140;
    stim[61] = 11'h046;
    stim[62] = 11'h538;
    stim[63] = 11'h3b6;
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
      expv[0] = 10'h002;
      expv[1] = 10'h002;
      expv[2] = 10'h002;
      expv[3] = 10'h002;
      expv[4] = 10'h002;
      expv[5] = 10'h000;
      expv[6] = 10'h0ce;
      expv[7] = 10'h0cc;
      expv[8] = 10'h0cc;
      expv[9] = 10'h0cc;
      expv[10] = 10'h0cc;
      expv[11] = 10'h002;
      expv[12] = 10'h002;
      expv[13] = 10'h002;
      expv[14] = 10'h000;
      expv[15] = 10'h0ca;
      expv[16] = 10'h0ca;
      expv[17] = 10'h0ca;
      expv[18] = 10'h0ca;
      expv[19] = 10'h0ca;
      expv[20] = 10'h0c8;
      expv[21] = 10'h0c8;
      expv[22] = 10'h0c8;
      expv[23] = 10'h0c8;
      expv[24] = 10'h0c8;
      expv[25] = 10'h154;
      expv[26] = 10'h154;
      expv[27] = 10'h2f4;
      expv[28] = 10'h3b2;
      expv[29] = 10'h3b2;
      expv[30] = 10'h3b0;
      expv[31] = 10'h3b0;
      expv[32] = 10'h3b0;
      expv[33] = 10'h3b0;
      expv[34] = 10'h3b0;
      expv[35] = 10'h3b0;
      expv[36] = 10'h338;
      expv[37] = 10'h338;
      expv[38] = 10'h1f0;
      expv[39] = 10'h1f0;
      expv[40] = 10'h1f0;
      expv[41] = 10'h1f0;
      expv[42] = 10'h1f0;
      expv[43] = 10'h1c0;
      expv[44] = 10'h1c0;
      expv[45] = 10'h11a;
      expv[46] = 10'h11a;
      expv[47] = 10'h11a;
      expv[48] = 10'h11a;
      expv[49] = 10'h118;
      expv[50] = 10'hxxx;
      expv[51] = 10'hxxx;
      expv[52] = 10'hxxx;
      expv[53] = 10'hxxx;
      expv[54] = 10'hxxx;
      expv[55] = 10'hxxx;
      expv[56] = 10'hxxx;
      expv[57] = 10'hxxx;
      expv[58] = 10'hxxx;
      expv[59] = 10'hxxx;
      expv[60] = 10'hxxx;
      expv[61] = 10'hxxx;
      expv[62] = 10'hxxx;
      expv[63] = 10'hxxx;
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
