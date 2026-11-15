// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 23;
  localparam OW = 45;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_034222 dut (
    .clk(clk),
    .w_enable(in_vec[22:22]),
    .reset(in_vec[21:21]),
    .rx_ready(in_vec[20:20]),
    .row(in_vec[19:14]),
    .col(in_vec[13:8]),
    .pixel_in(in_vec[7:0]),
    .flag(out_vec[44:44]),
    .pixel_out(out_vec[43:36]),
    .out_row(out_vec[35:30]),
    .out_col(out_vec[29:24]),
    .three_rows(out_vec[23:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 23'h7df562;
    stim[1] = 23'h61034e;
    stim[2] = 23'h09942c;
    stim[3] = 23'h096c8b;
    stim[4] = 23'h132b99;
    stim[5] = 23'h529244;
    stim[6] = 23'h5b27c0;
    stim[7] = 23'h03431f;
    stim[8] = 23'h055aa6;
    stim[9] = 23'h0f9147;
    stim[10] = 23'h5797cd;
    stim[11] = 23'h475808;
    stim[12] = 23'h59ebdc;
    stim[13] = 23'h42e746;
    stim[14] = 23'h43390c;
    stim[15] = 23'h5468d2;
    stim[16] = 23'h068b34;
    stim[17] = 23'h0f6845;
    stim[18] = 23'h17f88a;
    stim[19] = 23'h18809f;
    stim[20] = 23'h1568ed;
    stim[21] = 23'h14f025;
    stim[22] = 23'h07632d;
    stim[23] = 23'h09b0dd;
    stim[24] = 23'h03a55f;
    stim[25] = 23'h5e61f5;
    stim[26] = 23'h05e5c0;
    stim[27] = 23'h50e09d;
    stim[28] = 23'h40d512;
    stim[29] = 23'h00f42d;
    stim[30] = 23'h592196;
    stim[31] = 23'h5ffe50;
    stim[32] = 23'h51e114;
    stim[33] = 23'h4283c2;
    stim[34] = 23'h54797d;
    stim[35] = 23'h11e685;
    stim[36] = 23'h0686d1;
    stim[37] = 23'h5ee165;
    stim[38] = 23'h0fb9b7;
    stim[39] = 23'h1352ea;
    stim[40] = 23'h147c2a;
    stim[41] = 23'h1bfd85;
    stim[42] = 23'h16be3e;
    stim[43] = 23'h0f6dd5;
    stim[44] = 23'h43e20d;
    stim[45] = 23'h55bb35;
    stim[46] = 23'h11119c;
    stim[47] = 23'h58a80a;
    stim[48] = 23'h14448f;
    stim[49] = 23'h01c990;
    stim[50] = 23'h10a159;
    stim[51] = 23'h1fc635;
    stim[52] = 23'h1e27ba;
    stim[53] = 23'h438f62;
    stim[54] = 23'h5cea38;
    stim[55] = 23'h192974;
    stim[56] = 23'h46a183;
    stim[57] = 23'h59487f;
    stim[58] = 23'h1ce409;
    stim[59] = 23'h18f157;
    stim[60] = 23'h0c637b;
    stim[61] = 23'h533818;
    stim[62] = 23'h00e9e0;
    stim[63] = 23'h1780f0;
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
      expv[0] = 45'hxxxxxxxxxxxx;
      expv[1] = 45'h0xxxxxxxxxxx;
      expv[2] = 45'h0xxxxxxxxxxx;
      expv[3] = 45'h0xx994xxxxxx;
      expv[4] = 45'h0xx96cxxxxxx;
      expv[5] = 45'h0xx32bxxxxxx;
      expv[6] = 45'h044292xxxx44;
      expv[7] = 45'h0c0b27xxxxc0;
      expv[8] = 45'h0xx343xxxxc0;
      expv[9] = 45'h0xx55axxxxc0;
      expv[10] = 45'h0xxf91xxxxc0;
      expv[11] = 45'h0cd797xx44cd;
      expv[12] = 45'h0xx758xx44cd;
      expv[13] = 45'h0dc9eb44c0dc;
      expv[14] = 45'h0xx2e744c0dc;
      expv[15] = 45'h0xx33944c0dc;
      expv[16] = 45'h0d2468c0cdd2;
      expv[17] = 45'h0xx68bc0cdd2;
      expv[18] = 45'h0xxf68c0cdd2;
      expv[19] = 45'h0xx7f8c0cdd2;
      expv[20] = 45'h0xx880c0cdd2;
      expv[21] = 45'h0xx568c0cdd2;
      expv[22] = 45'h0xx4f0c0cdd2;
      expv[23] = 45'h0xx763c0cdd2;
      expv[24] = 45'h0xx9b0c0cdd2;
      expv[25] = 45'h0xx3a5c0cdd2;
      expv[26] = 45'h0f5e61cddcf5;
      expv[27] = 45'h0xx5e5cddcf5;
      expv[28] = 45'h09d0e0dcd29d;
      expv[29] = 45'h0xx0d5dcd29d;
      expv[30] = 45'h0xx0f4dcd29d;
      expv[31] = 45'h096921d2f596;
      expv[32] = 45'h050ffef59d50;
      expv[33] = 45'h0141e19d9614;
      expv[34] = 45'h0xx2839d9614;
      expv[35] = 45'h07d47996507d;
      expv[36] = 45'h0xx1e696507d;
      expv[37] = 45'h0xx68696507d;
      expv[38] = 45'h065ee1501465;
      expv[39] = 45'h0xxfb9501465;
      expv[40] = 45'h0xx352501465;
      expv[41] = 45'h0xx47c501465;
      expv[42] = 45'h0xxbfd501465;
      expv[43] = 45'h0xx6be501465;
      expv[44] = 45'h0xxf6d501465;
      expv[45] = 45'h0xx3e2501465;
      expv[46] = 45'h0355bb147d35;
      expv[47] = 45'h0xx111147d35;
      expv[48] = 45'h00a8a87d650a;
      expv[49] = 45'h0xx4447d650a;
      expv[50] = 45'h0xx1c97d650a;
      expv[51] = 45'h0xx0a17d650a;
      expv[52] = 45'h0xxfc67d650a;
      expv[53] = 45'h0xxe277d650a;
      expv[54] = 45'h0xx38f7d650a;
      expv[55] = 45'h038cea653538;
      expv[56] = 45'h0xx929653538;
      expv[57] = 45'h0xx6a1653538;
      expv[58] = 45'h07f948350a7f;
      expv[59] = 45'h0xxce4350a7f;
      expv[60] = 45'h0xx8f1350a7f;
      expv[61] = 45'h0xxc63350a7f;
      expv[62] = 45'h0183380a3818;
      expv[63] = 45'h0xx0e90a3818;
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
