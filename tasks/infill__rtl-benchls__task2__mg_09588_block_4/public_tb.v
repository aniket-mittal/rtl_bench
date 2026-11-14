// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 2;
  localparam OW = 5;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09588 dut (
    .clk(clk),
    .ain(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .count(out_vec[4:1]),
    .yout(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 2'h1;
    stim[1] = 2'h3;
    stim[2] = 2'h0;
    stim[3] = 2'h0;
    stim[4] = 2'h0;
    stim[5] = 2'h0;
    stim[6] = 2'h2;
    stim[7] = 2'h0;
    stim[8] = 2'h0;
    stim[9] = 2'h0;
    stim[10] = 2'h2;
    stim[11] = 2'h0;
    stim[12] = 2'h0;
    stim[13] = 2'h0;
    stim[14] = 2'h0;
    stim[15] = 2'h0;
    stim[16] = 2'h0;
    stim[17] = 2'h2;
    stim[18] = 2'h0;
    stim[19] = 2'h0;
    stim[20] = 2'h0;
    stim[21] = 2'h2;
    stim[22] = 2'h2;
    stim[23] = 2'h1;
    stim[24] = 2'h2;
    stim[25] = 2'h0;
    stim[26] = 2'h2;
    stim[27] = 2'h0;
    stim[28] = 2'h0;
    stim[29] = 2'h0;
    stim[30] = 2'h2;
    stim[31] = 2'h0;
    stim[32] = 2'h0;
    stim[33] = 2'h0;
    stim[34] = 2'h2;
    stim[35] = 2'h2;
    stim[36] = 2'h0;
    stim[37] = 2'h0;
    stim[38] = 2'h0;
    stim[39] = 2'h2;
    stim[40] = 2'h0;
    stim[41] = 2'h0;
    stim[42] = 2'h0;
    stim[43] = 2'h2;
    stim[44] = 2'h0;
    stim[45] = 2'h2;
    stim[46] = 2'h2;
    stim[47] = 2'h0;
    stim[48] = 2'h0;
    stim[49] = 2'h0;
    stim[50] = 2'h2;
    stim[51] = 2'h0;
    stim[52] = 2'h2;
    stim[53] = 2'h2;
    stim[54] = 2'h2;
    stim[55] = 2'h2;
    stim[56] = 2'h3;
    stim[57] = 2'h0;
    stim[58] = 2'h0;
    stim[59] = 2'h2;
    stim[60] = 2'h0;
    stim[61] = 2'h0;
    stim[62] = 2'h3;
    stim[63] = 2'h0;
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
      expv[0] = 5'hxx;
      expv[1] = 5'h00;
      expv[2] = 5'h01;
      expv[3] = 5'h01;
      expv[4] = 5'h01;
      expv[5] = 5'h01;
      expv[6] = 5'h00;
      expv[7] = 5'h02;
      expv[8] = 5'h02;
      expv[9] = 5'h02;
      expv[10] = 5'h02;
      expv[11] = 5'h04;
      expv[12] = 5'h04;
      expv[13] = 5'h04;
      expv[14] = 5'h04;
      expv[15] = 5'h04;
      expv[16] = 5'h04;
      expv[17] = 5'h04;
      expv[18] = 5'h06;
      expv[19] = 5'h06;
      expv[20] = 5'h06;
      expv[21] = 5'h07;
      expv[22] = 5'h08;
      expv[23] = 5'h0a;
      expv[24] = 5'h00;
      expv[25] = 5'h02;
      expv[26] = 5'h02;
      expv[27] = 5'h04;
      expv[28] = 5'h04;
      expv[29] = 5'h04;
      expv[30] = 5'h04;
      expv[31] = 5'h06;
      expv[32] = 5'h06;
      expv[33] = 5'h06;
      expv[34] = 5'h07;
      expv[35] = 5'h08;
      expv[36] = 5'h0a;
      expv[37] = 5'h0a;
      expv[38] = 5'h0a;
      expv[39] = 5'h0a;
      expv[40] = 5'h0c;
      expv[41] = 5'h0c;
      expv[42] = 5'h0c;
      expv[43] = 5'h0d;
      expv[44] = 5'h0e;
      expv[45] = 5'h0e;
      expv[46] = 5'h10;
      expv[47] = 5'h12;
      expv[48] = 5'h12;
      expv[49] = 5'h12;
      expv[50] = 5'h13;
      expv[51] = 5'h14;
      expv[52] = 5'h14;
      expv[53] = 5'h16;
      expv[54] = 5'h19;
      expv[55] = 5'h1a;
      expv[56] = 5'h1c;
      expv[57] = 5'h01;
      expv[58] = 5'h01;
      expv[59] = 5'h00;
      expv[60] = 5'h02;
      expv[61] = 5'h02;
      expv[62] = 5'h02;
      expv[63] = 5'h01;
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
