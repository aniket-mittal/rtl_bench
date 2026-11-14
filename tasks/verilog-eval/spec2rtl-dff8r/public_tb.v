// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  TopModule dut (
    .clk(clk),
    .d(in_vec[8:1]),
    .reset(in_vec[0:0]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h0f3;
    stim[1] = 9'h175;
    stim[2] = 9'h0ac;
    stim[3] = 9'h126;
    stim[4] = 9'h0ca;
    stim[5] = 9'h1a4;
    stim[6] = 9'h0da;
    stim[7] = 9'h10a;
    stim[8] = 9'h198;
    stim[9] = 9'h132;
    stim[10] = 9'h060;
    stim[11] = 9'h142;
    stim[12] = 9'h19c;
    stim[13] = 9'h12e;
    stim[14] = 9'h0aa;
    stim[15] = 9'h1c4;
    stim[16] = 9'h072;
    stim[17] = 9'h078;
    stim[18] = 9'h18c;
    stim[19] = 9'h082;
    stim[20] = 9'h1c8;
    stim[21] = 9'h1dc;
    stim[22] = 9'h1a0;
    stim[23] = 9'h1a4;
    stim[24] = 9'h0f2;
    stim[25] = 9'h0be;
    stim[26] = 9'h0af;
    stim[27] = 9'h0fe;
    stim[28] = 9'h0ab;
    stim[29] = 9'h0ee;
    stim[30] = 9'h1a0;
    stim[31] = 9'h10e;
    stim[32] = 9'h0a0;
    stim[33] = 9'h12e;
    stim[34] = 9'h1fa;
    stim[35] = 9'h118;
    stim[36] = 9'h086;
    stim[37] = 9'h006;
    stim[38] = 9'h102;
    stim[39] = 9'h01e;
    stim[40] = 9'h0be;
    stim[41] = 9'h0a4;
    stim[42] = 9'h0e8;
    stim[43] = 9'h072;
    stim[44] = 9'h0fe;
    stim[45] = 9'h1f0;
    stim[46] = 9'h0d0;
    stim[47] = 9'h16c;
    stim[48] = 9'h044;
    stim[49] = 9'h028;
    stim[50] = 9'h000;
    stim[51] = 9'h0e4;
    stim[52] = 9'h1d0;
    stim[53] = 9'h1ae;
    stim[54] = 9'h152;
    stim[55] = 9'h11e;
    stim[56] = 9'h0d6;
    stim[57] = 9'h022;
    stim[58] = 9'h0e8;
    stim[59] = 9'h1a6;
    stim[60] = 9'h1cc;
    stim[61] = 9'h05a;
    stim[62] = 9'h178;
    stim[63] = 9'h1ae;
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
      expv[0] = 8'hxx;
      expv[1] = 8'h00;
      expv[2] = 8'h00;
      expv[3] = 8'h56;
      expv[4] = 8'h93;
      expv[5] = 8'h65;
      expv[6] = 8'hd2;
      expv[7] = 8'h6d;
      expv[8] = 8'h85;
      expv[9] = 8'hcc;
      expv[10] = 8'h99;
      expv[11] = 8'h30;
      expv[12] = 8'ha1;
      expv[13] = 8'hce;
      expv[14] = 8'h97;
      expv[15] = 8'h55;
      expv[16] = 8'he2;
      expv[17] = 8'h39;
      expv[18] = 8'h3c;
      expv[19] = 8'hc6;
      expv[20] = 8'h41;
      expv[21] = 8'he4;
      expv[22] = 8'hee;
      expv[23] = 8'hd0;
      expv[24] = 8'hd2;
      expv[25] = 8'h79;
      expv[26] = 8'h5f;
      expv[27] = 8'h00;
      expv[28] = 8'h7f;
      expv[29] = 8'h00;
      expv[30] = 8'h77;
      expv[31] = 8'hd0;
      expv[32] = 8'h87;
      expv[33] = 8'h50;
      expv[34] = 8'h97;
      expv[35] = 8'hfd;
      expv[36] = 8'h8c;
      expv[37] = 8'h43;
      expv[38] = 8'h03;
      expv[39] = 8'h81;
      expv[40] = 8'h0f;
      expv[41] = 8'h5f;
      expv[42] = 8'h52;
      expv[43] = 8'h74;
      expv[44] = 8'h39;
      expv[45] = 8'h7f;
      expv[46] = 8'hf8;
      expv[47] = 8'h68;
      expv[48] = 8'hb6;
      expv[49] = 8'h22;
      expv[50] = 8'h14;
      expv[51] = 8'h00;
      expv[52] = 8'h72;
      expv[53] = 8'he8;
      expv[54] = 8'hd7;
      expv[55] = 8'ha9;
      expv[56] = 8'h8f;
      expv[57] = 8'h6b;
      expv[58] = 8'h11;
      expv[59] = 8'h74;
      expv[60] = 8'hd3;
      expv[61] = 8'he6;
      expv[62] = 8'h2d;
      expv[63] = 8'hbc;
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
