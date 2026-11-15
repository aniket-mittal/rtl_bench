// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 2;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_064878 dut (
    .CLK(clk),
    .RESET(in_vec[4:4]),
    .OB_EN(in_vec[3:3]),
    .B_E(in_vec[2:2]),
    .OB_RESET(in_vec[1:1]),
    .M_OB_EN(in_vec[0:0]),
    .EN_OB(out_vec[1:1]),
    .COLLISION(out_vec[0:0])
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
    stim[1] = 5'h10;
    stim[2] = 5'h0e;
    stim[3] = 5'h1a;
    stim[4] = 5'h09;
    stim[5] = 5'h0c;
    stim[6] = 5'h0d;
    stim[7] = 5'h0e;
    stim[8] = 5'h07;
    stim[9] = 5'h03;
    stim[10] = 5'h0a;
    stim[11] = 5'h09;
    stim[12] = 5'h0d;
    stim[13] = 5'h0a;
    stim[14] = 5'h0f;
    stim[15] = 5'h0c;
    stim[16] = 5'h06;
    stim[17] = 5'h06;
    stim[18] = 5'h09;
    stim[19] = 5'h0b;
    stim[20] = 5'h01;
    stim[21] = 5'h0d;
    stim[22] = 5'h01;
    stim[23] = 5'h01;
    stim[24] = 5'h04;
    stim[25] = 5'h14;
    stim[26] = 5'h02;
    stim[27] = 5'h04;
    stim[28] = 5'h0a;
    stim[29] = 5'h02;
    stim[30] = 5'h03;
    stim[31] = 5'h0e;
    stim[32] = 5'h0f;
    stim[33] = 5'h07;
    stim[34] = 5'h00;
    stim[35] = 5'h06;
    stim[36] = 5'h08;
    stim[37] = 5'h0c;
    stim[38] = 5'h0c;
    stim[39] = 5'h00;
    stim[40] = 5'h0f;
    stim[41] = 5'h0b;
    stim[42] = 5'h0a;
    stim[43] = 5'h0b;
    stim[44] = 5'h0d;
    stim[45] = 5'h06;
    stim[46] = 5'h0d;
    stim[47] = 5'h0b;
    stim[48] = 5'h0e;
    stim[49] = 5'h03;
    stim[50] = 5'h0d;
    stim[51] = 5'h06;
    stim[52] = 5'h07;
    stim[53] = 5'h0a;
    stim[54] = 5'h0e;
    stim[55] = 5'h01;
    stim[56] = 5'h0f;
    stim[57] = 5'h00;
    stim[58] = 5'h08;
    stim[59] = 5'h08;
    stim[60] = 5'h05;
    stim[61] = 5'h01;
    stim[62] = 5'h00;
    stim[63] = 5'h0e;
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
      expv[0] = 2'h2;
      expv[1] = 2'h0;
      expv[2] = 2'h1;
      expv[3] = 2'h0;
      expv[4] = 2'h2;
      expv[5] = 2'h1;
      expv[6] = 2'h1;
      expv[7] = 2'h1;
      expv[8] = 2'h2;
      expv[9] = 2'h2;
      expv[10] = 2'h0;
      expv[11] = 2'h2;
      expv[12] = 2'h3;
      expv[13] = 2'h0;
      expv[14] = 2'h3;
      expv[15] = 2'h1;
      expv[16] = 2'h0;
      expv[17] = 2'h0;
      expv[18] = 2'h2;
      expv[19] = 2'h2;
      expv[20] = 2'h2;
      expv[21] = 2'h3;
      expv[22] = 2'h0;
      expv[23] = 2'h0;
      expv[24] = 2'h0;
      expv[25] = 2'h0;
      expv[26] = 2'h0;
      expv[27] = 2'h0;
      expv[28] = 2'h0;
      expv[29] = 2'h0;
      expv[30] = 2'h2;
      expv[31] = 2'h1;
      expv[32] = 2'h1;
      expv[33] = 2'h2;
      expv[34] = 2'h0;
      expv[35] = 2'h0;
      expv[36] = 2'h0;
      expv[37] = 2'h1;
      expv[38] = 2'h1;
      expv[39] = 2'h0;
      expv[40] = 2'h1;
      expv[41] = 2'h2;
      expv[42] = 2'h0;
      expv[43] = 2'h2;
      expv[44] = 2'h3;
      expv[45] = 2'h0;
      expv[46] = 2'h3;
      expv[47] = 2'h0;
      expv[48] = 2'h1;
      expv[49] = 2'h0;
      expv[50] = 2'h3;
      expv[51] = 2'h0;
      expv[52] = 2'h2;
      expv[53] = 2'h0;
      expv[54] = 2'h1;
      expv[55] = 2'h0;
      expv[56] = 2'h1;
      expv[57] = 2'h0;
      expv[58] = 2'h0;
      expv[59] = 2'h0;
      expv[60] = 2'h2;
      expv[61] = 2'h2;
      expv[62] = 2'h0;
      expv[63] = 2'h1;
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
