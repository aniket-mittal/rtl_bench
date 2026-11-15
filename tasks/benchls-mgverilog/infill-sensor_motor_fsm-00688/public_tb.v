// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 6;
  localparam OW = 7;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00688 dut (
    .clk(clk),
    .rst(in_vec[5:5]),
    .sensor(in_vec[4:0]),
    .sw(out_vec[6:4]),
    .dira(out_vec[3:2]),
    .dirb(out_vec[1:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 6'h22;
    stim[1] = 6'h27;
    stim[2] = 6'h0a;
    stim[3] = 6'h0e;
    stim[4] = 6'h0e;
    stim[5] = 6'h28;
    stim[6] = 6'h09;
    stim[7] = 6'h0b;
    stim[8] = 6'h16;
    stim[9] = 6'h1c;
    stim[10] = 6'h18;
    stim[11] = 6'h0b;
    stim[12] = 6'h16;
    stim[13] = 6'h0e;
    stim[14] = 6'h16;
    stim[15] = 6'h1a;
    stim[16] = 6'h10;
    stim[17] = 6'h1e;
    stim[18] = 6'h12;
    stim[19] = 6'h18;
    stim[20] = 6'h13;
    stim[21] = 6'h11;
    stim[22] = 6'h1e;
    stim[23] = 6'h13;
    stim[24] = 6'h0c;
    stim[25] = 6'h0e;
    stim[26] = 6'h03;
    stim[27] = 6'h0c;
    stim[28] = 6'h06;
    stim[29] = 6'h0e;
    stim[30] = 6'h1d;
    stim[31] = 6'h1b;
    stim[32] = 6'h11;
    stim[33] = 6'h11;
    stim[34] = 6'h15;
    stim[35] = 6'h01;
    stim[36] = 6'h1d;
    stim[37] = 6'h08;
    stim[38] = 6'h1c;
    stim[39] = 6'h1d;
    stim[40] = 6'h07;
    stim[41] = 6'h07;
    stim[42] = 6'h03;
    stim[43] = 6'h14;
    stim[44] = 6'h0b;
    stim[45] = 6'h16;
    stim[46] = 6'h19;
    stim[47] = 6'h17;
    stim[48] = 6'h18;
    stim[49] = 6'h1d;
    stim[50] = 6'h18;
    stim[51] = 6'h3a;
    stim[52] = 6'h09;
    stim[53] = 6'h03;
    stim[54] = 6'h07;
    stim[55] = 6'h0b;
    stim[56] = 6'h0e;
    stim[57] = 6'h38;
    stim[58] = 6'h1b;
    stim[59] = 6'h0f;
    stim[60] = 6'h0b;
    stim[61] = 6'h02;
    stim[62] = 6'h1b;
    stim[63] = 6'h0d;
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
      expv[0] = 7'hx5;
      expv[1] = 7'h05;
      expv[2] = 7'h05;
      expv[3] = 7'h35;
      expv[4] = 7'h05;
      expv[5] = 7'h05;
      expv[6] = 7'h05;
      expv[7] = 7'h05;
      expv[8] = 7'h05;
      expv[9] = 7'h35;
      expv[10] = 7'h05;
      expv[11] = 7'h05;
      expv[12] = 7'h05;
      expv[13] = 7'h04;
      expv[14] = 7'h35;
      expv[15] = 7'h05;
      expv[16] = 7'h35;
      expv[17] = 7'h35;
      expv[18] = 7'h05;
      expv[19] = 7'h35;
      expv[20] = 7'h35;
      expv[21] = 7'h31;
      expv[22] = 7'h31;
      expv[23] = 7'h05;
      expv[24] = 7'h04;
      expv[25] = 7'h35;
      expv[26] = 7'h05;
      expv[27] = 7'h05;
      expv[28] = 7'h05;
      expv[29] = 7'h35;
      expv[30] = 7'h05;
      expv[31] = 7'h05;
      expv[32] = 7'h05;
      expv[33] = 7'h05;
      expv[34] = 7'h05;
      expv[35] = 7'h05;
      expv[36] = 7'h05;
      expv[37] = 7'h05;
      expv[38] = 7'h05;
      expv[39] = 7'h05;
      expv[40] = 7'h05;
      expv[41] = 7'h04;
      expv[42] = 7'h04;
      expv[43] = 7'h04;
      expv[44] = 7'h04;
      expv[45] = 7'h35;
      expv[46] = 7'h05;
      expv[47] = 7'h05;
      expv[48] = 7'h04;
      expv[49] = 7'h35;
      expv[50] = 7'h05;
      expv[51] = 7'h05;
      expv[52] = 7'h05;
      expv[53] = 7'h05;
      expv[54] = 7'h04;
      expv[55] = 7'h04;
      expv[56] = 7'h35;
      expv[57] = 7'h05;
      expv[58] = 7'h05;
      expv[59] = 7'h05;
      expv[60] = 7'h05;
      expv[61] = 7'h05;
      expv[62] = 7'h04;
      expv[63] = 7'h35;
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
