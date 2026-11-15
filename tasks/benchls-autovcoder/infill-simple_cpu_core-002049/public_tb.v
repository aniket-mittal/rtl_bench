// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 74;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_002049 dut (
    .clk(clk),
    .rst(in_vec[32:32]),
    .bus_in(in_vec[31:0]),
    .bus_A(out_vec[73:42]),
    .bus_out(out_vec[41:10]),
    .bus_WE(out_vec[9:9]),
    .bus_RE(out_vec[8:8]),
    .current_opcode(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h123fa2a65;
    stim[1] = 33'h130788a11;
    stim[2] = 33'h0cf8275ad;
    stim[3] = 33'h0aff29afe;
    stim[4] = 33'h0dc120c03;
    stim[5] = 33'h03f31daff;
    stim[6] = 33'h02679073c;
    stim[7] = 33'h0adbf7386;
    stim[8] = 33'h0ff3c75f2;
    stim[9] = 33'h04ab910d8;
    stim[10] = 33'h040956bfb;
    stim[11] = 33'h0594819c5;
    stim[12] = 33'h0c7e96892;
    stim[13] = 33'h0c35d7fb9;
    stim[14] = 33'h0268f0f95;
    stim[15] = 33'h0fc0b6d79;
    stim[16] = 33'h0bf3b83d7;
    stim[17] = 33'h04133842b;
    stim[18] = 33'h0b585e4a6;
    stim[19] = 33'h0a3c3c652;
    stim[20] = 33'h084b7454d;
    stim[21] = 33'h03574d82b;
    stim[22] = 33'h0689706d6;
    stim[23] = 33'h024ee5767;
    stim[24] = 33'h047a60969;
    stim[25] = 33'h05b41d19a;
    stim[26] = 33'h01b6a511f;
    stim[27] = 33'h089ded081;
    stim[28] = 33'h039bdb9b4;
    stim[29] = 33'h09c254177;
    stim[30] = 33'h0f167530d;
    stim[31] = 33'h08563d536;
    stim[32] = 33'h02a4fc807;
    stim[33] = 33'h055759439;
    stim[34] = 33'h0154dcf56;
    stim[35] = 33'h0c8b8ee2d;
    stim[36] = 33'h05989d646;
    stim[37] = 33'h0adaca966;
    stim[38] = 33'h0b136ef6b;
    stim[39] = 33'h08ef6aba8;
    stim[40] = 33'h0848fecbd;
    stim[41] = 33'h005df6e42;
    stim[42] = 33'h0fc0c09c9;
    stim[43] = 33'h080dcfb52;
    stim[44] = 33'h0d30a32b8;
    stim[45] = 33'h0e44be47d;
    stim[46] = 33'h0c02ac799;
    stim[47] = 33'h03528ef02;
    stim[48] = 33'h0099d6013;
    stim[49] = 33'h013090520;
    stim[50] = 33'h012da1f58;
    stim[51] = 33'h00cc6b2ba;
    stim[52] = 33'h0eeb5722b;
    stim[53] = 33'h0fbbe287a;
    stim[54] = 33'h07fc95f99;
    stim[55] = 33'h0a1e8658e;
    stim[56] = 33'h05fc46498;
    stim[57] = 33'h01b8ffe8e;
    stim[58] = 33'h06255f7e9;
    stim[59] = 33'h0fb7276ad;
    stim[60] = 33'h0659d58f6;
    stim[61] = 33'h012251ab3;
    stim[62] = 33'h09cd050e0;
    stim[63] = 33'h072ee5fb2;
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
      expv[0] = 74'hxxxxxxxxxxxxxxxxxxx;
      expv[1] = 74'h00000000xxxxxxxxxxx;
      expv[2] = 74'h00000000xxxxxxxxx11;
      expv[3] = 74'h00000000xxxxxxxxxad;
      expv[4] = 74'h00000000xxxxxxxxxad;
      expv[5] = 74'h00000000000000000ad;
      expv[6] = 74'h00000000000000000ad;
      expv[7] = 74'h00000000400000001ad;
      expv[8] = 74'h0000000000000000086;
      expv[9] = 74'h0000000000000000086;
      expv[10] = 74'h0000000000000000086;
      expv[11] = 74'h0000000000000000086;
      expv[12] = 74'h0000000080000000186;
      expv[13] = 74'h0000000000000000092;
      expv[14] = 74'h0000000000000000092;
      expv[15] = 74'h0000000000000000092;
      expv[16] = 74'h0000000000000000092;
      expv[17] = 74'h00000000c0000000192;
      expv[18] = 74'h000000000000000002b;
      expv[19] = 74'h000000000000000002b;
      expv[20] = 74'h000000000000000002b;
      expv[21] = 74'h000000000000000002b;
      expv[22] = 74'h000000010000000012b;
      expv[23] = 74'h00000000000000000d6;
      expv[24] = 74'h00000000000000000d6;
      expv[25] = 74'h00000000000000000d6;
      expv[26] = 74'h00000000000000000d6;
      expv[27] = 74'h00000001400000001d6;
      expv[28] = 74'h0000000000000000081;
      expv[29] = 74'h0000000000000000081;
      expv[30] = 74'h0000000000000000081;
      expv[31] = 74'h0000000000000000081;
      expv[32] = 74'h0000000180000000181;
      expv[33] = 74'h0000000000000000007;
      expv[34] = 74'h0000000000000000007;
      expv[35] = 74'h0000000000000000007;
      expv[36] = 74'h0000000000000000007;
      expv[37] = 74'h00000001c0000000107;
      expv[38] = 74'h0000000000000000066;
      expv[39] = 74'h0000000000000000066;
      expv[40] = 74'h0000000000000000066;
      expv[41] = 74'h0000000000000000066;
      expv[42] = 74'h0000000200000000166;
      expv[43] = 74'h00000000000000000c9;
      expv[44] = 74'h00000000000000000c9;
      expv[45] = 74'h00000000000000000c9;
      expv[46] = 74'h00000000000000000c9;
      expv[47] = 74'h00000002400000001c9;
      expv[48] = 74'h0000000000000000002;
      expv[49] = 74'h0000000000000000002;
      expv[50] = 74'h0000000000000000002;
      expv[51] = 74'h0000000000000000002;
      expv[52] = 74'h0000000280000000102;
      expv[53] = 74'h000000000000000002b;
      expv[54] = 74'h000000000000000002b;
      expv[55] = 74'h000000000000000002b;
      expv[56] = 74'h000000000000000002b;
      expv[57] = 74'h00000002c000000012b;
      expv[58] = 74'h000000000000000008e;
      expv[59] = 74'h000000000000000008e;
      expv[60] = 74'h000000000000000008e;
      expv[61] = 74'h000000000000000008e;
      expv[62] = 74'h000000030000000018e;
      expv[63] = 74'h00000000000000000e0;
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
