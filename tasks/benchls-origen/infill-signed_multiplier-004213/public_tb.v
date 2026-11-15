// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_004213 dut (
    .A(in_vec[16:9]),
    .B(in_vec[8:1]),
    .TC(in_vec[0:0]),
    .PRODUCT(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h18258;
    stim[1] = 17'h0ad7b;
    stim[2] = 17'h022ee;
    stim[3] = 17'h03479;
    stim[4] = 17'h12e4e;
    stim[5] = 17'h13d33;
    stim[6] = 17'h182bf;
    stim[7] = 17'h1e1ee;
    stim[8] = 17'h167b0;
    stim[9] = 17'h1d4ab;
    stim[10] = 17'h072be;
    stim[11] = 17'h0bbfc;
    stim[12] = 17'h1a339;
    stim[13] = 17'h10dcb;
    stim[14] = 17'h060a0;
    stim[15] = 17'h13ad5;
    stim[16] = 17'h1bb1c;
    stim[17] = 17'h167b0;
    stim[18] = 17'h01430;
    stim[19] = 17'h05c6d;
    stim[20] = 17'h1725d;
    stim[21] = 17'h17163;
    stim[22] = 17'h168d0;
    stim[23] = 17'h1130f;
    stim[24] = 17'h18593;
    stim[25] = 17'h0c1ca;
    stim[26] = 17'h1da01;
    stim[27] = 17'h12a7c;
    stim[28] = 17'h1cbd5;
    stim[29] = 17'h12521;
    stim[30] = 17'h1cead;
    stim[31] = 17'h07ced;
    stim[32] = 17'h0a799;
    stim[33] = 17'h08928;
    stim[34] = 17'h00527;
    stim[35] = 17'h05484;
    stim[36] = 17'h0ab30;
    stim[37] = 17'h1b22a;
    stim[38] = 17'h1785c;
    stim[39] = 17'h19988;
    stim[40] = 17'h02916;
    stim[41] = 17'h15c32;
    stim[42] = 17'h160a5;
    stim[43] = 17'h1bc5e;
    stim[44] = 17'h1fe2e;
    stim[45] = 17'h052be;
    stim[46] = 17'h1feff;
    stim[47] = 17'h032bc;
    stim[48] = 17'h10d4f;
    stim[49] = 17'h14dd9;
    stim[50] = 17'h14233;
    stim[51] = 17'h15bfb;
    stim[52] = 17'h1307f;
    stim[53] = 17'h16875;
    stim[54] = 17'h0f379;
    stim[55] = 17'h14af3;
    stim[56] = 17'h03230;
    stim[57] = 17'h06f2f;
    stim[58] = 17'h05b42;
    stim[59] = 17'h0287c;
    stim[60] = 17'h0c028;
    stim[61] = 17'h0823a;
    stim[62] = 17'h0035c;
    stim[63] = 17'h03904;
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
      expv[0] = 16'h212c;
      expv[1] = 16'he97e;
      expv[2] = 16'h07e7;
      expv[3] = 16'h0618;
      expv[4] = 16'h1701;
      expv[5] = 16'h276e;
      expv[6] = 16'he89f;
      expv[7] = 16'he790;
      expv[8] = 16'h9708;
      expv[9] = 16'hf8b2;
      expv[10] = 16'h1527;
      expv[11] = 16'h5c46;
      expv[12] = 16'h125c;
      expv[13] = 16'h0cde;
      expv[14] = 16'h0f00;
      expv[15] = 16'hd702;
      expv[16] = 16'h7a96;
      expv[17] = 16'h9708;
      expv[18] = 16'h00f0;
      expv[19] = 16'h09b4;
      expv[20] = 16'hf33e;
      expv[21] = 16'h1638;
      expv[22] = 16'h4920;
      expv[23] = 16'h383f;
      expv[24] = 16'h0d52;
      expv[25] = 16'h55e0;
      expv[26] = 16'h8000;
      expv[27] = 16'h2416;
      expv[28] = 16'h0252;
      expv[29] = 16'h3020;
      expv[30] = 16'hf79a;
      expv[31] = 16'h1c94;
      expv[32] = 16'hef24;
      expv[33] = 16'h2750;
      expv[34] = 16'hff26;
      expv[35] = 16'h0ad4;
      expv[36] = 16'h3278;
      expv[37] = 16'h11cd;
      expv[38] = 16'h21c8;
      expv[39] = 16'h9c30;
      expv[40] = 16'h0adc;
      expv[41] = 16'h10fe;
      expv[42] = 16'he660;
      expv[43] = 16'h28c2;
      expv[44] = 16'h16e9;
      expv[45] = 16'h0f37;
      expv[46] = 16'hff81;
      expv[47] = 16'h092e;
      expv[48] = 16'h2a6a;
      expv[49] = 16'h0708;
      expv[50] = 16'hf6b9;
      expv[51] = 16'h00f9;
      expv[52] = 16'he668;
      expv[53] = 16'heec8;
      expv[54] = 16'hdfdc;
      expv[55] = 16'hd4fd;
      expv[56] = 16'h0258;
      expv[57] = 16'he971;
      expv[58] = 16'h1c4d;
      expv[59] = 16'h04d8;
      expv[60] = 16'h0780;
      expv[61] = 16'h075d;
      expv[62] = 16'h00ae;
      expv[63] = 16'h0e38;
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
