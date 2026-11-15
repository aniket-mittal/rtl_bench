// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 25;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_057981 dut (
    .clk(clk),
    .rst(in_vec[24:24]),
    .ce(in_vec[23:23]),
    .a(in_vec[22:17]),
    .b(in_vec[16:9]),
    .c(in_vec[8:0]),
    .p(out_vec[12:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 25'h11ef75e;
    stim[1] = 25'h15509f0;
    stim[2] = 25'h0c30c8a;
    stim[3] = 25'h0e57e61;
    stim[4] = 25'h0c87dfa;
    stim[5] = 25'h07682f1;
    stim[6] = 25'h00dc789;
    stim[7] = 25'h00114ad;
    stim[8] = 25'h0055342;
    stim[9] = 25'h015864c;
    stim[10] = 25'h09b1142;
    stim[11] = 25'h06ef4b9;
    stim[12] = 25'h0975451;
    stim[13] = 25'h0ff1d0e;
    stim[14] = 25'h0c8ace0;
    stim[15] = 25'h083e8c6;
    stim[16] = 25'h0890030;
    stim[17] = 25'h09f226c;
    stim[18] = 25'h0b12a78;
    stim[19] = 25'h06fbbbd;
    stim[20] = 25'h0d5c8d8;
    stim[21] = 25'h064a51f;
    stim[22] = 25'h0cabb06;
    stim[23] = 25'h0c62d36;
    stim[24] = 25'h0b4483b;
    stim[25] = 25'h0462cce;
    stim[26] = 25'h084d4df;
    stim[27] = 25'h0e63ea1;
    stim[28] = 25'h1098745;
    stim[29] = 25'h0961aec;
    stim[30] = 25'h17f6183;
    stim[31] = 25'h0c41965;
    stim[32] = 25'h0f4494d;
    stim[33] = 25'h0297f46;
    stim[34] = 25'h0039057;
    stim[35] = 25'h0ab7c7e;
    stim[36] = 25'h0404aee;
    stim[37] = 25'h096f078;
    stim[38] = 25'h0140456;
    stim[39] = 25'h085266e;
    stim[40] = 25'h035e50a;
    stim[41] = 25'h02d40b2;
    stim[42] = 25'h0324996;
    stim[43] = 25'h066bf88;
    stim[44] = 25'h0d0121b;
    stim[45] = 25'h0ea83c1;
    stim[46] = 25'h0881e63;
    stim[47] = 25'h06371c4;
    stim[48] = 25'h0cf1a02;
    stim[49] = 25'h094f079;
    stim[50] = 25'h078a829;
    stim[51] = 25'h05e5eec;
    stim[52] = 25'h041b80d;
    stim[53] = 25'h06d5b78;
    stim[54] = 25'h053960f;
    stim[55] = 25'h0dfb841;
    stim[56] = 25'h0d1a4db;
    stim[57] = 25'h0db9969;
    stim[58] = 25'h07f4aa9;
    stim[59] = 25'h072abab;
    stim[60] = 25'h0d5a4a1;
    stim[61] = 25'h0e5cfde;
    stim[62] = 25'h0a21465;
    stim[63] = 25'h07ed7ad;
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
      expv[0] = 13'hxxxx;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h008a;
      expv[4] = 13'h11a7;
      expv[5] = 13'h0748;
      expv[6] = 13'h0748;
      expv[7] = 13'h0748;
      expv[8] = 13'h0748;
      expv[9] = 13'h0748;
      expv[10] = 13'h0748;
      expv[11] = 13'h09fa;
      expv[12] = 13'h09fa;
      expv[13] = 13'h0739;
      expv[14] = 13'h085c;
      expv[15] = 13'h03d2;
      expv[16] = 13'h0cde;
      expv[17] = 13'h0124;
      expv[18] = 13'h026c;
      expv[19] = 13'h08f7;
      expv[20] = 13'h08f7;
      expv[21] = 13'h0ed0;
      expv[22] = 13'h0ed0;
      expv[23] = 13'h066e;
      expv[24] = 13'h0ea7;
      expv[25] = 13'h033d;
      expv[26] = 13'h033d;
      expv[27] = 13'h0487;
      expv[28] = 13'h0175;
      expv[29] = 13'h0000;
      expv[30] = 13'h00ec;
      expv[31] = 13'h0000;
      expv[32] = 13'h0165;
      expv[33] = 13'h02e5;
      expv[34] = 13'h02e5;
      expv[35] = 13'h02e5;
      expv[36] = 13'h08a6;
      expv[37] = 13'h08a6;
      expv[38] = 13'h100e;
      expv[39] = 13'h100e;
      expv[40] = 13'h0596;
      expv[41] = 13'h0596;
      expv[42] = 13'h0596;
      expv[43] = 13'h0596;
      expv[44] = 13'h0596;
      expv[45] = 13'h0141;
      expv[46] = 13'h0329;
      expv[47] = 13'h0dd8;
      expv[48] = 13'h0dd8;
      expv[49] = 13'h003e;
      expv[50] = 13'h15f4;
      expv[51] = 13'h15f4;
      expv[52] = 13'h15f4;
      expv[53] = 13'h15f4;
      expv[54] = 13'h15f4;
      expv[55] = 13'h15f4;
      expv[56] = 13'h04f1;
      expv[57] = 13'h093f;
      expv[58] = 13'h0239;
      expv[59] = 13'h0239;
      expv[60] = 13'h0239;
      expv[61] = 13'h047d;
      expv[62] = 13'h0452;
      expv[63] = 13'h0d83;
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
