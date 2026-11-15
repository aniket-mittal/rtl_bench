// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_195863 dut (
    .Op(in_vec[12:7]),
    .Func(in_vec[6:1]),
    .Z(in_vec[0:0]),
    .Wmem(out_vec[13:13]),
    .Wreg(out_vec[12:12]),
    .Regrt(out_vec[11:11]),
    .Reg2reg(out_vec[10:10]),
    .Aluc(out_vec[9:6]),
    .Shift(out_vec[5:5]),
    .Aluqb(out_vec[4:4]),
    .Pcsrc(out_vec[3:2]),
    .jal(out_vec[1:1]),
    .Se(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h0340;
    stim[1] = 13'h1035;
    stim[2] = 13'h1fd9;
    stim[3] = 13'h017b;
    stim[4] = 13'h03a5;
    stim[5] = 13'h0838;
    stim[6] = 13'h1b3e;
    stim[7] = 13'h054f;
    stim[8] = 13'h13e3;
    stim[9] = 13'h0148;
    stim[10] = 13'h1637;
    stim[11] = 13'h0e70;
    stim[12] = 13'h1ca4;
    stim[13] = 13'h11a9;
    stim[14] = 13'h1f60;
    stim[15] = 13'h118a;
    stim[16] = 13'h0b15;
    stim[17] = 13'h140e;
    stim[18] = 13'h094d;
    stim[19] = 13'h00d4;
    stim[20] = 13'h058f;
    stim[21] = 13'h0eaa;
    stim[22] = 13'h1893;
    stim[23] = 13'h14d7;
    stim[24] = 13'h05d6;
    stim[25] = 13'h1509;
    stim[26] = 13'h1ba7;
    stim[27] = 13'h13e2;
    stim[28] = 13'h0a94;
    stim[29] = 13'h12ac;
    stim[30] = 13'h0421;
    stim[31] = 13'h143d;
    stim[32] = 13'h0ba9;
    stim[33] = 13'h046c;
    stim[34] = 13'h16e0;
    stim[35] = 13'h14d8;
    stim[36] = 13'h13d0;
    stim[37] = 13'h171d;
    stim[38] = 13'h1697;
    stim[39] = 13'h1787;
    stim[40] = 13'h1db1;
    stim[41] = 13'h014c;
    stim[42] = 13'h1bf7;
    stim[43] = 13'h1b87;
    stim[44] = 13'h12d1;
    stim[45] = 13'h1eb4;
    stim[46] = 13'h0e05;
    stim[47] = 13'h1d70;
    stim[48] = 13'h0798;
    stim[49] = 13'h1b33;
    stim[50] = 13'h0c85;
    stim[51] = 13'h0057;
    stim[52] = 13'h02f4;
    stim[53] = 13'h1158;
    stim[54] = 13'h00d5;
    stim[55] = 13'h005c;
    stim[56] = 13'h1d9c;
    stim[57] = 13'h0296;
    stim[58] = 13'h18c5;
    stim[59] = 13'h1201;
    stim[60] = 13'h10ab;
    stim[61] = 13'h1513;
    stim[62] = 13'h1b9f;
    stim[63] = 13'h17ee;
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
      expv[0] = 14'h0000;
      expv[1] = 14'h0000;
      expv[2] = 14'h0000;
      expv[3] = 14'h0000;
      expv[4] = 14'h140e;
      expv[5] = 14'h0000;
      expv[6] = 14'h0000;
      expv[7] = 14'h0000;
      expv[8] = 14'h1801;
      expv[9] = 14'h0000;
      expv[10] = 14'h0000;
      expv[11] = 14'h0000;
      expv[12] = 14'h0000;
      expv[13] = 14'h0000;
      expv[14] = 14'h0000;
      expv[15] = 14'h0000;
      expv[16] = 14'h0000;
      expv[17] = 14'h0000;
      expv[18] = 14'h0000;
      expv[19] = 14'h0000;
      expv[20] = 14'h0000;
      expv[21] = 14'h0000;
      expv[22] = 14'h0000;
      expv[23] = 14'h0000;
      expv[24] = 14'h0000;
      expv[25] = 14'h0000;
      expv[26] = 14'h0000;
      expv[27] = 14'h1801;
      expv[28] = 14'h0000;
      expv[29] = 14'h0000;
      expv[30] = 14'h0004;
      expv[31] = 14'h0000;
      expv[32] = 14'h0000;
      expv[33] = 14'h0000;
      expv[34] = 14'h0000;
      expv[35] = 14'h0000;
      expv[36] = 14'h1801;
      expv[37] = 14'h0000;
      expv[38] = 14'h0000;
      expv[39] = 14'h2001;
      expv[40] = 14'h0000;
      expv[41] = 14'h0000;
      expv[42] = 14'h0000;
      expv[43] = 14'h0000;
      expv[44] = 14'h0000;
      expv[45] = 14'h0000;
      expv[46] = 14'h0000;
      expv[47] = 14'h0000;
      expv[48] = 14'h0000;
      expv[49] = 14'h0000;
      expv[50] = 14'h0000;
      expv[51] = 14'h14c0;
      expv[52] = 14'h0008;
      expv[53] = 14'h1801;
      expv[54] = 14'h0000;
      expv[55] = 14'h14a0;
      expv[56] = 14'h0000;
      expv[57] = 14'h0008;
      expv[58] = 14'h0000;
      expv[59] = 14'h1880;
      expv[60] = 14'h0000;
      expv[61] = 14'h0000;
      expv[62] = 14'h0000;
      expv[63] = 14'h2001;
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
