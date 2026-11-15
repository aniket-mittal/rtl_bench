// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  lab4_2 dut (
    .a(in_vec[4:1]),
    .en(in_vec[0:0]),
    .f(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h19;
    stim[1] = 5'h16;
    stim[2] = 5'h14;
    stim[3] = 5'h1b;
    stim[4] = 5'h00;
    stim[5] = 5'h01;
    stim[6] = 5'h04;
    stim[7] = 5'h02;
    stim[8] = 5'h0c;
    stim[9] = 5'h1c;
    stim[10] = 5'h07;
    stim[11] = 5'h1c;
    stim[12] = 5'h04;
    stim[13] = 5'h02;
    stim[14] = 5'h1b;
    stim[15] = 5'h13;
    stim[16] = 5'h11;
    stim[17] = 5'h11;
    stim[18] = 5'h1e;
    stim[19] = 5'h0d;
    stim[20] = 5'h15;
    stim[21] = 5'h05;
    stim[22] = 5'h00;
    stim[23] = 5'h02;
    stim[24] = 5'h02;
    stim[25] = 5'h07;
    stim[26] = 5'h07;
    stim[27] = 5'h06;
    stim[28] = 5'h0b;
    stim[29] = 5'h1c;
    stim[30] = 5'h04;
    stim[31] = 5'h04;
    stim[32] = 5'h17;
    stim[33] = 5'h11;
    stim[34] = 5'h1d;
    stim[35] = 5'h02;
    stim[36] = 5'h0b;
    stim[37] = 5'h04;
    stim[38] = 5'h00;
    stim[39] = 5'h14;
    stim[40] = 5'h0f;
    stim[41] = 5'h0b;
    stim[42] = 5'h1c;
    stim[43] = 5'h0f;
    stim[44] = 5'h13;
    stim[45] = 5'h14;
    stim[46] = 5'h0b;
    stim[47] = 5'h1b;
    stim[48] = 5'h09;
    stim[49] = 5'h05;
    stim[50] = 5'h14;
    stim[51] = 5'h11;
    stim[52] = 5'h12;
    stim[53] = 5'h14;
    stim[54] = 5'h0b;
    stim[55] = 5'h05;
    stim[56] = 5'h17;
    stim[57] = 5'h1e;
    stim[58] = 5'h14;
    stim[59] = 5'h06;
    stim[60] = 5'h0d;
    stim[61] = 5'h01;
    stim[62] = 5'h11;
    stim[63] = 5'h16;
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
      expv[0] = 16'h0000;
      expv[1] = 16'h0010;
      expv[2] = 16'h0020;
      expv[3] = 16'h0000;
      expv[4] = 16'h8000;
      expv[5] = 16'h0000;
      expv[6] = 16'h2000;
      expv[7] = 16'h4000;
      expv[8] = 16'h0200;
      expv[9] = 16'h0002;
      expv[10] = 16'h0000;
      expv[11] = 16'h0002;
      expv[12] = 16'h2000;
      expv[13] = 16'h4000;
      expv[14] = 16'h0000;
      expv[15] = 16'h0000;
      expv[16] = 16'h0000;
      expv[17] = 16'h0000;
      expv[18] = 16'h0001;
      expv[19] = 16'h0000;
      expv[20] = 16'h0000;
      expv[21] = 16'h0000;
      expv[22] = 16'h8000;
      expv[23] = 16'h4000;
      expv[24] = 16'h4000;
      expv[25] = 16'h0000;
      expv[26] = 16'h0000;
      expv[27] = 16'h1000;
      expv[28] = 16'h0000;
      expv[29] = 16'h0002;
      expv[30] = 16'h2000;
      expv[31] = 16'h2000;
      expv[32] = 16'h0000;
      expv[33] = 16'h0000;
      expv[34] = 16'h0000;
      expv[35] = 16'h4000;
      expv[36] = 16'h0000;
      expv[37] = 16'h2000;
      expv[38] = 16'h8000;
      expv[39] = 16'h0020;
      expv[40] = 16'h0000;
      expv[41] = 16'h0000;
      expv[42] = 16'h0002;
      expv[43] = 16'h0000;
      expv[44] = 16'h0000;
      expv[45] = 16'h0020;
      expv[46] = 16'h0000;
      expv[47] = 16'h0000;
      expv[48] = 16'h0000;
      expv[49] = 16'h0000;
      expv[50] = 16'h0020;
      expv[51] = 16'h0000;
      expv[52] = 16'h0040;
      expv[53] = 16'h0020;
      expv[54] = 16'h0000;
      expv[55] = 16'h0000;
      expv[56] = 16'h0000;
      expv[57] = 16'h0001;
      expv[58] = 16'h0020;
      expv[59] = 16'h1000;
      expv[60] = 16'h0000;
      expv[61] = 16'h0000;
      expv[62] = 16'h0000;
      expv[63] = 16'h0010;
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
