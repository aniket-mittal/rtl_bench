// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 4;
  localparam OW = 42;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_118407 dut (
    .vs(clk),
    .dir_x(in_vec[3:2]),
    .dir_y(in_vec[1:0]),
    .box_r(out_vec[41:38]),
    .box_g(out_vec[37:34]),
    .box_b(out_vec[33:30]),
    .box_x(out_vec[29:20]),
    .box_y(out_vec[19:10]),
    .box_size(out_vec[9:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 4'he;
    stim[1] = 4'h5;
    stim[2] = 4'ha;
    stim[3] = 4'ha;
    stim[4] = 4'h5;
    stim[5] = 4'h8;
    stim[6] = 4'h3;
    stim[7] = 4'hf;
    stim[8] = 4'h0;
    stim[9] = 4'h7;
    stim[10] = 4'h7;
    stim[11] = 4'ha;
    stim[12] = 4'h7;
    stim[13] = 4'h3;
    stim[14] = 4'h0;
    stim[15] = 4'h1;
    stim[16] = 4'h3;
    stim[17] = 4'h9;
    stim[18] = 4'h0;
    stim[19] = 4'hb;
    stim[20] = 4'h1;
    stim[21] = 4'h0;
    stim[22] = 4'hb;
    stim[23] = 4'hc;
    stim[24] = 4'hb;
    stim[25] = 4'h6;
    stim[26] = 4'h3;
    stim[27] = 4'hc;
    stim[28] = 4'h7;
    stim[29] = 4'h8;
    stim[30] = 4'h4;
    stim[31] = 4'h7;
    stim[32] = 4'h0;
    stim[33] = 4'ha;
    stim[34] = 4'hb;
    stim[35] = 4'h8;
    stim[36] = 4'h5;
    stim[37] = 4'h0;
    stim[38] = 4'h3;
    stim[39] = 4'h6;
    stim[40] = 4'h7;
    stim[41] = 4'h9;
    stim[42] = 4'h0;
    stim[43] = 4'h9;
    stim[44] = 4'he;
    stim[45] = 4'h2;
    stim[46] = 4'hf;
    stim[47] = 4'hf;
    stim[48] = 4'hd;
    stim[49] = 4'he;
    stim[50] = 4'hb;
    stim[51] = 4'hc;
    stim[52] = 4'h9;
    stim[53] = 4'hd;
    stim[54] = 4'hb;
    stim[55] = 4'h4;
    stim[56] = 4'h3;
    stim[57] = 4'h6;
    stim[58] = 4'h3;
    stim[59] = 4'hd;
    stim[60] = 4'h2;
    stim[61] = 4'h1;
    stim[62] = 4'h8;
    stim[63] = 4'hc;
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
      expv[0] = 42'hxxxxxxxxx28;
      expv[1] = 42'hxxxxxxxxx28;
      expv[2] = 42'h3c012d37428;
      expv[3] = 42'h3c012d37428;
      expv[4] = 42'h3c012d37428;
      expv[5] = 42'h3c012e37828;
      expv[6] = 42'h3c012e37428;
      expv[7] = 42'h3c012d37428;
      expv[8] = 42'h3c012d37428;
      expv[9] = 42'h3c012c37028;
      expv[10] = 42'h3c012d37028;
      expv[11] = 42'h3c012e37028;
      expv[12] = 42'h3c012e37028;
      expv[13] = 42'h3c012f37028;
      expv[14] = 42'h3c012e37028;
      expv[15] = 42'h3c012d36c28;
      expv[16] = 42'h3c012c37028;
      expv[17] = 42'h3c012b37028;
      expv[18] = 42'h3c012b37428;
      expv[19] = 42'h3c012a37028;
      expv[20] = 42'h3c012a37028;
      expv[21] = 42'h3c012937428;
      expv[22] = 42'h3c012837028;
      expv[23] = 42'h3c012837028;
      expv[24] = 42'h3c012836c28;
      expv[25] = 42'h3c012836c28;
      expv[26] = 42'h3c012936c28;
      expv[27] = 42'h3c012836c28;
      expv[28] = 42'h3c012836828;
      expv[29] = 42'h3c012936828;
      expv[30] = 42'h3c012936428;
      expv[31] = 42'h3c012a36028;
      expv[32] = 42'h3c012b36028;
      expv[33] = 42'h3c012a35c28;
      expv[34] = 42'h3c012a35c28;
      expv[35] = 42'h3c012a35c28;
      expv[36] = 42'h3c012a35828;
      expv[37] = 42'h3c012b35c28;
      expv[38] = 42'h3c012a35828;
      expv[39] = 42'h3c012935828;
      expv[40] = 42'h3c012a35828;
      expv[41] = 42'h3c012b35828;
      expv[42] = 42'h3c012b35c28;
      expv[43] = 42'h3c012a35828;
      expv[44] = 42'h3c012a35c28;
      expv[45] = 42'h3c012a35c28;
      expv[46] = 42'h3c012935c28;
      expv[47] = 42'h3c012935c28;
      expv[48] = 42'h3c012935c28;
      expv[49] = 42'h3c012936028;
      expv[50] = 42'h3c012936028;
      expv[51] = 42'h3c012936028;
      expv[52] = 42'h3c012935c28;
      expv[53] = 42'h3c012936028;
      expv[54] = 42'h3c012936428;
      expv[55] = 42'h3c012936428;
      expv[56] = 42'h3c012a36028;
      expv[57] = 42'h3c012936028;
      expv[58] = 42'h3c012a36028;
      expv[59] = 42'h3c012936028;
      expv[60] = 42'h3c012936428;
      expv[61] = 42'h3c012836428;
      expv[62] = 42'h3c012736828;
      expv[63] = 42'h3c012736428;
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
