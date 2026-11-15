// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 9;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_188545 dut (
    .clk(clk),
    .rst(in_vec[8:8]),
    .halt(in_vec[7:7]),
    .j(in_vec[6:6]),
    .jal(in_vec[5:5]),
    .jr(in_vec[4:4]),
    .bne(in_vec[3:3]),
    .blez(in_vec[2:2]),
    .beq(in_vec[1:1]),
    .correct_b(in_vec[0:0]),
    .total(out_vec[127:96]),
    .conditional(out_vec[95:64]),
    .unconditional(out_vec[63:32]),
    .conditional_success(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 9'h108;
    stim[1] = 9'h197;
    stim[2] = 9'h0e7;
    stim[3] = 9'h053;
    stim[4] = 9'h0c1;
    stim[5] = 9'h05d;
    stim[6] = 9'h0db;
    stim[7] = 9'h0af;
    stim[8] = 9'h0b4;
    stim[9] = 9'h0d3;
    stim[10] = 9'h098;
    stim[11] = 9'h151;
    stim[12] = 9'h022;
    stim[13] = 9'h01d;
    stim[14] = 9'h085;
    stim[15] = 9'h005;
    stim[16] = 9'h079;
    stim[17] = 9'h058;
    stim[18] = 9'h037;
    stim[19] = 9'h0fb;
    stim[20] = 9'h0fd;
    stim[21] = 9'h007;
    stim[22] = 9'h16d;
    stim[23] = 9'h052;
    stim[24] = 9'h073;
    stim[25] = 9'h008;
    stim[26] = 9'h0b3;
    stim[27] = 9'h053;
    stim[28] = 9'h0b4;
    stim[29] = 9'h02a;
    stim[30] = 9'h0ae;
    stim[31] = 9'h034;
    stim[32] = 9'h0ae;
    stim[33] = 9'h049;
    stim[34] = 9'h0c4;
    stim[35] = 9'h065;
    stim[36] = 9'h040;
    stim[37] = 9'h0a1;
    stim[38] = 9'h040;
    stim[39] = 9'h092;
    stim[40] = 9'h082;
    stim[41] = 9'h06d;
    stim[42] = 9'h0a7;
    stim[43] = 9'h066;
    stim[44] = 9'h08e;
    stim[45] = 9'h0ba;
    stim[46] = 9'h0f4;
    stim[47] = 9'h00c;
    stim[48] = 9'h072;
    stim[49] = 9'h003;
    stim[50] = 9'h03d;
    stim[51] = 9'h0f9;
    stim[52] = 9'h0f1;
    stim[53] = 9'h02f;
    stim[54] = 9'h0ae;
    stim[55] = 9'h088;
    stim[56] = 9'h068;
    stim[57] = 9'h0f3;
    stim[58] = 9'h0b4;
    stim[59] = 9'h090;
    stim[60] = 9'h0d0;
    stim[61] = 9'h0a8;
    stim[62] = 9'h0ae;
    stim[63] = 9'h0b2;
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
      expv[0] = 128'h00000000000000000000000000000000;
      expv[1] = 128'h00000000000000000000000000000000;
      expv[2] = 128'h00000000000000000000000000000000;
      expv[3] = 128'h00000001000000010000000100000001;
      expv[4] = 128'h00000002000000020000000200000002;
      expv[5] = 128'h00000002000000020000000300000002;
      expv[6] = 128'h00000003000000030000000400000003;
      expv[7] = 128'h00000003000000040000000500000004;
      expv[8] = 128'h00000003000000050000000600000005;
      expv[9] = 128'h00000003000000060000000700000005;
      expv[10] = 128'h00000003000000070000000800000006;
      expv[11] = 128'h00000003000000080000000900000006;
      expv[12] = 128'h00000000000000000000000000000000;
      expv[13] = 128'h00000001000000010000000100000000;
      expv[14] = 128'h00000002000000020000000200000001;
      expv[15] = 128'h00000003000000030000000200000002;
      expv[16] = 128'h00000004000000040000000200000003;
      expv[17] = 128'h00000005000000050000000300000004;
      expv[18] = 128'h00000006000000060000000400000004;
      expv[19] = 128'h00000007000000070000000500000005;
      expv[20] = 128'h00000007000000080000000600000006;
      expv[21] = 128'h00000007000000090000000700000007;
      expv[22] = 128'h000000080000000a0000000700000008;
      expv[23] = 128'h00000000000000000000000000000000;
      expv[24] = 128'h00000001000000010000000100000000;
      expv[25] = 128'h00000002000000020000000200000001;
      expv[26] = 128'h00000003000000030000000200000001;
      expv[27] = 128'h00000004000000040000000300000002;
      expv[28] = 128'h00000005000000050000000400000003;
      expv[29] = 128'h00000005000000060000000500000003;
      expv[30] = 128'h00000006000000070000000600000003;
      expv[31] = 128'h00000006000000080000000700000003;
      expv[32] = 128'h00000007000000090000000800000003;
      expv[33] = 128'h000000070000000a0000000900000003;
      expv[34] = 128'h000000080000000b0000000a00000004;
      expv[35] = 128'h000000080000000c0000000b00000004;
      expv[36] = 128'h000000090000000d0000000c00000005;
      expv[37] = 128'h0000000a0000000d0000000d00000005;
      expv[38] = 128'h0000000a0000000d0000000e00000005;
      expv[39] = 128'h0000000b0000000d0000000f00000005;
      expv[40] = 128'h0000000b0000000e0000001000000005;
      expv[41] = 128'h0000000b0000000f0000001000000005;
      expv[42] = 128'h0000000c000000100000001100000006;
      expv[43] = 128'h0000000c000000110000001200000007;
      expv[44] = 128'h0000000d000000120000001300000007;
      expv[45] = 128'h0000000d000000130000001300000007;
      expv[46] = 128'h0000000d000000140000001400000007;
      expv[47] = 128'h0000000d000000150000001500000007;
      expv[48] = 128'h0000000e000000160000001500000007;
      expv[49] = 128'h0000000f000000170000001600000007;
      expv[50] = 128'h00000010000000180000001600000008;
      expv[51] = 128'h00000011000000190000001700000009;
      expv[52] = 128'h000000110000001a000000180000000a;
      expv[53] = 128'h000000110000001a000000190000000a;
      expv[54] = 128'h000000120000001b0000001a0000000b;
      expv[55] = 128'h000000120000001c0000001b0000000b;
      expv[56] = 128'h000000120000001d0000001b0000000b;
      expv[57] = 128'h000000130000001e0000001c0000000b;
      expv[58] = 128'h000000130000001f0000001d0000000c;
      expv[59] = 128'h00000013000000200000001e0000000c;
      expv[60] = 128'h00000013000000200000001f0000000c;
      expv[61] = 128'h0000001300000020000000200000000c;
      expv[62] = 128'h0000001300000021000000210000000c;
      expv[63] = 128'h0000001300000022000000220000000c;
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
