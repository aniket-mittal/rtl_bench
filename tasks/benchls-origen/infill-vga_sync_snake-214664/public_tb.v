// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 14;
  localparam OW = 34;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_214664 dut (
    .clk(clk),
    .rst(in_vec[13:13]),
    .snake(in_vec[12:11]),
    .apple_x(in_vec[10:5]),
    .apple_y(in_vec[4:0]),
    .x_pos(out_vec[33:24]),
    .y_pos(out_vec[23:14]),
    .hsync(out_vec[13:13]),
    .vsync(out_vec[12:12]),
    .color_out(out_vec[11:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 14'h2534;
    stim[1] = 14'h37c7;
    stim[2] = 14'h0f6d;
    stim[3] = 14'h1fe4;
    stim[4] = 14'h0add;
    stim[5] = 14'h1646;
    stim[6] = 14'h0029;
    stim[7] = 14'h18a8;
    stim[8] = 14'h154a;
    stim[9] = 14'h08ca;
    stim[10] = 14'h1176;
    stim[11] = 14'h0133;
    stim[12] = 14'h011c;
    stim[13] = 14'h006e;
    stim[14] = 14'h1a98;
    stim[15] = 14'h0c00;
    stim[16] = 14'h0763;
    stim[17] = 14'h0d26;
    stim[18] = 14'h09ad;
    stim[19] = 14'h0323;
    stim[20] = 14'h3186;
    stim[21] = 14'h0006;
    stim[22] = 14'h0d0d;
    stim[23] = 14'h1bc9;
    stim[24] = 14'h0539;
    stim[25] = 14'h0dad;
    stim[26] = 14'h1237;
    stim[27] = 14'h10ff;
    stim[28] = 14'h0aa1;
    stim[29] = 14'h029f;
    stim[30] = 14'h013c;
    stim[31] = 14'h0724;
    stim[32] = 14'h05cf;
    stim[33] = 14'h1124;
    stim[34] = 14'h12fe;
    stim[35] = 14'h034c;
    stim[36] = 14'h017c;
    stim[37] = 14'h1449;
    stim[38] = 14'h081d;
    stim[39] = 14'h0217;
    stim[40] = 14'h06fe;
    stim[41] = 14'h070e;
    stim[42] = 14'h0bc4;
    stim[43] = 14'h115d;
    stim[44] = 14'h0c1f;
    stim[45] = 14'h0857;
    stim[46] = 14'h056b;
    stim[47] = 14'h0a0e;
    stim[48] = 14'h0a44;
    stim[49] = 14'h12f5;
    stim[50] = 14'h0a64;
    stim[51] = 14'h0f63;
    stim[52] = 14'h0811;
    stim[53] = 14'h1036;
    stim[54] = 14'h076e;
    stim[55] = 14'h1662;
    stim[56] = 14'h0288;
    stim[57] = 14'h1afe;
    stim[58] = 14'h1d81;
    stim[59] = 14'h19cb;
    stim[60] = 14'h040e;
    stim[61] = 14'h0354;
    stim[62] = 14'h0040;
    stim[63] = 14'h3335;
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
      expv[0] = 34'h000003000;
      expv[1] = 34'h370003000;
      expv[2] = 34'h000003000;
      expv[3] = 34'h000003000;
      expv[4] = 34'h000003000;
      expv[5] = 34'h000003000;
      expv[6] = 34'h000003000;
      expv[7] = 34'h000003000;
      expv[8] = 34'h000003000;
      expv[9] = 34'h000003000;
      expv[10] = 34'h000003000;
      expv[11] = 34'h000003000;
      expv[12] = 34'h000003000;
      expv[13] = 34'h000003000;
      expv[14] = 34'h000003000;
      expv[15] = 34'h000003000;
      expv[16] = 34'h000003000;
      expv[17] = 34'h000003000;
      expv[18] = 34'h000003000;
      expv[19] = 34'h000003000;
      expv[20] = 34'h000003000;
      expv[21] = 34'h000003000;
      expv[22] = 34'h000003000;
      expv[23] = 34'h000003000;
      expv[24] = 34'h000003000;
      expv[25] = 34'h000003000;
      expv[26] = 34'h000003000;
      expv[27] = 34'h000003000;
      expv[28] = 34'h000003000;
      expv[29] = 34'h000003000;
      expv[30] = 34'h000003000;
      expv[31] = 34'h000003000;
      expv[32] = 34'h000003000;
      expv[33] = 34'h000003000;
      expv[34] = 34'h000003000;
      expv[35] = 34'h000003000;
      expv[36] = 34'h000003000;
      expv[37] = 34'h000003000;
      expv[38] = 34'h000003000;
      expv[39] = 34'h000003000;
      expv[40] = 34'h000003000;
      expv[41] = 34'h000003000;
      expv[42] = 34'h000003000;
      expv[43] = 34'h000003000;
      expv[44] = 34'h000003000;
      expv[45] = 34'h000003000;
      expv[46] = 34'h000003000;
      expv[47] = 34'h000003000;
      expv[48] = 34'h000003000;
      expv[49] = 34'h000003000;
      expv[50] = 34'h000003000;
      expv[51] = 34'h000003000;
      expv[52] = 34'h000003000;
      expv[53] = 34'h000003000;
      expv[54] = 34'h000003000;
      expv[55] = 34'h000003000;
      expv[56] = 34'h000003000;
      expv[57] = 34'h000003000;
      expv[58] = 34'h000003000;
      expv[59] = 34'h000003000;
      expv[60] = 34'h000003000;
      expv[61] = 34'h000003000;
      expv[62] = 34'h000003000;
      expv[63] = 34'h000003000;
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
