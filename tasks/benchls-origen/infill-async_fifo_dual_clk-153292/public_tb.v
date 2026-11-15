// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_153292 dut (
    .wclk(clk),
    .wrst(in_vec[12:12]),
    .wr(in_vec[11:11]),
    .wdata(in_vec[10:3]),
    .rclk(in_vec[2:2]),
    .rrst(in_vec[1:1]),
    .rd(in_vec[0:0]),
    .full(out_vec[9:9]),
    .rdata(out_vec[8:1]),
    .empty(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h1c96;
    stim[1] = 13'h172d;
    stim[2] = 13'h0d26;
    stim[3] = 13'h0451;
    stim[4] = 13'h09e7;
    stim[5] = 13'h01d3;
    stim[6] = 13'h087f;
    stim[7] = 13'h0a9a;
    stim[8] = 13'h0489;
    stim[9] = 13'h0268;
    stim[10] = 13'h0c60;
    stim[11] = 13'h0062;
    stim[12] = 13'h02b6;
    stim[13] = 13'h0e72;
    stim[14] = 13'h09f4;
    stim[15] = 13'h08a0;
    stim[16] = 13'h0dcb;
    stim[17] = 13'h1c48;
    stim[18] = 13'h0e02;
    stim[19] = 13'h05fe;
    stim[20] = 13'h05e1;
    stim[21] = 13'h0bfc;
    stim[22] = 13'h042e;
    stim[23] = 13'h09bf;
    stim[24] = 13'h0e5f;
    stim[25] = 13'h0dab;
    stim[26] = 13'h00d3;
    stim[27] = 13'h0145;
    stim[28] = 13'h07cc;
    stim[29] = 13'h0f1a;
    stim[30] = 13'h086d;
    stim[31] = 13'h03d6;
    stim[32] = 13'h03eb;
    stim[33] = 13'h065d;
    stim[34] = 13'h0da7;
    stim[35] = 13'h039a;
    stim[36] = 13'h0817;
    stim[37] = 13'h1947;
    stim[38] = 13'h0273;
    stim[39] = 13'h0cd2;
    stim[40] = 13'h0bcc;
    stim[41] = 13'h1e45;
    stim[42] = 13'h0906;
    stim[43] = 13'h0d64;
    stim[44] = 13'h02d0;
    stim[45] = 13'h07c1;
    stim[46] = 13'h0a99;
    stim[47] = 13'h0872;
    stim[48] = 13'h0bb3;
    stim[49] = 13'h0783;
    stim[50] = 13'h0e0c;
    stim[51] = 13'h0272;
    stim[52] = 13'h05ce;
    stim[53] = 13'h0006;
    stim[54] = 13'h0090;
    stim[55] = 13'h0c75;
    stim[56] = 13'h0f4f;
    stim[57] = 13'h0bc1;
    stim[58] = 13'h00ef;
    stim[59] = 13'h0e7c;
    stim[60] = 13'h006a;
    stim[61] = 13'h022b;
    stim[62] = 13'h0a56;
    stim[63] = 13'h0da6;
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
      expv[0] = 10'hxxx;
      expv[1] = 10'h125;
      expv[2] = 10'h125;
      expv[3] = 10'h149;
      expv[4] = 10'h149;
      expv[5] = 10'h149;
      expv[6] = 10'h149;
      expv[7] = 10'h149;
      expv[8] = 10'h149;
      expv[9] = 10'h149;
      expv[10] = 10'h149;
      expv[11] = 10'h149;
      expv[12] = 10'h149;
      expv[13] = 10'h149;
      expv[14] = 10'h149;
      expv[15] = 10'h149;
      expv[16] = 10'h149;
      expv[17] = 10'h149;
      expv[18] = 10'h113;
      expv[19] = 10'h181;
      expv[20] = 10'h181;
      expv[21] = 10'h181;
      expv[22] = 10'h181;
      expv[23] = 10'h181;
      expv[24] = 10'h181;
      expv[25] = 10'h181;
      expv[26] = 10'h181;
      expv[27] = 10'h181;
      expv[28] = 10'h181;
      expv[29] = 10'h181;
      expv[30] = 10'h181;
      expv[31] = 10'h181;
      expv[32] = 10'h181;
      expv[33] = 10'h181;
      expv[34] = 10'h181;
      expv[35] = 10'h181;
      expv[36] = 10'h181;
      expv[37] = 10'h181;
      expv[38] = 10'h051;
      expv[39] = 10'h051;
      expv[40] = 10'h135;
      expv[41] = 10'h135;
      expv[42] = 10'h191;
      expv[43] = 10'h041;
      expv[44] = 10'h041;
      expv[45] = 10'h041;
      expv[46] = 10'h041;
      expv[47] = 10'h041;
      expv[48] = 10'h041;
      expv[49] = 10'h041;
      expv[50] = 10'h041;
      expv[51] = 10'h041;
      expv[52] = 10'h041;
      expv[53] = 10'h041;
      expv[54] = 10'h041;
      expv[55] = 10'h041;
      expv[56] = 10'h041;
      expv[57] = 10'h041;
      expv[58] = 10'h041;
      expv[59] = 10'h041;
      expv[60] = 10'h041;
      expv[61] = 10'h041;
      expv[62] = 10'h041;
      expv[63] = 10'h041;
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
