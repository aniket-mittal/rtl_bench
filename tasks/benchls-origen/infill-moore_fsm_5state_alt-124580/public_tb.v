// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_124580 dut (
    .clk(clk),
    .rst(in_vec[4:4]),
    .in(in_vec[3:0]),
    .out(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h1f;
    stim[1] = 5'h17;
    stim[2] = 5'h05;
    stim[3] = 5'h04;
    stim[4] = 5'h0c;
    stim[5] = 5'h00;
    stim[6] = 5'h0f;
    stim[7] = 5'h0d;
    stim[8] = 5'h0f;
    stim[9] = 5'h0d;
    stim[10] = 5'h00;
    stim[11] = 5'h07;
    stim[12] = 5'h0e;
    stim[13] = 5'h09;
    stim[14] = 5'h06;
    stim[15] = 5'h03;
    stim[16] = 5'h01;
    stim[17] = 5'h0a;
    stim[18] = 5'h05;
    stim[19] = 5'h05;
    stim[20] = 5'h0a;
    stim[21] = 5'h08;
    stim[22] = 5'h0e;
    stim[23] = 5'h04;
    stim[24] = 5'h08;
    stim[25] = 5'h09;
    stim[26] = 5'h09;
    stim[27] = 5'h05;
    stim[28] = 5'h0c;
    stim[29] = 5'h09;
    stim[30] = 5'h0e;
    stim[31] = 5'h06;
    stim[32] = 5'h09;
    stim[33] = 5'h0e;
    stim[34] = 5'h08;
    stim[35] = 5'h04;
    stim[36] = 5'h0d;
    stim[37] = 5'h02;
    stim[38] = 5'h0f;
    stim[39] = 5'h0b;
    stim[40] = 5'h0f;
    stim[41] = 5'h02;
    stim[42] = 5'h05;
    stim[43] = 5'h07;
    stim[44] = 5'h08;
    stim[45] = 5'h04;
    stim[46] = 5'h06;
    stim[47] = 5'h0e;
    stim[48] = 5'h02;
    stim[49] = 5'h08;
    stim[50] = 5'h00;
    stim[51] = 5'h0e;
    stim[52] = 5'h0f;
    stim[53] = 5'h05;
    stim[54] = 5'h08;
    stim[55] = 5'h0a;
    stim[56] = 5'h0f;
    stim[57] = 5'h06;
    stim[58] = 5'h02;
    stim[59] = 5'h0c;
    stim[60] = 5'h03;
    stim[61] = 5'h0a;
    stim[62] = 5'h02;
    stim[63] = 5'h02;
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
      expv[0] = 3'h7;
      expv[1] = 3'h7;
      expv[2] = 3'h5;
      expv[3] = 3'h1;
      expv[4] = 3'h1;
      expv[5] = 3'h0;
      expv[6] = 3'h7;
      expv[7] = 3'h1;
      expv[8] = 3'h7;
      expv[9] = 3'h5;
      expv[10] = 3'h0;
      expv[11] = 3'h5;
      expv[12] = 3'h3;
      expv[13] = 3'h0;
      expv[14] = 3'h2;
      expv[15] = 3'h4;
      expv[16] = 3'h0;
      expv[17] = 3'h0;
      expv[18] = 3'h0;
      expv[19] = 3'h0;
      expv[20] = 3'h0;
      expv[21] = 3'h0;
      expv[22] = 3'h3;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h0;
      expv[28] = 3'h1;
      expv[29] = 3'h0;
      expv[30] = 3'h3;
      expv[31] = 3'h2;
      expv[32] = 3'h0;
      expv[33] = 3'h3;
      expv[34] = 3'h0;
      expv[35] = 3'h0;
      expv[36] = 3'h1;
      expv[37] = 3'h0;
      expv[38] = 3'h7;
      expv[39] = 3'h6;
      expv[40] = 3'h7;
      expv[41] = 3'h1;
      expv[42] = 3'h2;
      expv[43] = 3'h3;
      expv[44] = 3'h4;
      expv[45] = 3'h0;
      expv[46] = 3'h1;
      expv[47] = 3'h5;
      expv[48] = 3'h2;
      expv[49] = 3'h0;
      expv[50] = 3'h0;
      expv[51] = 3'h3;
      expv[52] = 3'h7;
      expv[53] = 3'h0;
      expv[54] = 3'h0;
      expv[55] = 3'h0;
      expv[56] = 3'h7;
      expv[57] = 3'h3;
      expv[58] = 3'h2;
      expv[59] = 3'h1;
      expv[60] = 3'h1;
      expv[61] = 3'h0;
      expv[62] = 3'h0;
      expv[63] = 3'h0;
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
