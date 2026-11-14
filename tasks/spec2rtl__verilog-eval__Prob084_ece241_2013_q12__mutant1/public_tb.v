// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .enable(in_vec[4:4]),
    .S(in_vec[3:3]),
    .A(in_vec[2:2]),
    .B(in_vec[1:1]),
    .C(in_vec[0:0]),
    .Z(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h1c;
    stim[1] = 5'h1d;
    stim[2] = 5'h01;
    stim[3] = 5'h04;
    stim[4] = 5'h1a;
    stim[5] = 5'h1b;
    stim[6] = 5'h04;
    stim[7] = 5'h1a;
    stim[8] = 5'h0e;
    stim[9] = 5'h1d;
    stim[10] = 5'h1f;
    stim[11] = 5'h06;
    stim[12] = 5'h11;
    stim[13] = 5'h09;
    stim[14] = 5'h0c;
    stim[15] = 5'h18;
    stim[16] = 5'h12;
    stim[17] = 5'h08;
    stim[18] = 5'h05;
    stim[19] = 5'h19;
    stim[20] = 5'h1d;
    stim[21] = 5'h0e;
    stim[22] = 5'h1f;
    stim[23] = 5'h0b;
    stim[24] = 5'h17;
    stim[25] = 5'h0b;
    stim[26] = 5'h19;
    stim[27] = 5'h0f;
    stim[28] = 5'h1f;
    stim[29] = 5'h13;
    stim[30] = 5'h00;
    stim[31] = 5'h19;
    stim[32] = 5'h08;
    stim[33] = 5'h1e;
    stim[34] = 5'h06;
    stim[35] = 5'h10;
    stim[36] = 5'h0f;
    stim[37] = 5'h14;
    stim[38] = 5'h14;
    stim[39] = 5'h11;
    stim[40] = 5'h12;
    stim[41] = 5'h0f;
    stim[42] = 5'h1e;
    stim[43] = 5'h13;
    stim[44] = 5'h07;
    stim[45] = 5'h18;
    stim[46] = 5'h18;
    stim[47] = 5'h14;
    stim[48] = 5'h11;
    stim[49] = 5'h1b;
    stim[50] = 5'h01;
    stim[51] = 5'h01;
    stim[52] = 5'h07;
    stim[53] = 5'h19;
    stim[54] = 5'h02;
    stim[55] = 5'h0a;
    stim[56] = 5'h18;
    stim[57] = 5'h1c;
    stim[58] = 5'h1c;
    stim[59] = 5'h02;
    stim[60] = 5'h08;
    stim[61] = 5'h00;
    stim[62] = 5'h0f;
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
      expv[0] = 1'hx;
      expv[1] = 1'hx;
      expv[2] = 1'hx;
      expv[3] = 1'hx;
      expv[4] = 1'hx;
      expv[5] = 1'hx;
      expv[6] = 1'hx;
      expv[7] = 1'hx;
      expv[8] = 1'hx;
      expv[9] = 1'hx;
      expv[10] = 1'hx;
      expv[11] = 1'hx;
      expv[12] = 1'hx;
      expv[13] = 1'hx;
      expv[14] = 1'hx;
      expv[15] = 1'h0;
      expv[16] = 1'hx;
      expv[17] = 1'h0;
      expv[18] = 1'hx;
      expv[19] = 1'hx;
      expv[20] = 1'hx;
      expv[21] = 1'hx;
      expv[22] = 1'hx;
      expv[23] = 1'hx;
      expv[24] = 1'hx;
      expv[25] = 1'hx;
      expv[26] = 1'hx;
      expv[27] = 1'hx;
      expv[28] = 1'hx;
      expv[29] = 1'hx;
      expv[30] = 1'h0;
      expv[31] = 1'hx;
      expv[32] = 1'h1;
      expv[33] = 1'hx;
      expv[34] = 1'hx;
      expv[35] = 1'h1;
      expv[36] = 1'hx;
      expv[37] = 1'hx;
      expv[38] = 1'hx;
      expv[39] = 1'hx;
      expv[40] = 1'hx;
      expv[41] = 1'hx;
      expv[42] = 1'hx;
      expv[43] = 1'hx;
      expv[44] = 1'hx;
      expv[45] = 1'h0;
      expv[46] = 1'h1;
      expv[47] = 1'hx;
      expv[48] = 1'hx;
      expv[49] = 1'hx;
      expv[50] = 1'hx;
      expv[51] = 1'hx;
      expv[52] = 1'hx;
      expv[53] = 1'hx;
      expv[54] = 1'hx;
      expv[55] = 1'hx;
      expv[56] = 1'h1;
      expv[57] = 1'hx;
      expv[58] = 1'hx;
      expv[59] = 1'hx;
      expv[60] = 1'h1;
      expv[61] = 1'h1;
      expv[62] = 1'hx;
      expv[63] = 1'hx;
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
