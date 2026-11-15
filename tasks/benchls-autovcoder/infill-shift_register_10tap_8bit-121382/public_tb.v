// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 13;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_121382 dut (
    .clk(clk),
    .data(in_vec[12:5]),
    .ce(in_vec[4:4]),
    .a(in_vec[3:0]),
    .q(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 13'h00f4;
    stim[1] = 13'h0444;
    stim[2] = 13'h16c0;
    stim[3] = 13'h1c35;
    stim[4] = 13'h0687;
    stim[5] = 13'h1918;
    stim[6] = 13'h1600;
    stim[7] = 13'h0973;
    stim[8] = 13'h1f2c;
    stim[9] = 13'h0a6d;
    stim[10] = 13'h1498;
    stim[11] = 13'h04cd;
    stim[12] = 13'h06e9;
    stim[13] = 13'h1ae1;
    stim[14] = 13'h182e;
    stim[15] = 13'h17e7;
    stim[16] = 13'h0c42;
    stim[17] = 13'h005c;
    stim[18] = 13'h1779;
    stim[19] = 13'h17e7;
    stim[20] = 13'h166e;
    stim[21] = 13'h1108;
    stim[22] = 13'h09a8;
    stim[23] = 13'h19cb;
    stim[24] = 13'h0b44;
    stim[25] = 13'h16d6;
    stim[26] = 13'h0cce;
    stim[27] = 13'h09bb;
    stim[28] = 13'h0ffa;
    stim[29] = 13'h1eba;
    stim[30] = 13'h1d02;
    stim[31] = 13'h1dec;
    stim[32] = 13'h0d15;
    stim[33] = 13'h1c8e;
    stim[34] = 13'h1458;
    stim[35] = 13'h0e0c;
    stim[36] = 13'h01cb;
    stim[37] = 13'h0968;
    stim[38] = 13'h003e;
    stim[39] = 13'h1cf3;
    stim[40] = 13'h0b61;
    stim[41] = 13'h1323;
    stim[42] = 13'h1bff;
    stim[43] = 13'h0d48;
    stim[44] = 13'h03b6;
    stim[45] = 13'h0d1b;
    stim[46] = 13'h0b27;
    stim[47] = 13'h1549;
    stim[48] = 13'h0e1c;
    stim[49] = 13'h120c;
    stim[50] = 13'h0191;
    stim[51] = 13'h1a5b;
    stim[52] = 13'h0643;
    stim[53] = 13'h1973;
    stim[54] = 13'h1ff7;
    stim[55] = 13'h0b13;
    stim[56] = 13'h0494;
    stim[57] = 13'h0b1a;
    stim[58] = 13'h024a;
    stim[59] = 13'h094a;
    stim[60] = 13'h1496;
    stim[61] = 13'h0b84;
    stim[62] = 13'h11dd;
    stim[63] = 13'h0ef4;
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
      expv[0] = 8'hxx;
      expv[1] = 8'hxx;
      expv[2] = 8'h07;
      expv[3] = 8'hxx;
      expv[4] = 8'hxx;
      expv[5] = 8'hxx;
      expv[6] = 8'hc8;
      expv[7] = 8'hxx;
      expv[8] = 8'hxx;
      expv[9] = 8'hxx;
      expv[10] = 8'hxx;
      expv[11] = 8'hxx;
      expv[12] = 8'hxx;
      expv[13] = 8'h4b;
      expv[14] = 8'hxx;
      expv[15] = 8'hxx;
      expv[16] = 8'hc8;
      expv[17] = 8'hxx;
      expv[18] = 8'hxx;
      expv[19] = 8'hxx;
      expv[20] = 8'hxx;
      expv[21] = 8'hxx;
      expv[22] = 8'hxx;
      expv[23] = 8'hxx;
      expv[24] = 8'hc8;
      expv[25] = 8'h07;
      expv[26] = 8'hxx;
      expv[27] = 8'hxx;
      expv[28] = 8'hxx;
      expv[29] = 8'h07;
      expv[30] = 8'h4d;
      expv[31] = 8'he1;
      expv[32] = 8'h02;
      expv[33] = 8'hc8;
      expv[34] = 8'h4b;
      expv[35] = 8'h4b;
      expv[36] = 8'h4b;
      expv[37] = 8'ha4;
      expv[38] = 8'h4b;
      expv[39] = 8'hf5;
      expv[40] = 8'h01;
      expv[41] = 8'h68;
      expv[42] = 8'h02;
      expv[43] = 8'hb6;
      expv[44] = 8'h7f;
      expv[45] = 8'hb6;
      expv[46] = 8'hf5;
      expv[47] = 8'h4d;
      expv[48] = 8'h4d;
      expv[49] = 8'h7f;
      expv[50] = 8'h68;
      expv[51] = 8'hf5;
      expv[52] = 8'h68;
      expv[53] = 8'h68;
      expv[54] = 8'he7;
      expv[55] = 8'h0c;
      expv[56] = 8'h0c;
      expv[57] = 8'hdf;
      expv[58] = 8'h1d;
      expv[59] = 8'h1d;
      expv[60] = 8'h0c;
      expv[61] = 8'hff;
      expv[62] = 8'h68;
      expv[63] = 8'h58;
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
