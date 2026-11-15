// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 6;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_033682 dut (
    .clock(clk),
    .reset(in_vec[4:4]),
    .left(in_vec[3:3]),
    .right(in_vec[2:2]),
    .hazard(in_vec[1:1]),
    .brake(in_vec[0:0]),
    .out(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h18;
    stim[1] = 5'h1c;
    stim[2] = 5'h0f;
    stim[3] = 5'h02;
    stim[4] = 5'h08;
    stim[5] = 5'h00;
    stim[6] = 5'h01;
    stim[7] = 5'h05;
    stim[8] = 5'h00;
    stim[9] = 5'h01;
    stim[10] = 5'h01;
    stim[11] = 5'h02;
    stim[12] = 5'h01;
    stim[13] = 5'h0e;
    stim[14] = 5'h08;
    stim[15] = 5'h0f;
    stim[16] = 5'h0a;
    stim[17] = 5'h0f;
    stim[18] = 5'h03;
    stim[19] = 5'h03;
    stim[20] = 5'h0e;
    stim[21] = 5'h0a;
    stim[22] = 5'h0b;
    stim[23] = 5'h0f;
    stim[24] = 5'h06;
    stim[25] = 5'h0c;
    stim[26] = 5'h03;
    stim[27] = 5'h03;
    stim[28] = 5'h05;
    stim[29] = 5'h0e;
    stim[30] = 5'h01;
    stim[31] = 5'h0e;
    stim[32] = 5'h09;
    stim[33] = 5'h0f;
    stim[34] = 5'h03;
    stim[35] = 5'h0f;
    stim[36] = 5'h0e;
    stim[37] = 5'h02;
    stim[38] = 5'h0e;
    stim[39] = 5'h06;
    stim[40] = 5'h06;
    stim[41] = 5'h04;
    stim[42] = 5'h0f;
    stim[43] = 5'h0d;
    stim[44] = 5'h07;
    stim[45] = 5'h0b;
    stim[46] = 5'h0d;
    stim[47] = 5'h07;
    stim[48] = 5'h02;
    stim[49] = 5'h00;
    stim[50] = 5'h05;
    stim[51] = 5'h0a;
    stim[52] = 5'h0e;
    stim[53] = 5'h02;
    stim[54] = 5'h00;
    stim[55] = 5'h0b;
    stim[56] = 5'h06;
    stim[57] = 5'h04;
    stim[58] = 5'h04;
    stim[59] = 5'h07;
    stim[60] = 5'h01;
    stim[61] = 5'h08;
    stim[62] = 5'h06;
    stim[63] = 5'h07;
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
      expv[0] = 6'h00;
      expv[1] = 6'h00;
      expv[2] = 6'h00;
      expv[3] = 6'h00;
      expv[4] = 6'h00;
      expv[5] = 6'h00;
      expv[6] = 6'h00;
      expv[7] = 6'h00;
      expv[8] = 6'h3c;
      expv[9] = 6'h3c;
      expv[10] = 6'h3c;
      expv[11] = 6'h3c;
      expv[12] = 6'h3c;
      expv[13] = 6'h3c;
      expv[14] = 6'h3c;
      expv[15] = 6'h3c;
      expv[16] = 6'h3c;
      expv[17] = 6'h3c;
      expv[18] = 6'h3c;
      expv[19] = 6'h3c;
      expv[20] = 6'h3c;
      expv[21] = 6'h3c;
      expv[22] = 6'h3c;
      expv[23] = 6'h3c;
      expv[24] = 6'h3c;
      expv[25] = 6'h3c;
      expv[26] = 6'h3c;
      expv[27] = 6'h3c;
      expv[28] = 6'h3c;
      expv[29] = 6'h3e;
      expv[30] = 6'h3e;
      expv[31] = 6'h3e;
      expv[32] = 6'h3e;
      expv[33] = 6'h3e;
      expv[34] = 6'h3e;
      expv[35] = 6'h3e;
      expv[36] = 6'h3e;
      expv[37] = 6'h3e;
      expv[38] = 6'h3e;
      expv[39] = 6'h3e;
      expv[40] = 6'h3e;
      expv[41] = 6'h3e;
      expv[42] = 6'h3e;
      expv[43] = 6'h3e;
      expv[44] = 6'h3e;
      expv[45] = 6'h3e;
      expv[46] = 6'h3e;
      expv[47] = 6'h3e;
      expv[48] = 6'h3e;
      expv[49] = 6'h3e;
      expv[50] = 6'h3e;
      expv[51] = 6'h3f;
      expv[52] = 6'h3f;
      expv[53] = 6'h3f;
      expv[54] = 6'h3f;
      expv[55] = 6'h3f;
      expv[56] = 6'h3f;
      expv[57] = 6'h3f;
      expv[58] = 6'h3f;
      expv[59] = 6'h3f;
      expv[60] = 6'h3f;
      expv[61] = 6'h3f;
      expv[62] = 6'h3f;
      expv[63] = 6'h3f;
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
