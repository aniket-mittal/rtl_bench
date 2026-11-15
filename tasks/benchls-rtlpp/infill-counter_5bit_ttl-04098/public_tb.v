// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04098 dut (
    .CLK(clk),
    .CE(in_vec[1:1]),
    .CLR(in_vec[0:0]),
    .CEO(out_vec[6:6]),
    .Q0(out_vec[5:5]),
    .Q1(out_vec[4:4]),
    .Q2(out_vec[3:3]),
    .Q3(out_vec[2:2]),
    .Q4(out_vec[1:1]),
    .TC(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h3;
    stim[1] = 2'h1;
    stim[2] = 2'h2;
    stim[3] = 2'h2;
    stim[4] = 2'h0;
    stim[5] = 2'h2;
    stim[6] = 2'h0;
    stim[7] = 2'h2;
    stim[8] = 2'h2;
    stim[9] = 2'h0;
    stim[10] = 2'h2;
    stim[11] = 2'h2;
    stim[12] = 2'h2;
    stim[13] = 2'h0;
    stim[14] = 2'h0;
    stim[15] = 2'h0;
    stim[16] = 2'h2;
    stim[17] = 2'h0;
    stim[18] = 2'h2;
    stim[19] = 2'h0;
    stim[20] = 2'h0;
    stim[21] = 2'h0;
    stim[22] = 2'h2;
    stim[23] = 2'h2;
    stim[24] = 2'h2;
    stim[25] = 2'h2;
    stim[26] = 2'h2;
    stim[27] = 2'h3;
    stim[28] = 2'h0;
    stim[29] = 2'h2;
    stim[30] = 2'h2;
    stim[31] = 2'h0;
    stim[32] = 2'h2;
    stim[33] = 2'h0;
    stim[34] = 2'h0;
    stim[35] = 2'h0;
    stim[36] = 2'h2;
    stim[37] = 2'h2;
    stim[38] = 2'h0;
    stim[39] = 2'h0;
    stim[40] = 2'h0;
    stim[41] = 2'h0;
    stim[42] = 2'h2;
    stim[43] = 2'h0;
    stim[44] = 2'h2;
    stim[45] = 2'h2;
    stim[46] = 2'h2;
    stim[47] = 2'h2;
    stim[48] = 2'h0;
    stim[49] = 2'h0;
    stim[50] = 2'h0;
    stim[51] = 2'h2;
    stim[52] = 2'h0;
    stim[53] = 2'h0;
    stim[54] = 2'h0;
    stim[55] = 2'h0;
    stim[56] = 2'h2;
    stim[57] = 2'h2;
    stim[58] = 2'h2;
    stim[59] = 2'h0;
    stim[60] = 2'h0;
    stim[61] = 2'h2;
    stim[62] = 2'h0;
    stim[63] = 2'h2;
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
      expv[0] = 7'h30;
      expv[1] = 7'h30;
      expv[2] = 7'h30;
      expv[3] = 7'h08;
      expv[4] = 7'h28;
      expv[5] = 7'h28;
      expv[6] = 7'h18;
      expv[7] = 7'h18;
      expv[8] = 7'h38;
      expv[9] = 7'h04;
      expv[10] = 7'h04;
      expv[11] = 7'h24;
      expv[12] = 7'h14;
      expv[13] = 7'h34;
      expv[14] = 7'h34;
      expv[15] = 7'h34;
      expv[16] = 7'h34;
      expv[17] = 7'h0c;
      expv[18] = 7'h0c;
      expv[19] = 7'h2c;
      expv[20] = 7'h2c;
      expv[21] = 7'h2c;
      expv[22] = 7'h2c;
      expv[23] = 7'h1c;
      expv[24] = 7'h3c;
      expv[25] = 7'h02;
      expv[26] = 7'h22;
      expv[27] = 7'h30;
      expv[28] = 7'h30;
      expv[29] = 7'h30;
      expv[30] = 7'h08;
      expv[31] = 7'h28;
      expv[32] = 7'h28;
      expv[33] = 7'h18;
      expv[34] = 7'h18;
      expv[35] = 7'h18;
      expv[36] = 7'h18;
      expv[37] = 7'h38;
      expv[38] = 7'h04;
      expv[39] = 7'h04;
      expv[40] = 7'h04;
      expv[41] = 7'h04;
      expv[42] = 7'h04;
      expv[43] = 7'h24;
      expv[44] = 7'h24;
      expv[45] = 7'h14;
      expv[46] = 7'h34;
      expv[47] = 7'h0c;
      expv[48] = 7'h2c;
      expv[49] = 7'h2c;
      expv[50] = 7'h2c;
      expv[51] = 7'h2c;
      expv[52] = 7'h1c;
      expv[53] = 7'h1c;
      expv[54] = 7'h1c;
      expv[55] = 7'h1c;
      expv[56] = 7'h1c;
      expv[57] = 7'h3c;
      expv[58] = 7'h02;
      expv[59] = 7'h22;
      expv[60] = 7'h22;
      expv[61] = 7'h22;
      expv[62] = 7'h12;
      expv[63] = 7'h12;
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
