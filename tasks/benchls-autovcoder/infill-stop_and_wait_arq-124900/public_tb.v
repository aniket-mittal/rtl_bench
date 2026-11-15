// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_124900 dut (
    .clk(clk),
    .reset(in_vec[9:9]),
    .data_in(in_vec[8:1]),
    .error(in_vec[0:0]),
    .data_out(out_vec[13:6]),
    .ack(out_vec[5:5]),
    .nack(out_vec[4:4]),
    .attempts(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h259;
    stim[1] = 10'h213;
    stim[2] = 10'h17b;
    stim[3] = 10'h04b;
    stim[4] = 10'h084;
    stim[5] = 10'h1f8;
    stim[6] = 10'h14f;
    stim[7] = 10'h0e8;
    stim[8] = 10'h0c1;
    stim[9] = 10'h12a;
    stim[10] = 10'h13b;
    stim[11] = 10'h0e9;
    stim[12] = 10'h15f;
    stim[13] = 10'h16c;
    stim[14] = 10'h177;
    stim[15] = 10'h1f1;
    stim[16] = 10'h124;
    stim[17] = 10'h1ac;
    stim[18] = 10'h045;
    stim[19] = 10'h117;
    stim[20] = 10'h034;
    stim[21] = 10'h19e;
    stim[22] = 10'h0e0;
    stim[23] = 10'h0c9;
    stim[24] = 10'h174;
    stim[25] = 10'h165;
    stim[26] = 10'h0d6;
    stim[27] = 10'h0cf;
    stim[28] = 10'h013;
    stim[29] = 10'h152;
    stim[30] = 10'h0ad;
    stim[31] = 10'h027;
    stim[32] = 10'h0a3;
    stim[33] = 10'h08d;
    stim[34] = 10'h143;
    stim[35] = 10'h152;
    stim[36] = 10'h004;
    stim[37] = 10'h115;
    stim[38] = 10'h0cc;
    stim[39] = 10'h087;
    stim[40] = 10'h00a;
    stim[41] = 10'h059;
    stim[42] = 10'h0a3;
    stim[43] = 10'h0e1;
    stim[44] = 10'h13a;
    stim[45] = 10'h0fd;
    stim[46] = 10'h0bf;
    stim[47] = 10'h04c;
    stim[48] = 10'h3b4;
    stim[49] = 10'h2f5;
    stim[50] = 10'h0f8;
    stim[51] = 10'h059;
    stim[52] = 10'h173;
    stim[53] = 10'h0c3;
    stim[54] = 10'h12d;
    stim[55] = 10'h0e8;
    stim[56] = 10'h16d;
    stim[57] = 10'h073;
    stim[58] = 10'h15d;
    stim[59] = 10'h04e;
    stim[60] = 10'h07e;
    stim[61] = 10'h18f;
    stim[62] = 10'h18f;
    stim[63] = 10'h0ba;
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
      expv[0] = 14'hxxx0;
      expv[1] = 14'hxxx0;
      expv[2] = 14'hxxx0;
      expv[3] = 14'h2f41;
      expv[4] = 14'h2f51;
      expv[5] = 14'h1092;
      expv[6] = 14'h10a2;
      expv[7] = 14'h1082;
      expv[8] = 14'h1d03;
      expv[9] = 14'h1d13;
      expv[10] = 14'h2554;
      expv[11] = 14'h2554;
      expv[12] = 14'h1d15;
      expv[13] = 14'h1d15;
      expv[14] = 14'h2d96;
      expv[15] = 14'h2d96;
      expv[16] = 14'h3e17;
      expv[17] = 14'h3e27;
      expv[18] = 14'h3e07;
      expv[19] = 14'h0888;
      expv[20] = 14'h0898;
      expv[21] = 14'h0699;
      expv[22] = 14'h06a9;
      expv[23] = 14'h0689;
      expv[24] = 14'h190a;
      expv[25] = 14'h192a;
      expv[26] = 14'h190a;
      expv[27] = 14'h190a;
      expv[28] = 14'h190a;
      expv[29] = 14'h190a;
      expv[30] = 14'h190a;
      expv[31] = 14'h190a;
      expv[32] = 14'h190a;
      expv[33] = 14'h190a;
      expv[34] = 14'h190a;
      expv[35] = 14'h190a;
      expv[36] = 14'h190a;
      expv[37] = 14'h190a;
      expv[38] = 14'h190a;
      expv[39] = 14'h190a;
      expv[40] = 14'h190a;
      expv[41] = 14'h190a;
      expv[42] = 14'h190a;
      expv[43] = 14'h190a;
      expv[44] = 14'h190a;
      expv[45] = 14'h190a;
      expv[46] = 14'h190a;
      expv[47] = 14'h190a;
      expv[48] = 14'h1900;
      expv[49] = 14'h1900;
      expv[50] = 14'h1900;
      expv[51] = 14'h1f01;
      expv[52] = 14'h1f11;
      expv[53] = 14'h2e52;
      expv[54] = 14'h2e52;
      expv[55] = 14'h2593;
      expv[56] = 14'h25a3;
      expv[57] = 14'h2583;
      expv[58] = 14'h0e44;
      expv[59] = 14'h0e54;
      expv[60] = 14'h09d5;
      expv[61] = 14'h09e5;
      expv[62] = 14'h09c5;
      expv[63] = 14'h31c6;
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
