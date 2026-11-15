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

  autovcoder_002350 dut (
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
    stim[0] = 33'h1f14eb824;
    stim[1] = 33'h180b5c9c4;
    stim[2] = 33'h0b4a552f7;
    stim[3] = 33'h09e54f03d;
    stim[4] = 33'h0da0ac26d;
    stim[5] = 33'h0584eef48;
    stim[6] = 33'h0d3fa1975;
    stim[7] = 33'h0db8246c4;
    stim[8] = 33'h0d0b340be;
    stim[9] = 33'h003aa704f;
    stim[10] = 33'h0aa073ec2;
    stim[11] = 33'h06c5eced7;
    stim[12] = 33'h08ffdee5f;
    stim[13] = 33'h0ecc56747;
    stim[14] = 33'h08b214d18;
    stim[15] = 33'h00e7b277d;
    stim[16] = 33'h0ccfb17a4;
    stim[17] = 33'h047764fe4;
    stim[18] = 33'h039081264;
    stim[19] = 33'h0b096206c;
    stim[20] = 33'h0fb1e5a65;
    stim[21] = 33'h09c314149;
    stim[22] = 33'h0768bbb22;
    stim[23] = 33'h0708ca5c6;
    stim[24] = 33'h08c76c9e6;
    stim[25] = 33'h0390c5237;
    stim[26] = 33'h0c16b5f97;
    stim[27] = 33'h0a44a20e0;
    stim[28] = 33'h043a57769;
    stim[29] = 33'h0f424e209;
    stim[30] = 33'h0eb756e58;
    stim[31] = 33'h056dead0b;
    stim[32] = 33'h0238dc3de;
    stim[33] = 33'h018060b0a;
    stim[34] = 33'h0956c273c;
    stim[35] = 33'h02ede5bdc;
    stim[36] = 33'h08c458cee;
    stim[37] = 33'h0f36568e5;
    stim[38] = 33'h0fcb5e46d;
    stim[39] = 33'h08d92900e;
    stim[40] = 33'h03ed744af;
    stim[41] = 33'h057a7336a;
    stim[42] = 33'h013a7387e;
    stim[43] = 33'h0be95bf79;
    stim[44] = 33'h06e135369;
    stim[45] = 33'h034c3de42;
    stim[46] = 33'h0bd0fab6b;
    stim[47] = 33'h008a46585;
    stim[48] = 33'h08c2277e5;
    stim[49] = 33'h0e5f3a520;
    stim[50] = 33'h02dbdc539;
    stim[51] = 33'h06d68ab5a;
    stim[52] = 33'h0e79c89ea;
    stim[53] = 33'h0211c5304;
    stim[54] = 33'h03adac17a;
    stim[55] = 33'h042879eef;
    stim[56] = 33'h005494778;
    stim[57] = 33'h0a9921c01;
    stim[58] = 33'h02bffba64;
    stim[59] = 33'h0e0dae54a;
    stim[60] = 33'h0ba0d1c9b;
    stim[61] = 33'h0ea2d9df1;
    stim[62] = 33'h0a20b8be7;
    stim[63] = 33'h09ee2db2d;
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
      expv[2] = 74'h00000000xxxxxxxxxc4;
      expv[3] = 74'h00000000xxxxxxxxxf7;
      expv[4] = 74'h00000000xxxxxxxxxf7;
      expv[5] = 74'h3fffffffc00000000f7;
      expv[6] = 74'h00000000000000000f7;
      expv[7] = 74'h00000000400000001f7;
      expv[8] = 74'h00000000000000000c4;
      expv[9] = 74'h00000000000000000c4;
      expv[10] = 74'h3fffffffc00000000c4;
      expv[11] = 74'h00000000000000000c4;
      expv[12] = 74'h00000000800000001c4;
      expv[13] = 74'h000000000000000005f;
      expv[14] = 74'h000000000000000005f;
      expv[15] = 74'h3fffffffc000000005f;
      expv[16] = 74'h000000000000000005f;
      expv[17] = 74'h00000000c000000015f;
      expv[18] = 74'h00000000000000000e4;
      expv[19] = 74'h00000000000000000e4;
      expv[20] = 74'h3fffffffc00000000e4;
      expv[21] = 74'h00000000000000000e4;
      expv[22] = 74'h00000001000000001e4;
      expv[23] = 74'h0000000000000000022;
      expv[24] = 74'h0000000000000000022;
      expv[25] = 74'h3fffffffc0000000022;
      expv[26] = 74'h0000000000000000022;
      expv[27] = 74'h0000000140000000122;
      expv[28] = 74'h00000000000000000e0;
      expv[29] = 74'h00000000000000000e0;
      expv[30] = 74'h3fffffffc00000000e0;
      expv[31] = 74'h00000000000000000e0;
      expv[32] = 74'h00000001800000001e0;
      expv[33] = 74'h00000000000000000de;
      expv[34] = 74'h00000000000000000de;
      expv[35] = 74'h3fffffffc00000000de;
      expv[36] = 74'h00000000000000000de;
      expv[37] = 74'h00000001c00000001de;
      expv[38] = 74'h00000000000000000e5;
      expv[39] = 74'h00000000000000000e5;
      expv[40] = 74'h3fffffffc00000000e5;
      expv[41] = 74'h00000000000000000e5;
      expv[42] = 74'h00000002000000001e5;
      expv[43] = 74'h000000000000000007e;
      expv[44] = 74'h000000000000000007e;
      expv[45] = 74'h3fffffffc000000007e;
      expv[46] = 74'h000000000000000007e;
      expv[47] = 74'h000000024000000017e;
      expv[48] = 74'h0000000000000000085;
      expv[49] = 74'h0000000000000000085;
      expv[50] = 74'h3fffffffc0000000085;
      expv[51] = 74'h0000000000000000085;
      expv[52] = 74'h0000000280000000185;
      expv[53] = 74'h00000000000000000ea;
      expv[54] = 74'h00000000000000000ea;
      expv[55] = 74'h3fffffffc00000000ea;
      expv[56] = 74'h00000000000000000ea;
      expv[57] = 74'h00000002c00000001ea;
      expv[58] = 74'h0000000000000000001;
      expv[59] = 74'h0000000000000000001;
      expv[60] = 74'h3fffffffc0000000001;
      expv[61] = 74'h0000000000000000001;
      expv[62] = 74'h0000000340000000101;
      expv[63] = 74'h00000000000000000e7;
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
