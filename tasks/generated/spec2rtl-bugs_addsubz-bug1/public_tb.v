// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .do_sub(in_vec[16:16]),
    .a(in_vec[15:8]),
    .b(in_vec[7:0]),
    .out(out_vec[8:1]),
    .result_is_zero(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h18700;
    stim[1] = 17'h016b5;
    stim[2] = 17'h1fee2;
    stim[3] = 17'h113ac;
    stim[4] = 17'h1d0ff;
    stim[5] = 17'h16556;
    stim[6] = 17'h061a0;
    stim[7] = 17'h0bd69;
    stim[8] = 17'h151ac;
    stim[9] = 17'h1f86c;
    stim[10] = 17'h0565d;
    stim[11] = 17'h16921;
    stim[12] = 17'h13b43;
    stim[13] = 17'h13322;
    stim[14] = 17'h1bb20;
    stim[15] = 17'h174df;
    stim[16] = 17'h08cb2;
    stim[17] = 17'h1a344;
    stim[18] = 17'h131b8;
    stim[19] = 17'h03e4c;
    stim[20] = 17'h16131;
    stim[21] = 17'h1de2d;
    stim[22] = 17'h0b96a;
    stim[23] = 17'h18502;
    stim[24] = 17'h0282a;
    stim[25] = 17'h062d7;
    stim[26] = 17'h0451d;
    stim[27] = 17'h1d36e;
    stim[28] = 17'h003ff;
    stim[29] = 17'h091f4;
    stim[30] = 17'h05044;
    stim[31] = 17'h1046f;
    stim[32] = 17'h15c6f;
    stim[33] = 17'h071a5;
    stim[34] = 17'h14c71;
    stim[35] = 17'h198c4;
    stim[36] = 17'h0e313;
    stim[37] = 17'h06544;
    stim[38] = 17'h0f9a3;
    stim[39] = 17'h01559;
    stim[40] = 17'h0a6c6;
    stim[41] = 17'h17ef0;
    stim[42] = 17'h0d535;
    stim[43] = 17'h0b060;
    stim[44] = 17'h0b136;
    stim[45] = 17'h0a871;
    stim[46] = 17'h07ca4;
    stim[47] = 17'h0960f;
    stim[48] = 17'h11cd7;
    stim[49] = 17'h04778;
    stim[50] = 17'h014d5;
    stim[51] = 17'h10701;
    stim[52] = 17'h004c1;
    stim[53] = 17'h000d8;
    stim[54] = 17'h04c38;
    stim[55] = 17'h034a2;
    stim[56] = 17'h16cf7;
    stim[57] = 17'h05832;
    stim[58] = 17'h08b1a;
    stim[59] = 17'h15ccc;
    stim[60] = 17'h1a174;
    stim[61] = 17'h02025;
    stim[62] = 17'h13545;
    stim[63] = 17'h0cedc;
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
      expv[0] = 9'h10e;
      expv[1] = 9'h0c2;
      expv[2] = 9'h038;
      expv[3] = 9'h0ce;
      expv[4] = 9'h1a2;
      expv[5] = 9'h01e;
      expv[6] = 9'h182;
      expv[7] = 9'h0a8;
      expv[8] = 9'h14a;
      expv[9] = 9'h118;
      expv[10] = 9'h1f2;
      expv[11] = 9'h090;
      expv[12] = 9'h1f0;
      expv[13] = 9'h022;
      expv[14] = 9'h136;
      expv[15] = 9'h12a;
      expv[16] = 9'h1b4;
      expv[17] = 9'h0be;
      expv[18] = 9'h0f2;
      expv[19] = 9'h1e4;
      expv[20] = 9'h060;
      expv[21] = 9'h162;
      expv[22] = 9'h09e;
      expv[23] = 9'h106;
      expv[24] = 9'h1fc;
      expv[25] = 9'h116;
      expv[26] = 9'h050;
      expv[27] = 9'h0ca;
      expv[28] = 9'h008;
      expv[29] = 9'h13a;
      expv[30] = 9'h018;
      expv[31] = 9'h12a;
      expv[32] = 9'h1da;
      expv[33] = 9'h198;
      expv[34] = 9'h1b6;
      expv[35] = 9'h1a8;
      expv[36] = 9'h1a0;
      expv[37] = 9'h042;
      expv[38] = 9'h0ac;
      expv[39] = 9'h178;
      expv[40] = 9'h1c0;
      expv[41] = 9'h11c;
      expv[42] = 9'h140;
      expv[43] = 9'h0a0;
      expv[44] = 9'h0f6;
      expv[45] = 9'h06e;
      expv[46] = 9'h1b0;
      expv[47] = 9'h10e;
      expv[48] = 9'h08a;
      expv[49] = 9'h19e;
      expv[50] = 9'h07e;
      expv[51] = 9'h00c;
      expv[52] = 9'h086;
      expv[53] = 9'h050;
      expv[54] = 9'h028;
      expv[55] = 9'h124;
      expv[56] = 9'h0ea;
      expv[57] = 9'h04c;
      expv[58] = 9'h0e2;
      expv[59] = 9'h120;
      expv[60] = 9'h05a;
      expv[61] = 9'h1f6;
      expv[62] = 9'h1e0;
      expv[63] = 9'h1e4;
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
