// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 13;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_123372 dut (
    .clk(clk),
    .rst(in_vec[13:13]),
    .ad(in_vec[12:1]),
    .flag(in_vec[0:0]),
    .convert(out_vec[12:12]),
    .num(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h3a5f;
    stim[1] = 14'h2c04;
    stim[2] = 14'h10f1;
    stim[3] = 14'h1e78;
    stim[4] = 14'h14fa;
    stim[5] = 14'h2eac;
    stim[6] = 14'h0489;
    stim[7] = 14'h0931;
    stim[8] = 14'h0edd;
    stim[9] = 14'h16a9;
    stim[10] = 14'h18f8;
    stim[11] = 14'h1b01;
    stim[12] = 14'h1a09;
    stim[13] = 14'h0e4e;
    stim[14] = 14'h1dcc;
    stim[15] = 14'h1734;
    stim[16] = 14'h0a9f;
    stim[17] = 14'h127b;
    stim[18] = 14'h04d7;
    stim[19] = 14'h145a;
    stim[20] = 14'h06d6;
    stim[21] = 14'h021a;
    stim[22] = 14'h0922;
    stim[23] = 14'h0db5;
    stim[24] = 14'h0045;
    stim[25] = 14'h1209;
    stim[26] = 14'h0302;
    stim[27] = 14'h0c21;
    stim[28] = 14'h1df2;
    stim[29] = 14'h0663;
    stim[30] = 14'h1553;
    stim[31] = 14'h1ad5;
    stim[32] = 14'h13f3;
    stim[33] = 14'h1c5a;
    stim[34] = 14'h00cf;
    stim[35] = 14'h0ad7;
    stim[36] = 14'h179d;
    stim[37] = 14'h0143;
    stim[38] = 14'h1c01;
    stim[39] = 14'h1218;
    stim[40] = 14'h12c6;
    stim[41] = 14'h0a9e;
    stim[42] = 14'h1020;
    stim[43] = 14'h0f24;
    stim[44] = 14'h15c1;
    stim[45] = 14'h129e;
    stim[46] = 14'h0118;
    stim[47] = 14'h0d82;
    stim[48] = 14'h0475;
    stim[49] = 14'h1545;
    stim[50] = 14'h0612;
    stim[51] = 14'h0fce;
    stim[52] = 14'h1920;
    stim[53] = 14'h107d;
    stim[54] = 14'h0aa4;
    stim[55] = 14'h0e5a;
    stim[56] = 14'h1c93;
    stim[57] = 14'h1d1f;
    stim[58] = 14'h06c6;
    stim[59] = 14'h0111;
    stim[60] = 14'h1621;
    stim[61] = 14'h0403;
    stim[62] = 14'h0d49;
    stim[63] = 14'h1b40;
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
      expv[0] = 13'h0000;
      expv[1] = 13'h0000;
      expv[2] = 13'h0000;
      expv[3] = 13'h0000;
      expv[4] = 13'h0000;
      expv[5] = 13'h0000;
      expv[6] = 13'h0000;
      expv[7] = 13'h0000;
      expv[8] = 13'h0000;
      expv[9] = 13'h0000;
      expv[10] = 13'h0000;
      expv[11] = 13'h0000;
      expv[12] = 13'h0000;
      expv[13] = 13'h0000;
      expv[14] = 13'h0000;
      expv[15] = 13'h0000;
      expv[16] = 13'h0000;
      expv[17] = 13'h0000;
      expv[18] = 13'h0000;
      expv[19] = 13'h0000;
      expv[20] = 13'h0000;
      expv[21] = 13'h0000;
      expv[22] = 13'h0000;
      expv[23] = 13'h0000;
      expv[24] = 13'h0000;
      expv[25] = 13'h0000;
      expv[26] = 13'h0000;
      expv[27] = 13'h0000;
      expv[28] = 13'h0000;
      expv[29] = 13'h0000;
      expv[30] = 13'h0000;
      expv[31] = 13'h0000;
      expv[32] = 13'h0000;
      expv[33] = 13'h0000;
      expv[34] = 13'h0000;
      expv[35] = 13'h0000;
      expv[36] = 13'h0000;
      expv[37] = 13'h1000;
      expv[38] = 13'h0000;
      expv[39] = 13'h0000;
      expv[40] = 13'h0000;
      expv[41] = 13'h0000;
      expv[42] = 13'h0000;
      expv[43] = 13'h0000;
      expv[44] = 13'h0000;
      expv[45] = 13'h0000;
      expv[46] = 13'h0000;
      expv[47] = 13'h0000;
      expv[48] = 13'h0000;
      expv[49] = 13'h0000;
      expv[50] = 13'h0000;
      expv[51] = 13'h0000;
      expv[52] = 13'h0000;
      expv[53] = 13'h0000;
      expv[54] = 13'h0000;
      expv[55] = 13'h0000;
      expv[56] = 13'h0000;
      expv[57] = 13'h0000;
      expv[58] = 13'h0000;
      expv[59] = 13'h0000;
      expv[60] = 13'h0000;
      expv[61] = 13'h0000;
      expv[62] = 13'h0000;
      expv[63] = 13'h0000;
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
