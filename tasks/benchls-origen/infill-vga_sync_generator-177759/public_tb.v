// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 15;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_177759 dut (
    .CLK(clk),
    .sw(in_vec[4:1]),
    .reset(in_vec[0:0]),
    .red(out_vec[14:11]),
    .green(out_vec[10:7]),
    .blue(out_vec[6:3]),
    .hsync(out_vec[2:2]),
    .vsync(out_vec[1:1]),
    .led(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h15;
    stim[1] = 5'h17;
    stim[2] = 5'h0a;
    stim[3] = 5'h08;
    stim[4] = 5'h16;
    stim[5] = 5'h08;
    stim[6] = 5'h08;
    stim[7] = 5'h10;
    stim[8] = 5'h16;
    stim[9] = 5'h02;
    stim[10] = 5'h10;
    stim[11] = 5'h1e;
    stim[12] = 5'h10;
    stim[13] = 5'h1c;
    stim[14] = 5'h12;
    stim[15] = 5'h1c;
    stim[16] = 5'h1b;
    stim[17] = 5'h1a;
    stim[18] = 5'h0c;
    stim[19] = 5'h0c;
    stim[20] = 5'h0e;
    stim[21] = 5'h08;
    stim[22] = 5'h02;
    stim[23] = 5'h1c;
    stim[24] = 5'h16;
    stim[25] = 5'h14;
    stim[26] = 5'h1e;
    stim[27] = 5'h1c;
    stim[28] = 5'h0c;
    stim[29] = 5'h0e;
    stim[30] = 5'h0e;
    stim[31] = 5'h02;
    stim[32] = 5'h0a;
    stim[33] = 5'h10;
    stim[34] = 5'h1c;
    stim[35] = 5'h1c;
    stim[36] = 5'h18;
    stim[37] = 5'h04;
    stim[38] = 5'h1a;
    stim[39] = 5'h04;
    stim[40] = 5'h08;
    stim[41] = 5'h06;
    stim[42] = 5'h1c;
    stim[43] = 5'h0e;
    stim[44] = 5'h0e;
    stim[45] = 5'h06;
    stim[46] = 5'h1e;
    stim[47] = 5'h0c;
    stim[48] = 5'h04;
    stim[49] = 5'h1e;
    stim[50] = 5'h1e;
    stim[51] = 5'h1a;
    stim[52] = 5'h08;
    stim[53] = 5'h1c;
    stim[54] = 5'h02;
    stim[55] = 5'h10;
    stim[56] = 5'h1a;
    stim[57] = 5'h04;
    stim[58] = 5'h0a;
    stim[59] = 5'h02;
    stim[60] = 5'h18;
    stim[61] = 5'h12;
    stim[62] = 5'h12;
    stim[63] = 5'h0a;
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
      expv[0] = 15'hxxxx;
      expv[1] = 15'h7fff;
      expv[2] = 15'h7fff;
      expv[3] = 15'h7fff;
      expv[4] = 15'h7fff;
      expv[5] = 15'h7fff;
      expv[6] = 15'h7fff;
      expv[7] = 15'h7fff;
      expv[8] = 15'h7fff;
      expv[9] = 15'h7fff;
      expv[10] = 15'h7fff;
      expv[11] = 15'h7fff;
      expv[12] = 15'h7fff;
      expv[13] = 15'h7fff;
      expv[14] = 15'h7fff;
      expv[15] = 15'h7fff;
      expv[16] = 15'h7fff;
      expv[17] = 15'h7fff;
      expv[18] = 15'h7fff;
      expv[19] = 15'h7fff;
      expv[20] = 15'h7fff;
      expv[21] = 15'h7fff;
      expv[22] = 15'h7fff;
      expv[23] = 15'h7fff;
      expv[24] = 15'h7fff;
      expv[25] = 15'h7fff;
      expv[26] = 15'h7fff;
      expv[27] = 15'h7fff;
      expv[28] = 15'h7fff;
      expv[29] = 15'h7fff;
      expv[30] = 15'h7fff;
      expv[31] = 15'h7fff;
      expv[32] = 15'h7fff;
      expv[33] = 15'h7fff;
      expv[34] = 15'h7fff;
      expv[35] = 15'h7fff;
      expv[36] = 15'h7fff;
      expv[37] = 15'h7fff;
      expv[38] = 15'h7fff;
      expv[39] = 15'h7fff;
      expv[40] = 15'h7fff;
      expv[41] = 15'h7fff;
      expv[42] = 15'h7fff;
      expv[43] = 15'h7fff;
      expv[44] = 15'h7fff;
      expv[45] = 15'h7fff;
      expv[46] = 15'h7fff;
      expv[47] = 15'h7fff;
      expv[48] = 15'h7fff;
      expv[49] = 15'h7fff;
      expv[50] = 15'h7fff;
      expv[51] = 15'h7fff;
      expv[52] = 15'h7fff;
      expv[53] = 15'h7fff;
      expv[54] = 15'h7fff;
      expv[55] = 15'h7fff;
      expv[56] = 15'h7fff;
      expv[57] = 15'h7fff;
      expv[58] = 15'h7fff;
      expv[59] = 15'h7fff;
      expv[60] = 15'h7fff;
      expv[61] = 15'h7fff;
      expv[62] = 15'h7fff;
      expv[63] = 15'h7fff;
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
