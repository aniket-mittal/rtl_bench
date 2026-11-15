// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 71;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_10449 dut (
    .clk(clk),
    .reset_n(in_vec[70:70]),
    .opcode(in_vec[69:64]),
    .src0_data(in_vec[63:32]),
    .src1_data(in_vec[31:0]),
    .dst_data(out_vec[32:1]),
    .eq_data(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 71'h0ea59ae654ad427d67;
    stim[1] = 71'h11504d96b7ed9ba0a2;
    stim[2] = 71'h51073e34d32da58974;
    stim[3] = 71'h6f21df66278dd5f2e7;
    stim[4] = 71'h7b84c00e780f271190;
    stim[5] = 71'h4f4f3c3a540a822cf0;
    stim[6] = 71'h7dc9f9092923875f10;
    stim[7] = 71'h7ded57e0ad35bc229c;
    stim[8] = 71'h679c7851506d52a032;
    stim[9] = 71'h6541bfceb24fa70a35;
    stim[10] = 71'h79188b41300aee50d2;
    stim[11] = 71'h6c43da4f0bacdac941;
    stim[12] = 71'h4ef8bedf7c4957a691;
    stim[13] = 71'h3e2cf105f23bdbf33b;
    stim[14] = 71'h4cf479575b2b5541b3;
    stim[15] = 71'h551ae50a6b16399da3;
    stim[16] = 71'h7fecfab8c50200b69c;
    stim[17] = 71'h581271f69f9d73c6d6;
    stim[18] = 71'h51b5e307e46efac241;
    stim[19] = 71'h58bbb744445e856aa1;
    stim[20] = 71'h4ee35eb188e1e954b5;
    stim[21] = 71'h49760bb8d81babe142;
    stim[22] = 71'h6b0351d16cf75fb685;
    stim[23] = 71'h4b108666a93d6d6289;
    stim[24] = 71'h6bb4f6f330985db462;
    stim[25] = 71'h6b2951118d4740d0bb;
    stim[26] = 71'h4c8e26daa5ca5935af;
    stim[27] = 71'h4fa2d99e65f4d0ddc2;
    stim[28] = 71'h544586f69ddef801ef;
    stim[29] = 71'h7991dbfa932391796b;
    stim[30] = 71'h5f90be64ea27c82730;
    stim[31] = 71'h546491f8318351ef29;
    stim[32] = 71'h73acb933de24e4ef25;
    stim[33] = 71'h6b890113d3f3cc662d;
    stim[34] = 71'h452f5f3c5983e922ba;
    stim[35] = 71'h71fa44c5bd822b79c5;
    stim[36] = 71'h4adb2c67fffa1898ff;
    stim[37] = 71'h71f8552cfd4f996da3;
    stim[38] = 71'h4521e2b14c48ebc67e;
    stim[39] = 71'h540a9b4387f5eaf08c;
    stim[40] = 71'h71b349cf4e82d43d91;
    stim[41] = 71'h78cb6deeea4c27bb36;
    stim[42] = 71'h71b72e4b700198903e;
    stim[43] = 71'h48e633addf028b583c;
    stim[44] = 71'h761cbba5e5fd01dc62;
    stim[45] = 71'h43d85d4c0c46fd1919;
    stim[46] = 71'h77ceed69399f06d791;
    stim[47] = 71'h44e3f94a9e4a30f1c7;
    stim[48] = 71'h7500c9896b2a9b7460;
    stim[49] = 71'h5f6aeefbffedf712b8;
    stim[50] = 71'h5bfa34c200f807987f;
    stim[51] = 71'h60dea90922f63d16bf;
    stim[52] = 71'h56d4687d876cded651;
    stim[53] = 71'h04a70d67d355287343;
    stim[54] = 71'h657d0b2814da658b1e;
    stim[55] = 71'h48b1b856a23548b3b2;
    stim[56] = 71'h57f00c21beb416bbf6;
    stim[57] = 71'h72e9acd882cafa873e;
    stim[58] = 71'h6e2aa604d5150d70d5;
    stim[59] = 71'h74410ebfd88457d560;
    stim[60] = 71'h7900ac746a28c283e2;
    stim[61] = 71'h436fafb04cb55f6e29;
    stim[62] = 71'h776361e9c4ad0747c6;
    stim[63] = 71'h4fdcfe4282f6b7ca60;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000002;
      expv[2] = 33'h00000e7c6;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h000000000;
      expv[9] = 33'h000000000;
      expv[10] = 33'h000000000;
      expv[11] = 33'h000000000;
      expv[12] = 33'h000000000;
      expv[13] = 33'h000000000;
      expv[14] = 33'h0147a5f42;
      expv[15] = 33'h000000000;
      expv[16] = 33'h000000000;
      expv[17] = 33'h000000000;
      expv[18] = 33'h000000002;
      expv[19] = 33'h000000000;
      expv[20] = 33'h000000000;
      expv[21] = 33'h1236f3434;
      expv[22] = 33'h000000000;
      expv[23] = 33'h1a6320840;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h0da613f96;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h15ffe7df6;
      expv[35] = 33'h000000000;
      expv[36] = 33'h1c2279e00;
      expv[37] = 33'h000000000;
      expv[38] = 33'h0d3d7eefc;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h1d17e0c36;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h08460810c;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h00a10c686;
      expv[54] = 33'h000000000;
      expv[55] = 33'h1ce0214a8;
      expv[56] = 33'h000000000;
      expv[57] = 33'h000000000;
      expv[58] = 33'h000000000;
      expv[59] = 33'h000000000;
      expv[60] = 33'h000000000;
      expv[61] = 33'h000000000;
      expv[62] = 33'h000000000;
      expv[63] = 33'h000000000;
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
