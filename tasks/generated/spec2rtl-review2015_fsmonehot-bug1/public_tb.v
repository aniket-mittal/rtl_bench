// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .d(in_vec[12:12]),
    .done_counting(in_vec[11:11]),
    .ack(in_vec[10:10]),
    .state(in_vec[9:0]),
    .B3_next(out_vec[7:7]),
    .S_next(out_vec[6:6]),
    .S1_next(out_vec[5:5]),
    .Count_next(out_vec[4:4]),
    .Wait_next(out_vec[3:3]),
    .done(out_vec[2:2]),
    .counting(out_vec[1:1]),
    .shift_ena(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h182f;
    stim[1] = 13'h1f52;
    stim[2] = 13'h0612;
    stim[3] = 13'h0fec;
    stim[4] = 13'h046e;
    stim[5] = 13'h1831;
    stim[6] = 13'h0b7a;
    stim[7] = 13'h1b1e;
    stim[8] = 13'h04ab;
    stim[9] = 13'h174e;
    stim[10] = 13'h1619;
    stim[11] = 13'h12b9;
    stim[12] = 13'h0b63;
    stim[13] = 13'h166e;
    stim[14] = 13'h0dfc;
    stim[15] = 13'h00ae;
    stim[16] = 13'h18a1;
    stim[17] = 13'h118f;
    stim[18] = 13'h0f79;
    stim[19] = 13'h1710;
    stim[20] = 13'h0e42;
    stim[21] = 13'h0cc9;
    stim[22] = 13'h07b8;
    stim[23] = 13'h1dac;
    stim[24] = 13'h0248;
    stim[25] = 13'h16b9;
    stim[26] = 13'h1027;
    stim[27] = 13'h07aa;
    stim[28] = 13'h189f;
    stim[29] = 13'h0650;
    stim[30] = 13'h1b69;
    stim[31] = 13'h18b6;
    stim[32] = 13'h067a;
    stim[33] = 13'h1420;
    stim[34] = 13'h1e06;
    stim[35] = 13'h1091;
    stim[36] = 13'h1e17;
    stim[37] = 13'h145f;
    stim[38] = 13'h1c57;
    stim[39] = 13'h0eea;
    stim[40] = 13'h1901;
    stim[41] = 13'h0497;
    stim[42] = 13'h110f;
    stim[43] = 13'h152b;
    stim[44] = 13'h0e83;
    stim[45] = 13'h178a;
    stim[46] = 13'h1c1d;
    stim[47] = 13'h1a1a;
    stim[48] = 13'h1733;
    stim[49] = 13'h17e5;
    stim[50] = 13'h0173;
    stim[51] = 13'h13c0;
    stim[52] = 13'h1f38;
    stim[53] = 13'h1c61;
    stim[54] = 13'h15a9;
    stim[55] = 13'h1c65;
    stim[56] = 13'h06dd;
    stim[57] = 13'h15f9;
    stim[58] = 13'h052a;
    stim[59] = 13'h0ba1;
    stim[60] = 13'h10db;
    stim[61] = 13'h0916;
    stim[62] = 13'h19e6;
    stim[63] = 13'h152b;
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
      expv[0] = 8'h21;
      expv[1] = 8'h8f;
      expv[2] = 8'h45;
      expv[3] = 8'hdf;
      expv[4] = 8'hc1;
      expv[5] = 8'h21;
      expv[6] = 8'hcf;
      expv[7] = 8'h0f;
      expv[8] = 8'h51;
      expv[9] = 8'h97;
      expv[10] = 8'h25;
      expv[11] = 8'h3d;
      expv[12] = 8'hcf;
      expv[13] = 8'h85;
      expv[14] = 8'hdb;
      expv[15] = 8'h51;
      expv[16] = 8'h31;
      expv[17] = 8'h33;
      expv[18] = 8'hcf;
      expv[19] = 8'h17;
      expv[20] = 8'hc5;
      expv[21] = 8'hd1;
      expv[22] = 8'h57;
      expv[23] = 8'h1b;
      expv[24] = 8'hcd;
      expv[25] = 8'h35;
      expv[26] = 8'h21;
      expv[27] = 8'h57;
      expv[28] = 8'h31;
      expv[29] = 8'h85;
      expv[30] = 8'haf;
      expv[31] = 8'h11;
      expv[32] = 8'hc5;
      expv[33] = 8'h01;
      expv[34] = 8'h04;
      expv[35] = 8'h31;
      expv[36] = 8'h25;
      expv[37] = 8'ha1;
      expv[38] = 8'ha1;
      expv[39] = 8'hd5;
      expv[40] = 8'h2a;
      expv[41] = 8'h51;
      expv[42] = 8'h32;
      expv[43] = 8'h33;
      expv[44] = 8'h55;
      expv[45] = 8'h17;
      expv[46] = 8'h21;
      expv[47] = 8'h0d;
      expv[48] = 8'h37;
      expv[49] = 8'hb7;
      expv[50] = 8'hd3;
      expv[51] = 8'h9f;
      expv[52] = 8'h0f;
      expv[53] = 8'ha1;
      expv[54] = 8'h33;
      expv[55] = 8'ha1;
      expv[56] = 8'hd5;
      expv[57] = 8'hb3;
      expv[58] = 8'h53;
      expv[59] = 8'h5f;
      expv[60] = 8'hb1;
      expv[61] = 8'h4b;
      expv[62] = 8'h9b;
      expv[63] = 8'h33;
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
