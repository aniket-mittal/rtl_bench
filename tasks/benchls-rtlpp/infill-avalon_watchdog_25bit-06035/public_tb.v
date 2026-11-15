// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 22;
  localparam OW = 18;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_06035 dut (
    .clk(clk),
    .address(in_vec[21:19]),
    .chipselect(in_vec[18:18]),
    .reset_n(in_vec[17:17]),
    .write_n(in_vec[16:16]),
    .writedata(in_vec[15:0]),
    .irq(out_vec[17:17]),
    .readdata(out_vec[16:1]),
    .resetrequest(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 22'h355e5b;
    stim[1] = 22'h145f2d;
    stim[2] = 22'h0a173e;
    stim[3] = 22'h1b0c74;
    stim[4] = 22'h23e630;
    stim[5] = 22'h1a5268;
    stim[6] = 22'h139517;
    stim[7] = 22'h23e86e;
    stim[8] = 22'h0ef21e;
    stim[9] = 22'h132e0a;
    stim[10] = 22'h23bed7;
    stim[11] = 22'h3bb545;
    stim[12] = 22'h273ad0;
    stim[13] = 22'h0e4f66;
    stim[14] = 22'h06c9c0;
    stim[15] = 22'h3b3442;
    stim[16] = 22'h0eca02;
    stim[17] = 22'h22ea8a;
    stim[18] = 22'h23c2d2;
    stim[19] = 22'h3ae128;
    stim[20] = 22'h0664eb;
    stim[21] = 22'h375901;
    stim[22] = 22'h3391e6;
    stim[23] = 22'h0a6943;
    stim[24] = 22'h1ec99e;
    stim[25] = 22'h2bfca8;
    stim[26] = 22'h3e2014;
    stim[27] = 22'h3fa11d;
    stim[28] = 22'h32efd6;
    stim[29] = 22'h12c2f6;
    stim[30] = 22'h2a385d;
    stim[31] = 22'h0ea9b3;
    stim[32] = 22'h0ef3be;
    stim[33] = 22'h27d5bd;
    stim[34] = 22'h3e7da2;
    stim[35] = 22'h3e3b3e;
    stim[36] = 22'h3fd084;
    stim[37] = 22'h17a1f3;
    stim[38] = 22'h12d108;
    stim[39] = 22'h275005;
    stim[40] = 22'h1631bf;
    stim[41] = 22'h16b179;
    stim[42] = 22'h12d559;
    stim[43] = 22'h2fb10f;
    stim[44] = 22'h2ec6d0;
    stim[45] = 22'h263612;
    stim[46] = 22'h1ff4a4;
    stim[47] = 22'h0a4622;
    stim[48] = 22'h042995;
    stim[49] = 22'h23ea80;
    stim[50] = 22'h1f0c64;
    stim[51] = 22'h3a1612;
    stim[52] = 22'h2fc031;
    stim[53] = 22'h237a02;
    stim[54] = 22'h27e9be;
    stim[55] = 22'h22cfa5;
    stim[56] = 22'h3b6a61;
    stim[57] = 22'h076486;
    stim[58] = 22'h3fefb0;
    stim[59] = 22'h2a2809;
    stim[60] = 22'h0e3559;
    stim[61] = 22'h2abbf3;
    stim[62] = 22'h36c294;
    stim[63] = 22'h02d197;
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
      expv[0] = 18'h00000;
      expv[1] = 18'h00000;
      expv[2] = 18'h00000;
      expv[3] = 18'h00000;
      expv[4] = 18'h00000;
      expv[5] = 18'h00000;
      expv[6] = 18'h00000;
      expv[7] = 18'h00000;
      expv[8] = 18'h00000;
      expv[9] = 18'h00000;
      expv[10] = 18'h00000;
      expv[11] = 18'h00000;
      expv[12] = 18'h00000;
      expv[13] = 18'h00000;
      expv[14] = 18'h00000;
      expv[15] = 18'h00004;
      expv[16] = 18'h00000;
      expv[17] = 18'h00000;
      expv[18] = 18'h00000;
      expv[19] = 18'h00000;
      expv[20] = 18'h00000;
      expv[21] = 18'h00004;
      expv[22] = 18'h00000;
      expv[23] = 18'h00000;
      expv[24] = 18'h00000;
      expv[25] = 18'h00000;
      expv[26] = 18'h00000;
      expv[27] = 18'h00000;
      expv[28] = 18'h00000;
      expv[29] = 18'h00000;
      expv[30] = 18'h00000;
      expv[31] = 18'h00000;
      expv[32] = 18'h00000;
      expv[33] = 18'h00002;
      expv[34] = 18'h00000;
      expv[35] = 18'h00000;
      expv[36] = 18'h00000;
      expv[37] = 18'h00000;
      expv[38] = 18'h00000;
      expv[39] = 18'h00000;
      expv[40] = 18'h00000;
      expv[41] = 18'h00000;
      expv[42] = 18'h00000;
      expv[43] = 18'h00000;
      expv[44] = 18'h00000;
      expv[45] = 18'h00000;
      expv[46] = 18'h00000;
      expv[47] = 18'h00000;
      expv[48] = 18'h00000;
      expv[49] = 18'h00000;
      expv[50] = 18'h00000;
      expv[51] = 18'h00000;
      expv[52] = 18'h00000;
      expv[53] = 18'h00000;
      expv[54] = 18'h00000;
      expv[55] = 18'h00000;
      expv[56] = 18'h00000;
      expv[57] = 18'h00000;
      expv[58] = 18'h00000;
      expv[59] = 18'h00000;
      expv[60] = 18'h00000;
      expv[61] = 18'h00000;
      expv[62] = 18'h00000;
      expv[63] = 18'h00000;
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
