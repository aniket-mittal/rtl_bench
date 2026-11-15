// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_08834 dut (
    .clk(clk),
    .ce(in_vec[12:12]),
    .nrst(in_vec[11:11]),
    .reset(in_vec[10:10]),
    .wdata(in_vec[9:2]),
    .wr(in_vec[1:1]),
    .rd(in_vec[0:0]),
    .rdata(out_vec[10:3]),
    .empty(out_vec[2:2]),
    .half_full(out_vec[1:1]),
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
    stim[0] = 13'h0cfc;
    stim[1] = 13'h0512;
    stim[2] = 13'h11b2;
    stim[3] = 13'h19e9;
    stim[4] = 13'h1a53;
    stim[5] = 13'h0397;
    stim[6] = 13'h1bf8;
    stim[7] = 13'h18d7;
    stim[8] = 13'h0335;
    stim[9] = 13'h1305;
    stim[10] = 13'h0b57;
    stim[11] = 13'h190f;
    stim[12] = 13'h0be0;
    stim[13] = 13'h1838;
    stim[14] = 13'h0213;
    stim[15] = 13'h102a;
    stim[16] = 13'h03c5;
    stim[17] = 13'h19f9;
    stim[18] = 13'h0001;
    stim[19] = 13'h106b;
    stim[20] = 13'h1055;
    stim[21] = 13'h1b0f;
    stim[22] = 13'h10a3;
    stim[23] = 13'h0983;
    stim[24] = 13'h03c0;
    stim[25] = 13'h181c;
    stim[26] = 13'h1b8f;
    stim[27] = 13'h1979;
    stim[28] = 13'h13bd;
    stim[29] = 13'h0187;
    stim[30] = 13'h19eb;
    stim[31] = 13'h08fe;
    stim[32] = 13'h0140;
    stim[33] = 13'h0270;
    stim[34] = 13'h10b1;
    stim[35] = 13'h096c;
    stim[36] = 13'h13c0;
    stim[37] = 13'h192f;
    stim[38] = 13'h099d;
    stim[39] = 13'h0155;
    stim[40] = 13'h0b2d;
    stim[41] = 13'h09a1;
    stim[42] = 13'h1b3e;
    stim[43] = 13'h131b;
    stim[44] = 13'h1255;
    stim[45] = 13'h195d;
    stim[46] = 13'h082f;
    stim[47] = 13'h1a86;
    stim[48] = 13'h0145;
    stim[49] = 13'h1a04;
    stim[50] = 13'h0018;
    stim[51] = 13'h0852;
    stim[52] = 13'h1079;
    stim[53] = 13'h0baa;
    stim[54] = 13'h1387;
    stim[55] = 13'h1018;
    stim[56] = 13'h019c;
    stim[57] = 13'h0341;
    stim[58] = 13'h0093;
    stim[59] = 13'h0872;
    stim[60] = 13'h1350;
    stim[61] = 13'h12e4;
    stim[62] = 13'h188c;
    stim[63] = 13'h0afb;
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
      expv[0] = 11'hxxx;
      expv[1] = 11'hxxx;
      expv[2] = 11'hxxx;
      expv[3] = 11'h364;
      expv[4] = 11'hxxx;
      expv[5] = 11'h4a4;
      expv[6] = 11'h4a4;
      expv[7] = 11'h4a4;
      expv[8] = 11'h1ac;
      expv[9] = 11'h1ac;
      expv[10] = 11'h1ac;
      expv[11] = 11'h1ac;
      expv[12] = 11'hxxx;
      expv[13] = 11'hxxx;
      expv[14] = 11'h21c;
      expv[15] = 11'h21c;
      expv[16] = 11'h054;
      expv[17] = 11'h054;
      expv[18] = 11'h054;
      expv[19] = 11'h054;
      expv[20] = 11'h0d4;
      expv[21] = 11'h0d4;
      expv[22] = 11'h61c;
      expv[23] = 11'h144;
      expv[24] = 11'h144;
      expv[25] = 11'h144;
      expv[26] = 11'h144;
      expv[27] = 11'hxxx;
      expv[28] = 11'h71c;
      expv[29] = 11'h71c;
      expv[30] = 11'h71c;
      expv[31] = 11'hxxx;
      expv[32] = 11'h3d4;
      expv[33] = 11'h3d4;
      expv[34] = 11'h3d4;
      expv[35] = 11'h3d4;
      expv[36] = 11'h3d4;
      expv[37] = 11'h3d4;
      expv[38] = 11'hxxx;
      expv[39] = 11'h25c;
      expv[40] = 11'h25c;
      expv[41] = 11'h25c;
      expv[42] = 11'h25c;
      expv[43] = 11'h67c;
      expv[44] = 11'h634;
      expv[45] = 11'h634;
      expv[46] = 11'hxxx;
      expv[47] = 11'hxxx;
      expv[48] = 11'h50c;
      expv[49] = 11'h50c;
      expv[50] = 11'h50c;
      expv[51] = 11'h50c;
      expv[52] = 11'h50c;
      expv[53] = 11'h50c;
      expv[54] = 11'h50c;
      expv[55] = 11'h70c;
      expv[56] = 11'h70c;
      expv[57] = 11'h70c;
      expv[58] = 11'h70c;
      expv[59] = 11'h70c;
      expv[60] = 11'h70c;
      expv[61] = 11'h70c;
      expv[62] = 11'h70c;
      expv[63] = 11'h70c;
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
