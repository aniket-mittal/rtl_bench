// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_088104 dut (
    .encode_In(in_vec[10:3]),
    .level(in_vec[2:0]),
    .Binary_Out(out_vec[3:1]),
    .error(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h5e3;
    stim[1] = 11'h420;
    stim[2] = 11'h1bf;
    stim[3] = 11'h05b;
    stim[4] = 11'h75a;
    stim[5] = 11'h6b2;
    stim[6] = 11'h727;
    stim[7] = 11'h3d1;
    stim[8] = 11'h300;
    stim[9] = 11'h3ef;
    stim[10] = 11'h09a;
    stim[11] = 11'h554;
    stim[12] = 11'h619;
    stim[13] = 11'h611;
    stim[14] = 11'h099;
    stim[15] = 11'h4d8;
    stim[16] = 11'h2a9;
    stim[17] = 11'h49f;
    stim[18] = 11'h500;
    stim[19] = 11'h23b;
    stim[20] = 11'h5f5;
    stim[21] = 11'h53e;
    stim[22] = 11'h5e4;
    stim[23] = 11'h33b;
    stim[24] = 11'h14d;
    stim[25] = 11'h0b9;
    stim[26] = 11'h1b8;
    stim[27] = 11'h534;
    stim[28] = 11'h72a;
    stim[29] = 11'h3bb;
    stim[30] = 11'h5c9;
    stim[31] = 11'h192;
    stim[32] = 11'h22d;
    stim[33] = 11'h32f;
    stim[34] = 11'h555;
    stim[35] = 11'h32b;
    stim[36] = 11'h56c;
    stim[37] = 11'h240;
    stim[38] = 11'h46d;
    stim[39] = 11'h46a;
    stim[40] = 11'h70b;
    stim[41] = 11'h3c3;
    stim[42] = 11'h77f;
    stim[43] = 11'h256;
    stim[44] = 11'h423;
    stim[45] = 11'h08c;
    stim[46] = 11'h155;
    stim[47] = 11'h1fb;
    stim[48] = 11'h3da;
    stim[49] = 11'h0b3;
    stim[50] = 11'h1a4;
    stim[51] = 11'h2c3;
    stim[52] = 11'h16f;
    stim[53] = 11'h451;
    stim[54] = 11'h511;
    stim[55] = 11'h571;
    stim[56] = 11'h28e;
    stim[57] = 11'h3bb;
    stim[58] = 11'h3c4;
    stim[59] = 11'h312;
    stim[60] = 11'h0cf;
    stim[61] = 11'h5da;
    stim[62] = 11'h519;
    stim[63] = 11'h078;
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
      expv[0] = 4'h1;
      expv[1] = 4'h1;
      expv[2] = 4'hc;
      expv[3] = 4'h1;
      expv[4] = 4'h1;
      expv[5] = 4'h1;
      expv[6] = 4'h0;
      expv[7] = 4'h1;
      expv[8] = 4'h1;
      expv[9] = 4'he;
      expv[10] = 4'h1;
      expv[11] = 4'h1;
      expv[12] = 4'h1;
      expv[13] = 4'h1;
      expv[14] = 4'h1;
      expv[15] = 4'h1;
      expv[16] = 4'h1;
      expv[17] = 4'h1;
      expv[18] = 4'h1;
      expv[19] = 4'h1;
      expv[20] = 4'h1;
      expv[21] = 4'h1;
      expv[22] = 4'h1;
      expv[23] = 4'h1;
      expv[24] = 4'h1;
      expv[25] = 4'h1;
      expv[26] = 4'h1;
      expv[27] = 4'h1;
      expv[28] = 4'h1;
      expv[29] = 4'h1;
      expv[30] = 4'h1;
      expv[31] = 4'h1;
      expv[32] = 4'h1;
      expv[33] = 4'he;
      expv[34] = 4'h1;
      expv[35] = 4'h1;
      expv[36] = 4'h1;
      expv[37] = 4'h1;
      expv[38] = 4'h1;
      expv[39] = 4'h1;
      expv[40] = 4'h1;
      expv[41] = 4'h1;
      expv[42] = 4'h1;
      expv[43] = 4'he;
      expv[44] = 4'h1;
      expv[45] = 4'h1;
      expv[46] = 4'hc;
      expv[47] = 4'h1;
      expv[48] = 4'h1;
      expv[49] = 4'h1;
      expv[50] = 4'hc;
      expv[51] = 4'h1;
      expv[52] = 4'hc;
      expv[53] = 4'h1;
      expv[54] = 4'h1;
      expv[55] = 4'h1;
      expv[56] = 4'h1;
      expv[57] = 4'h1;
      expv[58] = 4'he;
      expv[59] = 4'h1;
      expv[60] = 4'ha;
      expv[61] = 4'h1;
      expv[62] = 4'h1;
      expv[63] = 4'h1;
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
