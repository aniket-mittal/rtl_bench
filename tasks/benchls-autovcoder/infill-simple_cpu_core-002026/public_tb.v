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

  autovcoder_002026 dut (
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
    stim[0] = 33'h15cd05fee;
    stim[1] = 33'h19280c5cd;
    stim[2] = 33'h0fe23afda;
    stim[3] = 33'h072a1fb6c;
    stim[4] = 33'h0a51574b2;
    stim[5] = 33'h06b4c4d14;
    stim[6] = 33'h08a4b068e;
    stim[7] = 33'h010a2df78;
    stim[8] = 33'h04d4c8adc;
    stim[9] = 33'h0cb275189;
    stim[10] = 33'h04a08daf9;
    stim[11] = 33'h09db07802;
    stim[12] = 33'h0ddf77235;
    stim[13] = 33'h022ce42cf;
    stim[14] = 33'h0c64eeaf3;
    stim[15] = 33'h0a02f63c0;
    stim[16] = 33'h0539c779e;
    stim[17] = 33'h0f4903091;
    stim[18] = 33'h0af309f1b;
    stim[19] = 33'h0bf34205c;
    stim[20] = 33'h04840a737;
    stim[21] = 33'h05b0fecd5;
    stim[22] = 33'h04d6f994b;
    stim[23] = 33'h036339a47;
    stim[24] = 33'h1c7a27b70;
    stim[25] = 33'h0b1fc4190;
    stim[26] = 33'h00fb2788d;
    stim[27] = 33'h067478818;
    stim[28] = 33'h0bee92da1;
    stim[29] = 33'h0d1819003;
    stim[30] = 33'h1def5cbe4;
    stim[31] = 33'h014bcdf66;
    stim[32] = 33'h0917110f9;
    stim[33] = 33'h0171585c2;
    stim[34] = 33'h0bab36edb;
    stim[35] = 33'h1232dc24f;
    stim[36] = 33'h0fa70261b;
    stim[37] = 33'h081fc4d6a;
    stim[38] = 33'h06d15db54;
    stim[39] = 33'h015e5917c;
    stim[40] = 33'h03185d778;
    stim[41] = 33'h0bd146f63;
    stim[42] = 33'h02a25df4b;
    stim[43] = 33'h062ea88b1;
    stim[44] = 33'h0aa62c419;
    stim[45] = 33'h0c2f8cd3c;
    stim[46] = 33'h0c9be7870;
    stim[47] = 33'h0b8da34c0;
    stim[48] = 33'h0d6d84930;
    stim[49] = 33'h0b0ffefcf;
    stim[50] = 33'h026d21a78;
    stim[51] = 33'h014b5c010;
    stim[52] = 33'h0f5bb09ea;
    stim[53] = 33'h009fe862a;
    stim[54] = 33'h0e483592c;
    stim[55] = 33'h064faa296;
    stim[56] = 33'h08d3bcbfa;
    stim[57] = 33'h0330a89af;
    stim[58] = 33'h04249499c;
    stim[59] = 33'h0a77311d4;
    stim[60] = 33'h032bf0067;
    stim[61] = 33'h0899e2912;
    stim[62] = 33'h04444aeb9;
    stim[63] = 33'h034ec9f2b;
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
      expv[2] = 74'h00000000xxxxxxxxxcd;
      expv[3] = 74'h00000000xxxxxxxxxda;
      expv[4] = 74'h00000000xxxxxxxxxda;
      expv[5] = 74'h00000000000000000da;
      expv[6] = 74'h00000000000000000da;
      expv[7] = 74'h00000000400000001da;
      expv[8] = 74'h0000000000000000078;
      expv[9] = 74'h0000000000000000078;
      expv[10] = 74'h0000000000000000078;
      expv[11] = 74'h0000000000000000078;
      expv[12] = 74'h0000000080000000178;
      expv[13] = 74'h0000000000000000035;
      expv[14] = 74'h0000000000000000035;
      expv[15] = 74'h0000000000000000035;
      expv[16] = 74'h0000000000000000035;
      expv[17] = 74'h00000000c0000000135;
      expv[18] = 74'h0000000000000000091;
      expv[19] = 74'h0000000000000000091;
      expv[20] = 74'h0000000000000000091;
      expv[21] = 74'h0000000000000000091;
      expv[22] = 74'h0000000100000000191;
      expv[23] = 74'h000000000000000004b;
      expv[24] = 74'h000000000000000004b;
      expv[25] = 74'h000000000000000014b;
      expv[26] = 74'h0000000000000000090;
      expv[27] = 74'h0000000000000000090;
      expv[28] = 74'h0000000000000000090;
      expv[29] = 74'h0000000000000000090;
      expv[30] = 74'h0000000040000000190;
      expv[31] = 74'h00000000000000001e4;
      expv[32] = 74'h0000000000000000066;
      expv[33] = 74'h0000000000000000066;
      expv[34] = 74'h0000000000000000066;
      expv[35] = 74'h0000000000000000066;
      expv[36] = 74'h0000000000000000166;
      expv[37] = 74'h000000000000000001b;
      expv[38] = 74'h000000000000000001b;
      expv[39] = 74'h000000000000000001b;
      expv[40] = 74'h000000000000000001b;
      expv[41] = 74'h000000004000000011b;
      expv[42] = 74'h0000000000000000063;
      expv[43] = 74'h0000000000000000063;
      expv[44] = 74'h0000000000000000063;
      expv[45] = 74'h0000000000000000063;
      expv[46] = 74'h0000000080000000163;
      expv[47] = 74'h0000000000000000070;
      expv[48] = 74'h0000000000000000070;
      expv[49] = 74'h0000000000000000070;
      expv[50] = 74'h0000000000000000070;
      expv[51] = 74'h00000000c0000000170;
      expv[52] = 74'h0000000000000000010;
      expv[53] = 74'h0000000000000000010;
      expv[54] = 74'h0000000000000000010;
      expv[55] = 74'h0000000000000000010;
      expv[56] = 74'h0000000100000000110;
      expv[57] = 74'h00000000000000000fa;
      expv[58] = 74'h00000000000000000fa;
      expv[59] = 74'h00000000000000000fa;
      expv[60] = 74'h00000000000000000fa;
      expv[61] = 74'h00000001400000001fa;
      expv[62] = 74'h0000000000000000012;
      expv[63] = 74'h0000000000000000012;
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
