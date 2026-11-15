// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_169723 dut (
    .i_clk(clk),
    .i_rst(in_vec[10:10]),
    .din(in_vec[9:2]),
    .wr_en(in_vec[1:1]),
    .rd_en(in_vec[0:0]),
    .dout(out_vec[10:3]),
    .full(out_vec[2:2]),
    .empty(out_vec[1:1]),
    .half_full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h458;
    stim[1] = 11'h577;
    stim[2] = 11'h209;
    stim[3] = 11'h381;
    stim[4] = 11'h2fb;
    stim[5] = 11'h23d;
    stim[6] = 11'h252;
    stim[7] = 11'h2d4;
    stim[8] = 11'h3d3;
    stim[9] = 11'h382;
    stim[10] = 11'h3b2;
    stim[11] = 11'h0df;
    stim[12] = 11'h2e3;
    stim[13] = 11'h3cb;
    stim[14] = 11'h2f7;
    stim[15] = 11'h2a6;
    stim[16] = 11'h1d5;
    stim[17] = 11'h02b;
    stim[18] = 11'h4aa;
    stim[19] = 11'h095;
    stim[20] = 11'h247;
    stim[21] = 11'h1c2;
    stim[22] = 11'h205;
    stim[23] = 11'h254;
    stim[24] = 11'h31c;
    stim[25] = 11'h17d;
    stim[26] = 11'h3a4;
    stim[27] = 11'h136;
    stim[28] = 11'h28f;
    stim[29] = 11'h15c;
    stim[30] = 11'h104;
    stim[31] = 11'h34c;
    stim[32] = 11'h048;
    stim[33] = 11'h0a8;
    stim[34] = 11'h007;
    stim[35] = 11'h062;
    stim[36] = 11'h24a;
    stim[37] = 11'h293;
    stim[38] = 11'h2a7;
    stim[39] = 11'h24b;
    stim[40] = 11'h2de;
    stim[41] = 11'h3ad;
    stim[42] = 11'h27b;
    stim[43] = 11'h185;
    stim[44] = 11'h270;
    stim[45] = 11'h50d;
    stim[46] = 11'h366;
    stim[47] = 11'h108;
    stim[48] = 11'h063;
    stim[49] = 11'h3f1;
    stim[50] = 11'h28d;
    stim[51] = 11'h24e;
    stim[52] = 11'h631;
    stim[53] = 11'h06a;
    stim[54] = 11'h178;
    stim[55] = 11'h00f;
    stim[56] = 11'h1ee;
    stim[57] = 11'h2b4;
    stim[58] = 11'h23b;
    stim[59] = 11'h3f7;
    stim[60] = 11'h2c4;
    stim[61] = 11'h239;
    stim[62] = 11'h311;
    stim[63] = 11'h1c8;
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
      expv[3] = 11'hxxx;
      expv[4] = 11'hxxx;
      expv[5] = 11'hxxx;
      expv[6] = 11'hxxx;
      expv[7] = 11'hxxx;
      expv[8] = 11'hxxx;
      expv[9] = 11'hxxx;
      expv[10] = 11'hxxx;
      expv[11] = 11'hxxx;
      expv[12] = 11'hxxx;
      expv[13] = 11'hxxx;
      expv[14] = 11'hxxx;
      expv[15] = 11'hxxx;
      expv[16] = 11'hxxx;
      expv[17] = 11'h549;
      expv[18] = 11'hxxx;
      expv[19] = 11'hxxx;
      expv[20] = 11'h5f1;
      expv[21] = 11'h4a1;
      expv[22] = 11'h4a1;
      expv[23] = 11'h7a1;
      expv[24] = 11'h7a1;
      expv[25] = 11'h7a1;
      expv[26] = 11'h701;
      expv[27] = 11'h701;
      expv[28] = 11'h701;
      expv[29] = 11'h761;
      expv[30] = 11'h761;
      expv[31] = 11'h761;
      expv[32] = 11'h761;
      expv[33] = 11'h761;
      expv[34] = 11'h761;
      expv[35] = 11'h1b9;
      expv[36] = 11'h1b9;
      expv[37] = 11'h1b9;
      expv[38] = 11'h491;
      expv[39] = 11'h521;
      expv[40] = 11'h549;
      expv[41] = 11'h549;
      expv[42] = 11'h491;
      expv[43] = 11'h5b9;
      expv[44] = 11'h4f1;
      expv[45] = 11'h4f2;
      expv[46] = 11'h4f2;
      expv[47] = 11'h4f0;
      expv[48] = 11'h4f0;
      expv[49] = 11'h6ca;
      expv[50] = 11'h0c1;
      expv[51] = 11'h269;
      expv[52] = 11'h26a;
      expv[53] = 11'h26a;
      expv[54] = 11'h268;
      expv[55] = 11'h268;
      expv[56] = 11'h0d2;
      expv[57] = 11'h0d0;
      expv[58] = 11'h0d0;
      expv[59] = 11'h01a;
      expv[60] = 11'h018;
      expv[61] = 11'h018;
      expv[62] = 11'h472;
      expv[63] = 11'h7e9;
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
