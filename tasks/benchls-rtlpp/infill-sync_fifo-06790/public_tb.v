// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 11;
  localparam OW = 10;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06790 dut (
    .clk(clk),
    .data_in(in_vec[10:3]),
    .push(in_vec[2:2]),
    .pop(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .data_out(out_vec[9:2]),
    .empty(out_vec[1:1]),
    .full(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 11'h119;
    stim[1] = 11'h3d5;
    stim[2] = 11'h56e;
    stim[3] = 11'h252;
    stim[4] = 11'h622;
    stim[5] = 11'h3e2;
    stim[6] = 11'h661;
    stim[7] = 11'h3d8;
    stim[8] = 11'h59c;
    stim[9] = 11'h52e;
    stim[10] = 11'h6a6;
    stim[11] = 11'h64a;
    stim[12] = 11'h19a;
    stim[13] = 11'h6d2;
    stim[14] = 11'h6a4;
    stim[15] = 11'h6a0;
    stim[16] = 11'h404;
    stim[17] = 11'h05a;
    stim[18] = 11'h068;
    stim[19] = 11'h35e;
    stim[20] = 11'h092;
    stim[21] = 11'h0cc;
    stim[22] = 11'h0f4;
    stim[23] = 11'h500;
    stim[24] = 11'h2c4;
    stim[25] = 11'h0f2;
    stim[26] = 11'h520;
    stim[27] = 11'h4fe;
    stim[28] = 11'h42a;
    stim[29] = 11'h45a;
    stim[30] = 11'h1a8;
    stim[31] = 11'h686;
    stim[32] = 11'h284;
    stim[33] = 11'h248;
    stim[34] = 11'h134;
    stim[35] = 11'h0d4;
    stim[36] = 11'h30e;
    stim[37] = 11'h618;
    stim[38] = 11'h71c;
    stim[39] = 11'h542;
    stim[40] = 11'h304;
    stim[41] = 11'h700;
    stim[42] = 11'h5e0;
    stim[43] = 11'h3ee;
    stim[44] = 11'h728;
    stim[45] = 11'h31c;
    stim[46] = 11'h148;
    stim[47] = 11'h7da;
    stim[48] = 11'h4ca;
    stim[49] = 11'h218;
    stim[50] = 11'h29a;
    stim[51] = 11'h76a;
    stim[52] = 11'h3f4;
    stim[53] = 11'h3b4;
    stim[54] = 11'h35e;
    stim[55] = 11'h46c;
    stim[56] = 11'h594;
    stim[57] = 11'h62e;
    stim[58] = 11'h292;
    stim[59] = 11'h3ac;
    stim[60] = 11'h75e;
    stim[61] = 11'h4ae;
    stim[62] = 11'h33c;
    stim[63] = 11'h708;
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
      expv[0] = 10'h002;
      expv[1] = 10'h002;
      expv[2] = 10'h000;
      expv[3] = 10'h000;
      expv[4] = 10'h1ea;
      expv[5] = 10'h1ea;
      expv[6] = 10'h002;
      expv[7] = 10'h002;
      expv[8] = 10'h002;
      expv[9] = 10'h000;
      expv[10] = 10'h000;
      expv[11] = 10'h000;
      expv[12] = 10'h2ce;
      expv[13] = 10'h2ce;
      expv[14] = 10'h2ce;
      expv[15] = 10'h2cc;
      expv[16] = 10'h2cc;
      expv[17] = 10'h2cc;
      expv[18] = 10'h350;
      expv[19] = 10'h350;
      expv[20] = 10'h350;
      expv[21] = 10'h202;
      expv[22] = 10'h200;
      expv[23] = 10'h200;
      expv[24] = 10'h200;
      expv[25] = 10'h200;
      expv[26] = 10'h064;
      expv[27] = 10'h064;
      expv[28] = 10'h064;
      expv[29] = 10'h078;
      expv[30] = 10'h162;
      expv[31] = 10'h162;
      expv[32] = 10'h162;
      expv[33] = 10'h160;
      expv[34] = 10'h160;
      expv[35] = 10'h160;
      expv[36] = 10'h160;
      expv[37] = 10'h160;
      expv[38] = 10'h160;
      expv[39] = 10'h160;
      expv[40] = 10'h140;
      expv[41] = 10'h140;
      expv[42] = 10'h140;
      expv[43] = 10'h140;
      expv[44] = 10'h140;
      expv[45] = 10'h140;
      expv[46] = 10'h140;
      expv[47] = 10'h140;
      expv[48] = 10'h098;
      expv[49] = 10'h068;
      expv[50] = 10'h068;
      expv[51] = 10'h38c;
      expv[52] = 10'h180;
      expv[53] = 10'h180;
      expv[54] = 10'h180;
      expv[55] = 10'h180;
      expv[56] = 10'h180;
      expv[57] = 10'h180;
      expv[58] = 10'h180;
      expv[59] = 10'h18c;
      expv[60] = 10'h18c;
      expv[61] = 10'h18c;
      expv[62] = 10'h18c;
      expv[63] = 10'h18c;
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
