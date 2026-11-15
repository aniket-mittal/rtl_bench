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

  autovcoder_001251 dut (
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
    stim[0] = 33'h12d24ae75;
    stim[1] = 33'h1a2fddec5;
    stim[2] = 33'h014d0273e;
    stim[3] = 33'h05223d05a;
    stim[4] = 33'h0b25b87bb;
    stim[5] = 33'h06c64a206;
    stim[6] = 33'h02c85a349;
    stim[7] = 33'h090c9cfa9;
    stim[8] = 33'h0ff1a7d9a;
    stim[9] = 33'h00193f86b;
    stim[10] = 33'h057578f8c;
    stim[11] = 33'h08627a614;
    stim[12] = 33'h0ecabe661;
    stim[13] = 33'h01d82d00f;
    stim[14] = 33'h0ba92625e;
    stim[15] = 33'h0da4e964b;
    stim[16] = 33'h08760657f;
    stim[17] = 33'h0c978dbda;
    stim[18] = 33'h0580b66de;
    stim[19] = 33'h13497fdbc;
    stim[20] = 33'h078215cd0;
    stim[21] = 33'h0b48b6194;
    stim[22] = 33'h06a6b89f7;
    stim[23] = 33'h0d758b32e;
    stim[24] = 33'h0dee8fd23;
    stim[25] = 33'h0cbabeff8;
    stim[26] = 33'h07b01b874;
    stim[27] = 33'h0c3e09cd3;
    stim[28] = 33'h0f8810d03;
    stim[29] = 33'h0466280da;
    stim[30] = 33'h0ddfec673;
    stim[31] = 33'h03e484095;
    stim[32] = 33'h018ef9e27;
    stim[33] = 33'h0c0e43d92;
    stim[34] = 33'h0fb132bc1;
    stim[35] = 33'h0e8348237;
    stim[36] = 33'h0fcbd27ed;
    stim[37] = 33'h04c18adf7;
    stim[38] = 33'h09365f73c;
    stim[39] = 33'h093f2b0ef;
    stim[40] = 33'h0e2b180ee;
    stim[41] = 33'h17d82e529;
    stim[42] = 33'h0620eaa80;
    stim[43] = 33'h02fac8a29;
    stim[44] = 33'h0cbe4394f;
    stim[45] = 33'h0f84b321e;
    stim[46] = 33'h007a2ae68;
    stim[47] = 33'h017716f83;
    stim[48] = 33'h01a246dfa;
    stim[49] = 33'h02fecc43a;
    stim[50] = 33'h04898ab79;
    stim[51] = 33'h01d95ea0b;
    stim[52] = 33'h0ced9fa6d;
    stim[53] = 33'h0d33e44d3;
    stim[54] = 33'h0353379ab;
    stim[55] = 33'h0ce6b4ca8;
    stim[56] = 33'h04c2b901d;
    stim[57] = 33'h0b48416f2;
    stim[58] = 33'h0c4e014bb;
    stim[59] = 33'h06e2ab68a;
    stim[60] = 33'h099e6e892;
    stim[61] = 33'h00894cc77;
    stim[62] = 33'h0c459e4fc;
    stim[63] = 33'h0db20655d;
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
      expv[2] = 74'h00000000xxxxxxxxxc5;
      expv[3] = 74'h00000000xxxxxxxxx3e;
      expv[4] = 74'h00000000xxxxxxxxx3e;
      expv[5] = 74'h000000000000000003e;
      expv[6] = 74'h000000000000000003e;
      expv[7] = 74'h000000004000000013e;
      expv[8] = 74'h00000000000000000a9;
      expv[9] = 74'h00000000000000000a9;
      expv[10] = 74'h00000000000000000a9;
      expv[11] = 74'h00000000000000000a9;
      expv[12] = 74'h00000000800000001a9;
      expv[13] = 74'h0000000000000000061;
      expv[14] = 74'h0000000000000000061;
      expv[15] = 74'h0000000000000000061;
      expv[16] = 74'h0000000000000000061;
      expv[17] = 74'h00000000c0000000161;
      expv[18] = 74'h00000000000000000da;
      expv[19] = 74'h00000000000000000da;
      expv[20] = 74'h00000000000000001da;
      expv[21] = 74'h00000000000000000d0;
      expv[22] = 74'h00000000000000000d0;
      expv[23] = 74'h00000000000000000d0;
      expv[24] = 74'h00000000000000000d0;
      expv[25] = 74'h00000000400000001d0;
      expv[26] = 74'h00000000000000000f8;
      expv[27] = 74'h00000000000000000f8;
      expv[28] = 74'h00000000000000000f8;
      expv[29] = 74'h00000000000000000f8;
      expv[30] = 74'h00000000800000001f8;
      expv[31] = 74'h0000000000000000073;
      expv[32] = 74'h0000000000000000073;
      expv[33] = 74'h0000000000000000073;
      expv[34] = 74'h0000000000000000073;
      expv[35] = 74'h00000000c0000000173;
      expv[36] = 74'h0000000000000000037;
      expv[37] = 74'h0000000000000000037;
      expv[38] = 74'h0000000000000000037;
      expv[39] = 74'h0000000000000000037;
      expv[40] = 74'h0000000100000000137;
      expv[41] = 74'h00000000000000000ee;
      expv[42] = 74'h00000000000000001ee;
      expv[43] = 74'h0000000000000000080;
      expv[44] = 74'h0000000000000000080;
      expv[45] = 74'h0000000000000000080;
      expv[46] = 74'h0000000000000000080;
      expv[47] = 74'h0000000040000000180;
      expv[48] = 74'h0000000000000000083;
      expv[49] = 74'h0000000000000000083;
      expv[50] = 74'h0000000000000000083;
      expv[51] = 74'h0000000000000000083;
      expv[52] = 74'h0000000080000000183;
      expv[53] = 74'h000000000000000006d;
      expv[54] = 74'h000000000000000006d;
      expv[55] = 74'h000000000000000006d;
      expv[56] = 74'h000000000000000006d;
      expv[57] = 74'h00000000c000000016d;
      expv[58] = 74'h00000000000000000f2;
      expv[59] = 74'h00000000000000000f2;
      expv[60] = 74'h00000000000000000f2;
      expv[61] = 74'h00000000000000000f2;
      expv[62] = 74'h00000001000000001f2;
      expv[63] = 74'h00000000000000000fc;
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
