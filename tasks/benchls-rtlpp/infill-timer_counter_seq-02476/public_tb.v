// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 17;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02476 dut (
    .clk(clk),
    .start(in_vec[32:32]),
    .phs(in_vec[31:24]),
    .iv(in_vec[23:23]),
    .iocs(in_vec[22:22]),
    .ioaddr(in_vec[21:19]),
    .din(in_vec[18:3]),
    .iowr(in_vec[2:2]),
    .iord(in_vec[1:1]),
    .rst(in_vec[0:0]),
    .rfd(out_vec[16:16]),
    .dout(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h0d3d2ff75;
    stim[1] = 33'h161e27425;
    stim[2] = 33'h0716b6d9a;
    stim[3] = 33'h158c28a90;
    stim[4] = 33'h1c8ed8cc4;
    stim[5] = 33'h0eb91d212;
    stim[6] = 33'h07c6d26ba;
    stim[7] = 33'h0c0efceb0;
    stim[8] = 33'h0c3794fc2;
    stim[9] = 33'h053013ac6;
    stim[10] = 33'h1010d4624;
    stim[11] = 33'h19a0eeb90;
    stim[12] = 33'h1abea0952;
    stim[13] = 33'h011559f4a;
    stim[14] = 33'h1bc3d9426;
    stim[15] = 33'h04105ea16;
    stim[16] = 33'h05d30b078;
    stim[17] = 33'h0c8ccf002;
    stim[18] = 33'h0148ce482;
    stim[19] = 33'h1dee2f732;
    stim[20] = 33'h1154610e6;
    stim[21] = 33'h106187e66;
    stim[22] = 33'h0d33ceaf8;
    stim[23] = 33'h1e538ce74;
    stim[24] = 33'h193b646ec;
    stim[25] = 33'h073fa26b6;
    stim[26] = 33'h1434bebce;
    stim[27] = 33'h021a808a0;
    stim[28] = 33'h088d8e91c;
    stim[29] = 33'h16eaaa882;
    stim[30] = 33'h032534efc;
    stim[31] = 33'h1812e0828;
    stim[32] = 33'h095bc0600;
    stim[33] = 33'h070ad5650;
    stim[34] = 33'h104258c84;
    stim[35] = 33'h085112c14;
    stim[36] = 33'h00440e866;
    stim[37] = 33'h12256f5c6;
    stim[38] = 33'h032e27d3e;
    stim[39] = 33'h0b4cd1aae;
    stim[40] = 33'h0e15d3cca;
    stim[41] = 33'h1d4031df8;
    stim[42] = 33'h17eb273bc;
    stim[43] = 33'h02917b7e8;
    stim[44] = 33'h18c9ed124;
    stim[45] = 33'h15b99693a;
    stim[46] = 33'h1d44bf05c;
    stim[47] = 33'h04ab5f410;
    stim[48] = 33'h0356ff626;
    stim[49] = 33'h10f81dafe;
    stim[50] = 33'h1dd1cbb24;
    stim[51] = 33'h0ac80e370;
    stim[52] = 33'h0b2282342;
    stim[53] = 33'h16e919e5c;
    stim[54] = 33'h09aefbf22;
    stim[55] = 33'h07afb2ab4;
    stim[56] = 33'h072bd35ec;
    stim[57] = 33'h14b7f5635;
    stim[58] = 33'h00cd3b01a;
    stim[59] = 33'h01eaca06a;
    stim[60] = 33'h0b1c56994;
    stim[61] = 33'h1eb64776e;
    stim[62] = 33'h0b565b85a;
    stim[63] = 33'h1ebec46fa;
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
      expv[0] = 17'hxxxxx;
      expv[1] = 17'h00000;
      expv[2] = 17'h00000;
      expv[3] = 17'h00000;
      expv[4] = 17'h00000;
      expv[5] = 17'h00000;
      expv[6] = 17'h08125;
      expv[7] = 17'h00c0f;
      expv[8] = 17'h00c0f;
      expv[9] = 17'h083eb;
      expv[10] = 17'h0fccf;
      expv[11] = 17'h1fccf;
      expv[12] = 17'h1fccf;
      expv[13] = 17'h1fccf;
      expv[14] = 17'h183eb;
      expv[15] = 17'h183eb;
      expv[16] = 17'h1fccf;
      expv[17] = 17'h183eb;
      expv[18] = 17'h1fccf;
      expv[19] = 17'h1fccf;
      expv[20] = 17'h1000f;
      expv[21] = 17'h10330;
      expv[22] = 17'h18014;
      expv[23] = 17'h18014;
      expv[24] = 17'h18014;
      expv[25] = 17'h18014;
      expv[26] = 17'h18014;
      expv[27] = 17'h10330;
      expv[28] = 17'h10330;
      expv[29] = 17'h18014;
      expv[30] = 17'h10330;
      expv[31] = 17'h18014;
      expv[32] = 17'h10330;
      expv[33] = 17'h18014;
      expv[34] = 17'h10330;
      expv[35] = 17'h10330;
      expv[36] = 17'h18014;
      expv[37] = 17'h10330;
      expv[38] = 17'h18014;
      expv[39] = 17'h10330;
      expv[40] = 17'h10330;
      expv[41] = 17'h18014;
      expv[42] = 17'h10330;
      expv[43] = 17'h18014;
      expv[44] = 17'h18014;
      expv[45] = 17'h18014;
      expv[46] = 17'h18014;
      expv[47] = 17'h10330;
      expv[48] = 17'h18014;
      expv[49] = 17'h10330;
      expv[50] = 17'h10330;
      expv[51] = 17'h18014;
      expv[52] = 17'h10330;
      expv[53] = 17'h10330;
      expv[54] = 17'h18014;
      expv[55] = 17'h10330;
      expv[56] = 17'h18014;
      expv[57] = 17'h18014;
      expv[58] = 17'h00000;
      expv[59] = 17'h00000;
      expv[60] = 17'h00000;
      expv[61] = 17'h00f00;
      expv[62] = 17'h1cf30;
      expv[63] = 17'h1cf30;
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
