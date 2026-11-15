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

  autovcoder_000525 dut (
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
    stim[0] = 33'h1903858b4;
    stim[1] = 33'h1318046c6;
    stim[2] = 33'h07d9cebb0;
    stim[3] = 33'h03d59c1a1;
    stim[4] = 33'h047455982;
    stim[5] = 33'h03fc9e9bb;
    stim[6] = 33'h08e9c8533;
    stim[7] = 33'h0fe78495e;
    stim[8] = 33'h05565d44e;
    stim[9] = 33'h00a6310d4;
    stim[10] = 33'h011889b75;
    stim[11] = 33'h0f2476018;
    stim[12] = 33'h0e7c8498f;
    stim[13] = 33'h05f8db09e;
    stim[14] = 33'h0edfc69a2;
    stim[15] = 33'h0c67cb1c4;
    stim[16] = 33'h0a9bf4c16;
    stim[17] = 33'h020168ab5;
    stim[18] = 33'h046a5f761;
    stim[19] = 33'h0c9464241;
    stim[20] = 33'h0caed985b;
    stim[21] = 33'h087b3eb3d;
    stim[22] = 33'h0499b2afa;
    stim[23] = 33'h0e77ea0fc;
    stim[24] = 33'h0150f9150;
    stim[25] = 33'h0108be22a;
    stim[26] = 33'h0de4b2a4d;
    stim[27] = 33'h0f5876c7f;
    stim[28] = 33'h014b6f365;
    stim[29] = 33'h0de107418;
    stim[30] = 33'h002fab978;
    stim[31] = 33'h04b5c5875;
    stim[32] = 33'h0e0937794;
    stim[33] = 33'h02b47fe83;
    stim[34] = 33'h082c8f0a0;
    stim[35] = 33'h025d33983;
    stim[36] = 33'h0029f4f86;
    stim[37] = 33'h01cc6469b;
    stim[38] = 33'h02cfd7b44;
    stim[39] = 33'h091d7c0a2;
    stim[40] = 33'h0356e668e;
    stim[41] = 33'h0730c1f0d;
    stim[42] = 33'h087237934;
    stim[43] = 33'h106aaf9c5;
    stim[44] = 33'h0b2355ff3;
    stim[45] = 33'h1d01f790b;
    stim[46] = 33'h0d6f86cc6;
    stim[47] = 33'h08b96371f;
    stim[48] = 33'h0deea05c2;
    stim[49] = 33'h0d6eba064;
    stim[50] = 33'h07a946fc8;
    stim[51] = 33'h049baf78e;
    stim[52] = 33'h02254e8a2;
    stim[53] = 33'h027f652d8;
    stim[54] = 33'h0bc715807;
    stim[55] = 33'h09092d31d;
    stim[56] = 33'h0e6792b6b;
    stim[57] = 33'h0291a84e3;
    stim[58] = 33'h0cb065573;
    stim[59] = 33'h019db47a9;
    stim[60] = 33'h0b2a55b8e;
    stim[61] = 33'h06b3c0537;
    stim[62] = 33'h0093c8337;
    stim[63] = 33'h0472cec49;
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
      expv[2] = 74'h00000000xxxxxxxxxc6;
      expv[3] = 74'h00000000xxxxxxxxxb0;
      expv[4] = 74'h00000000xxxxxxxxxb0;
      expv[5] = 74'h3fffffffc00000000b0;
      expv[6] = 74'h00000000000000000b0;
      expv[7] = 74'h00000000400000001b0;
      expv[8] = 74'h000000000000000005e;
      expv[9] = 74'h000000000000000005e;
      expv[10] = 74'h000000000000000005e;
      expv[11] = 74'h000000000000000005e;
      expv[12] = 74'h000000008000000015e;
      expv[13] = 74'h000000000000000008f;
      expv[14] = 74'h000000000000000008f;
      expv[15] = 74'h000000000000000008f;
      expv[16] = 74'h000000000000000008f;
      expv[17] = 74'h00000000c000000018f;
      expv[18] = 74'h00000000000000000b5;
      expv[19] = 74'h00000000000000000b5;
      expv[20] = 74'h00000000000000000b5;
      expv[21] = 74'h00000000000000000b5;
      expv[22] = 74'h00000001000000001b5;
      expv[23] = 74'h00000000000000000fa;
      expv[24] = 74'h00000000000000000fa;
      expv[25] = 74'h00000000000000000fa;
      expv[26] = 74'h00000000000000000fa;
      expv[27] = 74'h00000001400000001fa;
      expv[28] = 74'h000000000000000007f;
      expv[29] = 74'h000000000000000007f;
      expv[30] = 74'h000000000000000007f;
      expv[31] = 74'h000000000000000007f;
      expv[32] = 74'h000000018000000017f;
      expv[33] = 74'h0000000000000000094;
      expv[34] = 74'h0000000000000000094;
      expv[35] = 74'h0000000000000000094;
      expv[36] = 74'h0000000000000000094;
      expv[37] = 74'h00000001c0000000194;
      expv[38] = 74'h000000000000000009b;
      expv[39] = 74'h000000000000000009b;
      expv[40] = 74'h000000000000000009b;
      expv[41] = 74'h000000000000000009b;
      expv[42] = 74'h000000020000000019b;
      expv[43] = 74'h0000000000000000034;
      expv[44] = 74'h0000000000000000134;
      expv[45] = 74'h00000000000000000f3;
      expv[46] = 74'h00000000000000001f3;
      expv[47] = 74'h00000000000000000c6;
      expv[48] = 74'h00000000000000000c6;
      expv[49] = 74'h00000000000000000c6;
      expv[50] = 74'h00000000000000000c6;
      expv[51] = 74'h00000000400000001c6;
      expv[52] = 74'h000000000000000008e;
      expv[53] = 74'h000000000000000008e;
      expv[54] = 74'h000000000000000008e;
      expv[55] = 74'h000000000000000008e;
      expv[56] = 74'h000000008000000018e;
      expv[57] = 74'h000000000000000006b;
      expv[58] = 74'h000000000000000006b;
      expv[59] = 74'h3fffffffc000000006b;
      expv[60] = 74'h000000000000000006b;
      expv[61] = 74'h00000000c000000016b;
      expv[62] = 74'h0000000000000000037;
      expv[63] = 74'h0000000000000000037;
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
