// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 24;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_01242 dut (
    .clk(clk),
    .resetn(in_vec[10:10]),
    .din(in_vec[9:2]),
    .shift_in(in_vec[1:1]),
    .shift_out(in_vec[0:0]),
    .dout(out_vec[23:16]),
    .used_slots(out_vec[15:8]),
    .free_slots(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h0f2;
    stim[1] = 11'h151;
    stim[2] = 11'h7c2;
    stim[3] = 11'h75e;
    stim[4] = 11'h63b;
    stim[5] = 11'h457;
    stim[6] = 11'h72b;
    stim[7] = 11'h7cc;
    stim[8] = 11'h5a1;
    stim[9] = 11'h56c;
    stim[10] = 11'h725;
    stim[11] = 11'h7d0;
    stim[12] = 11'h41d;
    stim[13] = 11'h6d3;
    stim[14] = 11'h7d4;
    stim[15] = 11'h5ee;
    stim[16] = 11'h7cc;
    stim[17] = 11'h797;
    stim[18] = 11'h415;
    stim[19] = 11'h614;
    stim[20] = 11'h574;
    stim[21] = 11'h6df;
    stim[22] = 11'h426;
    stim[23] = 11'h47b;
    stim[24] = 11'h539;
    stim[25] = 11'h775;
    stim[26] = 11'h6df;
    stim[27] = 11'h436;
    stim[28] = 11'h44b;
    stim[29] = 11'h7c5;
    stim[30] = 11'h4c2;
    stim[31] = 11'h644;
    stim[32] = 11'h636;
    stim[33] = 11'h7d5;
    stim[34] = 11'h6ac;
    stim[35] = 11'h646;
    stim[36] = 11'h428;
    stim[37] = 11'h7c6;
    stim[38] = 11'h7b2;
    stim[39] = 11'h618;
    stim[40] = 11'h500;
    stim[41] = 11'h50d;
    stim[42] = 11'h506;
    stim[43] = 11'h49d;
    stim[44] = 11'h686;
    stim[45] = 11'h61e;
    stim[46] = 11'h40f;
    stim[47] = 11'h660;
    stim[48] = 11'h678;
    stim[49] = 11'h757;
    stim[50] = 11'h4ad;
    stim[51] = 11'h54e;
    stim[52] = 11'h703;
    stim[53] = 11'h4c5;
    stim[54] = 11'h706;
    stim[55] = 11'h645;
    stim[56] = 11'h4be;
    stim[57] = 11'h7d4;
    stim[58] = 11'h49d;
    stim[59] = 11'h548;
    stim[60] = 11'h53f;
    stim[61] = 11'h5d1;
    stim[62] = 11'h580;
    stim[63] = 11'h5f5;
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
      expv[0] = 24'hxxxxxx;
      expv[1] = 24'hxx00ff;
      expv[2] = 24'hxx00ff;
      expv[3] = 24'hf001fe;
      expv[4] = 24'hf002fd;
      expv[5] = 24'hd702fd;
      expv[6] = 24'h8e02fd;
      expv[7] = 24'h1502fd;
      expv[8] = 24'h1502fd;
      expv[9] = 24'hca01fe;
      expv[10] = 24'hca01fe;
      expv[11] = 24'h5b00ff;
      expv[12] = 24'hf400ff;
      expv[13] = 24'h0700ff;
      expv[14] = 24'hb401fe;
      expv[15] = 24'hb401fe;
      expv[16] = 24'hb402fd;
      expv[17] = 24'hb402fd;
      expv[18] = 24'h7b02fd;
      expv[19] = 24'he501fe;
      expv[20] = 24'he501fe;
      expv[21] = 24'he501fe;
      expv[22] = 24'h5d01fe;
      expv[23] = 24'hb702fd;
      expv[24] = 24'h0902fd;
      expv[25] = 24'h1e01fe;
      expv[26] = 24'h4e00ff;
      expv[27] = 24'hb701fe;
      expv[28] = 24'hb702fd;
      expv[29] = 24'h0d02fd;
      expv[30] = 24'h1201fe;
      expv[31] = 24'h1202fd;
      expv[32] = 24'h1202fd;
      expv[33] = 24'h1203fc;
      expv[34] = 24'h3002fd;
      expv[35] = 24'h3002fd;
      expv[36] = 24'h3003fc;
      expv[37] = 24'h3003fc;
      expv[38] = 24'h3004fb;
      expv[39] = 24'h3005fa;
      expv[40] = 24'h3005fa;
      expv[41] = 24'h3005fa;
      expv[42] = 24'h8d04fb;
      expv[43] = 24'h8d05fa;
      expv[44] = 24'h9104fb;
      expv[45] = 24'h9105fa;
      expv[46] = 24'h9106f9;
      expv[47] = 24'hf106f9;
      expv[48] = 24'hf106f9;
      expv[49] = 24'hf106f9;
      expv[50] = 24'hec06f9;
      expv[51] = 24'h4105fa;
      expv[52] = 24'h4106f9;
      expv[53] = 24'ha106f9;
      expv[54] = 24'h8705fa;
      expv[55] = 24'h8706f9;
      expv[56] = 24'h0305fa;
      expv[57] = 24'h0306f9;
      expv[58] = 24'h0306f9;
      expv[59] = 24'hd505fa;
      expv[60] = 24'hd505fa;
      expv[61] = 24'h5305fa;
      expv[62] = 24'hc004fb;
      expv[63] = 24'hc004fb;
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
