// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 11;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_05384 dut (
    .clk(clk),
    .reset(in_vec[8:8]),
    .x_in(in_vec[7:0]),
    .y_out(out_vec[10:1]),
    .clk2(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h1d2;
    stim[1] = 9'h176;
    stim[2] = 9'h000;
    stim[3] = 9'h05d;
    stim[4] = 9'h09d;
    stim[5] = 9'h005;
    stim[6] = 9'h0df;
    stim[7] = 9'h006;
    stim[8] = 9'h06a;
    stim[9] = 9'h088;
    stim[10] = 9'h039;
    stim[11] = 9'h043;
    stim[12] = 9'h03b;
    stim[13] = 9'h0f7;
    stim[14] = 9'h044;
    stim[15] = 9'h05c;
    stim[16] = 9'h0de;
    stim[17] = 9'h04f;
    stim[18] = 9'h014;
    stim[19] = 9'h033;
    stim[20] = 9'h0e7;
    stim[21] = 9'h028;
    stim[22] = 9'h002;
    stim[23] = 9'h039;
    stim[24] = 9'h0cf;
    stim[25] = 9'h00c;
    stim[26] = 9'h01f;
    stim[27] = 9'h0b9;
    stim[28] = 9'h018;
    stim[29] = 9'h0d1;
    stim[30] = 9'h0a0;
    stim[31] = 9'h0b4;
    stim[32] = 9'h04e;
    stim[33] = 9'h0ac;
    stim[34] = 9'h07e;
    stim[35] = 9'h0e6;
    stim[36] = 9'h0d4;
    stim[37] = 9'h0db;
    stim[38] = 9'h0c4;
    stim[39] = 9'h0e8;
    stim[40] = 9'h082;
    stim[41] = 9'h067;
    stim[42] = 9'h0ef;
    stim[43] = 9'h030;
    stim[44] = 9'h00c;
    stim[45] = 9'h015;
    stim[46] = 9'h0a0;
    stim[47] = 9'h0d1;
    stim[48] = 9'h00d;
    stim[49] = 9'h0b9;
    stim[50] = 9'h00c;
    stim[51] = 9'h09b;
    stim[52] = 9'h091;
    stim[53] = 9'h0d5;
    stim[54] = 9'h0d7;
    stim[55] = 9'h016;
    stim[56] = 9'h0aa;
    stim[57] = 9'h0d4;
    stim[58] = 9'h033;
    stim[59] = 9'h01b;
    stim[60] = 9'h01a;
    stim[61] = 9'h0bd;
    stim[62] = 9'h06e;
    stim[63] = 9'h018;
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
      expv[0] = 11'h000;
      expv[1] = 11'h000;
      expv[2] = 11'h000;
      expv[3] = 11'h000;
      expv[4] = 11'h000;
      expv[5] = 11'h000;
      expv[6] = 11'h000;
      expv[7] = 11'h000;
      expv[8] = 11'h000;
      expv[9] = 11'h000;
      expv[10] = 11'h000;
      expv[11] = 11'h000;
      expv[12] = 11'h000;
      expv[13] = 11'h000;
      expv[14] = 11'h000;
      expv[15] = 11'h000;
      expv[16] = 11'h000;
      expv[17] = 11'h000;
      expv[18] = 11'h000;
      expv[19] = 11'h000;
      expv[20] = 11'h000;
      expv[21] = 11'h000;
      expv[22] = 11'h000;
      expv[23] = 11'h000;
      expv[24] = 11'h000;
      expv[25] = 11'h000;
      expv[26] = 11'h000;
      expv[27] = 11'h000;
      expv[28] = 11'h000;
      expv[29] = 11'h000;
      expv[30] = 11'h000;
      expv[31] = 11'h000;
      expv[32] = 11'h000;
      expv[33] = 11'h000;
      expv[34] = 11'h001;
      expv[35] = 11'h000;
      expv[36] = 11'h000;
      expv[37] = 11'h000;
      expv[38] = 11'h000;
      expv[39] = 11'h000;
      expv[40] = 11'h000;
      expv[41] = 11'h000;
      expv[42] = 11'h000;
      expv[43] = 11'h000;
      expv[44] = 11'h000;
      expv[45] = 11'h000;
      expv[46] = 11'h000;
      expv[47] = 11'h000;
      expv[48] = 11'h000;
      expv[49] = 11'h000;
      expv[50] = 11'h000;
      expv[51] = 11'h000;
      expv[52] = 11'h000;
      expv[53] = 11'h000;
      expv[54] = 11'h000;
      expv[55] = 11'h000;
      expv[56] = 11'h000;
      expv[57] = 11'h000;
      expv[58] = 11'h000;
      expv[59] = 11'h000;
      expv[60] = 11'h000;
      expv[61] = 11'h000;
      expv[62] = 11'h000;
      expv[63] = 11'h000;
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
