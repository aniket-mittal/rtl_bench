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

  autovcoder_002001 dut (
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
    stim[0] = 33'h1e61aaca0;
    stim[1] = 33'h16209d37e;
    stim[2] = 33'h06f9be532;
    stim[3] = 33'h0d4cf623e;
    stim[4] = 33'h0471b12c2;
    stim[5] = 33'h013c25778;
    stim[6] = 33'h0d1de2eeb;
    stim[7] = 33'h0a9202b24;
    stim[8] = 33'h0d7d483c1;
    stim[9] = 33'h080346090;
    stim[10] = 33'h0b6627ebc;
    stim[11] = 33'h053d9432f;
    stim[12] = 33'h1fb280fab;
    stim[13] = 33'h09212f8b8;
    stim[14] = 33'h01f4efd5d;
    stim[15] = 33'h098a8b55b;
    stim[16] = 33'h04d6bbccb;
    stim[17] = 33'h05d03c411;
    stim[18] = 33'h097ed8d6b;
    stim[19] = 33'h00567f178;
    stim[20] = 33'h07e241029;
    stim[21] = 33'h03de7edfb;
    stim[22] = 33'h0443ace86;
    stim[23] = 33'h083d3e785;
    stim[24] = 33'h0deeb7a48;
    stim[25] = 33'h03891c6bf;
    stim[26] = 33'h1e997726f;
    stim[27] = 33'h0801aa07f;
    stim[28] = 33'h025447c2b;
    stim[29] = 33'h0c7915371;
    stim[30] = 33'h00f241e83;
    stim[31] = 33'h0f2e96f22;
    stim[32] = 33'h0a5df7bd1;
    stim[33] = 33'h0b5f532e5;
    stim[34] = 33'h084b45b32;
    stim[35] = 33'h0d9a5ee9d;
    stim[36] = 33'h0eca9fde7;
    stim[37] = 33'h0569b47fa;
    stim[38] = 33'h070c70f8a;
    stim[39] = 33'h00687b646;
    stim[40] = 33'h0d2de7486;
    stim[41] = 33'h001e1e1df;
    stim[42] = 33'h02a19823d;
    stim[43] = 33'h071606af1;
    stim[44] = 33'h04613c32f;
    stim[45] = 33'h0a23c7c4c;
    stim[46] = 33'h09fe51214;
    stim[47] = 33'h0fb6df27c;
    stim[48] = 33'h0c7a4c318;
    stim[49] = 33'h082b0010e;
    stim[50] = 33'h0d1910b99;
    stim[51] = 33'h02f917f59;
    stim[52] = 33'h092661261;
    stim[53] = 33'h05efca120;
    stim[54] = 33'h0f0867bd0;
    stim[55] = 33'h0a5d24f36;
    stim[56] = 33'h0de5779e3;
    stim[57] = 33'h04f3b3cef;
    stim[58] = 33'h0a8ae9f47;
    stim[59] = 33'h005cfddc0;
    stim[60] = 33'h07962affa;
    stim[61] = 33'h0a82e23ef;
    stim[62] = 33'h017845e2e;
    stim[63] = 33'h0954d594f;
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
      expv[2] = 74'h00000000xxxxxxxxx7e;
      expv[3] = 74'h00000000xxxxxxxxx32;
      expv[4] = 74'h00000000xxxxxxxxx32;
      expv[5] = 74'h0000000000000000032;
      expv[6] = 74'h0000000000000000032;
      expv[7] = 74'h0000000040000000132;
      expv[8] = 74'h0000000000000000024;
      expv[9] = 74'h0000000000000000024;
      expv[10] = 74'h0000000000000000024;
      expv[11] = 74'h0000000000000000024;
      expv[12] = 74'h0000000080000000124;
      expv[13] = 74'h00000000000000001ab;
      expv[14] = 74'h00000000000000000b8;
      expv[15] = 74'h00000000000000000b8;
      expv[16] = 74'h00000000000000000b8;
      expv[17] = 74'h00000000000000000b8;
      expv[18] = 74'h00000000400000001b8;
      expv[19] = 74'h000000000000000006b;
      expv[20] = 74'h000000000000000006b;
      expv[21] = 74'h000000000000000006b;
      expv[22] = 74'h000000000000000006b;
      expv[23] = 74'h000000008000000016b;
      expv[24] = 74'h0000000000000000085;
      expv[25] = 74'h0000000000000000085;
      expv[26] = 74'h0000000000000000085;
      expv[27] = 74'h0000000000000000185;
      expv[28] = 74'h000000000000000007f;
      expv[29] = 74'h000000000000000007f;
      expv[30] = 74'h000000000000000007f;
      expv[31] = 74'h000000000000000007f;
      expv[32] = 74'h000000004000000017f;
      expv[33] = 74'h00000000000000000d1;
      expv[34] = 74'h00000000000000000d1;
      expv[35] = 74'h00000000000000000d1;
      expv[36] = 74'h00000000000000000d1;
      expv[37] = 74'h00000000800000001d1;
      expv[38] = 74'h00000000000000000fa;
      expv[39] = 74'h00000000000000000fa;
      expv[40] = 74'h00000000000000000fa;
      expv[41] = 74'h00000000000000000fa;
      expv[42] = 74'h00000000c00000001fa;
      expv[43] = 74'h000000000000000003d;
      expv[44] = 74'h000000000000000003d;
      expv[45] = 74'h000000000000000003d;
      expv[46] = 74'h000000000000000003d;
      expv[47] = 74'h000000010000000013d;
      expv[48] = 74'h000000000000000007c;
      expv[49] = 74'h000000000000000007c;
      expv[50] = 74'h000000000000000007c;
      expv[51] = 74'h000000000000000007c;
      expv[52] = 74'h000000014000000017c;
      expv[53] = 74'h0000000000000000061;
      expv[54] = 74'h0000000000000000061;
      expv[55] = 74'h0000000000000000061;
      expv[56] = 74'h0000000000000000061;
      expv[57] = 74'h0000000180000000161;
      expv[58] = 74'h00000000000000000ef;
      expv[59] = 74'h00000000000000000ef;
      expv[60] = 74'h00000000000000000ef;
      expv[61] = 74'h00000000000000000ef;
      expv[62] = 74'h00000001c00000001ef;
      expv[63] = 74'h000000000000000002e;
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
