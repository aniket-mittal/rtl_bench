// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 26;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_177464 dut (
    .pixel_clock(clk),
    .rst(in_vec[25:25]),
    .sw0(in_vec[24:24]),
    .sw1(in_vec[23:23]),
    .hPos(in_vec[22:12]),
    .vPos(in_vec[11:1]),
    .videoOn(in_vec[0:0]),
    .R(out_vec[15:11]),
    .G(out_vec[10:5]),
    .B(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 26'h39117b2;
    stim[1] = 26'h26a1580;
    stim[2] = 26'h08b1f10;
    stim[3] = 26'h1f8a2f8;
    stim[4] = 26'h1507043;
    stim[5] = 26'h1752b7e;
    stim[6] = 26'h0b8ff88;
    stim[7] = 26'h0d45210;
    stim[8] = 26'h04d47d1;
    stim[9] = 26'h16ec592;
    stim[10] = 26'h0f8808c;
    stim[11] = 26'h0177f22;
    stim[12] = 26'h00a0773;
    stim[13] = 26'h124694f;
    stim[14] = 26'h13a42c9;
    stim[15] = 26'h09a3dee;
    stim[16] = 26'h04f8b4f;
    stim[17] = 26'h0f1d3fc;
    stim[18] = 26'h1845507;
    stim[19] = 26'h1183728;
    stim[20] = 26'h13d6c13;
    stim[21] = 26'h0fe86e8;
    stim[22] = 26'h0f08ba3;
    stim[23] = 26'h1a220e1;
    stim[24] = 26'h00c11a5;
    stim[25] = 26'h0f2041b;
    stim[26] = 26'h06dc70d;
    stim[27] = 26'h1d8d765;
    stim[28] = 26'h1c03fe7;
    stim[29] = 26'h0e4953a;
    stim[30] = 26'h0fe2dc3;
    stim[31] = 26'h08152a8;
    stim[32] = 26'h1d86a92;
    stim[33] = 26'h0535a59;
    stim[34] = 26'h011080a;
    stim[35] = 26'h16e69f2;
    stim[36] = 26'h11c41ca;
    stim[37] = 26'h0a0c5e9;
    stim[38] = 26'h1512857;
    stim[39] = 26'h1a7bbb6;
    stim[40] = 26'h1ab0428;
    stim[41] = 26'h0664fa8;
    stim[42] = 26'h1a5bbd1;
    stim[43] = 26'h0ced8ae;
    stim[44] = 26'h0a14059;
    stim[45] = 26'h072adf9;
    stim[46] = 26'h1d30f2f;
    stim[47] = 26'h1a8b4bd;
    stim[48] = 26'h1fa12e9;
    stim[49] = 26'h13fa08e;
    stim[50] = 26'h14d5d6b;
    stim[51] = 26'h162351a;
    stim[52] = 26'h0841429;
    stim[53] = 26'h09b702f;
    stim[54] = 26'h0c4fa74;
    stim[55] = 26'h00dac00;
    stim[56] = 26'h1be86ae;
    stim[57] = 26'h1d7b790;
    stim[58] = 26'h092887d;
    stim[59] = 26'h17d7364;
    stim[60] = 26'h1203ae1;
    stim[61] = 26'h0f1d2fb;
    stim[62] = 26'h003485d;
    stim[63] = 26'h1925b3e;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0000;
      expv[2] = 16'h0000;
      expv[3] = 16'h0000;
      expv[4] = 16'hffff;
      expv[5] = 16'h0000;
      expv[6] = 16'h0000;
      expv[7] = 16'h0000;
      expv[8] = 16'h0000;
      expv[9] = 16'h0000;
      expv[10] = 16'h0000;
      expv[11] = 16'h0000;
      expv[12] = 16'h0000;
      expv[13] = 16'hffff;
      expv[14] = 16'hffff;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'hffff;
      expv[19] = 16'h0000;
      expv[20] = 16'hffff;
      expv[21] = 16'h0000;
      expv[22] = 16'h0000;
      expv[23] = 16'hffff;
      expv[24] = 16'h0000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'hffff;
      expv[28] = 16'hffff;
      expv[29] = 16'h0000;
      expv[30] = 16'h0000;
      expv[31] = 16'h0000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h0000;
      expv[36] = 16'h0000;
      expv[37] = 16'h0000;
      expv[38] = 16'hffff;
      expv[39] = 16'h0000;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'hffff;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0000;
      expv[46] = 16'hffff;
      expv[47] = 16'hffff;
      expv[48] = 16'hffff;
      expv[49] = 16'h0000;
      expv[50] = 16'hffff;
      expv[51] = 16'h0000;
      expv[52] = 16'h0000;
      expv[53] = 16'h0000;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0000;
      expv[58] = 16'h0000;
      expv[59] = 16'h0000;
      expv[60] = 16'hffff;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0000;
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
