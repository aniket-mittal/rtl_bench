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

  origen_185353 dut (
    .CLK(clk),
    .RSTn(in_vec[10:10]),
    .RX_Done_Sig(in_vec[9:9]),
    .RX_Data(in_vec[8:1]),
    .Full_Sig(in_vec[0:0]),
    .RX_En_Sig(out_vec[9:9]),
    .Write_Req_Sig(out_vec[8:8]),
    .FIFO_Write_Data(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h2a4;
    stim[1] = 11'h22a;
    stim[2] = 11'h26e;
    stim[3] = 11'h6d9;
    stim[4] = 11'h5fd;
    stim[5] = 11'h404;
    stim[6] = 11'h44d;
    stim[7] = 11'h417;
    stim[8] = 11'h47e;
    stim[9] = 11'h58f;
    stim[10] = 11'h5fc;
    stim[11] = 11'h56b;
    stim[12] = 11'h57a;
    stim[13] = 11'h688;
    stim[14] = 11'h433;
    stim[15] = 11'h5c4;
    stim[16] = 11'h624;
    stim[17] = 11'h7ca;
    stim[18] = 11'h7bc;
    stim[19] = 11'h7c7;
    stim[20] = 11'h6a1;
    stim[21] = 11'h478;
    stim[22] = 11'h7ae;
    stim[23] = 11'h450;
    stim[24] = 11'h473;
    stim[25] = 11'h43c;
    stim[26] = 11'h465;
    stim[27] = 11'h47f;
    stim[28] = 11'h7d8;
    stim[29] = 11'h6a4;
    stim[30] = 11'h51f;
    stim[31] = 11'h57a;
    stim[32] = 11'h4ee;
    stim[33] = 11'h633;
    stim[34] = 11'h454;
    stim[35] = 11'h4b4;
    stim[36] = 11'h504;
    stim[37] = 11'h62b;
    stim[38] = 11'h644;
    stim[39] = 11'h4ab;
    stim[40] = 11'h54d;
    stim[41] = 11'h5cc;
    stim[42] = 11'h67d;
    stim[43] = 11'h4f7;
    stim[44] = 11'h4de;
    stim[45] = 11'h556;
    stim[46] = 11'h6f0;
    stim[47] = 11'h670;
    stim[48] = 11'h7d5;
    stim[49] = 11'h6ff;
    stim[50] = 11'h7dc;
    stim[51] = 11'h2a1;
    stim[52] = 11'h218;
    stim[53] = 11'h62e;
    stim[54] = 11'h60e;
    stim[55] = 11'h70b;
    stim[56] = 11'h56f;
    stim[57] = 11'h495;
    stim[58] = 11'h4b5;
    stim[59] = 11'h62e;
    stim[60] = 11'h52f;
    stim[61] = 11'h4e0;
    stim[62] = 11'h75e;
    stim[63] = 11'h64d;
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
      expv[0] = 10'h052;
      expv[1] = 10'h015;
      expv[2] = 10'h037;
      expv[3] = 10'h06c;
      expv[4] = 10'h0fe;
      expv[5] = 10'h002;
      expv[6] = 10'h026;
      expv[7] = 10'h10b;
      expv[8] = 10'h03f;
      expv[9] = 10'h2c7;
      expv[10] = 10'h2fe;
      expv[11] = 10'h2b5;
      expv[12] = 10'h2bd;
      expv[13] = 10'h244;
      expv[14] = 10'h019;
      expv[15] = 10'h0e2;
      expv[16] = 10'h012;
      expv[17] = 10'h1e5;
      expv[18] = 10'h0de;
      expv[19] = 10'h0e3;
      expv[20] = 10'h050;
      expv[21] = 10'h03c;
      expv[22] = 10'h0d7;
      expv[23] = 10'h128;
      expv[24] = 10'h039;
      expv[25] = 10'h21e;
      expv[26] = 10'h232;
      expv[27] = 10'h23f;
      expv[28] = 10'h2ec;
      expv[29] = 10'h052;
      expv[30] = 10'h08f;
      expv[31] = 10'h1bd;
      expv[32] = 10'h077;
      expv[33] = 10'h219;
      expv[34] = 10'h02a;
      expv[35] = 10'h05a;
      expv[36] = 10'h182;
      expv[37] = 10'h015;
      expv[38] = 10'h022;
      expv[39] = 10'h055;
      expv[40] = 10'h1a6;
      expv[41] = 10'h0e6;
      expv[42] = 10'h23e;
      expv[43] = 10'h07b;
      expv[44] = 10'h06f;
      expv[45] = 10'h0ab;
      expv[46] = 10'h178;
      expv[47] = 10'h038;
      expv[48] = 10'h0ea;
      expv[49] = 10'h07f;
      expv[50] = 10'h0ee;
      expv[51] = 10'h050;
      expv[52] = 10'h00c;
      expv[53] = 10'h017;
      expv[54] = 10'h007;
      expv[55] = 10'h085;
      expv[56] = 10'h1b7;
      expv[57] = 10'h04a;
      expv[58] = 10'h25a;
      expv[59] = 10'h217;
      expv[60] = 10'h097;
      expv[61] = 10'h070;
      expv[62] = 10'h0af;
      expv[63] = 10'h126;
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
