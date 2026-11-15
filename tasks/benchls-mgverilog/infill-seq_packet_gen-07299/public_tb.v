// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 19;
  localparam OW = 37;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07299 dut (
    .clk(clk),
    .reset(in_vec[18:18]),
    .clear(in_vec[17:17]),
    .len(in_vec[16:1]),
    .dst_rdy_i(in_vec[0:0]),
    .data_o(out_vec[36:1]),
    .src_rdy_o(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 19'h641c1;
    stim[1] = 19'h41a1b;
    stim[2] = 19'h0fb13;
    stim[3] = 19'h1c71b;
    stim[4] = 19'h33af4;
    stim[5] = 19'h0b80a;
    stim[6] = 19'h0d307;
    stim[7] = 19'h0a776;
    stim[8] = 19'h0b04c;
    stim[9] = 19'h0684f;
    stim[10] = 19'h0073f;
    stim[11] = 19'h34dbc;
    stim[12] = 19'h05cba;
    stim[13] = 19'h2c125;
    stim[14] = 19'h1d826;
    stim[15] = 19'h037e3;
    stim[16] = 19'h381a4;
    stim[17] = 19'h2d153;
    stim[18] = 19'h20196;
    stim[19] = 19'h3aba3;
    stim[20] = 19'h34db5;
    stim[21] = 19'h2a2ce;
    stim[22] = 19'h0110d;
    stim[23] = 19'h0441b;
    stim[24] = 19'h1d827;
    stim[25] = 19'h3655a;
    stim[26] = 19'h1dce9;
    stim[27] = 19'h07cdf;
    stim[28] = 19'h01b65;
    stim[29] = 19'h3be78;
    stim[30] = 19'h29b53;
    stim[31] = 19'h0c601;
    stim[32] = 19'h28802;
    stim[33] = 19'h30795;
    stim[34] = 19'h1bca2;
    stim[35] = 19'h2f8f3;
    stim[36] = 19'h05185;
    stim[37] = 19'h39c90;
    stim[38] = 19'h0d10e;
    stim[39] = 19'h24311;
    stim[40] = 19'h002b2;
    stim[41] = 19'h15ee7;
    stim[42] = 19'h325de;
    stim[43] = 19'h1b3ce;
    stim[44] = 19'h1ac9b;
    stim[45] = 19'h09572;
    stim[46] = 19'h01d74;
    stim[47] = 19'h1cd4c;
    stim[48] = 19'h11aa8;
    stim[49] = 19'h39a12;
    stim[50] = 19'h2a4a3;
    stim[51] = 19'h207d4;
    stim[52] = 19'h3df38;
    stim[53] = 19'h3fe97;
    stim[54] = 19'h49297;
    stim[55] = 19'h2dea5;
    stim[56] = 19'h37f98;
    stim[57] = 19'h1ce21;
    stim[58] = 19'h18215;
    stim[59] = 19'h0208d;
    stim[60] = 19'h3f995;
    stim[61] = 19'h2fd63;
    stim[62] = 19'h1f013;
    stim[63] = 19'h2c6fa;
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
      expv[0] = 37'h0xxxxxxxxx;
      expv[1] = 37'h0200001a1b;
      expv[2] = 37'h020000fb13;
      expv[3] = 37'h0000000001;
      expv[4] = 37'h01fffa0005;
      expv[5] = 37'h020000b80b;
      expv[6] = 37'h020000d307;
      expv[7] = 37'h0000000001;
      expv[8] = 37'h0000000001;
      expv[9] = 37'h0000000001;
      expv[10] = 37'h01fffa0005;
      expv[11] = 37'h01fff80007;
      expv[12] = 37'h0200005cbb;
      expv[13] = 37'h020000c125;
      expv[14] = 37'h020001d827;
      expv[15] = 37'h02000037e3;
      expv[16] = 37'h0000000001;
      expv[17] = 37'h020000d153;
      expv[18] = 37'h0200000197;
      expv[19] = 37'h020001aba3;
      expv[20] = 37'h0200014db5;
      expv[21] = 37'h020000a2cf;
      expv[22] = 37'h020000110d;
      expv[23] = 37'h0000000001;
      expv[24] = 37'h01fffa0005;
      expv[25] = 37'h01fff80007;
      expv[26] = 37'h020001dce9;
      expv[27] = 37'h0000000001;
      expv[28] = 37'h01fffa0005;
      expv[29] = 37'h01fff80007;
      expv[30] = 37'h0200009b53;
      expv[31] = 37'h020000c601;
      expv[32] = 37'h0000000001;
      expv[33] = 37'h0200010795;
      expv[34] = 37'h020001bca3;
      expv[35] = 37'h020000f8f3;
      expv[36] = 37'h0200005185;
      expv[37] = 37'h0000000001;
      expv[38] = 37'h020000d10f;
      expv[39] = 37'h0200004311;
      expv[40] = 37'h02000002b3;
      expv[41] = 37'h0200015ee7;
      expv[42] = 37'h0000000001;
      expv[43] = 37'h020001b3cf;
      expv[44] = 37'h020001ac9b;
      expv[45] = 37'h0000000001;
      expv[46] = 37'h0000000001;
      expv[47] = 37'h0000000001;
      expv[48] = 37'h0000000001;
      expv[49] = 37'h0000000001;
      expv[50] = 37'h020000a4a3;
      expv[51] = 37'h02000007d5;
      expv[52] = 37'h020001df39;
      expv[53] = 37'h020001fe97;
      expv[54] = 37'h0200009297;
      expv[55] = 37'h020000dea5;
      expv[56] = 37'h0200017f99;
      expv[57] = 37'h020001ce21;
      expv[58] = 37'h0000000001;
      expv[59] = 37'h01fffa0005;
      expv[60] = 37'h01fff80007;
      expv[61] = 37'h020000fd63;
      expv[62] = 37'h020001f013;
      expv[63] = 37'h0000000001;
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
