// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05199 dut (
    .clk(clk),
    .rst_n(in_vec[10:10]),
    .wr(in_vec[9:9]),
    .rd(in_vec[8:8]),
    .data_in(in_vec[7:0]),
    .data_out(out_vec[12:5]),
    .fifo_full(out_vec[4:4]),
    .fifo_empty(out_vec[3:3]),
    .fifo_threshold(out_vec[2:2]),
    .fifo_overflow(out_vec[1:1]),
    .fifo_underflow(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h389;
    stim[1] = 11'h16d;
    stim[2] = 11'h775;
    stim[3] = 11'h5d5;
    stim[4] = 11'h502;
    stim[5] = 11'h7ab;
    stim[6] = 11'h7a5;
    stim[7] = 11'h7e0;
    stim[8] = 11'h444;
    stim[9] = 11'h704;
    stim[10] = 11'h71b;
    stim[11] = 11'h79b;
    stim[12] = 11'h65b;
    stim[13] = 11'h41b;
    stim[14] = 11'h479;
    stim[15] = 11'h75f;
    stim[16] = 11'h714;
    stim[17] = 11'h654;
    stim[18] = 11'h579;
    stim[19] = 11'h5a7;
    stim[20] = 11'h63b;
    stim[21] = 11'h421;
    stim[22] = 11'h404;
    stim[23] = 11'h745;
    stim[24] = 11'h7b1;
    stim[25] = 11'h510;
    stim[26] = 11'h672;
    stim[27] = 11'h6fd;
    stim[28] = 11'h600;
    stim[29] = 11'h78c;
    stim[30] = 11'h638;
    stim[31] = 11'h52c;
    stim[32] = 11'h772;
    stim[33] = 11'h6d2;
    stim[34] = 11'h4ea;
    stim[35] = 11'h7c3;
    stim[36] = 11'h40d;
    stim[37] = 11'h477;
    stim[38] = 11'h6f6;
    stim[39] = 11'h640;
    stim[40] = 11'h63a;
    stim[41] = 11'h714;
    stim[42] = 11'h75e;
    stim[43] = 11'h738;
    stim[44] = 11'h473;
    stim[45] = 11'h57f;
    stim[46] = 11'h6b3;
    stim[47] = 11'h525;
    stim[48] = 11'h76a;
    stim[49] = 11'h52e;
    stim[50] = 11'h44e;
    stim[51] = 11'h45a;
    stim[52] = 11'h6fa;
    stim[53] = 11'h715;
    stim[54] = 11'h5d9;
    stim[55] = 11'h624;
    stim[56] = 11'h689;
    stim[57] = 11'h4ec;
    stim[58] = 11'h7b5;
    stim[59] = 11'h551;
    stim[60] = 11'h7e6;
    stim[61] = 11'h632;
    stim[62] = 11'h61a;
    stim[63] = 11'h7b5;
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
      expv[0] = 13'hxxx8;
      expv[1] = 13'h1128;
      expv[2] = 13'h1128;
      expv[3] = 13'h0ea0;
      expv[4] = 13'hxxx8;
      expv[5] = 13'hxxx9;
      expv[6] = 13'h1560;
      expv[7] = 13'h14a0;
      expv[8] = 13'h1c00;
      expv[9] = 13'h1c00;
      expv[10] = 13'h0080;
      expv[11] = 13'h0360;
      expv[12] = 13'h1360;
      expv[13] = 13'h1360;
      expv[14] = 13'h1360;
      expv[15] = 13'h1360;
      expv[16] = 13'h0b60;
      expv[17] = 13'h0be0;
      expv[18] = 13'h0be0;
      expv[19] = 13'h0280;
      expv[20] = 13'h0a80;
      expv[21] = 13'h0a80;
      expv[22] = 13'h0a80;
      expv[23] = 13'h0a80;
      expv[24] = 13'h0760;
      expv[25] = 13'h08a0;
      expv[26] = 13'h1620;
      expv[27] = 13'h1620;
      expv[28] = 13'h1620;
      expv[29] = 13'h1620;
      expv[30] = 13'h0e40;
      expv[31] = 13'h0e40;
      expv[32] = 13'h1fa0;
      expv[33] = 13'h0000;
      expv[34] = 13'h0000;
      expv[35] = 13'h0000;
      expv[36] = 13'h1180;
      expv[37] = 13'h1180;
      expv[38] = 13'h1180;
      expv[39] = 13'h1180;
      expv[40] = 13'h1180;
      expv[41] = 13'h1184;
      expv[42] = 13'h0704;
      expv[43] = 13'h0e44;
      expv[44] = 13'h1a44;
      expv[45] = 13'h1a44;
      expv[46] = 13'h1860;
      expv[47] = 13'h1864;
      expv[48] = 13'h1ec0;
      expv[49] = 13'h0800;
      expv[50] = 13'h0740;
      expv[51] = 13'h0740;
      expv[52] = 13'h0740;
      expv[53] = 13'h0740;
      expv[54] = 13'h0280;
      expv[55] = 13'h0bc0;
      expv[56] = 13'h0bc0;
      expv[57] = 13'h0bc4;
      expv[58] = 13'h0bc4;
      expv[59] = 13'h0704;
      expv[60] = 13'h1660;
      expv[61] = 13'h0d40;
      expv[62] = 13'h0d44;
      expv[63] = 13'h0d44;
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
