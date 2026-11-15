// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 21;
  localparam OW = 40;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_10488 dut (
    .clk(clk),
    .target_angle(in_vec[20:1]),
    .rst(in_vec[0:0]),
    .x_res(out_vec[39:20]),
    .y_res(out_vec[19:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 21'h15fa8f;
    stim[1] = 21'h16f807;
    stim[2] = 21'h05443c;
    stim[3] = 21'h1afea6;
    stim[4] = 21'h1bd094;
    stim[5] = 21'h03d122;
    stim[6] = 21'h019aee;
    stim[7] = 21'h03eacc;
    stim[8] = 21'h0ef5f8;
    stim[9] = 21'h134c92;
    stim[10] = 21'h18e23a;
    stim[11] = 21'h081378;
    stim[12] = 21'h0fae54;
    stim[13] = 21'h144bec;
    stim[14] = 21'h183974;
    stim[15] = 21'h1acde0;
    stim[16] = 21'h093340;
    stim[17] = 21'h023088;
    stim[18] = 21'h0a4cc8;
    stim[19] = 21'h180c66;
    stim[20] = 21'h1cb524;
    stim[21] = 21'h1ec6ac;
    stim[22] = 21'h0ddf0e;
    stim[23] = 21'h1bb832;
    stim[24] = 21'h0af714;
    stim[25] = 21'h1521aa;
    stim[26] = 21'h13ee44;
    stim[27] = 21'h1be1d8;
    stim[28] = 21'h1656e2;
    stim[29] = 21'h1c95c0;
    stim[30] = 21'h16123e;
    stim[31] = 21'h0e4cfd;
    stim[32] = 21'h1fc5f6;
    stim[33] = 21'h033230;
    stim[34] = 21'h10a044;
    stim[35] = 21'h0022e2;
    stim[36] = 21'h189a82;
    stim[37] = 21'h17c862;
    stim[38] = 21'h0d772e;
    stim[39] = 21'h063858;
    stim[40] = 21'h04c986;
    stim[41] = 21'h1b0f60;
    stim[42] = 21'h086e20;
    stim[43] = 21'h019190;
    stim[44] = 21'h0436d8;
    stim[45] = 21'h17cdd4;
    stim[46] = 21'h198202;
    stim[47] = 21'h1d5bfe;
    stim[48] = 21'h17905c;
    stim[49] = 21'h18ef6c;
    stim[50] = 21'h0e944e;
    stim[51] = 21'h0feaf8;
    stim[52] = 21'h0728ee;
    stim[53] = 21'h0c9034;
    stim[54] = 21'h10e6dc;
    stim[55] = 21'h1d6310;
    stim[56] = 21'h16cf66;
    stim[57] = 21'h18ec48;
    stim[58] = 21'h04469c;
    stim[59] = 21'h19c924;
    stim[60] = 21'h1c1c30;
    stim[61] = 21'h1f5bd2;
    stim[62] = 21'h0da25e;
    stim[63] = 21'h175842;
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
      expv[0] = 40'hxxxxxxxxxx;
      expv[1] = 40'hxxxxxxxxxx;
      expv[2] = 40'hfd509f03ab;
      expv[3] = 40'h0000000000;
      expv[4] = 40'h0000000000;
      expv[5] = 40'h0000000000;
      expv[6] = 40'h0000000000;
      expv[7] = 40'h0000000000;
      expv[8] = 40'h0000000000;
      expv[9] = 40'h0000000000;
      expv[10] = 40'h0000000000;
      expv[11] = 40'h0000000000;
      expv[12] = 40'h0000000000;
      expv[13] = 40'h0000000000;
      expv[14] = 40'h0000000000;
      expv[15] = 40'h0000000000;
      expv[16] = 40'h0000000000;
      expv[17] = 40'h0000000000;
      expv[18] = 40'h0000000000;
      expv[19] = 40'h0000000000;
      expv[20] = 40'h0000000000;
      expv[21] = 40'h0000000000;
      expv[22] = 40'h0000000000;
      expv[23] = 40'h0000000000;
      expv[24] = 40'h0000000000;
      expv[25] = 40'h0000000000;
      expv[26] = 40'h0000000000;
      expv[27] = 40'h0000000000;
      expv[28] = 40'h0000000000;
      expv[29] = 40'h0000000000;
      expv[30] = 40'h0000000000;
      expv[31] = 40'h0000000000;
      expv[32] = 40'hfd509f03ab;
      expv[33] = 40'h0000000000;
      expv[34] = 40'h0000000000;
      expv[35] = 40'h0000000000;
      expv[36] = 40'h0000000000;
      expv[37] = 40'h0000000000;
      expv[38] = 40'h0000000000;
      expv[39] = 40'h0000000000;
      expv[40] = 40'h0000000000;
      expv[41] = 40'h0000000000;
      expv[42] = 40'h0000000000;
      expv[43] = 40'h0000000000;
      expv[44] = 40'h0000000000;
      expv[45] = 40'h0000000000;
      expv[46] = 40'h0000000000;
      expv[47] = 40'h0000000000;
      expv[48] = 40'h0000000000;
      expv[49] = 40'h0000000000;
      expv[50] = 40'h0000000000;
      expv[51] = 40'h0000000000;
      expv[52] = 40'h0000000000;
      expv[53] = 40'h0000000000;
      expv[54] = 40'h0000000000;
      expv[55] = 40'h0000000000;
      expv[56] = 40'h0000000000;
      expv[57] = 40'h0000000000;
      expv[58] = 40'h0000000000;
      expv[59] = 40'h0000000000;
      expv[60] = 40'h0000000000;
      expv[61] = 40'h0000000000;
      expv[62] = 40'h0000000000;
      expv[63] = 40'h0000000000;
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
