// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 14;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04182 dut (
    .clk(clk),
    .ser_in(in_vec[4:4]),
    .shift_en(in_vec[3:3]),
    .RSTn(in_vec[2:2]),
    .clear_syndrom(in_vec[1:1]),
    .clk_en(in_vec[0:0]),
    .data(out_vec[13:1]),
    .valid(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h10;
    stim[1] = 5'h1b;
    stim[2] = 5'h1c;
    stim[3] = 5'h04;
    stim[4] = 5'h0c;
    stim[5] = 5'h0d;
    stim[6] = 5'h16;
    stim[7] = 5'h1c;
    stim[8] = 5'h05;
    stim[9] = 5'h15;
    stim[10] = 5'h1c;
    stim[11] = 5'h1f;
    stim[12] = 5'h14;
    stim[13] = 5'h0c;
    stim[14] = 5'h15;
    stim[15] = 5'h0d;
    stim[16] = 5'h14;
    stim[17] = 5'h1e;
    stim[18] = 5'h1d;
    stim[19] = 5'h1d;
    stim[20] = 5'h17;
    stim[21] = 5'h05;
    stim[22] = 5'h0d;
    stim[23] = 5'h1f;
    stim[24] = 5'h0d;
    stim[25] = 5'h1d;
    stim[26] = 5'h1c;
    stim[27] = 5'h0f;
    stim[28] = 5'h0e;
    stim[29] = 5'h1e;
    stim[30] = 5'h0f;
    stim[31] = 5'h0f;
    stim[32] = 5'h04;
    stim[33] = 5'h1e;
    stim[34] = 5'h0d;
    stim[35] = 5'h1f;
    stim[36] = 5'h14;
    stim[37] = 5'h17;
    stim[38] = 5'h1f;
    stim[39] = 5'h0f;
    stim[40] = 5'h1f;
    stim[41] = 5'h14;
    stim[42] = 5'h16;
    stim[43] = 5'h07;
    stim[44] = 5'h06;
    stim[45] = 5'h0e;
    stim[46] = 5'h17;
    stim[47] = 5'h04;
    stim[48] = 5'h05;
    stim[49] = 5'h1d;
    stim[50] = 5'h1f;
    stim[51] = 5'h1e;
    stim[52] = 5'h1c;
    stim[53] = 5'h15;
    stim[54] = 5'h0f;
    stim[55] = 5'h1d;
    stim[56] = 5'h17;
    stim[57] = 5'h0d;
    stim[58] = 5'h07;
    stim[59] = 5'h15;
    stim[60] = 5'h15;
    stim[61] = 5'h0f;
    stim[62] = 5'h16;
    stim[63] = 5'h1f;
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
      expv[0] = 14'h2001;
      expv[1] = 14'h2001;
      expv[2] = 14'h2001;
      expv[3] = 14'h2001;
      expv[4] = 14'h2001;
      expv[5] = 14'h2001;
      expv[6] = 14'h2001;
      expv[7] = 14'h2001;
      expv[8] = 14'h2001;
      expv[9] = 14'h2001;
      expv[10] = 14'h0000;
      expv[11] = 14'h0000;
      expv[12] = 14'h2003;
      expv[13] = 14'h2003;
      expv[14] = 14'h2003;
      expv[15] = 14'h0002;
      expv[16] = 14'h0004;
      expv[17] = 14'h0004;
      expv[18] = 14'h0004;
      expv[19] = 14'h000a;
      expv[20] = 14'h0016;
      expv[21] = 14'h2017;
      expv[22] = 14'h2017;
      expv[23] = 14'h202d;
      expv[24] = 14'h205b;
      expv[25] = 14'h20b5;
      expv[26] = 14'h016a;
      expv[27] = 14'h016a;
      expv[28] = 14'h22d5;
      expv[29] = 14'h22d5;
      expv[30] = 14'h22d5;
      expv[31] = 14'h25a9;
      expv[32] = 14'h2b51;
      expv[33] = 14'h2b51;
      expv[34] = 14'h2b51;
      expv[35] = 14'h36a1;
      expv[36] = 14'h2d43;
      expv[37] = 14'h2d43;
      expv[38] = 14'h2d43;
      expv[39] = 14'h3a87;
      expv[40] = 14'h350d;
      expv[41] = 14'h2a1b;
      expv[42] = 14'h2a1b;
      expv[43] = 14'h2a1b;
      expv[44] = 14'h2a1b;
      expv[45] = 14'h2a1b;
      expv[46] = 14'h2a1b;
      expv[47] = 14'h2a1b;
      expv[48] = 14'h2a1b;
      expv[49] = 14'h2a1b;
      expv[50] = 14'h1436;
      expv[51] = 14'h286f;
      expv[52] = 14'h286f;
      expv[53] = 14'h286f;
      expv[54] = 14'h086e;
      expv[55] = 14'h30dd;
      expv[56] = 14'h01ba;
      expv[57] = 14'h21bb;
      expv[58] = 14'h2375;
      expv[59] = 14'h2375;
      expv[60] = 14'h0374;
      expv[61] = 14'h0374;
      expv[62] = 14'h26e9;
      expv[63] = 14'h26e9;
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
