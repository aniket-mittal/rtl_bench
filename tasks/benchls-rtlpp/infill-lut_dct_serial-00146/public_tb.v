// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 10;
  localparam OW = 9;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_00146 dut (
    .clk(clk),
    .reset(in_vec[9:9]),
    .x_in0(in_vec[8:6]),
    .x_in1(in_vec[5:3]),
    .x_in2(in_vec[2:0]),
    .lut(out_vec[8:6]),
    .y(out_vec[5:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 10'h385;
    stim[1] = 10'h31f;
    stim[2] = 10'h01b;
    stim[3] = 10'h08f;
    stim[4] = 10'h0bd;
    stim[5] = 10'h11f;
    stim[6] = 10'h1e1;
    stim[7] = 10'h0e9;
    stim[8] = 10'h002;
    stim[9] = 10'h1de;
    stim[10] = 10'h0ab;
    stim[11] = 10'h0c4;
    stim[12] = 10'h0e3;
    stim[13] = 10'h1c6;
    stim[14] = 10'h110;
    stim[15] = 10'h1a9;
    stim[16] = 10'h188;
    stim[17] = 10'h1e1;
    stim[18] = 10'h1df;
    stim[19] = 10'h1a1;
    stim[20] = 10'h0d9;
    stim[21] = 10'h06c;
    stim[22] = 10'h16e;
    stim[23] = 10'h141;
    stim[24] = 10'h136;
    stim[25] = 10'h054;
    stim[26] = 10'h1b0;
    stim[27] = 10'h1f8;
    stim[28] = 10'h104;
    stim[29] = 10'h032;
    stim[30] = 10'h1cb;
    stim[31] = 10'h07c;
    stim[32] = 10'h0aa;
    stim[33] = 10'h1c2;
    stim[34] = 10'h0e9;
    stim[35] = 10'h1f6;
    stim[36] = 10'h1bd;
    stim[37] = 10'h0a7;
    stim[38] = 10'h03f;
    stim[39] = 10'h0b0;
    stim[40] = 10'h1e2;
    stim[41] = 10'h1b8;
    stim[42] = 10'h0d7;
    stim[43] = 10'h0a1;
    stim[44] = 10'h17f;
    stim[45] = 10'h0ea;
    stim[46] = 10'h1d3;
    stim[47] = 10'h0b3;
    stim[48] = 10'h00d;
    stim[49] = 10'h026;
    stim[50] = 10'h147;
    stim[51] = 10'h024;
    stim[52] = 10'h1ea;
    stim[53] = 10'h0e6;
    stim[54] = 10'h0c2;
    stim[55] = 10'h192;
    stim[56] = 10'h012;
    stim[57] = 10'h0a9;
    stim[58] = 10'h003;
    stim[59] = 10'h04e;
    stim[60] = 10'h009;
    stim[61] = 10'h03e;
    stim[62] = 10'h113;
    stim[63] = 10'h1a7;
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
      expv[0] = 9'hxxx;
      expv[1] = 9'h0xx;
      expv[2] = 9'h0xx;
      expv[3] = 9'h0xx;
      expv[4] = 9'h1xx;
      expv[5] = 9'h1xx;
      expv[6] = 9'h0xx;
      expv[7] = 9'h012;
      expv[8] = 9'h012;
      expv[9] = 9'h1d2;
      expv[10] = 9'h052;
      expv[11] = 9'h092;
      expv[12] = 9'h091;
      expv[13] = 9'h091;
      expv[14] = 9'h151;
      expv[15] = 9'h151;
      expv[16] = 9'h091;
      expv[17] = 9'h098;
      expv[18] = 9'h098;
      expv[19] = 9'h158;
      expv[20] = 9'h058;
      expv[21] = 9'h0d8;
      expv[22] = 9'h0d4;
      expv[23] = 9'h0d4;
      expv[24] = 9'h0d4;
      expv[25] = 9'h114;
      expv[26] = 9'h1d4;
      expv[27] = 9'h1e8;
      expv[28] = 9'h1e8;
      expv[29] = 9'h0e8;
      expv[30] = 9'h0e8;
      expv[31] = 9'h0e8;
      expv[32] = 9'h0d8;
      expv[33] = 9'h0d8;
      expv[34] = 9'h098;
      expv[35] = 9'h158;
      expv[36] = 9'h098;
      expv[37] = 9'h095;
      expv[38] = 9'h095;
      expv[39] = 9'h115;
      expv[40] = 9'h155;
      expv[41] = 9'h195;
      expv[42] = 9'h1a7;
      expv[43] = 9'h1a7;
      expv[44] = 9'h167;
      expv[45] = 9'h1e7;
      expv[46] = 9'h127;
      expv[47] = 9'h126;
      expv[48] = 9'h126;
      expv[49] = 9'h126;
      expv[50] = 9'h1e6;
      expv[51] = 9'h0a6;
      expv[52] = 9'h09c;
      expv[53] = 9'h09c;
      expv[54] = 9'h0dc;
      expv[55] = 9'h15c;
      expv[56] = 9'h0dc;
      expv[57] = 9'h0da;
      expv[58] = 9'h0da;
      expv[59] = 9'h19a;
      expv[60] = 9'h05a;
      expv[61] = 9'h09a;
      expv[62] = 9'h091;
      expv[63] = 9'h091;
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
