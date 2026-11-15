// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 15;
  localparam OW = 4;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08102 dut (
    .clk(clk),
    .rst_n(in_vec[14:14]),
    .seg(in_vec[13:6]),
    .sel(in_vec[5:0]),
    .shcp(out_vec[3:3]),
    .stcp(out_vec[2:2]),
    .ds(out_vec[1:1]),
    .oe(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 15'h079b;
    stim[1] = 15'h2127;
    stim[2] = 15'h708f;
    stim[3] = 15'h652f;
    stim[4] = 15'h4131;
    stim[5] = 15'h76e9;
    stim[6] = 15'h4f43;
    stim[7] = 15'h5585;
    stim[8] = 15'h5e85;
    stim[9] = 15'h4db1;
    stim[10] = 15'h722c;
    stim[11] = 15'h753f;
    stim[12] = 15'h5b1a;
    stim[13] = 15'h6cb3;
    stim[14] = 15'h4f4e;
    stim[15] = 15'h5dfd;
    stim[16] = 15'h69b1;
    stim[17] = 15'h465a;
    stim[18] = 15'h5a8b;
    stim[19] = 15'h4674;
    stim[20] = 15'h7a9a;
    stim[21] = 15'h4841;
    stim[22] = 15'h6aa0;
    stim[23] = 15'h6747;
    stim[24] = 15'h7924;
    stim[25] = 15'h6c3a;
    stim[26] = 15'h7abf;
    stim[27] = 15'h77a3;
    stim[28] = 15'h6ef5;
    stim[29] = 15'h41ce;
    stim[30] = 15'h5bcb;
    stim[31] = 15'h6e26;
    stim[32] = 15'h7195;
    stim[33] = 15'h6455;
    stim[34] = 15'h57bf;
    stim[35] = 15'h68d5;
    stim[36] = 15'h7a0b;
    stim[37] = 15'h4965;
    stim[38] = 15'h5148;
    stim[39] = 15'h7ab9;
    stim[40] = 15'h54fb;
    stim[41] = 15'h59d4;
    stim[42] = 15'h5f1a;
    stim[43] = 15'h42d2;
    stim[44] = 15'h7fc0;
    stim[45] = 15'h66a5;
    stim[46] = 15'h6bc7;
    stim[47] = 15'h5cd7;
    stim[48] = 15'h63ac;
    stim[49] = 15'h5f44;
    stim[50] = 15'h7976;
    stim[51] = 15'h5aaf;
    stim[52] = 15'h5674;
    stim[53] = 15'h5ec9;
    stim[54] = 15'h6532;
    stim[55] = 15'h45d4;
    stim[56] = 15'h61c0;
    stim[57] = 15'h62ee;
    stim[58] = 15'h4212;
    stim[59] = 15'h4577;
    stim[60] = 15'h686c;
    stim[61] = 15'h40b7;
    stim[62] = 15'h5a52;
    stim[63] = 15'h63af;
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
      expv[0] = 4'hx;
      expv[1] = 4'h0;
      expv[2] = 4'h0;
      expv[3] = 4'h6;
      expv[4] = 4'h6;
      expv[5] = 4'ha;
      expv[6] = 4'ha;
      expv[7] = 4'h2;
      expv[8] = 4'h2;
      expv[9] = 4'ha;
      expv[10] = 4'ha;
      expv[11] = 4'h2;
      expv[12] = 4'h2;
      expv[13] = 4'ha;
      expv[14] = 4'ha;
      expv[15] = 4'h2;
      expv[16] = 4'h2;
      expv[17] = 4'ha;
      expv[18] = 4'ha;
      expv[19] = 4'h0;
      expv[20] = 4'h0;
      expv[21] = 4'h8;
      expv[22] = 4'h8;
      expv[23] = 4'h2;
      expv[24] = 4'h2;
      expv[25] = 4'ha;
      expv[26] = 4'ha;
      expv[27] = 4'h0;
      expv[28] = 4'h0;
      expv[29] = 4'h8;
      expv[30] = 4'h8;
      expv[31] = 4'h2;
      expv[32] = 4'h2;
      expv[33] = 4'ha;
      expv[34] = 4'ha;
      expv[35] = 4'h2;
      expv[36] = 4'h2;
      expv[37] = 4'ha;
      expv[38] = 4'ha;
      expv[39] = 4'h0;
      expv[40] = 4'h0;
      expv[41] = 4'h8;
      expv[42] = 4'h8;
      expv[43] = 4'h2;
      expv[44] = 4'h2;
      expv[45] = 4'ha;
      expv[46] = 4'ha;
      expv[47] = 4'h2;
      expv[48] = 4'h2;
      expv[49] = 4'ha;
      expv[50] = 4'ha;
      expv[51] = 4'h2;
      expv[52] = 4'h2;
      expv[53] = 4'ha;
      expv[54] = 4'ha;
      expv[55] = 4'h2;
      expv[56] = 4'h2;
      expv[57] = 4'ha;
      expv[58] = 4'ha;
      expv[59] = 4'h4;
      expv[60] = 4'h4;
      expv[61] = 4'h8;
      expv[62] = 4'h8;
      expv[63] = 4'h2;
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
