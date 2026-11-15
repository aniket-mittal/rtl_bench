// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_193412 dut (
    .clk(clk),
    .enable(in_vec[8:8]),
    .addr_in(in_vec[7:0]),
    .csunmap(out_vec[8:8]),
    .csram1(out_vec[7:7]),
    .csram2(out_vec[6:6]),
    .csrom(out_vec[5:5]),
    .csio(out_vec[4:4]),
    .csgfx(out_vec[3:3]),
    .csctrl(out_vec[2:2]),
    .cspgtbl(out_vec[1:1]),
    .pas(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h05e;
    stim[1] = 9'h130;
    stim[2] = 9'h166;
    stim[3] = 9'h1ef;
    stim[4] = 9'h10f;
    stim[5] = 9'h0c2;
    stim[6] = 9'h0ea;
    stim[7] = 9'h167;
    stim[8] = 9'h176;
    stim[9] = 9'h13d;
    stim[10] = 9'h018;
    stim[11] = 9'h1d7;
    stim[12] = 9'h1e7;
    stim[13] = 9'h1ac;
    stim[14] = 9'h1c1;
    stim[15] = 9'h1d1;
    stim[16] = 9'h019;
    stim[17] = 9'h18e;
    stim[18] = 9'h199;
    stim[19] = 9'h184;
    stim[20] = 9'h0c1;
    stim[21] = 9'h04d;
    stim[22] = 9'h19d;
    stim[23] = 9'h19a;
    stim[24] = 9'h0c3;
    stim[25] = 9'h18b;
    stim[26] = 9'h102;
    stim[27] = 9'h0bb;
    stim[28] = 9'h101;
    stim[29] = 9'h10c;
    stim[30] = 9'h129;
    stim[31] = 9'h028;
    stim[32] = 9'h0c4;
    stim[33] = 9'h1a9;
    stim[34] = 9'h02f;
    stim[35] = 9'h087;
    stim[36] = 9'h12e;
    stim[37] = 9'h175;
    stim[38] = 9'h0dc;
    stim[39] = 9'h000;
    stim[40] = 9'h0f9;
    stim[41] = 9'h177;
    stim[42] = 9'h1b6;
    stim[43] = 9'h0e7;
    stim[44] = 9'h0ff;
    stim[45] = 9'h191;
    stim[46] = 9'h08b;
    stim[47] = 9'h1e3;
    stim[48] = 9'h03d;
    stim[49] = 9'h12b;
    stim[50] = 9'h11f;
    stim[51] = 9'h174;
    stim[52] = 9'h075;
    stim[53] = 9'h01c;
    stim[54] = 9'h0f5;
    stim[55] = 9'h148;
    stim[56] = 9'h03a;
    stim[57] = 9'h148;
    stim[58] = 9'h137;
    stim[59] = 9'h15d;
    stim[60] = 9'h0d4;
    stim[61] = 9'h018;
    stim[62] = 9'h086;
    stim[63] = 9'h116;
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
      expv[0] = 9'h00x;
      expv[1] = 9'h000;
      expv[2] = 9'h001;
      expv[3] = 9'h001;
      expv[4] = 9'h001;
      expv[5] = 9'h001;
      expv[6] = 9'h000;
      expv[7] = 9'h000;
      expv[8] = 9'h001;
      expv[9] = 9'h001;
      expv[10] = 9'h001;
      expv[11] = 9'h000;
      expv[12] = 9'h001;
      expv[13] = 9'h001;
      expv[14] = 9'h001;
      expv[15] = 9'h001;
      expv[16] = 9'h001;
      expv[17] = 9'h000;
      expv[18] = 9'h001;
      expv[19] = 9'h001;
      expv[20] = 9'h001;
      expv[21] = 9'h000;
      expv[22] = 9'h000;
      expv[23] = 9'h001;
      expv[24] = 9'h001;
      expv[25] = 9'h000;
      expv[26] = 9'h003;
      expv[27] = 9'h001;
      expv[28] = 9'h004;
      expv[29] = 9'h001;
      expv[30] = 9'h001;
      expv[31] = 9'h001;
      expv[32] = 9'h000;
      expv[33] = 9'h000;
      expv[34] = 9'h001;
      expv[35] = 9'h000;
      expv[36] = 9'h000;
      expv[37] = 9'h001;
      expv[38] = 9'h001;
      expv[39] = 9'h100;
      expv[40] = 9'h000;
      expv[41] = 9'h000;
      expv[42] = 9'h001;
      expv[43] = 9'h001;
      expv[44] = 9'h000;
      expv[45] = 9'h000;
      expv[46] = 9'h001;
      expv[47] = 9'h000;
      expv[48] = 9'h001;
      expv[49] = 9'h000;
      expv[50] = 9'h001;
      expv[51] = 9'h001;
      expv[52] = 9'h001;
      expv[53] = 9'h000;
      expv[54] = 9'h000;
      expv[55] = 9'h000;
      expv[56] = 9'h001;
      expv[57] = 9'h000;
      expv[58] = 9'h001;
      expv[59] = 9'h001;
      expv[60] = 9'h001;
      expv[61] = 9'h000;
      expv[62] = 9'h000;
      expv[63] = 9'h000;
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
