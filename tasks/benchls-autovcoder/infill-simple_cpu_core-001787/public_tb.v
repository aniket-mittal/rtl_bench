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

  autovcoder_001787 dut (
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
    stim[0] = 33'h119349acc;
    stim[1] = 33'h13286849d;
    stim[2] = 33'h0f3c13f16;
    stim[3] = 33'h0dd821fd7;
    stim[4] = 33'h08cc85c65;
    stim[5] = 33'h0c555b681;
    stim[6] = 33'h06bed8463;
    stim[7] = 33'h07f2a3911;
    stim[8] = 33'h074111f89;
    stim[9] = 33'h0aeae15ea;
    stim[10] = 33'h03b4f2595;
    stim[11] = 33'h0af711c46;
    stim[12] = 33'h0f82c56f0;
    stim[13] = 33'h05c4df6f2;
    stim[14] = 33'h02d3cb5b4;
    stim[15] = 33'h03895abd9;
    stim[16] = 33'h0077211fc;
    stim[17] = 33'h050462ec2;
    stim[18] = 33'h036ec52d1;
    stim[19] = 33'h089ecb6f7;
    stim[20] = 33'h01be8f70c;
    stim[21] = 33'h05893d8fc;
    stim[22] = 33'h04492c0e3;
    stim[23] = 33'h00b4cdc53;
    stim[24] = 33'h02739670d;
    stim[25] = 33'h05b04a87e;
    stim[26] = 33'h0afe6098c;
    stim[27] = 33'h05be1c207;
    stim[28] = 33'h0c989eb7a;
    stim[29] = 33'h056274a27;
    stim[30] = 33'h02e333e7f;
    stim[31] = 33'h07abf56a0;
    stim[32] = 33'h02bfda58f;
    stim[33] = 33'h0712b1769;
    stim[34] = 33'h09eacce70;
    stim[35] = 33'h045212dd2;
    stim[36] = 33'h07a1ed1a6;
    stim[37] = 33'h0eeb1da32;
    stim[38] = 33'h0a9b179c4;
    stim[39] = 33'h026ee48f8;
    stim[40] = 33'h010d4b4c9;
    stim[41] = 33'h0fb97e123;
    stim[42] = 33'h067203b59;
    stim[43] = 33'h0749c1c24;
    stim[44] = 33'h04cd6ddf0;
    stim[45] = 33'h0317b79e0;
    stim[46] = 33'h0beed5597;
    stim[47] = 33'h0ef938426;
    stim[48] = 33'h04cafe500;
    stim[49] = 33'h048eff2fa;
    stim[50] = 33'h009e60d9a;
    stim[51] = 33'h06263b05a;
    stim[52] = 33'h0466b197d;
    stim[53] = 33'h03ced4193;
    stim[54] = 33'h053458719;
    stim[55] = 33'h01a84a471;
    stim[56] = 33'h0acf5ce02;
    stim[57] = 33'h0f2cfada7;
    stim[58] = 33'h0accfd9bd;
    stim[59] = 33'h028fc3de6;
    stim[60] = 33'h01a5bfee8;
    stim[61] = 33'h025e3389a;
    stim[62] = 33'h0fde7d7be;
    stim[63] = 33'h0d7a868ef;
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
      expv[2] = 74'h00000000xxxxxxxxx9d;
      expv[3] = 74'h00000000xxxxxxxxx16;
      expv[4] = 74'h00000000xxxxxxxxx16;
      expv[5] = 74'h0000000000000000016;
      expv[6] = 74'h0000000000000000016;
      expv[7] = 74'h0000000040000000116;
      expv[8] = 74'h0000000000000000011;
      expv[9] = 74'h0000000000000000011;
      expv[10] = 74'h0000000000000000011;
      expv[11] = 74'h0000000000000000011;
      expv[12] = 74'h0000000080000000111;
      expv[13] = 74'h00000000000000000f0;
      expv[14] = 74'h00000000000000000f0;
      expv[15] = 74'h00000000000000000f0;
      expv[16] = 74'h00000000000000000f0;
      expv[17] = 74'h00000000c00000001f0;
      expv[18] = 74'h00000000000000000c2;
      expv[19] = 74'h00000000000000000c2;
      expv[20] = 74'h00000000000000000c2;
      expv[21] = 74'h00000000000000000c2;
      expv[22] = 74'h00000001000000001c2;
      expv[23] = 74'h00000000000000000e3;
      expv[24] = 74'h00000000000000000e3;
      expv[25] = 74'h00000000000000000e3;
      expv[26] = 74'h00000000000000000e3;
      expv[27] = 74'h00000001400000001e3;
      expv[28] = 74'h0000000000000000007;
      expv[29] = 74'h0000000000000000007;
      expv[30] = 74'h0000000000000000007;
      expv[31] = 74'h0000000000000000007;
      expv[32] = 74'h0000000180000000107;
      expv[33] = 74'h000000000000000008f;
      expv[34] = 74'h000000000000000008f;
      expv[35] = 74'h000000000000000008f;
      expv[36] = 74'h000000000000000008f;
      expv[37] = 74'h00000001c000000018f;
      expv[38] = 74'h0000000000000000032;
      expv[39] = 74'h0000000000000000032;
      expv[40] = 74'h0000000000000000032;
      expv[41] = 74'h0000000000000000032;
      expv[42] = 74'h0000000200000000132;
      expv[43] = 74'h0000000000000000059;
      expv[44] = 74'h0000000000000000059;
      expv[45] = 74'h0000000000000000059;
      expv[46] = 74'h0000000000000000059;
      expv[47] = 74'h0000000240000000159;
      expv[48] = 74'h0000000000000000026;
      expv[49] = 74'h0000000000000000026;
      expv[50] = 74'h0000000000000000026;
      expv[51] = 74'h0000000000000000026;
      expv[52] = 74'h0000000280000000126;
      expv[53] = 74'h000000000000000007d;
      expv[54] = 74'h000000000000000007d;
      expv[55] = 74'h000000000000000007d;
      expv[56] = 74'h000000000000000007d;
      expv[57] = 74'h00000002c000000017d;
      expv[58] = 74'h00000000000000000a7;
      expv[59] = 74'h00000000000000000a7;
      expv[60] = 74'h00000000000000000a7;
      expv[61] = 74'h00000000000000000a7;
      expv[62] = 74'h00000003000000001a7;
      expv[63] = 74'h00000000000000000be;
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
