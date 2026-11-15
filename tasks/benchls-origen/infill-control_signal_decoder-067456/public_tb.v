// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 20;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_067456 dut (
    .clk(clk),
    .operacao(in_vec[4:0]),
    .Tx(out_vec[19:15]),
    .Ty(out_vec[14:10]),
    .Tz(out_vec[9:5]),
    .Tula(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h01;
    stim[1] = 5'h06;
    stim[2] = 5'h14;
    stim[3] = 5'h13;
    stim[4] = 5'h1b;
    stim[5] = 5'h05;
    stim[6] = 5'h19;
    stim[7] = 5'h05;
    stim[8] = 5'h1d;
    stim[9] = 5'h1f;
    stim[10] = 5'h06;
    stim[11] = 5'h01;
    stim[12] = 5'h03;
    stim[13] = 5'h11;
    stim[14] = 5'h1b;
    stim[15] = 5'h1b;
    stim[16] = 5'h0b;
    stim[17] = 5'h16;
    stim[18] = 5'h1d;
    stim[19] = 5'h1f;
    stim[20] = 5'h1a;
    stim[21] = 5'h17;
    stim[22] = 5'h0d;
    stim[23] = 5'h0f;
    stim[24] = 5'h15;
    stim[25] = 5'h12;
    stim[26] = 5'h11;
    stim[27] = 5'h02;
    stim[28] = 5'h10;
    stim[29] = 5'h18;
    stim[30] = 5'h12;
    stim[31] = 5'h1b;
    stim[32] = 5'h16;
    stim[33] = 5'h08;
    stim[34] = 5'h0d;
    stim[35] = 5'h1b;
    stim[36] = 5'h07;
    stim[37] = 5'h1b;
    stim[38] = 5'h16;
    stim[39] = 5'h0e;
    stim[40] = 5'h1c;
    stim[41] = 5'h0d;
    stim[42] = 5'h1d;
    stim[43] = 5'h13;
    stim[44] = 5'h11;
    stim[45] = 5'h15;
    stim[46] = 5'h0c;
    stim[47] = 5'h15;
    stim[48] = 5'h00;
    stim[49] = 5'h0a;
    stim[50] = 5'h05;
    stim[51] = 5'h15;
    stim[52] = 5'h06;
    stim[53] = 5'h0c;
    stim[54] = 5'h1b;
    stim[55] = 5'h1b;
    stim[56] = 5'h1e;
    stim[57] = 5'h0b;
    stim[58] = 5'h02;
    stim[59] = 5'h0b;
    stim[60] = 5'h10;
    stim[61] = 5'h09;
    stim[62] = 5'h07;
    stim[63] = 5'h0b;
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
      expv[0] = 20'hxxxxx;
      expv[1] = 20'h08401;
      expv[2] = 20'h00000;
      expv[3] = 20'h00000;
      expv[4] = 20'h00000;
      expv[5] = 20'h00000;
      expv[6] = 20'h00000;
      expv[7] = 20'h00000;
      expv[8] = 20'h00000;
      expv[9] = 20'h00000;
      expv[10] = 20'h00000;
      expv[11] = 20'h00000;
      expv[12] = 20'h08401;
      expv[13] = 20'h10c00;
      expv[14] = 20'h00000;
      expv[15] = 20'h00000;
      expv[16] = 20'h00000;
      expv[17] = 20'h00000;
      expv[18] = 20'h00000;
      expv[19] = 20'h00000;
      expv[20] = 20'h00000;
      expv[21] = 20'h00000;
      expv[22] = 20'h00000;
      expv[23] = 20'h00000;
      expv[24] = 20'h00000;
      expv[25] = 20'h00000;
      expv[26] = 20'h00000;
      expv[27] = 20'h00000;
      expv[28] = 20'h10401;
      expv[29] = 20'h00000;
      expv[30] = 20'h00000;
      expv[31] = 20'h00000;
      expv[32] = 20'h00000;
      expv[33] = 20'h00000;
      expv[34] = 20'h00000;
      expv[35] = 20'h00000;
      expv[36] = 20'h00000;
      expv[37] = 20'h00000;
      expv[38] = 20'h00000;
      expv[39] = 20'h00000;
      expv[40] = 20'h00000;
      expv[41] = 20'h00000;
      expv[42] = 20'h00000;
      expv[43] = 20'h00000;
      expv[44] = 20'h00000;
      expv[45] = 20'h00000;
      expv[46] = 20'h00000;
      expv[47] = 20'h00000;
      expv[48] = 20'h00000;
      expv[49] = 20'h08840;
      expv[50] = 20'h00000;
      expv[51] = 20'h00000;
      expv[52] = 20'h00000;
      expv[53] = 20'h00000;
      expv[54] = 20'h00000;
      expv[55] = 20'h00000;
      expv[56] = 20'h00000;
      expv[57] = 20'h00000;
      expv[58] = 20'h00000;
      expv[59] = 20'h10401;
      expv[60] = 20'h00000;
      expv[61] = 20'h00000;
      expv[62] = 20'h00000;
      expv[63] = 20'h00000;
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
