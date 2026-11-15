// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 21;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_069597 dut (
    .divisor(in_vec[4:0]),
    .div_inverse(out_vec[20:4]),
    .div_shift(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h17;
    stim[1] = 5'h1b;
    stim[2] = 5'h02;
    stim[3] = 5'h17;
    stim[4] = 5'h0f;
    stim[5] = 5'h04;
    stim[6] = 5'h13;
    stim[7] = 5'h17;
    stim[8] = 5'h16;
    stim[9] = 5'h1c;
    stim[10] = 5'h0e;
    stim[11] = 5'h15;
    stim[12] = 5'h06;
    stim[13] = 5'h1c;
    stim[14] = 5'h0d;
    stim[15] = 5'h09;
    stim[16] = 5'h14;
    stim[17] = 5'h0b;
    stim[18] = 5'h05;
    stim[19] = 5'h11;
    stim[20] = 5'h04;
    stim[21] = 5'h0d;
    stim[22] = 5'h19;
    stim[23] = 5'h1d;
    stim[24] = 5'h15;
    stim[25] = 5'h08;
    stim[26] = 5'h0c;
    stim[27] = 5'h1e;
    stim[28] = 5'h0f;
    stim[29] = 5'h05;
    stim[30] = 5'h1f;
    stim[31] = 5'h15;
    stim[32] = 5'h0a;
    stim[33] = 5'h1f;
    stim[34] = 5'h1d;
    stim[35] = 5'h0b;
    stim[36] = 5'h13;
    stim[37] = 5'h12;
    stim[38] = 5'h0e;
    stim[39] = 5'h02;
    stim[40] = 5'h0c;
    stim[41] = 5'h16;
    stim[42] = 5'h17;
    stim[43] = 5'h05;
    stim[44] = 5'h08;
    stim[45] = 5'h19;
    stim[46] = 5'h1e;
    stim[47] = 5'h15;
    stim[48] = 5'h08;
    stim[49] = 5'h11;
    stim[50] = 5'h1f;
    stim[51] = 5'h0b;
    stim[52] = 5'h0f;
    stim[53] = 5'h02;
    stim[54] = 5'h1b;
    stim[55] = 5'h1f;
    stim[56] = 5'h04;
    stim[57] = 5'h1f;
    stim[58] = 5'h1e;
    stim[59] = 5'h10;
    stim[60] = 5'h00;
    stim[61] = 5'h12;
    stim[62] = 5'h10;
    stim[63] = 5'h0e;
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
      expv[0] = 21'h1642d5;
      expv[1] = 21'h12f695;
      expv[2] = 21'h100001;
      expv[3] = 21'h1642d5;
      expv[4] = 21'h111124;
      expv[5] = 21'h100002;
      expv[6] = 21'h1af295;
      expv[7] = 21'h1642d5;
      expv[8] = 21'h1745e5;
      expv[9] = 21'h124935;
      expv[10] = 21'h124934;
      expv[11] = 21'h186195;
      expv[12] = 21'h155563;
      expv[13] = 21'h124935;
      expv[14] = 21'h13b144;
      expv[15] = 21'h1c71d4;
      expv[16] = 21'h1999a5;
      expv[17] = 21'h1745e4;
      expv[18] = 21'h1999a3;
      expv[19] = 21'h1e1e25;
      expv[20] = 21'h100002;
      expv[21] = 21'h13b144;
      expv[22] = 21'h147af5;
      expv[23] = 21'h11a7c5;
      expv[24] = 21'h186195;
      expv[25] = 21'h100003;
      expv[26] = 21'h155564;
      expv[27] = 21'h111125;
      expv[28] = 21'h111124;
      expv[29] = 21'h1999a3;
      expv[30] = 21'h108445;
      expv[31] = 21'h186195;
      expv[32] = 21'h1999a4;
      expv[33] = 21'h108445;
      expv[34] = 21'h11a7c5;
      expv[35] = 21'h1745e4;
      expv[36] = 21'h1af295;
      expv[37] = 21'h1c71d5;
      expv[38] = 21'h124934;
      expv[39] = 21'h100001;
      expv[40] = 21'h155564;
      expv[41] = 21'h1745e5;
      expv[42] = 21'h1642d5;
      expv[43] = 21'h1999a3;
      expv[44] = 21'h100003;
      expv[45] = 21'h147af5;
      expv[46] = 21'h111125;
      expv[47] = 21'h186195;
      expv[48] = 21'h100003;
      expv[49] = 21'h1e1e25;
      expv[50] = 21'h108445;
      expv[51] = 21'h1745e4;
      expv[52] = 21'h111124;
      expv[53] = 21'h100001;
      expv[54] = 21'h12f695;
      expv[55] = 21'h108445;
      expv[56] = 21'h100002;
      expv[57] = 21'h108445;
      expv[58] = 21'h111125;
      expv[59] = 21'h100004;
      expv[60] = 21'h100000;
      expv[61] = 21'h1c71d5;
      expv[62] = 21'h100004;
      expv[63] = 21'h124934;
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
