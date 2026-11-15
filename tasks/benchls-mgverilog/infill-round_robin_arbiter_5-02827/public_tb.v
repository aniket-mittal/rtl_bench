// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_02827 dut (
    .sys_clk(clk),
    .sys_rst(in_vec[5:5]),
    .req(in_vec[4:0]),
    .gnt(out_vec[2:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h38;
    stim[1] = 6'h24;
    stim[2] = 6'h0e;
    stim[3] = 6'h08;
    stim[4] = 6'h10;
    stim[5] = 6'h17;
    stim[6] = 6'h1d;
    stim[7] = 6'h01;
    stim[8] = 6'h12;
    stim[9] = 6'h08;
    stim[10] = 6'h19;
    stim[11] = 6'h14;
    stim[12] = 6'h06;
    stim[13] = 6'h12;
    stim[14] = 6'h1c;
    stim[15] = 6'h1d;
    stim[16] = 6'h09;
    stim[17] = 6'h07;
    stim[18] = 6'h0c;
    stim[19] = 6'h06;
    stim[20] = 6'h02;
    stim[21] = 6'h10;
    stim[22] = 6'h0d;
    stim[23] = 6'h1b;
    stim[24] = 6'h3f;
    stim[25] = 6'h01;
    stim[26] = 6'h08;
    stim[27] = 6'h09;
    stim[28] = 6'h00;
    stim[29] = 6'h13;
    stim[30] = 6'h01;
    stim[31] = 6'h17;
    stim[32] = 6'h0e;
    stim[33] = 6'h07;
    stim[34] = 6'h31;
    stim[35] = 6'h02;
    stim[36] = 6'h0e;
    stim[37] = 6'h1b;
    stim[38] = 6'h18;
    stim[39] = 6'h1e;
    stim[40] = 6'h10;
    stim[41] = 6'h0d;
    stim[42] = 6'h0c;
    stim[43] = 6'h0b;
    stim[44] = 6'h03;
    stim[45] = 6'h12;
    stim[46] = 6'h08;
    stim[47] = 6'h0b;
    stim[48] = 6'h11;
    stim[49] = 6'h09;
    stim[50] = 6'h03;
    stim[51] = 6'h1f;
    stim[52] = 6'h16;
    stim[53] = 6'h0f;
    stim[54] = 6'h1f;
    stim[55] = 6'h0e;
    stim[56] = 6'h10;
    stim[57] = 6'h10;
    stim[58] = 6'h0b;
    stim[59] = 6'h02;
    stim[60] = 6'h1c;
    stim[61] = 6'h0c;
    stim[62] = 6'h18;
    stim[63] = 6'h1b;
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
      expv[0] = 3'hx;
      expv[1] = 3'h0;
      expv[2] = 3'h0;
      expv[3] = 3'h1;
      expv[4] = 3'h3;
      expv[5] = 3'h4;
      expv[6] = 3'h4;
      expv[7] = 3'h4;
      expv[8] = 3'h0;
      expv[9] = 3'h1;
      expv[10] = 3'h3;
      expv[11] = 3'h3;
      expv[12] = 3'h4;
      expv[13] = 3'h1;
      expv[14] = 3'h1;
      expv[15] = 3'h2;
      expv[16] = 3'h2;
      expv[17] = 3'h3;
      expv[18] = 3'h0;
      expv[19] = 3'h2;
      expv[20] = 3'h2;
      expv[21] = 3'h1;
      expv[22] = 3'h4;
      expv[23] = 3'h0;
      expv[24] = 3'h0;
      expv[25] = 3'h0;
      expv[26] = 3'h0;
      expv[27] = 3'h3;
      expv[28] = 3'h3;
      expv[29] = 3'h3;
      expv[30] = 3'h4;
      expv[31] = 3'h0;
      expv[32] = 3'h0;
      expv[33] = 3'h1;
      expv[34] = 3'h1;
      expv[35] = 3'h0;
      expv[36] = 3'h1;
      expv[37] = 3'h1;
      expv[38] = 3'h1;
      expv[39] = 3'h3;
      expv[40] = 3'h3;
      expv[41] = 3'h4;
      expv[42] = 3'h0;
      expv[43] = 3'h2;
      expv[44] = 3'h3;
      expv[45] = 3'h0;
      expv[46] = 3'h1;
      expv[47] = 3'h3;
      expv[48] = 3'h3;
      expv[49] = 3'h4;
      expv[50] = 3'h0;
      expv[51] = 3'h0;
      expv[52] = 3'h0;
      expv[53] = 3'h1;
      expv[54] = 3'h1;
      expv[55] = 3'h1;
      expv[56] = 3'h1;
      expv[57] = 3'h4;
      expv[58] = 3'h4;
      expv[59] = 3'h0;
      expv[60] = 3'h1;
      expv[61] = 3'h2;
      expv[62] = 3'h2;
      expv[63] = 3'h3;
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
