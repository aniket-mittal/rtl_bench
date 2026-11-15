// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_144596 dut (
    .A(in_vec[9:6]),
    .B(in_vec[5:2]),
    .shift(in_vec[1:0]),
    .OUT(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h39d;
    stim[1] = 10'h2f9;
    stim[2] = 10'h24b;
    stim[3] = 10'h3b1;
    stim[4] = 10'h26d;
    stim[5] = 10'h2c0;
    stim[6] = 10'h3b0;
    stim[7] = 10'h368;
    stim[8] = 10'h013;
    stim[9] = 10'h00a;
    stim[10] = 10'h1fd;
    stim[11] = 10'h174;
    stim[12] = 10'h1e8;
    stim[13] = 10'h3dd;
    stim[14] = 10'h046;
    stim[15] = 10'h2fe;
    stim[16] = 10'h369;
    stim[17] = 10'h155;
    stim[18] = 10'h045;
    stim[19] = 10'h024;
    stim[20] = 10'h3ed;
    stim[21] = 10'h215;
    stim[22] = 10'h3b0;
    stim[23] = 10'h280;
    stim[24] = 10'h2c3;
    stim[25] = 10'h3e0;
    stim[26] = 10'h040;
    stim[27] = 10'h127;
    stim[28] = 10'h0f3;
    stim[29] = 10'h1d9;
    stim[30] = 10'h299;
    stim[31] = 10'h0e8;
    stim[32] = 10'h04f;
    stim[33] = 10'h18b;
    stim[34] = 10'h04e;
    stim[35] = 10'h3fe;
    stim[36] = 10'h2bb;
    stim[37] = 10'h213;
    stim[38] = 10'h3d5;
    stim[39] = 10'h24e;
    stim[40] = 10'h3e1;
    stim[41] = 10'h186;
    stim[42] = 10'h03c;
    stim[43] = 10'h2f7;
    stim[44] = 10'h187;
    stim[45] = 10'h0c8;
    stim[46] = 10'h039;
    stim[47] = 10'h05a;
    stim[48] = 10'h053;
    stim[49] = 10'h0b9;
    stim[50] = 10'h0ff;
    stim[51] = 10'h124;
    stim[52] = 10'h2ab;
    stim[53] = 10'h189;
    stim[54] = 10'h279;
    stim[55] = 10'h0ac;
    stim[56] = 10'h26e;
    stim[57] = 10'h2b2;
    stim[58] = 10'h003;
    stim[59] = 10'h14c;
    stim[60] = 10'h225;
    stim[61] = 10'h09b;
    stim[62] = 10'h3ed;
    stim[63] = 10'h1ef;
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
      expv[0] = 8'hc4;
      expv[1] = 8'h35;
      expv[2] = 8'h09;
      expv[3] = 8'h51;
      expv[4] = 8'hc6;
      expv[5] = 8'h00;
      expv[6] = 8'ha8;
      expv[7] = 8'h82;
      expv[8] = 8'h00;
      expv[9] = 8'h00;
      expv[10] = 8'hd2;
      expv[11] = 8'h41;
      expv[12] = 8'h46;
      expv[13] = 8'hd2;
      expv[14] = 8'h04;
      expv[15] = 8'h96;
      expv[16] = 8'h05;
      expv[17] = 8'h32;
      expv[18] = 8'h02;
      expv[19] = 8'h00;
      expv[20] = 8'h4b;
      expv[21] = 8'h50;
      expv[22] = 8'ha8;
      expv[23] = 8'h00;
      expv[24] = 8'h00;
      expv[25] = 8'h78;
      expv[26] = 8'h00;
      expv[27] = 8'h12;
      expv[28] = 8'h12;
      expv[29] = 8'h54;
      expv[30] = 8'h78;
      expv[31] = 8'h1e;
      expv[32] = 8'h81;
      expv[33] = 8'h06;
      expv[34] = 8'h0c;
      expv[35] = 8'h87;
      expv[36] = 8'h46;
      expv[37] = 8'h10;
      expv[38] = 8'h96;
      expv[39] = 8'h6c;
      expv[40] = 8'hf0;
      expv[41] = 8'h18;
      expv[42] = 8'h00;
      expv[43] = 8'hc7;
      expv[44] = 8'h03;
      expv[45] = 8'h06;
      expv[46] = 8'h00;
      expv[47] = 8'h18;
      expv[48] = 8'h02;
      expv[49] = 8'h38;
      expv[50] = 8'h96;
      expv[51] = 8'h24;
      expv[52] = 8'h32;
      expv[53] = 8'h18;
      expv[54] = 8'hfc;
      expv[55] = 8'h16;
      expv[56] = 8'h8d;
      expv[57] = 8'he1;
      expv[58] = 8'h00;
      expv[59] = 8'h0f;
      expv[60] = 8'h90;
      expv[61] = 8'h06;
      expv[62] = 8'h4b;
      expv[63] = 8'ha6;
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
