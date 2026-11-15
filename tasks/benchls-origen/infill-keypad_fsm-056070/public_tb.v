// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 5;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_056070 dut (
    .pressed(in_vec[4:4]),
    .key_value(in_vec[3:0]),
    .start(out_vec[7:7]),
    .clear(out_vec[6:6]),
    .confirm(out_vec[5:5]),
    .press_num(out_vec[4:4]),
    .value(out_vec[3:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 5'h0f;
    stim[1] = 5'h17;
    stim[2] = 5'h08;
    stim[3] = 5'h0c;
    stim[4] = 5'h1f;
    stim[5] = 5'h03;
    stim[6] = 5'h16;
    stim[7] = 5'h09;
    stim[8] = 5'h04;
    stim[9] = 5'h14;
    stim[10] = 5'h12;
    stim[11] = 5'h0c;
    stim[12] = 5'h03;
    stim[13] = 5'h1d;
    stim[14] = 5'h18;
    stim[15] = 5'h07;
    stim[16] = 5'h15;
    stim[17] = 5'h16;
    stim[18] = 5'h12;
    stim[19] = 5'h12;
    stim[20] = 5'h02;
    stim[21] = 5'h0c;
    stim[22] = 5'h19;
    stim[23] = 5'h06;
    stim[24] = 5'h1f;
    stim[25] = 5'h16;
    stim[26] = 5'h06;
    stim[27] = 5'h11;
    stim[28] = 5'h16;
    stim[29] = 5'h04;
    stim[30] = 5'h08;
    stim[31] = 5'h13;
    stim[32] = 5'h1a;
    stim[33] = 5'h0f;
    stim[34] = 5'h15;
    stim[35] = 5'h14;
    stim[36] = 5'h08;
    stim[37] = 5'h18;
    stim[38] = 5'h06;
    stim[39] = 5'h1a;
    stim[40] = 5'h05;
    stim[41] = 5'h1d;
    stim[42] = 5'h19;
    stim[43] = 5'h08;
    stim[44] = 5'h06;
    stim[45] = 5'h03;
    stim[46] = 5'h17;
    stim[47] = 5'h1e;
    stim[48] = 5'h1c;
    stim[49] = 5'h0f;
    stim[50] = 5'h06;
    stim[51] = 5'h04;
    stim[52] = 5'h10;
    stim[53] = 5'h05;
    stim[54] = 5'h1c;
    stim[55] = 5'h18;
    stim[56] = 5'h16;
    stim[57] = 5'h11;
    stim[58] = 5'h11;
    stim[59] = 5'h04;
    stim[60] = 5'h1e;
    stim[61] = 5'h12;
    stim[62] = 5'h17;
    stim[63] = 5'h0b;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'h0f;
      expv[1] = 8'h17;
      expv[2] = 8'h08;
      expv[3] = 8'h0c;
      expv[4] = 8'h0f;
      expv[5] = 8'h03;
      expv[6] = 8'h16;
      expv[7] = 8'h09;
      expv[8] = 8'h04;
      expv[9] = 8'h14;
      expv[10] = 8'h12;
      expv[11] = 8'h0c;
      expv[12] = 8'h03;
      expv[13] = 8'h0d;
      expv[14] = 8'h18;
      expv[15] = 8'h07;
      expv[16] = 8'h15;
      expv[17] = 8'h16;
      expv[18] = 8'h12;
      expv[19] = 8'h12;
      expv[20] = 8'h02;
      expv[21] = 8'h0c;
      expv[22] = 8'h19;
      expv[23] = 8'h06;
      expv[24] = 8'h0f;
      expv[25] = 8'h16;
      expv[26] = 8'h06;
      expv[27] = 8'h11;
      expv[28] = 8'h16;
      expv[29] = 8'h04;
      expv[30] = 8'h08;
      expv[31] = 8'h13;
      expv[32] = 8'h8a;
      expv[33] = 8'h0f;
      expv[34] = 8'h15;
      expv[35] = 8'h14;
      expv[36] = 8'h08;
      expv[37] = 8'h18;
      expv[38] = 8'h06;
      expv[39] = 8'h8a;
      expv[40] = 8'h05;
      expv[41] = 8'h0d;
      expv[42] = 8'h19;
      expv[43] = 8'h08;
      expv[44] = 8'h06;
      expv[45] = 8'h03;
      expv[46] = 8'h17;
      expv[47] = 8'h0e;
      expv[48] = 8'h2c;
      expv[49] = 8'h0f;
      expv[50] = 8'h06;
      expv[51] = 8'h04;
      expv[52] = 8'h10;
      expv[53] = 8'h05;
      expv[54] = 8'h2c;
      expv[55] = 8'h18;
      expv[56] = 8'h16;
      expv[57] = 8'h11;
      expv[58] = 8'h11;
      expv[59] = 8'h04;
      expv[60] = 8'h0e;
      expv[61] = 8'h12;
      expv[62] = 8'h17;
      expv[63] = 8'h0b;
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
