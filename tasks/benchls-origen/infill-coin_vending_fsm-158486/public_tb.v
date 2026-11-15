// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_158486 dut (
    .clk(clk),
    .reset_n(in_vec[4:4]),
    .c5(in_vec[3:3]),
    .c10(in_vec[2:2]),
    .c25(in_vec[1:1]),
    .item_taken(in_vec[0:0]),
    .dispense(out_vec[13:13]),
    .r5(out_vec[12:12]),
    .r10(out_vec[11:11]),
    .r20(out_vec[10:10]),
    .state0(out_vec[9:9]),
    .state1(out_vec[8:8]),
    .state2(out_vec[7:7]),
    .state3(out_vec[6:6]),
    .state4(out_vec[5:5]),
    .state5(out_vec[4:4]),
    .state6(out_vec[3:3]),
    .state7(out_vec[2:2]),
    .state8(out_vec[1:1]),
    .state9(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h04;
    stim[1] = 5'h08;
    stim[2] = 5'h19;
    stim[3] = 5'h19;
    stim[4] = 5'h1d;
    stim[5] = 5'h1f;
    stim[6] = 5'h18;
    stim[7] = 5'h1d;
    stim[8] = 5'h1d;
    stim[9] = 5'h18;
    stim[10] = 5'h1a;
    stim[11] = 5'h14;
    stim[12] = 5'h14;
    stim[13] = 5'h18;
    stim[14] = 5'h04;
    stim[15] = 5'h19;
    stim[16] = 5'h1e;
    stim[17] = 5'h13;
    stim[18] = 5'h18;
    stim[19] = 5'h17;
    stim[20] = 5'h18;
    stim[21] = 5'h11;
    stim[22] = 5'h1e;
    stim[23] = 5'h1d;
    stim[24] = 5'h1d;
    stim[25] = 5'h1a;
    stim[26] = 5'h16;
    stim[27] = 5'h16;
    stim[28] = 5'h11;
    stim[29] = 5'h16;
    stim[30] = 5'h13;
    stim[31] = 5'h1d;
    stim[32] = 5'h10;
    stim[33] = 5'h16;
    stim[34] = 5'h1b;
    stim[35] = 5'h1b;
    stim[36] = 5'h16;
    stim[37] = 5'h14;
    stim[38] = 5'h11;
    stim[39] = 5'h19;
    stim[40] = 5'h12;
    stim[41] = 5'h1a;
    stim[42] = 5'h1a;
    stim[43] = 5'h18;
    stim[44] = 5'h10;
    stim[45] = 5'h1c;
    stim[46] = 5'h1a;
    stim[47] = 5'h1b;
    stim[48] = 5'h13;
    stim[49] = 5'h15;
    stim[50] = 5'h1d;
    stim[51] = 5'h1c;
    stim[52] = 5'h1a;
    stim[53] = 5'h1a;
    stim[54] = 5'h1b;
    stim[55] = 5'h19;
    stim[56] = 5'h1f;
    stim[57] = 5'h1a;
    stim[58] = 5'h18;
    stim[59] = 5'h12;
    stim[60] = 5'h18;
    stim[61] = 5'h1c;
    stim[62] = 5'h18;
    stim[63] = 5'h12;
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
      expv[0] = 14'h0200;
      expv[1] = 14'h0200;
      expv[2] = 14'h0200;
      expv[3] = 14'h1100;
      expv[4] = 14'h0020;
      expv[5] = 14'h0200;
      expv[6] = 14'h1100;
      expv[7] = 14'h0020;
      expv[8] = 14'h0200;
      expv[9] = 14'h1100;
      expv[10] = 14'h0020;
      expv[11] = 14'h0020;
      expv[12] = 14'h0020;
      expv[13] = 14'h0020;
      expv[14] = 14'h0200;
      expv[15] = 14'h0200;
      expv[16] = 14'h1100;
      expv[17] = 14'h0020;
      expv[18] = 14'h0200;
      expv[19] = 14'h1100;
      expv[20] = 14'h0880;
      expv[21] = 14'h1100;
      expv[22] = 14'h1100;
      expv[23] = 14'h0020;
      expv[24] = 14'h0200;
      expv[25] = 14'h1100;
      expv[26] = 14'h0020;
      expv[27] = 14'h0020;
      expv[28] = 14'h0020;
      expv[29] = 14'h0200;
      expv[30] = 14'h0880;
      expv[31] = 14'h2408;
      expv[32] = 14'h0200;
      expv[33] = 14'h0200;
      expv[34] = 14'h0880;
      expv[35] = 14'h1100;
      expv[36] = 14'h0020;
      expv[37] = 14'h0020;
      expv[38] = 14'h0020;
      expv[39] = 14'h0200;
      expv[40] = 14'h1100;
      expv[41] = 14'h0440;
      expv[42] = 14'h2004;
      expv[43] = 14'h2004;
      expv[44] = 14'h2004;
      expv[45] = 14'h2004;
      expv[46] = 14'h2004;
      expv[47] = 14'h2004;
      expv[48] = 14'h0200;
      expv[49] = 14'h0440;
      expv[50] = 14'h2408;
      expv[51] = 14'h0200;
      expv[52] = 14'h1100;
      expv[53] = 14'h0020;
      expv[54] = 14'h0020;
      expv[55] = 14'h0200;
      expv[56] = 14'h1100;
      expv[57] = 14'h0020;
      expv[58] = 14'h0020;
      expv[59] = 14'h0020;
      expv[60] = 14'h0020;
      expv[61] = 14'h0020;
      expv[62] = 14'h0020;
      expv[63] = 14'h0020;
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
