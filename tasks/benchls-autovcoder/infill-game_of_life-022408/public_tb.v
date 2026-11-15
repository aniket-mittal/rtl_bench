// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 27;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_022408 dut (
    .clk(clk),
    .rst(in_vec[1:1]),
    .din(in_vec[0:0]),
    .addr_rd(out_vec[26:15]),
    .we_rd(out_vec[14:14]),
    .addr_wr(out_vec[13:2]),
    .we_wr(out_vec[1:1]),
    .dout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h2;
    stim[1] = 2'h3;
    stim[2] = 2'h0;
    stim[3] = 2'h1;
    stim[4] = 2'h1;
    stim[5] = 2'h1;
    stim[6] = 2'h1;
    stim[7] = 2'h0;
    stim[8] = 2'h0;
    stim[9] = 2'h1;
    stim[10] = 2'h1;
    stim[11] = 2'h0;
    stim[12] = 2'h0;
    stim[13] = 2'h0;
    stim[14] = 2'h0;
    stim[15] = 2'h0;
    stim[16] = 2'h0;
    stim[17] = 2'h0;
    stim[18] = 2'h1;
    stim[19] = 2'h0;
    stim[20] = 2'h1;
    stim[21] = 2'h0;
    stim[22] = 2'h0;
    stim[23] = 2'h0;
    stim[24] = 2'h1;
    stim[25] = 2'h1;
    stim[26] = 2'h1;
    stim[27] = 2'h1;
    stim[28] = 2'h0;
    stim[29] = 2'h1;
    stim[30] = 2'h1;
    stim[31] = 2'h0;
    stim[32] = 2'h1;
    stim[33] = 2'h0;
    stim[34] = 2'h1;
    stim[35] = 2'h0;
    stim[36] = 2'h1;
    stim[37] = 2'h1;
    stim[38] = 2'h0;
    stim[39] = 2'h1;
    stim[40] = 2'h0;
    stim[41] = 2'h0;
    stim[42] = 2'h0;
    stim[43] = 2'h0;
    stim[44] = 2'h0;
    stim[45] = 2'h1;
    stim[46] = 2'h1;
    stim[47] = 2'h0;
    stim[48] = 2'h1;
    stim[49] = 2'h1;
    stim[50] = 2'h0;
    stim[51] = 2'h0;
    stim[52] = 2'h0;
    stim[53] = 2'h1;
    stim[54] = 2'h0;
    stim[55] = 2'h0;
    stim[56] = 2'h1;
    stim[57] = 2'h1;
    stim[58] = 2'h0;
    stim[59] = 2'h1;
    stim[60] = 2'h1;
    stim[61] = 2'h1;
    stim[62] = 2'h0;
    stim[63] = 2'h1;
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
      expv[0] = 27'hxxxxxxx;
      expv[1] = 27'hxxxx000;
      expv[2] = 27'hxxxx000;
      expv[3] = 27'h7e00000;
      expv[4] = 27'h7e08000;
      expv[5] = 27'h01f8001;
      expv[6] = 27'h0008001;
      expv[7] = 27'h03f8000;
      expv[8] = 27'h0200000;
      expv[9] = 27'h0208000;
      expv[10] = 27'h0000000;
      expv[11] = 27'hxxxx002;
      expv[12] = 27'h7e00004;
      expv[13] = 27'h7e08004;
      expv[14] = 27'h7e10004;
      expv[15] = 27'h0000004;
      expv[16] = 27'h0010004;
      expv[17] = 27'h0200004;
      expv[18] = 27'h0208004;
      expv[19] = 27'h0210004;
      expv[20] = 27'h0008004;
      expv[21] = 27'hxxxx007;
      expv[22] = 27'h7e08008;
      expv[23] = 27'h7e10008;
      expv[24] = 27'h7e18008;
      expv[25] = 27'h0008008;
      expv[26] = 27'h0018009;
      expv[27] = 27'h0208009;
      expv[28] = 27'h0210008;
      expv[29] = 27'h0218008;
      expv[30] = 27'h0010008;
      expv[31] = 27'hxxxx00a;
      expv[32] = 27'h7e1000c;
      expv[33] = 27'h7e1800c;
      expv[34] = 27'h7e2000c;
      expv[35] = 27'h001000c;
      expv[36] = 27'h002000c;
      expv[37] = 27'h021000d;
      expv[38] = 27'h021800d;
      expv[39] = 27'h022000d;
      expv[40] = 27'h001800c;
      expv[41] = 27'hxxxx00e;
      expv[42] = 27'h7e18010;
      expv[43] = 27'h7e20010;
      expv[44] = 27'h7e28010;
      expv[45] = 27'h0018010;
      expv[46] = 27'h0028010;
      expv[47] = 27'h0218011;
      expv[48] = 27'h0220010;
      expv[49] = 27'h0228011;
      expv[50] = 27'h0020010;
      expv[51] = 27'hxxxx012;
      expv[52] = 27'h7e20014;
      expv[53] = 27'h7e28014;
      expv[54] = 27'h7e30014;
      expv[55] = 27'h0020014;
      expv[56] = 27'h0030014;
      expv[57] = 27'h0220015;
      expv[58] = 27'h0228015;
      expv[59] = 27'h0230015;
      expv[60] = 27'h0028014;
      expv[61] = 27'hxxxx016;
      expv[62] = 27'h7e28018;
      expv[63] = 27'h7e30018;
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
