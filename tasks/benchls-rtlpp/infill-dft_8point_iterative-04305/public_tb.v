// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 22;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_04305 dut (
    .clk(clk),
    .reset(in_vec[8:8]),
    .x_in(in_vec[7:0]),
    .y_real(out_vec[21:11]),
    .y_imag(out_vec[10:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h18d;
    stim[1] = 9'h1a3;
    stim[2] = 9'h0f9;
    stim[3] = 9'h089;
    stim[4] = 9'h024;
    stim[5] = 9'h0fe;
    stim[6] = 9'h045;
    stim[7] = 9'h03a;
    stim[8] = 9'h0cd;
    stim[9] = 9'h006;
    stim[10] = 9'h0ea;
    stim[11] = 9'h019;
    stim[12] = 9'h0f6;
    stim[13] = 9'h035;
    stim[14] = 9'h0e9;
    stim[15] = 9'h0f7;
    stim[16] = 9'h08c;
    stim[17] = 9'h039;
    stim[18] = 9'h05e;
    stim[19] = 9'h020;
    stim[20] = 9'h069;
    stim[21] = 9'h065;
    stim[22] = 9'h06a;
    stim[23] = 9'h0a9;
    stim[24] = 9'h0cf;
    stim[25] = 9'h0dc;
    stim[26] = 9'h0b0;
    stim[27] = 9'h0ee;
    stim[28] = 9'h0d0;
    stim[29] = 9'h0a6;
    stim[30] = 9'h097;
    stim[31] = 9'h0b0;
    stim[32] = 9'h0cc;
    stim[33] = 9'h072;
    stim[34] = 9'h080;
    stim[35] = 9'h003;
    stim[36] = 9'h08a;
    stim[37] = 9'h036;
    stim[38] = 9'h0b6;
    stim[39] = 9'h0ce;
    stim[40] = 9'h035;
    stim[41] = 9'h067;
    stim[42] = 9'h02c;
    stim[43] = 9'h0d3;
    stim[44] = 9'h0e2;
    stim[45] = 9'h0b0;
    stim[46] = 9'h02d;
    stim[47] = 9'h08a;
    stim[48] = 9'h01e;
    stim[49] = 9'h002;
    stim[50] = 9'h07b;
    stim[51] = 9'h06d;
    stim[52] = 9'h028;
    stim[53] = 9'h048;
    stim[54] = 9'h0c7;
    stim[55] = 9'h0d6;
    stim[56] = 9'h07e;
    stim[57] = 9'h011;
    stim[58] = 9'h042;
    stim[59] = 9'h09c;
    stim[60] = 9'h033;
    stim[61] = 9'h0c1;
    stim[62] = 9'h0d7;
    stim[63] = 9'h0b0;
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
      expv[0] = 22'hxxxxxx;
      expv[1] = 22'hxxxxxx;
      expv[2] = 22'hxxxxxx;
      expv[3] = 22'h000000;
      expv[4] = 22'h000000;
      expv[5] = 22'h000000;
      expv[6] = 22'h000000;
      expv[7] = 22'h000000;
      expv[8] = 22'h000000;
      expv[9] = 22'h000000;
      expv[10] = 22'h000000;
      expv[11] = 22'h000000;
      expv[12] = 22'h3c7764;
      expv[13] = 22'h021032;
      expv[14] = 22'h3eb88c;
      expv[15] = 22'h3db827;
      expv[16] = 22'h002836;
      expv[17] = 22'h00af82;
      expv[18] = 22'h3ef811;
      expv[19] = 22'h3f8000;
      expv[20] = 22'h000000;
      expv[21] = 22'h000000;
      expv[22] = 22'h000000;
      expv[23] = 22'h000000;
      expv[24] = 22'h000000;
      expv[25] = 22'h000000;
      expv[26] = 22'h000000;
      expv[27] = 22'h000000;
      expv[28] = 22'h000000;
      expv[29] = 22'h00c171;
      expv[30] = 22'h3b60d0;
      expv[31] = 22'h03e86f;
      expv[32] = 22'h026ff3;
      expv[33] = 22'h0087ef;
      expv[34] = 22'h03f854;
      expv[35] = 22'h03204b;
      expv[36] = 22'h056000;
      expv[37] = 22'h000000;
      expv[38] = 22'h000000;
      expv[39] = 22'h000000;
      expv[40] = 22'h000000;
      expv[41] = 22'h000000;
      expv[42] = 22'h000000;
      expv[43] = 22'h000000;
      expv[44] = 22'h000000;
      expv[45] = 22'h000000;
      expv[46] = 22'h3aa763;
      expv[47] = 22'h3c6f73;
      expv[48] = 22'h3d883a;
      expv[49] = 22'h3978ff;
      expv[50] = 22'h3cd076;
      expv[51] = 22'h39a893;
      expv[52] = 22'h3f877b;
      expv[53] = 22'h006000;
      expv[54] = 22'h000000;
      expv[55] = 22'h000000;
      expv[56] = 22'h000000;
      expv[57] = 22'h000000;
      expv[58] = 22'h000000;
      expv[59] = 22'h000000;
      expv[60] = 22'h000000;
      expv[61] = 22'h000000;
      expv[62] = 22'h000000;
      expv[63] = 22'h025835;
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
