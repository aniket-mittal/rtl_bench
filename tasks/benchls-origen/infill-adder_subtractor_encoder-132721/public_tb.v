// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 3;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_132721 dut (
    .A(in_vec[8:5]),
    .B(in_vec[4:1]),
    .select(in_vec[0:0]),
    .Y1(out_vec[2:1]),
    .Y2(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h06b;
    stim[1] = 9'h172;
    stim[2] = 9'h0f9;
    stim[3] = 9'h107;
    stim[4] = 9'h0e8;
    stim[5] = 9'h0b9;
    stim[6] = 9'h02a;
    stim[7] = 9'h1aa;
    stim[8] = 9'h10a;
    stim[9] = 9'h0d8;
    stim[10] = 9'h0cb;
    stim[11] = 9'h0d9;
    stim[12] = 9'h0a9;
    stim[13] = 9'h117;
    stim[14] = 9'h113;
    stim[15] = 9'h1ca;
    stim[16] = 9'h0f5;
    stim[17] = 9'h07a;
    stim[18] = 9'h148;
    stim[19] = 9'h15c;
    stim[20] = 9'h19c;
    stim[21] = 9'h017;
    stim[22] = 9'h0a1;
    stim[23] = 9'h03d;
    stim[24] = 9'h113;
    stim[25] = 9'h051;
    stim[26] = 9'h0a7;
    stim[27] = 9'h0ac;
    stim[28] = 9'h04c;
    stim[29] = 9'h0e4;
    stim[30] = 9'h062;
    stim[31] = 9'h048;
    stim[32] = 9'h1d1;
    stim[33] = 9'h179;
    stim[34] = 9'h1d0;
    stim[35] = 9'h01a;
    stim[36] = 9'h15a;
    stim[37] = 9'h033;
    stim[38] = 9'h0de;
    stim[39] = 9'h06f;
    stim[40] = 9'h068;
    stim[41] = 9'h044;
    stim[42] = 9'h0c0;
    stim[43] = 9'h134;
    stim[44] = 9'h160;
    stim[45] = 9'h120;
    stim[46] = 9'h10c;
    stim[47] = 9'h00b;
    stim[48] = 9'h0c3;
    stim[49] = 9'h0ae;
    stim[50] = 9'h0a9;
    stim[51] = 9'h1fe;
    stim[52] = 9'h154;
    stim[53] = 9'h13e;
    stim[54] = 9'h1ed;
    stim[55] = 9'h009;
    stim[56] = 9'h114;
    stim[57] = 9'h1a2;
    stim[58] = 9'h0df;
    stim[59] = 9'h14d;
    stim[60] = 9'h0ce;
    stim[61] = 9'h18c;
    stim[62] = 9'h04e;
    stim[63] = 9'h1ee;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 3'h7;
      expv[1] = 3'h3;
      expv[2] = 3'h3;
      expv[3] = 3'h7;
      expv[4] = 3'h3;
      expv[5] = 3'h1;
      expv[6] = 3'h7;
      expv[7] = 3'h7;
      expv[8] = 3'h3;
      expv[9] = 3'h7;
      expv[10] = 3'h7;
      expv[11] = 3'h3;
      expv[12] = 3'h7;
      expv[13] = 3'h3;
      expv[14] = 3'h1;
      expv[15] = 3'h7;
      expv[16] = 3'h1;
      expv[17] = 3'h5;
      expv[18] = 3'h5;
      expv[19] = 3'h7;
      expv[20] = 3'h7;
      expv[21] = 3'h7;
      expv[22] = 3'h5;
      expv[23] = 3'h7;
      expv[24] = 3'h1;
      expv[25] = 3'h7;
      expv[26] = 3'h7;
      expv[27] = 3'h7;
      expv[28] = 3'h7;
      expv[29] = 3'h5;
      expv[30] = 3'h3;
      expv[31] = 3'h7;
      expv[32] = 3'h5;
      expv[33] = 3'h5;
      expv[34] = 3'h5;
      expv[35] = 3'h3;
      expv[36] = 3'h7;
      expv[37] = 3'h7;
      expv[38] = 3'h5;
      expv[39] = 3'h7;
      expv[40] = 3'h7;
      expv[41] = 3'h0;
      expv[42] = 3'h5;
      expv[43] = 3'h7;
      expv[44] = 3'h7;
      expv[45] = 3'h7;
      expv[46] = 3'h3;
      expv[47] = 3'h5;
      expv[48] = 3'h5;
      expv[49] = 3'h7;
      expv[50] = 3'h7;
      expv[51] = 3'h0;
      expv[52] = 3'h0;
      expv[53] = 3'h7;
      expv[54] = 3'h5;
      expv[55] = 3'h5;
      expv[56] = 3'h7;
      expv[57] = 3'h7;
      expv[58] = 3'h5;
      expv[59] = 3'h0;
      expv[60] = 3'h7;
      expv[61] = 3'h5;
      expv[62] = 3'h7;
      expv[63] = 3'h7;
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
