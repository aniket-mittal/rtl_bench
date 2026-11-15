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

  autovcoder_001185 dut (
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
    stim[0] = 33'h1cb80f33e;
    stim[1] = 33'h1a00f9ee7;
    stim[2] = 33'h0adf79e0d;
    stim[3] = 33'h07ac8144f;
    stim[4] = 33'h0122e52c3;
    stim[5] = 33'h00de1d78d;
    stim[6] = 33'h07eb41757;
    stim[7] = 33'h019ad7c37;
    stim[8] = 33'h05fcc4cf7;
    stim[9] = 33'h0dbd2251c;
    stim[10] = 33'h0772db3bd;
    stim[11] = 33'h06446cfff;
    stim[12] = 33'h04b88647e;
    stim[13] = 33'h0cac68522;
    stim[14] = 33'h09ab6f374;
    stim[15] = 33'h0653ebbe4;
    stim[16] = 33'h0996e9880;
    stim[17] = 33'h03879f1c2;
    stim[18] = 33'h0ae8ac0d3;
    stim[19] = 33'h0f8ac8d76;
    stim[20] = 33'h094fd3ad2;
    stim[21] = 33'h0480e4b49;
    stim[22] = 33'h00f0b4975;
    stim[23] = 33'h06bea6c66;
    stim[24] = 33'h081f19607;
    stim[25] = 33'h062617917;
    stim[26] = 33'h02540a23c;
    stim[27] = 33'h06fe1f753;
    stim[28] = 33'h073962e58;
    stim[29] = 33'h0c7e26d19;
    stim[30] = 33'h02b2ee5a1;
    stim[31] = 33'h08f61453c;
    stim[32] = 33'h0a55bc535;
    stim[33] = 33'h0068ebadc;
    stim[34] = 33'h0a31d1614;
    stim[35] = 33'h0d8787fa6;
    stim[36] = 33'h06330db64;
    stim[37] = 33'h00d779fa7;
    stim[38] = 33'h019625ac8;
    stim[39] = 33'h04d175c6f;
    stim[40] = 33'h07cdbd0a2;
    stim[41] = 33'h0b313ea4b;
    stim[42] = 33'h0b3541817;
    stim[43] = 33'h037a0a5b1;
    stim[44] = 33'h0478afc65;
    stim[45] = 33'h0a045ebf0;
    stim[46] = 33'h04dd7e7b6;
    stim[47] = 33'h013b99376;
    stim[48] = 33'h0b047ea9c;
    stim[49] = 33'h0d5f3cb62;
    stim[50] = 33'h011b521c6;
    stim[51] = 33'h08a90a9c0;
    stim[52] = 33'h0fe6d1ded;
    stim[53] = 33'h0209948fe;
    stim[54] = 33'h0ec7b40a0;
    stim[55] = 33'h0af3709d8;
    stim[56] = 33'h06b7694dc;
    stim[57] = 33'h00c6e5a28;
    stim[58] = 33'h094ae7fd7;
    stim[59] = 33'h0a3ae3906;
    stim[60] = 33'h07d83f582;
    stim[61] = 33'h0f116e1a3;
    stim[62] = 33'h003c7d05d;
    stim[63] = 33'h0d619c4c4;
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
      expv[2] = 74'h00000000xxxxxxxxxe7;
      expv[3] = 74'h00000000xxxxxxxxx0d;
      expv[4] = 74'h00000000xxxxxxxxx0d;
      expv[5] = 74'h000000000000000000d;
      expv[6] = 74'h000000000000000000d;
      expv[7] = 74'h000000004000000010d;
      expv[8] = 74'h0000000000000000037;
      expv[9] = 74'h0000000000000000037;
      expv[10] = 74'h0000000000000000037;
      expv[11] = 74'h0000000000000000037;
      expv[12] = 74'h0000000080000000137;
      expv[13] = 74'h000000000000000007e;
      expv[14] = 74'h000000000000000007e;
      expv[15] = 74'h000000000000000007e;
      expv[16] = 74'h000000000000000007e;
      expv[17] = 74'h00000000c000000017e;
      expv[18] = 74'h00000000000000000c2;
      expv[19] = 74'h00000000000000000c2;
      expv[20] = 74'h00000000000000000c2;
      expv[21] = 74'h00000000000000000c2;
      expv[22] = 74'h00000001400000001c2;
      expv[23] = 74'h0000000000000000075;
      expv[24] = 74'h0000000000000000075;
      expv[25] = 74'h0000000000000000075;
      expv[26] = 74'h0000000000000000075;
      expv[27] = 74'h0000001400000000175;
      expv[28] = 74'h0000000000000000053;
      expv[29] = 74'h0000000000000000053;
      expv[30] = 74'h0000000000000000053;
      expv[31] = 74'h0000000000000000053;
      expv[32] = 74'h0000001480000000153;
      expv[33] = 74'h0000000000000000035;
      expv[34] = 74'h0000000000000000035;
      expv[35] = 74'h0000000000000000035;
      expv[36] = 74'h0000000000000000035;
      expv[37] = 74'h0000001500000000135;
      expv[38] = 74'h00000000000000000a7;
      expv[39] = 74'h00000000000000000a7;
      expv[40] = 74'h00000000000000000a7;
      expv[41] = 74'h00000000000000000a7;
      expv[42] = 74'h00000015400000001a7;
      expv[43] = 74'h0000000000000000017;
      expv[44] = 74'h0000000000000000017;
      expv[45] = 74'h0000000000000000017;
      expv[46] = 74'h0000000000000000017;
      expv[47] = 74'h0000001580000000117;
      expv[48] = 74'h0000000000000000076;
      expv[49] = 74'h0000000000000000076;
      expv[50] = 74'h0000000000000000076;
      expv[51] = 74'h0000000000000000076;
      expv[52] = 74'h00000015c0000000176;
      expv[53] = 74'h00000000000000000ed;
      expv[54] = 74'h00000000000000000ed;
      expv[55] = 74'h00000000000000000ed;
      expv[56] = 74'h00000000000000000ed;
      expv[57] = 74'h00000016000000001ed;
      expv[58] = 74'h0000000000000000028;
      expv[59] = 74'h0000000000000000028;
      expv[60] = 74'h0000000000000000028;
      expv[61] = 74'h0000000000000000028;
      expv[62] = 74'h0000001640000000128;
      expv[63] = 74'h000000000000000005d;
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
