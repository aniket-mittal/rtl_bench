// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 34;
  localparam OW = 16;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_07826 dut (
    .clk(clk),
    .we(in_vec[33:33]),
    .waddr(in_vec[32:25]),
    .d(in_vec[24:9]),
    .re(in_vec[8:8]),
    .raddr(in_vec[7:0]),
    .q(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 34'h3a006fdeb;
    stim[1] = 34'h33a905ddd;
    stim[2] = 34'h00c1fb1d2;
    stim[3] = 34'h11e37cf9d;
    stim[4] = 34'h002ffa775;
    stim[5] = 34'h3e9dad21b;
    stim[6] = 34'h122b4d91e;
    stim[7] = 34'h2a9a777d6;
    stim[8] = 34'h31fbb7fca;
    stim[9] = 34'h3f7239225;
    stim[10] = 34'h2db7e9172;
    stim[11] = 34'h24fea6004;
    stim[12] = 34'h03c8b0ed7;
    stim[13] = 34'h1fda3a800;
    stim[14] = 34'h3f6c0d0fb;
    stim[15] = 34'h1804c1d17;
    stim[16] = 34'h12fa58e37;
    stim[17] = 34'h2acd1688e;
    stim[18] = 34'h2ffaf7939;
    stim[19] = 34'h087e00bfd;
    stim[20] = 34'h066857694;
    stim[21] = 34'h2448a45bf;
    stim[22] = 34'h0cfc603f5;
    stim[23] = 34'h3a45a654f;
    stim[24] = 34'h0d196866b;
    stim[25] = 34'h3e9b29a9d;
    stim[26] = 34'h0d16c4680;
    stim[27] = 34'h1a966725f;
    stim[28] = 34'h05b4acb79;
    stim[29] = 34'h0573a8a0a;
    stim[30] = 34'h3d5f3617c;
    stim[31] = 34'h3edd1baf6;
    stim[32] = 34'h358e01e50;
    stim[33] = 34'h295aafa31;
    stim[34] = 34'h0e25435da;
    stim[35] = 34'h379765398;
    stim[36] = 34'h3c4f05bec;
    stim[37] = 34'h3d5b33b5e;
    stim[38] = 34'h034f49b8b;
    stim[39] = 34'h3bbaaa1c8;
    stim[40] = 34'h14fd0949d;
    stim[41] = 34'h19a1647c7;
    stim[42] = 34'h254360e13;
    stim[43] = 34'h3ef32f5c7;
    stim[44] = 34'h0564d2c41;
    stim[45] = 34'h2fc704c05;
    stim[46] = 34'h3b29b5b26;
    stim[47] = 34'h2b091f623;
    stim[48] = 34'h22ff4eb6a;
    stim[49] = 34'h0bf3a59fb;
    stim[50] = 34'h17a4c4aee;
    stim[51] = 34'h0d5bd694a;
    stim[52] = 34'h18989b27e;
    stim[53] = 34'h0daae08c4;
    stim[54] = 34'h0ba133646;
    stim[55] = 34'h3413af815;
    stim[56] = 34'h00b8518d6;
    stim[57] = 34'h07ec48a97;
    stim[58] = 34'h0ccadeef2;
    stim[59] = 34'h344d5e771;
    stim[60] = 34'h1123b3c56;
    stim[61] = 34'h3327640e2;
    stim[62] = 34'h1ed6d620a;
    stim[63] = 34'h1524287cf;
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
      expv[0] = 16'h0000;
      expv[1] = 16'hxxxx;
      expv[2] = 16'hxxxx;
      expv[3] = 16'hxxxx;
      expv[4] = 16'h482e;
      expv[5] = 16'hxxxx;
      expv[6] = 16'hxxxx;
      expv[7] = 16'hxxxx;
      expv[8] = 16'hxxxx;
      expv[9] = 16'hxxxx;
      expv[10] = 16'hxxxx;
      expv[11] = 16'hxxxx;
      expv[12] = 16'hxxxx;
      expv[13] = 16'hxxxx;
      expv[14] = 16'hxxxx;
      expv[15] = 16'hxxxx;
      expv[16] = 16'hxxxx;
      expv[17] = 16'hxxxx;
      expv[18] = 16'hxxxx;
      expv[19] = 16'hxxxx;
      expv[20] = 16'hxxxx;
      expv[21] = 16'hxxxx;
      expv[22] = 16'hxxxx;
      expv[23] = 16'hxxxx;
      expv[24] = 16'hxxxx;
      expv[25] = 16'hxxxx;
      expv[26] = 16'hxxxx;
      expv[27] = 16'hxxxx;
      expv[28] = 16'hxxxx;
      expv[29] = 16'hxxxx;
      expv[30] = 16'hxxxx;
      expv[31] = 16'hxxxx;
      expv[32] = 16'hxxxx;
      expv[33] = 16'hxxxx;
      expv[34] = 16'hxxxx;
      expv[35] = 16'hxxxx;
      expv[36] = 16'hxxxx;
      expv[37] = 16'hxxxx;
      expv[38] = 16'hxxxx;
      expv[39] = 16'hxxxx;
      expv[40] = 16'hxxxx;
      expv[41] = 16'hxxxx;
      expv[42] = 16'hxxxx;
      expv[43] = 16'hxxxx;
      expv[44] = 16'hxxxx;
      expv[45] = 16'hxxxx;
      expv[46] = 16'hxxxx;
      expv[47] = 16'hxxxx;
      expv[48] = 16'hxxxx;
      expv[49] = 16'hxxxx;
      expv[50] = 16'h6068;
      expv[51] = 16'h6068;
      expv[52] = 16'hd57d;
      expv[53] = 16'hd57d;
      expv[54] = 16'hd57d;
      expv[55] = 16'hd57d;
      expv[56] = 16'hd57d;
      expv[57] = 16'hd57d;
      expv[58] = 16'hd57d;
      expv[59] = 16'hd57d;
      expv[60] = 16'hxxxx;
      expv[61] = 16'hxxxx;
      expv[62] = 16'hxxxx;
      expv[63] = 16'hxxxx;
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
