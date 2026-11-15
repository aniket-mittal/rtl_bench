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

  autovcoder_000636 dut (
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
    stim[0] = 33'h1ca7437a3;
    stim[1] = 33'h17363bdf7;
    stim[2] = 33'h0ecc49e0b;
    stim[3] = 33'h0bb138b6c;
    stim[4] = 33'h04348f8bc;
    stim[5] = 33'h086146670;
    stim[6] = 33'h0b30fe6b6;
    stim[7] = 33'h050dc73c5;
    stim[8] = 33'h021f70bef;
    stim[9] = 33'h0cfc7b8f9;
    stim[10] = 33'h06db7b377;
    stim[11] = 33'h07f75ac9d;
    stim[12] = 33'h076476a47;
    stim[13] = 33'h0a38493cd;
    stim[14] = 33'h0d336ad91;
    stim[15] = 33'h0305f1aac;
    stim[16] = 33'h0a83ee5fd;
    stim[17] = 33'h06a2c8060;
    stim[18] = 33'h081970864;
    stim[19] = 33'h0a35d6429;
    stim[20] = 33'h0a231b79c;
    stim[21] = 33'h0ceafc883;
    stim[22] = 33'h0318f461e;
    stim[23] = 33'h0eb60e1cc;
    stim[24] = 33'h03119a503;
    stim[25] = 33'h022a76042;
    stim[26] = 33'h02606352a;
    stim[27] = 33'h07427f5d1;
    stim[28] = 33'h026af7235;
    stim[29] = 33'h034f31cf8;
    stim[30] = 33'h04d087157;
    stim[31] = 33'h08358dd8e;
    stim[32] = 33'h01b59bfb3;
    stim[33] = 33'h086a4331e;
    stim[34] = 33'h1c0bfb6e0;
    stim[35] = 33'h0a307f5b0;
    stim[36] = 33'h0339b79de;
    stim[37] = 33'h0f579e333;
    stim[38] = 33'h06f1808b8;
    stim[39] = 33'h0802959a5;
    stim[40] = 33'h04ea50111;
    stim[41] = 33'h039daceef;
    stim[42] = 33'h0dad477c2;
    stim[43] = 33'h0866ea685;
    stim[44] = 33'h0e3c930e5;
    stim[45] = 33'h01b710b8d;
    stim[46] = 33'h0ad05c8dd;
    stim[47] = 33'h0a75862ac;
    stim[48] = 33'h07db0b3ed;
    stim[49] = 33'h0b75d993e;
    stim[50] = 33'h0a74de926;
    stim[51] = 33'h08a170b5a;
    stim[52] = 33'h02db10a92;
    stim[53] = 33'h01f57288b;
    stim[54] = 33'h0362e3686;
    stim[55] = 33'h03e92dbdd;
    stim[56] = 33'h0da08ef0a;
    stim[57] = 33'h0ff5714ee;
    stim[58] = 33'h0128fa197;
    stim[59] = 33'h0547520e7;
    stim[60] = 33'h0dded0555;
    stim[61] = 33'h05678f667;
    stim[62] = 33'h06a448488;
    stim[63] = 33'h040727152;
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
      expv[2] = 74'h00000000xxxxxxxxxf7;
      expv[3] = 74'h00000000xxxxxxxxx0b;
      expv[4] = 74'h00000000xxxxxxxxx0b;
      expv[5] = 74'h000000000000000000b;
      expv[6] = 74'h000000000000000000b;
      expv[7] = 74'h000000004000000010b;
      expv[8] = 74'h00000000000000000c5;
      expv[9] = 74'h00000000000000000c5;
      expv[10] = 74'h00000000000000000c5;
      expv[11] = 74'h00000000000000000c5;
      expv[12] = 74'h00000000800000001c5;
      expv[13] = 74'h0000000000000000047;
      expv[14] = 74'h0000000000000000047;
      expv[15] = 74'h0000000000000000047;
      expv[16] = 74'h0000000000000000047;
      expv[17] = 74'h00000000c0000000147;
      expv[18] = 74'h0000000000000000060;
      expv[19] = 74'h0000000000000000060;
      expv[20] = 74'h0000000000000000060;
      expv[21] = 74'h0000000000000000060;
      expv[22] = 74'h0000000100000000160;
      expv[23] = 74'h000000000000000001e;
      expv[24] = 74'h000000000000000001e;
      expv[25] = 74'h000000000000000001e;
      expv[26] = 74'h000000000000000001e;
      expv[27] = 74'h000000014000000011e;
      expv[28] = 74'h00000000000000000d1;
      expv[29] = 74'h00000000000000000d1;
      expv[30] = 74'h00000000000000000d1;
      expv[31] = 74'h00000000000000000d1;
      expv[32] = 74'h00000001800000001d1;
      expv[33] = 74'h00000000000000000b3;
      expv[34] = 74'h00000000000000000b3;
      expv[35] = 74'h00000000000000001b3;
      expv[36] = 74'h00000000000000000b0;
      expv[37] = 74'h00000000000000000b0;
      expv[38] = 74'h00000000000000000b0;
      expv[39] = 74'h00000000000000000b0;
      expv[40] = 74'h00000000400000001b0;
      expv[41] = 74'h0000000000000000011;
      expv[42] = 74'h0000000000000000011;
      expv[43] = 74'h0000000000000000011;
      expv[44] = 74'h0000000000000000011;
      expv[45] = 74'h0000000080000000111;
      expv[46] = 74'h000000000000000008d;
      expv[47] = 74'h000000000000000008d;
      expv[48] = 74'h000000000000000008d;
      expv[49] = 74'h000000000000000008d;
      expv[50] = 74'h00000000c000000018d;
      expv[51] = 74'h0000000000000000026;
      expv[52] = 74'h0000000000000000026;
      expv[53] = 74'h0000000000000000026;
      expv[54] = 74'h0000000000000000026;
      expv[55] = 74'h0000000100000000126;
      expv[56] = 74'h00000000000000000dd;
      expv[57] = 74'h00000000000000000dd;
      expv[58] = 74'h00000000000000000dd;
      expv[59] = 74'h00000000000000000dd;
      expv[60] = 74'h00000001400000001dd;
      expv[61] = 74'h0000000000000000055;
      expv[62] = 74'h0000000000000000055;
      expv[63] = 74'h0000000000000000055;
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
