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

  autovcoder_001601 dut (
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
    stim[0] = 33'h1b86d53f5;
    stim[1] = 33'h175c9e6c0;
    stim[2] = 33'h0edabd344;
    stim[3] = 33'h0aa9dde54;
    stim[4] = 33'h066fe65bb;
    stim[5] = 33'h0de60ef31;
    stim[6] = 33'h0af90a839;
    stim[7] = 33'h0621d2126;
    stim[8] = 33'h0a54b1474;
    stim[9] = 33'h087c171d1;
    stim[10] = 33'h0cac6ade3;
    stim[11] = 33'h03d0ccdc7;
    stim[12] = 33'h04bf8861e;
    stim[13] = 33'h0d433e971;
    stim[14] = 33'h0e45821e7;
    stim[15] = 33'h0db91301c;
    stim[16] = 33'h003ae8f8b;
    stim[17] = 33'h0d565174e;
    stim[18] = 33'h0da91c161;
    stim[19] = 33'h077a953e2;
    stim[20] = 33'h0029e6ee4;
    stim[21] = 33'h092f0b90b;
    stim[22] = 33'h0d61a83f9;
    stim[23] = 33'h05780c08a;
    stim[24] = 33'h031ad2acd;
    stim[25] = 33'h018707079;
    stim[26] = 33'h007028066;
    stim[27] = 33'h0e1837e9e;
    stim[28] = 33'h0efb98e57;
    stim[29] = 33'h0a0a2422b;
    stim[30] = 33'h08ec0352e;
    stim[31] = 33'h04393dcf1;
    stim[32] = 33'h029312a5e;
    stim[33] = 33'h0e737338d;
    stim[34] = 33'h004e8c9c8;
    stim[35] = 33'h0225f8f8b;
    stim[36] = 33'h00b101d00;
    stim[37] = 33'h0aa2218bd;
    stim[38] = 33'h00b30baf6;
    stim[39] = 33'h051bfcaf8;
    stim[40] = 33'h02991b29c;
    stim[41] = 33'h043f3e6dc;
    stim[42] = 33'h016cc6ff6;
    stim[43] = 33'h03b3dfe57;
    stim[44] = 33'h054471ad1;
    stim[45] = 33'h0348d3371;
    stim[46] = 33'h0e38c7d72;
    stim[47] = 33'h065fe46d6;
    stim[48] = 33'h0d91c06aa;
    stim[49] = 33'h0560b3bf1;
    stim[50] = 33'h0053937a1;
    stim[51] = 33'h0948a3a3d;
    stim[52] = 33'h079979b23;
    stim[53] = 33'h013e02424;
    stim[54] = 33'h0a36dcddf;
    stim[55] = 33'h065a11412;
    stim[56] = 33'h03a3bc64f;
    stim[57] = 33'h022ba689c;
    stim[58] = 33'h0450e164f;
    stim[59] = 33'h0ccf3081f;
    stim[60] = 33'h1d854195e;
    stim[61] = 33'h041e60887;
    stim[62] = 33'h095829ab1;
    stim[63] = 33'h03c31eba4;
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
      expv[2] = 74'h00000000xxxxxxxxxc0;
      expv[3] = 74'h00000000xxxxxxxxx44;
      expv[4] = 74'h00000000xxxxxxxxx44;
      expv[5] = 74'hxxxxxxxxx0000000044;
      expv[6] = 74'h0000000000000000044;
      expv[7] = 74'h0000000040000000144;
      expv[8] = 74'h0000000000000000026;
      expv[9] = 74'h0000000000000000026;
      expv[10] = 74'hxxxxxxxxx0000000026;
      expv[11] = 74'h0000000000000000026;
      expv[12] = 74'h0000000080000000126;
      expv[13] = 74'h000000000000000001e;
      expv[14] = 74'h000000000000000001e;
      expv[15] = 74'hxxxxxxxxx000000001e;
      expv[16] = 74'h000000000000000001e;
      expv[17] = 74'h00000000c000000011e;
      expv[18] = 74'h000000000000000004e;
      expv[19] = 74'h000000000000000004e;
      expv[20] = 74'hxxxxxxxxx000000004e;
      expv[21] = 74'h000000000000000004e;
      expv[22] = 74'h000000010000000014e;
      expv[23] = 74'h00000000000000000f9;
      expv[24] = 74'h00000000000000000f9;
      expv[25] = 74'hxxxxxxxxx00000000f9;
      expv[26] = 74'h00000000000000000f9;
      expv[27] = 74'h00000001400000001f9;
      expv[28] = 74'h000000000000000009e;
      expv[29] = 74'h000000000000000009e;
      expv[30] = 74'hxxxxxxxxx000000009e;
      expv[31] = 74'h000000000000000009e;
      expv[32] = 74'h000000018000000019e;
      expv[33] = 74'h000000000000000005e;
      expv[34] = 74'h000000000000000005e;
      expv[35] = 74'hxxxxxxxxx000000005e;
      expv[36] = 74'h000000000000000005e;
      expv[37] = 74'h00000001c000000015e;
      expv[38] = 74'h00000000000000000bd;
      expv[39] = 74'h00000000000000000bd;
      expv[40] = 74'hxxxxxxxxx00000000bd;
      expv[41] = 74'h00000000000000000bd;
      expv[42] = 74'h00000002000000001bd;
      expv[43] = 74'h00000000000000000f6;
      expv[44] = 74'h00000000000000000f6;
      expv[45] = 74'hxxxxxxxxx00000000f6;
      expv[46] = 74'h00000000000000000f6;
      expv[47] = 74'h00000002400000001f6;
      expv[48] = 74'h00000000000000000d6;
      expv[49] = 74'h00000000000000000d6;
      expv[50] = 74'hxxxxxxxxx00000000d6;
      expv[51] = 74'h00000000000000000d6;
      expv[52] = 74'h00000002800000001d6;
      expv[53] = 74'h0000000000000000023;
      expv[54] = 74'h0000000000000000023;
      expv[55] = 74'hxxxxxxxxx0000000023;
      expv[56] = 74'h0000000000000000023;
      expv[57] = 74'h00000002c0000000123;
      expv[58] = 74'h000000000000000009c;
      expv[59] = 74'h000000000000000009c;
      expv[60] = 74'hxxxxxxxxx000000009c;
      expv[61] = 74'h000000000000000019c;
      expv[62] = 74'h0000000000000000087;
      expv[63] = 74'h0000000000000000087;
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
