// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_137432 dut (
    .dividend(in_vec[12:9]),
    .divisor(in_vec[8:5]),
    .A(in_vec[4:4]),
    .B(in_vec[3:3]),
    .C(in_vec[2:2]),
    .D(in_vec[1:1]),
    .select(in_vec[0:0]),
    .Y1(out_vec[3:2]),
    .Y0(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h180d;
    stim[1] = 13'h11ee;
    stim[2] = 13'h0db2;
    stim[3] = 13'h165d;
    stim[4] = 13'h1174;
    stim[5] = 13'h03b4;
    stim[6] = 13'h0730;
    stim[7] = 13'h04d0;
    stim[8] = 13'h189d;
    stim[9] = 13'h03e9;
    stim[10] = 13'h1508;
    stim[11] = 13'h0f88;
    stim[12] = 13'h097e;
    stim[13] = 13'h1a2d;
    stim[14] = 13'h0935;
    stim[15] = 13'h1f66;
    stim[16] = 13'h1a7f;
    stim[17] = 13'h0acf;
    stim[18] = 13'h12ee;
    stim[19] = 13'h1836;
    stim[20] = 13'h0ef5;
    stim[21] = 13'h1de6;
    stim[22] = 13'h001c;
    stim[23] = 13'h1909;
    stim[24] = 13'h08d2;
    stim[25] = 13'h1cb4;
    stim[26] = 13'h1b2e;
    stim[27] = 13'h1a10;
    stim[28] = 13'h057e;
    stim[29] = 13'h1343;
    stim[30] = 13'h0a6a;
    stim[31] = 13'h12c4;
    stim[32] = 13'h13b9;
    stim[33] = 13'h1d95;
    stim[34] = 13'h0418;
    stim[35] = 13'h0f1f;
    stim[36] = 13'h038f;
    stim[37] = 13'h0194;
    stim[38] = 13'h1e45;
    stim[39] = 13'h16ca;
    stim[40] = 13'h0218;
    stim[41] = 13'h117a;
    stim[42] = 13'h18e0;
    stim[43] = 13'h1700;
    stim[44] = 13'h0866;
    stim[45] = 13'h0a07;
    stim[46] = 13'h18c8;
    stim[47] = 13'h1b03;
    stim[48] = 13'h10f1;
    stim[49] = 13'h0acc;
    stim[50] = 13'h0106;
    stim[51] = 13'h041d;
    stim[52] = 13'h0187;
    stim[53] = 13'h0221;
    stim[54] = 13'h00b3;
    stim[55] = 13'h161a;
    stim[56] = 13'h125c;
    stim[57] = 13'h0297;
    stim[58] = 13'h0f91;
    stim[59] = 13'h056a;
    stim[60] = 13'h08c1;
    stim[61] = 13'h1149;
    stim[62] = 13'h037b;
    stim[63] = 13'h1f96;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 4'h8;
      expv[1] = 4'h6;
      expv[2] = 4'h3;
      expv[3] = 4'h5;
      expv[4] = 4'h2;
      expv[5] = 4'h2;
      expv[6] = 4'h0;
      expv[7] = 4'h0;
      expv[8] = 4'hc;
      expv[9] = 4'h8;
      expv[10] = 4'h4;
      expv[11] = 4'h4;
      expv[12] = 4'h1;
      expv[13] = 4'h4;
      expv[14] = 4'h0;
      expv[15] = 4'hb;
      expv[16] = 4'h1;
      expv[17] = 4'h1;
      expv[18] = 4'h6;
      expv[19] = 4'h2;
      expv[20] = 4'h4;
      expv[21] = 4'hb;
      expv[22] = 4'h1;
      expv[23] = 4'h4;
      expv[24] = 4'h3;
      expv[25] = 4'h2;
      expv[26] = 4'h6;
      expv[27] = 4'h0;
      expv[28] = 4'h1;
      expv[29] = 4'h7;
      expv[30] = 4'h7;
      expv[31] = 4'h8;
      expv[32] = 4'ha;
      expv[33] = 4'h2;
      expv[34] = 4'h1;
      expv[35] = 4'h3;
      expv[36] = 4'hd;
      expv[37] = 4'h2;
      expv[38] = 4'hd;
      expv[39] = 4'h7;
      expv[40] = 4'h1;
      expv[41] = 4'h1;
      expv[42] = 4'h0;
      expv[43] = 4'h0;
      expv[44] = 4'hb;
      expv[45] = 4'hd;
      expv[46] = 4'h4;
      expv[47] = 4'h5;
      expv[48] = 4'h2;
      expv[49] = 4'h6;
      expv[50] = 4'hb;
      expv[51] = 4'he;
      expv[52] = 4'hc;
      expv[53] = 4'h4;
      expv[54] = 4'h0;
      expv[55] = 4'h1;
      expv[56] = 4'h1;
      expv[57] = 4'h1;
      expv[58] = 4'hb;
      expv[59] = 4'h7;
      expv[60] = 4'h0;
      expv[61] = 4'h6;
      expv[62] = 4'he;
      expv[63] = 4'h2;
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
